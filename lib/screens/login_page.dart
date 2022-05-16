import 'package:flutter/material.dart';
import 'package:flag/flag.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);
  static const String id = 'LoginPage';

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 100),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              const Image(image: AssetImage('images/icon.png')),
               const SizedBox(
                height: 30,
              ),
              const Text('Cover Me',
                  style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold)),
              const SizedBox(
                height: 30,
              ),
              TextFormField(
                style: const TextStyle(fontWeight: FontWeight.bold,fontSize: 20),
                decoration: InputDecoration(
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(30.0),
                    borderSide: const BorderSide(color: Colors.white, width: 0.0),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(30.0),
                    borderSide: const BorderSide(color: Colors.white),
                  ),
                  filled: true,
                  fillColor: Colors.grey[200],
                  prefixIcon: Padding(
                    padding: const EdgeInsets.only(left:30.0,right: 8.0,top: 8.0,bottom: 8.0),
                    child: Flag.fromCode(
                      FlagsCode.IN,
                      height: 30,
                      width: 30,
                      flagSize: FlagSize.size_4x3,
                      borderRadius: 10,
                    ),
                  ),
                  prefix: const Padding(
                    padding:  EdgeInsets.only(left: 8.0,right:20),
                    child: Text('+91', style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20)),
                  ),
                ),
              ),
              const SizedBox(
                height: 30,
              ),
              ElevatedButton(
                onPressed: () {},
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(Colors.indigo.shade400),
                  shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                    RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30.0),
                    ),
                  ),
                  elevation: MaterialStateProperty.all(0),
                ),
                child: Container(
                  width: double.infinity,
                  padding: const EdgeInsets.symmetric(vertical: 20),
                  child: const Center(
                    child: Text(
                      'Login',
                      style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: Colors.white),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
