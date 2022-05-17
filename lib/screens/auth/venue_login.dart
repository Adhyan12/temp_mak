import 'package:project_mak/router/routes.dart';
import 'package:project_mak/screens/auth/widgets/login_text_field.dart';
import 'package:flutter/material.dart';

class VenueLogin extends StatefulWidget {
  const VenueLogin({Key? key}) : super(key: key);

  @override
  _VenueLoginState createState() => _VenueLoginState();
}

class _VenueLoginState extends State<VenueLogin> {
  bool isChecked = false;
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
              children: [
                const SizedBox(
                  height: 150.0,
                ),
                const Image(
                  image: AssetImage('assets/images/icon.png'),
                  width: 80,
                ),
                const SizedBox(
                  height: 40.0,
                ),
                CustomTextField(
                  hintText: 'Account Number',
                  hide: false,
                ),
                const SizedBox(
                  height: 20.0,
                ),
                CustomTextField(
                  hintText: 'Password',
                  hide: true,
                ),
                const SizedBox(
                  height: 40.0,
                ),
                ElevatedButton(
                  onPressed: () {
                    Navigator.pushNamed(
                        context, Routes.venueRegistrationScreen);
                  },
                  style: ButtonStyle(
                      backgroundColor:
                          MaterialStateProperty.all(Colors.blueAccent),
                      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                        RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30.0),
                        ),
                      ),
                      elevation: MaterialStateProperty.all(0)),
                  child: Container(
                    width: double.infinity,
                    padding: const EdgeInsets.symmetric(vertical: 20),
                    child: const Center(
                      child: Text(
                        'Sign In',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 8.0),
                  child: TextButton(
                    onPressed: () {},
                    child: const Text(
                      'Forgot Password?',
                      style: TextStyle(fontWeight: FontWeight.normal),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class CustomTextField extends StatelessWidget {
  CustomTextField({Key? key, required this.hintText, required this.hide})
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
        fillColor: const Color.fromRGBO(238, 244, 255, 1),
      ),
      obscureText: hide,
    );
  }
}
