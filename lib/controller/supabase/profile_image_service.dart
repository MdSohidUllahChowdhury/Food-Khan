import 'dart:io';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class ProfileImageService {

  final FirebaseAuth _auth = FirebaseAuth.instance;
  final SupabaseClient _supabase = Supabase.instance.client;
  final String _tableName = 'user_profile';
  final String _bucketName = 'avatars';

  String get _currentUserId {
    final user = _auth.currentUser;
    if (user == null) throw Exception('User is not authenticated.');
    return user.uid;
  }

  String get _currentUserEmail {
    final email = _auth.currentUser?.email;
    if (email == null) throw Exception('User email not available.');
    return email;
  }

  /// Upload or update profile picture
  Future<String?> uploadOrUpdatePicture(File imageFile) async {
    try {
      final userId = _currentUserId;
      final userEmail = _currentUserEmail;

      final fileExtension = imageFile.path.split('.').last;
      final fileName = 'profile_${DateTime.now().millisecondsSinceEpoch}.$fileExtension';
      final storagePath = '$userId/$fileName';

      // 1. Upload file to storage
      await _supabase.storage
          .from(_bucketName)
          .upload(storagePath, imageFile,
              fileOptions: const FileOptions(cacheControl: '3600', upsert: true));

      // 2. Get public URL
      final imageUrl = _supabase.storage
          .from(_bucketName)
          .getPublicUrl(storagePath);

      // 3. FIX: Use upsert — no more update-then-insert logic
      //    onConflict targets user_email so it updates if exists, inserts if not.
      await _supabase.from(_tableName).upsert(
        {
          'user_email': userEmail,
          'uploaded_image': imageUrl,
          'updated_at': DateTime.now().toIso8601String(),
        },
        onConflict: 'user_email', // must match a UNIQUE constraint on this column
      );

      print('Uploaded & saved: $imageUrl');
      return imageUrl;
    } catch (e) {
      print('Upload error: $e');
      if (e.toString().contains('403') || e.toString().contains('Unauthorized')) {
        throw Exception('Storage upload failed (403). Check Supabase RLS on "avatars" bucket.');
      }
      throw Exception('Failed to upload image. Please try again.');
    }
  }

  /// Remove profile picture
  Future<void> removePicture() async {
    try {
      final userId = _currentUserId;
      //FIX: was using user?.uid — now correctly uses email
      final userEmail = _currentUserEmail;

      final files = await _supabase.storage.from(_bucketName).list(path: userId);
      if (files.isNotEmpty) {
        final filePaths = files.map((f) => '$userId/${f.name}').toList();
        await _supabase.storage.from(_bucketName).remove(filePaths);
      }

      await _supabase
          .from(_tableName)
          .update({'uploaded_image': null, 'updated_at': DateTime.now().toIso8601String()})
          .eq('user_email', userEmail);
    } catch (e) {
      print('Remove error: $e');
      throw Exception('Failed to remove image. Please try again.');
    }
  }

  /// Fetch current profile image URL
  Future<String?> getUserProfileImageUrl() async {
    try {
      final userEmail = _currentUserEmail;
      print('🔍 Fetching image for: $userEmail');

      final response = await _supabase
          .from(_tableName)
          .select('uploaded_image')
          .eq('user_email', userEmail)
          .maybeSingle();

      final url = response?['uploaded_image'] as String?;
      print(url != null ? 'Found: $url' : 'No image for $userEmail');
      return url;
    } catch (e) {
      print('Fetch error: $e');
      return null;
    }
  }
}
