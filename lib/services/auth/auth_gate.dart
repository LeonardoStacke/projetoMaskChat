import 'package:calculadora/src/calc_page.dart';
import 'package:calculadora/src/login_page.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class AuthGate extends StatefulWidget {
  const AuthGate({super.key});

  @override
  State<AuthGate> createState() => _AuthGateState();
}

class _AuthGateState extends State<AuthGate> {

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    FirebaseAuth.instance.authStateChanges().listen((User? user) { 
      if (user == null){
        Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (context)=> LoginPage(title: 'oi',)));
      }else{
        Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (context)=> CalcPage()));
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(child: CircularProgressIndicator(),)
    );
  }
}