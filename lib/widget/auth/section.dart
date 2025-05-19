import 'package:flutter/material.dart';

class SectionName extends StatelessWidget {
    final TextEditingController? authControler;

  final String nameit;
  final bool? forpassword;
  final bool? isRequired;
  final Icon? icon;

  const SectionName({
    super.key,
    required this.nameit,
    this.authControler,
    this.forpassword,
    this.isRequired,
    this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 25),
      child: TextFormField(
        controller:authControler,
        validator:
            isRequired == true
                ? (String? value) {
                  if (value == null || value.isEmpty) {
                    return 'Fill the section!';
                  } else {
                    return null;
                  }
                }
                : null,
        obscureText: forpassword ?? false,
        decoration: InputDecoration(
          filled: true,
          fillColor: const Color.fromARGB(213, 190, 186, 186),
          hintText: nameit,
          hintStyle: const TextStyle(fontSize: 10),
          contentPadding: const EdgeInsets.all(12),
          prefixIcon: icon,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(16),
            borderSide: BorderSide.none,
          ),
        ),
      ),
    );
  }
}
