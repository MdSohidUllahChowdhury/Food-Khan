import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class TostMessage{
 
 void rightMessage(String message){
    Fluttertoast.showToast(
        msg: message,
        toastLength: Toast.LENGTH_LONG,
        gravity: ToastGravity.BOTTOM,
        timeInSecForIosWeb:5,
        backgroundColor: Colors.green,
        textColor: Colors.white,
        fontSize: 16.0
      
    );
  }
 void wrongMessage(String message){
    Fluttertoast.showToast(
        msg: message,
        toastLength: Toast.LENGTH_LONG,
        gravity: ToastGravity.BOTTOM,
        timeInSecForIosWeb:5,
        backgroundColor: Colors.red,
        textColor: Colors.white,
        fontSize: 16.0
      
    );
  }
 void upcoming(String message){
    Fluttertoast.showToast(
        msg: message,
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.BOTTOM,
        timeInSecForIosWeb:1,
        backgroundColor: Colors.blue,
        textColor: Colors.black,
        fontSize: 16.0
      
    );
  }
}