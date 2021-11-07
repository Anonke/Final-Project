import 'package:flutter/material.dart';
import 'package:flutter_auth/Screens/Login/login_screen.dart';
import 'package:flutter_auth/Screens/Signup/components/background.dart';
import 'package:flutter_auth/Screens/Signup/components/or_divider.dart';
import 'package:flutter_auth/Screens/Signup/components/social_icon.dart';
import 'package:flutter_auth/components/already_have_an_account_acheck.dart';
import 'package:flutter_auth/components/rounded_button.dart';
import 'package:flutter_auth/components/rounded_input_field.dart';
import 'package:flutter_auth/components/rounded_name_field.dart';
import 'package:flutter_auth/components/rounded_password_field.dart';
import 'package:flutter_auth/utils/RegisterUser.dart';
import 'package:flutter_svg/svg.dart';

class Body extends StatefulWidget {
  @override
  State<Body> createState() => _BodyState();
}

class _BodyState extends State<Body> {
  final _formKey = GlobalKey<FormState>();
  TextEditingController _nameController = new TextEditingController();

  TextEditingController _emailController = new TextEditingController();

  TextEditingController  _passwordController = new TextEditingController();

  RegisterUser _registerHelper = new RegisterUser();

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Background(
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              "SIGNUP",
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            SizedBox(height: size.height * 0.03),
            SvgPicture.asset(
              "assets/icons/signup.svg",
              height: size.height * 0.35,
            ),

            // This s a name fields
            Form(
                key: _formKey,
                child: Column(
                  children: [
                    RoundedNameField(
                        hintText: "Your Name", controller: _nameController
                        // onChanged: (value) {},
                        ),
                    RoundedInputField(
                        hintText: "Your Email", controller: _emailController
                        // onChanged: (value) {},
                        ),
                    RoundedPasswordField(
                        // onChanged: (value) {},
                        controller: _passwordController),
                    RoundedButton(
                      text: "SIGNUP",
                      press: () {
                        if (_formKey.currentState.validate()) {
                          // If the form is valid, display a snackbar. In the real world,
                          // you'd often call a server or save the information in a database.
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                                content: Text('Creating your account...')),
                          );

                          //Get form data and submit

                          print('cre');

                          var formData = {
                            'email': _emailController.text,
                            'name': _nameController.text,
                            'password': _passwordController.text,
                          };

                          print('form data is');
                          print(formData);
                          _registerHelper.register(formData, context);
                          //send to server/ db

                        }
                      },
                    ),
                  ],
                )),
            SizedBox(height: size.height * 0.03),
            AlreadyHaveAnAccountCheck(
              login: false,
              press: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) {
                      return LoginScreen();
                    },
                  ),
                );
              },
            ),
            OrDivider(),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                SocalIcon(
                  iconSrc: "assets/icons/facebook.svg",
                  press: () {},
                ),
                SocalIcon(
                  iconSrc: "assets/icons/twitter.svg",
                  press: () {},
                ),
                SocalIcon(
                  iconSrc: "assets/icons/google-plus.svg",
                  press: () {},
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
