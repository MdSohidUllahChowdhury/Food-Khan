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
  final formkey = GlobalKey<FormState>();
  final TextEditingController _addressController = TextEditingController();
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

                    // Get.to(
                    //   // () => PaymentScreen(
                    //   //   totalPrice: widget.totalPrice.toString(),
                    //   // ),
                    // );
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
