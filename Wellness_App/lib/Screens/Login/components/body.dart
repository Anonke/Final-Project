import 'package:flutter/material.dart';
import 'package:flutter_auth/Screens/Login/components/background.dart';
import 'package:flutter_auth/Screens/Signup/signup_screen.dart';
import 'package:flutter_auth/components/already_have_an_account_acheck.dart';
import 'package:flutter_auth/components/rounded_button.dart';
import 'package:flutter_auth/components/rounded_input_field.dart';
import 'package:flutter_auth/components/rounded_password_field.dart';
import 'package:flutter_auth/utils/AuthHelper.dart';
import 'package:flutter_svg/svg.dart';

class Body extends StatefulWidget {
  const Body({
    Key key,
  }) : super(key: key);

  @override
  State<Body> createState() => _BodyState();
}

class _BodyState extends State<Body> {
  final _formkey = GlobalKey<FormState>();

  TextEditingController _emailController = new TextEditingController();

  TextEditingController _passwordController = new TextEditingController();

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Background(
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              "LOGIN",
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            SizedBox(height: size.height * 0.03),
            SvgPicture.asset(
              "assets/icons/login.svg",
              height: size.height * 0.35,
            ),
            SizedBox(height: size.height * 0.03),
            Form(
                key: _formkey,
                child: Column(
                  children: [
                    RoundedInputField(
                      hintText: "Your Email",
                      // onChanged: (value) {},
                      controller: _emailController,
                    ),
                    RoundedPasswordField(
                      // onChanged: (value) {},
                      controller: _passwordController,
                    ),
                  ],
                )),
            RoundedButton(
              text: "LOGIN",
              press: () {
                if (_formkey.currentState.validate()) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text('Starting your session...')),
                  );

                  //check if details valid
                  AuthHelper auth = new AuthHelper();
                  Map<String, dynamic> payload = {
                    'email': _emailController.text,
                    'password': _passwordController.text
                  };
                  auth.auth(payload, context);
                }
              },
            ),
            SizedBox(height: size.height * 0.03),
            AlreadyHaveAnAccountCheck(
              press: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) {
                      return SignUpScreen();
                    },
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
