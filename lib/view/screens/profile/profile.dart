import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:food_khan/view/auth/log_in.dart';
import 'package:food_khan/view/screens/profile/location.dart';
import 'package:food_khan/view/screens/profile/wallet.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:glass_kit/glass_kit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class Profile extends StatefulWidget {
  const Profile({super.key});

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  final fireBaseData = FirebaseAuth.instance;
  String selectedPayment = 'Card';
  final auth = FirebaseAuth.instance;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        toolbarHeight: 40,
        elevation: 0,
        centerTitle: true,
        title: Text('Profile', style: TextStyle(color: Colors.white)),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 5),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              //!! Information Title
              const SizedBox(height: 13),
              //!! Profile Info Card
              Container(
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(16),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.1),
                      spreadRadius: 3,
                      blurRadius: 5,
                      offset: const Offset(0, 3), // changes position of shadow
                    ),
                  ],
                ),
                child: Row(
                  children: [
                    // Avatar
                    CircleAvatar(
                      backgroundColor: Colors.amber,
                      radius: 30,
                      child: Image.network(
                        'https://www.pngall.com/wp-content/uploads/20/Pop-Mart-Labubu-Unique-Art-Style-PNG.png',
                        height: 80,
                        width: 70,
                      ),
                    ),
                    const SizedBox(width: 10),

                    //!!!!! Name and Email
                    Builder(
                      builder: (context) {
                        final uid = FirebaseAuth.instance.currentUser?.uid;
                        if (uid == null) {
                          return const Center(
                            child: Text(
                              'Not signed in',
                              style: TextStyle(color: Colors.white),
                            ),
                          );
                        }

                        final fireBaseInit =
                            FirebaseFirestore.instance
                                .collection("Auth User Informatin")
                                .doc(uid)
                                .snapshots();

                        return StreamBuilder(
                          stream: fireBaseInit,
                          builder: (context, snapshot) {
                            if (snapshot.hasError) {
                              return Center(
                                child: Text('Error: ${snapshot.error}'),
                              );
                            }
                            if (snapshot.connectionState ==
                                ConnectionState.waiting) {
                              return const Center(
                                child: CircularProgressIndicator(),
                              );
                            }
                            final doc = snapshot.data;
                            if (doc == null || !doc.exists) {
                              return const Center(
                                child: Text(
                                  'No profile found',
                                  style: TextStyle(color: Colors.black),
                                ),
                              );
                            }
                            final data = doc.data()!;

                            return Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  data["User Name"] ?? "User Name",
                                  style: GoogleFonts.poppins(
                                    fontSize: 12,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                                const SizedBox(height: 4),
                                Text(
                                  data["Email"] ?? "user@example.com",
                                  style: GoogleFonts.poppins(
                                    fontSize: 11,
                                    color: Colors.grey[700],
                                  ),
                                ),
                                const SizedBox(height: 4),

                                Text(
                                  data["Phone"] ?? 0181111111,
                                  style: GoogleFonts.poppins(
                                    fontSize: 11,
                                    color: Colors.black,
                                  ),
                                ),
                              ],
                            );
                          },
                        );
                      },
                    ),
                    Spacer(),
                    SizedBox(height: 4),
                    CircleAvatar(
                      backgroundColor: Colors.orange,
                      radius: 18,
                      child: IconButton(
                        onPressed: () async {
                          await auth.signOut().then(
                            (value) => Get.offAll(() => const Login()),
                          );
                        },
                        icon: Icon(
                          Icons.exit_to_app_rounded,
                          color: Colors.black,
                          size: 20,
                        ),
                      ),
                    ),
                  ],
                ),
              ),

              SizedBox(height: 30),
              ListTile(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(16),
                ),
                tileColor: Colors.white,
                onTap: () {
                  Get.to(() => const LocationScreen());
                },
                contentPadding: const EdgeInsets.symmetric(horizontal: 10),
                leading: Icon(
                  FontAwesomeIcons.mapMarkerAlt,
                  size: 24,
                  color: Colors.red,
                ),
                title: Text(
                  "Find Our Restaurent by Press on Location Icon",
                  style: GoogleFonts.poppins(fontSize: 10),
                ),
              ),

              const SizedBox(height: 10),
              ListTile(
                shape: RoundedRectangleBorder(
                  // Add rounded corners
                  borderRadius: BorderRadius.circular(16),
                ),
                tileColor: Colors.white,
                onTap: () {
                  Get.to(() => const Wallet());
                },
                contentPadding: const EdgeInsets.symmetric(horizontal: 13),
                leading: Icon(
                  FontAwesomeIcons.wallet,
                  size: 24,
                  color: Colors.green,
                ),
                title: Text(
                  "Add Money to Your Wallet by Press on Wallet Icon",
                  style: GoogleFonts.poppins(fontSize: 10),
                ),
              ),
              Expanded(child: SizedBox(height: 12)),
              //!! Payment Method Title
              Text(
                "Payment Method",
                style: GoogleFonts.poppins(
                  color: Colors.white,
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                ),
              ),
              //const SizedBox(height: 10),

              //!! Payment Method Options
              Animate(
                    child: GlassContainer(
                      height: 200,
                      borderRadius: BorderRadius.all(Radius.circular(16)),
                      gradient: LinearGradient(
                        colors: [
                          Colors.white.withOpacity(0.40),
                          Colors.white.withOpacity(0.10),
                        ],
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,
                      ),
                      borderGradient: LinearGradient(
                        colors: [
                          Colors.white.withOpacity(0.60),
                          Colors.white.withOpacity(0.10),
                          Colors.lightBlueAccent.withOpacity(0.05),
                          Colors.lightBlueAccent.withOpacity(0.6),
                        ],
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,
                        stops: [0.0, 0.39, 0.40, 1.0],
                      ),
                      blur: 15.0,
                      borderWidth: 1.5,
                      //elevation: 3.0,
                      isFrostedGlass: true,
                      shadowColor: Colors.black.withOpacity(0.20),
                      alignment: Alignment.center,
                      frostedOpacity: 0.12,
                      margin: EdgeInsets.only(top: 10),
                      //padding: EdgeInsets.all(8.0),
                      child: Column(
                        children: [
                          _buildPaymentTile(
                            title: 'Card',
                            icon: Icons.credit_card,
                            color: Colors.orange,
                          ),
                          Divider(),
                          _buildPaymentTile(
                            title: 'Bank account',
                            icon: FontAwesomeIcons.university,
                            color: Colors.pink,
                          ),
                          Divider(),
                          _buildPaymentTile(
                            title: 'Paypal',
                            icon: FontAwesomeIcons.paypal,
                            color: Colors.blue,
                          ),
                        ],
                      ),
                    ),
                  )
                  .animate()
                  .fadeIn(duration: const Duration(seconds: 2))
                  .shimmer(
                    color: Colors.black,
                    duration: const Duration(seconds: 14),
                  ),

              const Spacer(),
              //!! Update Button
              SizedBox(
                width: double.infinity,
                height: 45,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.orange,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30),
                    ),
                  ),
                  onPressed: () {
                    Get.snackbar(
                      'Updated',
                      'Stay with us for your best food',
                      backgroundColor: Colors.amber,
                    );
                    // handle update
                  },
                  child: Text(
                    "Update",
                    style: GoogleFonts.poppins(
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 15),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildPaymentTile({
    required String title,
    required IconData icon,
    required Color color,
  }) {
    return RadioListTile<String>(
      value: title,
      groupValue: selectedPayment,
      onChanged: (value) {
        setState(() {
          selectedPayment = value!;
        });
      },
      contentPadding: const EdgeInsets.symmetric(horizontal: 12),
      activeColor: color,
      title: Text(
        title,
        style: GoogleFonts.poppins(fontSize: 14, color: Colors.white),
      ),
      secondary: Container(
        padding: const EdgeInsets.all(8),
        decoration: BoxDecoration(
          color: color.withOpacity(0.1),
          borderRadius: BorderRadius.circular(8),
        ),
        child: Icon(icon, color: color, size: 20),
      ),
    );
  }
}
