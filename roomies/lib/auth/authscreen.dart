import 'package:flutter/material.dart';
import 'package:roomies/auth/authformm.dart';

class AuthScreen extends StatefulWidget {
  @override
  _AuthScreenState createState() => _AuthScreenState();
}

class _AuthScreenState extends State<AuthScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(backgroundColor: Color(0xff0a0a0a), body: AuthForm());
  }
}
