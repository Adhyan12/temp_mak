import 'package:flutter/material.dart';
import 'package:project_mak/screens/screens.dart';

void main(){
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: const VerifyPage(),
      routes: {
        RegistrationPage.id : (context)=>const RegistrationPage(),
        BranchInfo.id : (context)=> const BranchInfo(),
        OutletDetails.id: (context)=> const OutletDetails(),
        LoginPage.id: (context)=> const LoginPage(),
        VerifyPage.id:(context)=> const VerifyPage(),
      },
    );
  }
}
