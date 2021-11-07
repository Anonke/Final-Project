import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_auth/Screens/Dashboard/HomePage.dart';
import 'package:flutter_auth/Screens/Welcome/welcome_screen.dart';
import 'package:fluttertoast/fluttertoast.dart';

class AuthHelper {
  Dio dio;

  auth(payload, context) {
    print('in method');
    dio = Dio();
    dio
        .post('https://4296-197-177-74-206.ngrok.io/api/customAuth',
            data: payload)
        .then((response) {
      //Redirect user to welcome page
      print('login response');
      print(response.data['auth']);
      if (response.data['auth']) {
        //Login successful
        Navigator.push(context, MaterialPageRoute(builder: (context) {
          return HomePage();
        }));
      } else {
        //Wrong credentials
        Fluttertoast.showToast(
            msg:
                'These credentials do not match our records. Please try again.');
      }
    }).catchError((e) {
      print("An error ...world" + e.message);
    });
  }

  void verify(context, payload) {
    dio = Dio();
    print('verifying');
    print(payload['email']);
    dio
        .post('https://4296-197-177-74-206.ngrok.io/api/verify', data: payload)
        .then((value) {
      print('Verification response');
      print(value.data);

      if (value.data == 'true') {
        //redirect to welcome page
        Navigator.push(context, MaterialPageRoute(builder: (context) {
          return HomePage();
        }));
      } else {
        //show error toast
        Fluttertoast.showToast(
            msg: 'The code is invalid. Didnt get a code, resend');
      }
    }).catchError((err) {
      print('An error occured');
      print(err.message);
    });
  }

  void resend(email) {
    dio = Dio();
    print('resending');
    print(email);
    dio
        .get('https://4296-197-177-74-206.ngrok.io/api/sendMail/$email')
        .then((value) {
      print('Resend response');
      print(value.data);
    }).catchError((err) {
      print('An error occured');
      print(err.message);
    });
  }
}
