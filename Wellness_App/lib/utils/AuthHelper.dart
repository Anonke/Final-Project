import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_auth/Screens/Dashboard/HomePage.dart';
import 'package:flutter_auth/Screens/Login/login_screen.dart';
import 'package:flutter_auth/Screens/T14TravelScreen.dart';
import 'package:flutter_auth/Screens/Welcome/welcome_screen.dart';
import 'package:flutter_auth/utils/UriHelper.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:nb_utils/nb_utils.dart';

class AuthHelper {
  Dio dio;

  auth(payload, context) {
    print('in method');
    print(payload);
    print(UriHelper.getUrl('api/customAuth'));
    dio = Dio();
    dio
        .post(UriHelper.getUrl('api/customAuth'), data: payload)
        .then((response) async {
      //Redirect user to welcome page
      print('login response');
      print(response.data['user']);
      var sPrefs = await SharedPreferences.getInstance();
      sPrefs.setInt('userId', response.data['user']['id']);
      if (response.data['auth'] == true) {
        //Login successful
        Navigator.push(context, MaterialPageRoute(builder: (context) {
          return T14TravelScreen();
        }));
      } else {
        //Wrong credentials
        Fluttertoast.showToast(
            msg:
                'These credentials do not match our records. Please try again.');
      }
    }).catchError((e) {
      print('error encountered');
      print(e);
    });
  }

  void verify(context, payload) {
    dio = Dio();
    print('verifying');
    print(payload['email']);
    dio.post(UriHelper.getUrl('api/verify'), data: payload).then((value) {
      print('Verification response');
      print(value.data);

      if (value.data == 'true') {
        //redirect to welcome page
        Navigator.push(context, MaterialPageRoute(builder: (context) {
          return LoginScreen();
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
    dio.get(UriHelper.getUrl('api/sendMail/$email')).then((value) {
      print('Resend response');
      print(value.data);
    }).catchError((err) {
      print('An error occured');
      print(err.message);
    });
  }
}
