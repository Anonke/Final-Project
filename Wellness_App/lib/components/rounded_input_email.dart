import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_auth/components/text_field_container.dart';
import 'package:flutter_auth/constants.dart';

class RoundedInputEmail extends StatelessWidget {
  final String hintText;
  final IconData icon;
  final TextEditingController controller;
  final ValueChanged<String> onChanged;
  const RoundedInputEmail({
    Key key,
    this.hintText,
    this.icon = Icons.person,
    this.onChanged,
    this.controller,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFieldContainer(
      child: TextFormField(
        controller: controller,
        // onChanged: onChanged,
        cursorColor: kPrimaryColor,
        validator: (value) {
          if (value == null || value.isEmpty) {
            return "This field is required.";
          }

          //check if email is valid
          final bool isValid = EmailValidator.validate(value);
          if (!isValid) {
            return 'Please enter a valid email address.';
          }
          return null;
        },
        decoration: InputDecoration(
          icon: Icon(
            icon,
            color: kPrimaryColor,
          ),
          hintText: hintText,
          border: InputBorder.none,
        ),
      ),
    );
  }
}
