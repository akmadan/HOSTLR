import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'auth/authscreen.dart';
import 'home.dart';

class Check extends StatefulWidget {
  @override
  _CheckState createState() => _CheckState();
}

class _CheckState extends State<Check> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder(
          stream: FirebaseAuth.instance.onAuthStateChanged,
          builder: (context, usersnapshot) {
            if (usersnapshot.hasData) {
              Future.delayed(Duration(milliseconds: 2500), () {});
              return HomePage();
            } else {
              Future.delayed(Duration(milliseconds: 2500), () {});
              return AuthScreen();
            }
          }),
    );
  }
}
