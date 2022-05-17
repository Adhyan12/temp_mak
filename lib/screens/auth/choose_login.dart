import 'package:project_mak/screens/auth/widgets/primary_button.dart';
import 'package:project_mak/utility/colors.dart';
import 'package:flutter/material.dart';

import '../../router/routes.dart';

class ChooseLogin extends StatefulWidget {
  const ChooseLogin({Key? key}) : super(key: key);

  @override
  _ChooseLoginState createState() => _ChooseLoginState();
}

class _ChooseLoginState extends State<ChooseLogin> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: ConstrainedBox(
          constraints: BoxConstraints(
            maxHeight: MediaQuery.of(context).size.height,
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Column(
                  children: const [
                    SizedBox(
                      height: 150.0,
                    ),
                    Image(
                      image: AssetImage('assets/images/icon.png'),
                      width: 80,
                    ),
                    SizedBox(
                      height: 20.0,
                    ),
                  ],
                ),
                Column(
                  children: const [
                    PrimaryButton(
                      buttonText: 'Login as Guest',
                      buttonColor: primaryColor,
                      buttonTextColor: Colors.white,
                      routeName: Routes.guestLogin,
                    ),
                    SizedBox(height: 20),
                    PrimaryButton(
                      buttonText: 'Login as Venue',
                      buttonColor: Color.fromRGBO(200, 230, 255, 1),
                      buttonTextColor: Colors.black,
                      routeName: Routes.venueLogin,
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
