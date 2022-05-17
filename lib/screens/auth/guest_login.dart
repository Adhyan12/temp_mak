import 'package:project_mak/router/routes.dart';
import 'package:project_mak/screens/auth/widgets/primary_button.dart';
import 'package:project_mak/utility/colors.dart';
import 'package:flutter/material.dart';
import 'package:intl_phone_field/intl_phone_field.dart';

class GuestLogin extends StatefulWidget {
  const GuestLogin({Key? key}) : super(key: key);

  @override
  _GuestLoginState createState() => _GuestLoginState();
}

class _GuestLoginState extends State<GuestLogin> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 100),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              const Image(image: AssetImage('assets/images/icon.png')),
              const SizedBox(
                height: 30,
              ),
              const Text('Cover Me',
                  style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold)),
              const SizedBox(
                height: 30,
              ),
              IntlPhoneField(
                decoration: InputDecoration(
                  hintText: 'Enter Mobile Number',
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(30.0),
                    borderSide:
                        const BorderSide(color: Colors.white, width: 0.0),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(30.0),
                    borderSide: const BorderSide(color: Colors.white),
                  ),
                  filled: true,
                  fillColor: textFieldColor,
                ),
                initialCountryCode: 'IN',
                onChanged: (phone) {
                  print(phone.completeNumber);
                },
              ),
              const SizedBox(
                height: 30,
              ),
              const PrimaryButton(
                  buttonText: 'Login',
                  buttonColor: primaryColor,
                  buttonTextColor: Colors.white,
                  routeName: Routes.otpVerification),
            ],
          ),
        ),
      ),
    );
  }
}
