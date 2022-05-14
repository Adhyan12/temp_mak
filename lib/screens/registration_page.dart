import 'package:flutter/material.dart';

class RegistrationPage extends StatefulWidget {
  static const String id = 'RegistrationPage';
  const RegistrationPage({Key? key}) : super(key: key);

  @override
  State<RegistrationPage> createState() => _RegistrationPageState();
}

class _RegistrationPageState extends State<RegistrationPage> {
  bool isChecked = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            children: [
              const SizedBox(
                height: 100.0,
              ),
              const Image(image: AssetImage('images/icon.png')),
              const SizedBox(
                height: 20.0,
              ),
              const Text(
                'Cover Me',
                style: TextStyle(
                    fontSize: 40,
                    fontWeight: FontWeight.bold,
                    fontStyle: FontStyle.italic),
              ),
              const SizedBox(
                height: 40.0,
              ),
              CustomTextField(hintText: 'Account Number',hide: false,),
              const SizedBox(
                height: 20.0,
              ),
              CustomTextField(hintText: 'Password',hide: true,),
              const SizedBox(
                height: 40.0,
              ),
              ElevatedButton(
                onPressed: () {},
                style: ButtonStyle(
                    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                      RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30.0),
                        side: const BorderSide(color: Colors.deepPurpleAccent),
                      ),
                    ),
                    elevation: MaterialStateProperty.all(10.0)),
                child: const SizedBox(
                    width: double.infinity,
                    height: 50.0,
                    child: Center(
                        child: Text(
                      'Sign In',
                      style: TextStyle(fontSize: 18),
                    ))),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 8.0),
                child: TextButton(
                  onPressed: () {},
                  child: const Text(
                    'Forgot Password',
                    style: TextStyle(
                        color: Colors.black, fontWeight: FontWeight.bold),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top:20.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Checkbox(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20)),
                        value: isChecked,
                        onChanged: (bool? value) {
                          setState(() {
                            isChecked = value!;
                          });
                        }),
                   const  Text('Accept Terms and Conditions', style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold,fontSize: 15),)
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class CustomTextField extends StatelessWidget {
  CustomTextField({Key? key, required this.hintText,required this.hide}) : super(key: key);

  String hintText;
  bool hide;
  @override
  Widget build(BuildContext context) {
    return TextField(
      textAlign: TextAlign.center,
      decoration: InputDecoration(
        border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(30.0),
            borderSide: const BorderSide(color: Colors.grey, width: 0)),
        // enabledBorder: const OutlineInputBorder(
        //   borderSide: BorderSide(color: Colors.grey),
        // ),
        hintText: hintText,
        filled: true,
        fillColor: Colors.grey[200],
      ),
      obscureText: hide,
    );
  }
}
