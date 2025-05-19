import 'package:Food_Khan/view/page/profile.dart';
import 'package:flutter/material.dart';
import 'package:country_picker/country_picker.dart';
import 'package:get/get.dart';

class BioFormScreen extends StatefulWidget {
  const BioFormScreen({super.key});

  @override
  State<BioFormScreen> createState() => _BioFormScreenState();
}

class _BioFormScreenState extends State<BioFormScreen> {
  final TextEditingController _fullNameController = TextEditingController();
  final TextEditingController _mobileNumberController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  Country? _selectedCountry;

  void _submitForm() {
    if (_formKey.currentState!.validate() && _selectedCountry != null) {
      // Save or send data
      Navigator.push(
        context,
        MaterialPageRoute(
          builder:
              (context) => ProfileScreen(
                fullName: _fullNameController.text,
                country: _selectedCountry!.name,
                phone: _mobileNumberController.text,
              ),
        ),
      );
    } else {
      if (_selectedCountry == null) {
        ScaffoldMessenger.of(
          context,
        ).showSnackBar(SnackBar(content: Text('Please select a country')));
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Form(
          key: _formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(height: 38),
              Center(
                child: Text(
                  'Fill in Your Bio Information',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              SizedBox(height: 8),
              Text(
                'This data will be displayed in your account profile for security',
                style: TextStyle(color: Colors.grey, fontSize: 13),
              ),
              SizedBox(height: 32),

              // Full Name
              TextFormField(
                controller: _fullNameController,
                decoration: InputDecoration(
                  hintText: 'Full Name',
                  prefixIcon: Icon(Icons.person),
                  filled: true,
                  fillColor: Colors.grey[200],
                  border: InputBorder.none,
                ),
                validator:
                    (value) =>
                        value == null || value.isEmpty
                            ? 'Enter your full name'
                            : null,
              ),
              SizedBox(height: 16),

              // Country Picker
              GestureDetector(
                onTap: () {
                  showCountryPicker(
                    context: context,
                    onSelect: (Country country) {
                      setState(() {
                        _selectedCountry = country;
                      });
                    },
                  );
                },
                child: Container(
                  padding: EdgeInsets.symmetric(horizontal: 12, vertical: 16),
                  decoration: BoxDecoration(
                    color: Colors.grey[200],
                    borderRadius: BorderRadius.circular(4),
                  ),
                  child: Row(
                    children: [
                      Icon(Icons.public, color: Colors.black54),
                      SizedBox(width: 12),
                      Text(
                        _selectedCountry?.name ?? 'Country',
                        style: TextStyle(
                          color:
                              _selectedCountry == null
                                  ? Colors.grey
                                  : Colors.black,
                        ),
                      ),
                      Spacer(),
                      Icon(Icons.arrow_drop_down),
                    ],
                  ),
                ),
              ),
              SizedBox(height: 16),

              // Mobile Number
              TextFormField(
                controller: _mobileNumberController,
                decoration: InputDecoration(
                  hintText: 'Mobile Number',
                  prefixIcon: Icon(Icons.phone),
                  filled: true,
                  fillColor: Colors.grey[200],
                  border: InputBorder.none,
                ),
                keyboardType: TextInputType.phone,
                validator:
                    (value) =>
                        value == null || value.isEmpty
                            ? 'Enter your mobile number'
                            : null,
              ),
              Spacer(),

              // Next Button
              SizedBox(
                width: double.infinity,
                height: 50,
                child: ElevatedButton(
                  onPressed: () {
                    _submitForm;
                    Get.to(
                      ProfileScreen(
                        fullName: _fullNameController.text,
                        country: _selectedCountry?.name ?? '',
                        phone: _mobileNumberController.text,
                      ),
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.white,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(4),
                    ),
                  ),
                  child: Text(
                    'Next',
                    style: TextStyle(color: Colors.black, fontSize: 18),
                  ),
                ),
              ),
              SizedBox(height: 25),
            ],
          ),
        ),
      ),
    );
  }
}
