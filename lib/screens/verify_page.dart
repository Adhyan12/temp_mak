import 'package:flutter/material.dart';
import 'package:project_mak/constants.dart';

class VerifyPage extends StatefulWidget {
  const VerifyPage({Key? key, pnumber}) : super(key: key);
  static const String id = 'VerifyPage';
  static final String pnumber = '';
//TODO: set font, accept pnumber from previous login page
  @override
  State<VerifyPage> createState() => _VerifyPageState();
}

class _VerifyPageState extends State<VerifyPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 35, vertical: 100),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Verify \n your number',
                style: TextStyle(fontSize: 30, fontWeight: FontWeight.w500),
              ),
              const SizedBox(
                height: 20,
              ),
              const Text("We've sent your verification code to \n pnumber",
                  style: kValueTextStyle),
              const SizedBox(
                height: 20,
              ),
              const TextField(
                decoration: InputDecoration(
                    enabledBorder: UnderlineInputBorder(
                        borderSide: BorderSide(width: 0.3))),
              ),
              const SizedBox(
                height: 40,
              ),
              ElevatedButton(
                onPressed: () {},
                style: ButtonStyle(
                  backgroundColor:
                      MaterialStateProperty.all(Colors.indigo.shade400),
                  shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                    RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30.0),
                    ),
                  ),
                  elevation: MaterialStateProperty.all(10),
                ),
                child: Container(
                  width: double.infinity,
                  padding: const EdgeInsets.symmetric(vertical: 20),
                  child: const Center(
                    child: Text(
                      'Verify',
                      style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: Colors.white),
                    ),
                  ),
                ),
              ),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 15),
                alignment: Alignment.topLeft,
                child: TextButton(
                  onPressed: () {},
                  child: const Text(
                    'Resend code',
                    style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Colors.black),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
