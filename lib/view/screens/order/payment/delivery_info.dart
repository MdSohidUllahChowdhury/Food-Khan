import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:food_khan/controller/firebase/order_info.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';
import 'package:get/utils.dart';

class DeliveryCheckOut extends StatefulWidget {
  final String totalPrice;
  final String foodName;
  final String foodQuantity;
  const DeliveryCheckOut({
    required this.totalPrice,
    required this.foodName,
    required this.foodQuantity,
    super.key,
  });

  @override
  State<DeliveryCheckOut> createState() => _DeliveryCheckOutState();
}

class _DeliveryCheckOutState extends State<DeliveryCheckOut> {
  final formkeyAddress = GlobalKey<FormState>();
  final formkeyNumber = GlobalKey<FormState>();
  final TextEditingController _addressController = TextEditingController();
  final TextEditingController _mobileController = TextEditingController();
  bool isRequired = true;
  String _maleType = 'Male';
  String _paymentMethod = 'Cash On Delivery';
  String _doorDelivery = 'Door Delivery';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade200,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        centerTitle: true,
        leading: IconButton(
          icon: Icon(
            FontAwesomeIcons.solidArrowAltCircleLeft,
            size: 24,
            color: Colors.black,
          ),
          onPressed: () => Get.back(),
        ),
        title: Text('Payment Steps', style: TextStyle(color: Colors.black)),
      ),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Delivery',
                style: TextStyle(
                  fontSize: 26,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
              SizedBox(height: 20),

              //** */ Address Section
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Address Details',
                    style: TextStyle(
                      fontWeight: FontWeight.w600,
                      color: Colors.black,
                    ),
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
                      key: formkeyAddress,
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

              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Add Your Mobile Number',
                    style: TextStyle(
                      fontWeight: FontWeight.w600,
                      color: Colors.black,
                    ),
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
                      key: formkeyNumber,
                      child: TextFormField(
                        keyboardType: TextInputType.text,
                        controller: _mobileController,
                        validator:
                            isRequired == true
                                ? (String? value) {
                                  if (value == null || value.isEmpty) {
                                    return 'Plese enter your mobile number!';
                                  } else {
                                    return null;
                                  }
                                }
                                : null,
                        decoration: InputDecoration(
                          labelText: 'Add Number',
                          prefixIcon: Icon(
                            FontAwesomeIcons.phone,
                            color: Colors.lightBlue,
                            size: 20,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 20),

              //** */ Delivery Rider Section
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
                      groupValue: _maleType,
                      value: 'Male',
                      title: Text('Male'),
                      activeColor: Colors.green,
                      onChanged: (value) {
                        setState(() {
                          _maleType = value!;
                        });
                      },
                    ),
                    Divider(),
                    RadioListTile<String>(
                      groupValue: _maleType,
                      value: 'Female',
                      title: Text('Female'),
                      activeColor: Colors.pink,
                      onChanged: (value) {
                        setState(() {
                          _maleType = value!;
                        });
                      },
                    ),
                  ],
                ),
              ),
              SizedBox(height: 20),

              //** */ Payment Method
              Text(
                'Payment Method',
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
                      groupValue: _paymentMethod,
                      value: 'Cash On Delivery',
                      activeColor: Colors.greenAccent,
                      onChanged: (value) {
                        setState(() {
                          _paymentMethod = value!;
                        });
                      },
                      title: Row(
                        children: [
                          Container(
                            padding: EdgeInsets.all(6),
                            decoration: BoxDecoration(
                              color: Colors.greenAccent,
                              borderRadius: BorderRadius.circular(8),
                            ),
                            child: Icon(
                              FontAwesomeIcons.moneyBills,
                              color: Colors.white,
                              size: 20,
                            ),
                          ),
                          SizedBox(width: 10),
                          Text("Cash On Delivery"),
                        ],
                      ),
                    ),
                    Divider(),
                    RadioListTile<String>(
                      value: 'Card',
                      groupValue: _paymentMethod,
                      activeColor: Colors.orange,
                      onChanged: (value) {
                        setState(() {
                          _paymentMethod = value!;
                        });
                      },
                      title: Row(
                        children: [
                          Container(
                            padding: EdgeInsets.all(6),
                            decoration: BoxDecoration(
                              color: Colors.orange,
                              borderRadius: BorderRadius.circular(8),
                            ),
                            child: Icon(
                              Icons.credit_card,
                              color: Colors.white,
                              size: 20,
                            ),
                          ),
                          SizedBox(width: 10),
                          Text("Card"),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 20),

              //** */ Delivery Method
              Text(
                'Delivery Method.',
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
                      value: 'Door Delivery',
                      groupValue: _doorDelivery,
                      activeColor: Colors.orange,
                      onChanged: (value) {
                        setState(() {
                          _doorDelivery = value!;
                        });
                      },
                      title: Text('Door Delivery'),
                    ),
                    Divider(),
                    RadioListTile<String>(
                      value: 'Pick Up',
                      groupValue: _doorDelivery,
                      activeColor: Colors.redAccent,
                      onChanged: (value) {
                        setState(() {
                          _doorDelivery = value!;
                        });
                      },
                      title: Text('Pick Up'),
                    ),
                  ],
                ),
              ),

              SizedBox(height: 20),
              //** */ Food Name
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('Food Name', style: TextStyle(fontSize: 16)),
                  Text(
                    widget.foodName.toString(),
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                ],
              ),
              SizedBox(height: 20),

              //** */ Total Price
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('Total', style: TextStyle(fontSize: 16)),
                  Text(
                    '${widget.totalPrice}\$',
                    style: TextStyle(fontSize: 17, fontWeight: FontWeight.bold),
                  ),
                ],
              ),
              SizedBox(height: 20),

              //** */ Total Quantity
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('Quanity', style: TextStyle(fontSize: 16)),
                  Text(
                    widget.foodQuantity.toString(),
                    style: TextStyle(fontSize: 17, fontWeight: FontWeight.bold),
                  ),
                ],
              ),
              SizedBox(height: 20),
              SizedBox(
                width: double.infinity,
                height: 60,
                child: ElevatedButton(
                  onPressed: () {
                    if (formkeyAddress.currentState!.validate() &&
                        formkeyNumber.currentState!.validate()) {
                      isRequired = false;
                      Map<String, dynamic> collection = {
                        "1. Food Name": widget.foodName,
                        "2. Price": widget.totalPrice,
                        "3. Quantity": widget.foodQuantity,
                        "4. Address": _addressController.text.trim(),
                        "5. Number": _mobileController.text.trim(),
                        "6. Payment Method": _paymentMethod.trim(),
                        "7. Delivery Rider Type": _maleType.trim(),
                        "8. Delivery Method": _doorDelivery.trim(),
                      };

                      final User? user = FirebaseAuth.instance.currentUser;

                      OrderInfo().paymentSteps(collection, user!.uid);
                      Get.snackbar(
                        'Successfully Confirmed Order',
                        'Stay with us for for the best food',
                        backgroundColor: Colors.orange,
                        colorText: Colors.white,
                        duration: Duration(seconds: 3),
                      );
                    } else {
                      isRequired = true;
                      return;
                    }
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.orange,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30),
                    ),
                  ),
                  child: Text(
                    'Order Confirm',
                    style: TextStyle(fontSize: 18, color: Colors.white),
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
