import 'package:project_mak/services/user_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class PrimaryButton extends StatelessWidget {
  final String buttonText;
  final Color buttonColor;
  final Color buttonTextColor;
  final String routeName;
  const PrimaryButton(
      {Key? key,
      required this.buttonText,
      required this.buttonColor,
      required this.buttonTextColor,
      required this.routeName})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
        if (buttonText == 'Login as Guest') {
          Provider.of<UserProvider>(context, listen: false)
              .updateSource('guest');
        } else {
          Provider.of<UserProvider>(context, listen: false)
              .updateSource('venue');
        }
        Navigator.pushNamed(context, routeName);
      },
      style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all(buttonColor),
          shape: MaterialStateProperty.all<RoundedRectangleBorder>(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(30.0),
            ),
          ),
          elevation: MaterialStateProperty.all(0)),
      child: Container(
        width: double.infinity,
        padding: const EdgeInsets.symmetric(vertical: 20),
        child: Center(
          child: Text(
            buttonText,
            style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                color: buttonTextColor),
          ),
        ),
      ),
    );
  }
}
