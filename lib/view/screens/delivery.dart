import 'package:food_khan/view/screens/payment.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';
import 'package:get/utils.dart';

class DeliveryCheckOut extends StatefulWidget {
  final String totalPrice;
  const DeliveryCheckOut({required this.totalPrice, super.key});

  @override
  State<DeliveryCheckOut> createState() => _DeliveryCheckOutState();
}

class _DeliveryCheckOutState extends State<DeliveryCheckOut> {
  String _deliveryMethod = 'Door delivery';
  final formkey = GlobalKey<FormState>();
  final TextEditingController _addressController = TextEditingController();
  bool isRequired = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade100,
      appBar: AppBar(
        backgroundColor: Colors.grey.shade100,
        elevation: 0,
        centerTitle: true,
        leading: IconButton(
          icon: Icon(FontAwesomeIcons.solidArrowAltCircleLeft, size: 24),
          onPressed: () => Get.back(),
        ),
        title: Text('Checkout', style: TextStyle(color: Colors.black)),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Delivery',
              style: TextStyle(fontSize: 26, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 20),

            //** */ Address Section
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Address Details',
                  style: TextStyle(fontWeight: FontWeight.w600),
                ),
                Text('change', style: TextStyle(color: Colors.orange)),
              ],
            ),
            SizedBox(height: 10),
            Container(
              padding: EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(16),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Form(
                    key: formkey,
                    child: TextFormField(
                      keyboardType: TextInputType.text,
                      controller: _addressController,
                      validator:
                          isRequired == true
                              ? (String? value) {
                                if (value == null || value.isEmpty) {
                                  return 'Plese enter your address!';
                                } else {
                                  return null;
                                }
                              }
                              : null,
                      decoration: InputDecoration(
                        labelText: 'Add Your Address',
                        hintText: 'Gulshan 2, Road 12, House 435, Dhaka',
                        prefixIcon: Icon(
                          FontAwesomeIcons.mapMarkerAlt,
                          color: Colors.orange,
                          size: 20,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 20),

            //** */ Delivery Method Section
            Text(
              'Delivery Rider Type.',
              style: TextStyle(fontWeight: FontWeight.w600),
            ),
            SizedBox(height: 10),
            Container(
              padding: EdgeInsets.all(16),
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
                  RadioListTile<String>(
                    title: Text('Male'),
                    value: 'Door delivery',
                    groupValue: _deliveryMethod,
                    activeColor: Colors.green,
                    onChanged: (value) {
                      setState(() {
                        _deliveryMethod = value!;
                      });
                    },
                  ),
                  Divider(),
                  RadioListTile<String>(
                    title: Text('Female'),
                    value: 'Pick up',
                    groupValue: _deliveryMethod,
                    activeColor: Colors.pink,
                    onChanged: (value) {
                      setState(() {
                        _deliveryMethod = value!;
                      });
                    },
                  ),
                ],
              ),
            ),
            Spacer(),
            //** */ Total & Button
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('Total', style: TextStyle(fontSize: 16)),
                Text(
                  '${widget.totalPrice}\$',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
              ],
            ),
            SizedBox(height: 20),
            SizedBox(
              width: double.infinity,
              height: 60,
              child: ElevatedButton(
                onPressed: () {
                  if (formkey.currentState!.validate()) {
                    isRequired = false;
                    Get.snackbar(
                      'Address Added',
                      'Address and Rider Type has been Added Successfully.',
                      backgroundColor: Colors.orange,
                      colorText: Colors.white,
                      duration: Duration(seconds: 3),
                    );
                  } else {
                    isRequired = true;
                    return;
                  }
                  Get.to(
                    () =>
                        PaymentScreen(totalPrice: widget.totalPrice.toString()),
                  );
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.orange,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30),
                  ),
                ),
                child: Text(
                  'Proceed to Payment',
                  style: TextStyle(fontSize: 18, color: Colors.white),
                ),
              ),
            ),
            SizedBox(height: 25),
          ],
        ),
      ),
    );
  }
}
