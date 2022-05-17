import 'package:project_mak/utility/colors.dart';
import 'package:flutter/material.dart';

class LoginTextField extends StatelessWidget {
  LoginTextField({Key? key, required this.hintText, required this.hide})
      : super(key: key);

  String hintText;
  bool hide;
  @override
  Widget build(BuildContext context) {
    return TextField(
      textAlign: TextAlign.center,
      decoration: InputDecoration(
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(30.0),
          borderSide: const BorderSide(color: Colors.white, width: 0.0),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(30.0),
          borderSide: const BorderSide(color: Colors.white),
        ),
        hintText: hintText,
        hintStyle: TextStyle(color: Colors.blueGrey),
        filled: true,
        fillColor: textFieldColor,
      ),
      obscureText: hide,
    );
  }
}
