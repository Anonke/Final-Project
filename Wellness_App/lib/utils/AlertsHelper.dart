import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_auth/utils/UriHelper.dart';
import 'package:nb_utils/nb_utils.dart';

class AlertsHelper {
  Dio dio = new Dio();
  createAlert(payload, context) {
    dio.post(UriHelper.getUrl('api/alerts/store'), data: payload).then((value) {
      //show toastr
      Navigator.pop(context);
      Fluttertoast.showToast(
        msg: 'Alert created successfully',
      );
    }).catchError((error) {
      print(error);
      //show toastr error
      Fluttertoast.showToast(
        backgroundColor: Color(0xff7043),
        msg: 'There was an error.',
      );
    });
  }

  sendAlert(context) async {
    //user logged in user id
    var sPrefs = await SharedPreferences.getInstance();
    var userId = sPrefs.getInt('userId');
    dio.get(UriHelper.getUrl('api/alerts/send/$userId')).then((value) {
      Fluttertoast.showToast(
        msg: 'Alert sent successfully',
      );
      // Navigator.pop(context);
    }).catchError((error) {
      print(error);
    });
    //send request
  }
}
