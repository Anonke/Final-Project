import 'package:flutter/material.dart';
import 'package:flutter_auth/components/rounded_button.dart';
import 'package:flutter_auth/utils/AuthHelper.dart';
import 'package:shared_preferences/shared_preferences.dart';

class OTP extends StatelessWidget {
  TextEditingController otpController = TextEditingController();
  AuthHelper _auth = new AuthHelper();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [],
        centerTitle: true,
        title: Text('Verify OTP'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          
          children: [
            SizedBox(height: 20,),
            TextField(
              controller: otpController,

            ),
            SizedBox(
              height: 100,
            ),
            Row(
              children: [
                Expanded(
                  child: RoundedButton(
                    press: () async {
                      //verify
                      print('Verfss');
                      SharedPreferences _prefs =
                          await SharedPreferences.getInstance();

                           ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(content: Text('Verifying otp code..')),
                            );

                      _auth.verify(context, {
                        'email': _prefs.getString('email'),
                        'code': otpController.text
                      });
                    },
                    text: 'Submit',
                    color: Colors.green,
                  ),
                ),
                SizedBox(
                  width: 10,
                ),
                Expanded(
                  child: RoundedButton(
                    press: () async {
                      //resend otp
                        ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(content: Text('Resend otp code...')),
                      );

                      SharedPreferences _prefs =
                          await SharedPreferences.getInstance();
                      _auth.resend(_prefs.getString('email'));
                    },
                    text: 'Resend',
                    color: Colors.orange,
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
