import 'package:Food_Khan/view/page/location.dart';
import 'package:Food_Khan/view/page/wallet.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class ProfileTwo extends StatefulWidget {
  const ProfileTwo({super.key});

  @override
  State<ProfileTwo> createState() => _ProfileTwoState();
}

class _ProfileTwoState extends State<ProfileTwo> {
  String selectedPayment = 'Card';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF8F8F8),
      appBar: AppBar(
        
      backgroundColor: const Color(0xFFF8F8F8),
        elevation: 0,
        centerTitle: true,
        leading: IconButton(
          icon: Icon(Icons.arrow_left, size: 30, color: Colors.black),
          onPressed: ()=>Get.back(),
        ),
        title: Text('My Profile', style: TextStyle(color: Colors.black)),

      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 5),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [

              //** */ Information Title
              Text(
                "Information",
                style: GoogleFonts.poppins(
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                ),
              ),
              const SizedBox(height: 10),

              //** */ Profile Info Card
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
                    ClipRRect(
                      borderRadius: BorderRadius.circular(12),
                      child: Image.network(
                        'https://i.imgur.com/QCNbOAo.png',
                        height: 50,
                        width: 50,
                      ),
                    ),
                    const SizedBox(width: 16),
                    // Name and Email
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Shakil Chowdhury",
                          style: GoogleFonts.poppins(
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        const SizedBox(height: 4),
                        Text(
                          "test@gmail.com",
                          style: GoogleFonts.poppins(
                            fontSize: 12,
                            color: Colors.grey[700],
                          ),
                        ),
                        const SizedBox(height: 4),
                        Text(
                          "No 15 uti street off ovie palace\nroad effurun delta state",
                          style: GoogleFonts.poppins(
                            fontSize: 12,
                            color: Colors.grey[700],
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 15),
              Text(
                "Location",
                style: GoogleFonts.poppins(
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                ),
              ),
              ListTile(
                onTap: () {
                  Get.to(() => const LocationScreen());
                },
                contentPadding: const EdgeInsets.symmetric(horizontal: 6),
                leading: Icon(
                  FontAwesomeIcons.mapMarkerAlt,
                  size: 24,
                  color: Colors.red,
                ),
                title: Text(
                  "Find Our Restaurent by Press on Location Icon",
                  style: GoogleFonts.poppins(fontSize: 14),
                ),
              ),
              const SizedBox(height: 10),
              Text(
                "Wallet",
                style: GoogleFonts.poppins(
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                ),
              ),
              ListTile(
                onTap: () {
                  Get.to(() => const Wallet());
                },
                contentPadding: const EdgeInsets.symmetric(horizontal: 12),
                leading: Icon(
                  FontAwesomeIcons.wallet,
                  size: 24,
                  color: Colors.green,
                ),
                title: Text(
                  "Add Money to Your Wallet by Press on Wallet Icon",
                  style: GoogleFonts.poppins(fontSize: 14),
                ),
              ),
              const SizedBox(height: 15),
              // Payment Method Title
              Text(
                "Payment Method",
                style: GoogleFonts.poppins(
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                ),
              ),
              const SizedBox(height: 10),

              //** */ Payment Method Options
              Container(
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

              const Spacer(),

              //** */ Update Button
              SizedBox(
                width: double.infinity,
                height: 45,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor:  Colors.orange,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30),
                    ),
                  ),
                  onPressed: () {
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
      title: Text(title, style: GoogleFonts.poppins(fontSize: 14)),
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
