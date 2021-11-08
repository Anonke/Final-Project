import 'package:dio/dio.dart';
import 'package:flutter_auth/Screens/Login/login_screen.dart';
import 'package:flutter_auth/Screens/OtpScreen.dart';
import 'package:flutter_auth/utils/UriHelper.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class RegisterUser {
  register(payload, context) {
    //Make request to db

    Dio dio = new Dio();
    print('Making request');
    dio
        .post(UriHelper.getUrl('api/register'),
            data: payload)
        .then((value) async {
      Fluttertoast.showToast(msg: 'Account successfully created');
      //store email in sharedprefs
        SharedPreferences _prefs = await SharedPreferences.getInstance();
        _prefs.setString('email', value.data['email']);
        print('registered user');
        print(value.data);
      Navigator.push(context, MaterialPageRoute(builder: (context) {
        return OTP();
      }));
    }).catchError((err) {
      print(err);
    });
  }
}
