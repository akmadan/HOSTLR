import 'package:flutter/material.dart';

import 'dart:async';

import '../check.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();

    _mockCheckForSession();
  }

  Future<bool> _mockCheckForSession() async {
    await Future.delayed(Duration(milliseconds: 1500), () {});
    Navigator.of(context).pushReplacement(
        MaterialPageRoute(builder: (BuildContext context) => Check()));
    return true;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color(0xff0a0a0a),
        body: Center(
          child: Container(
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            child: Stack(children: [
              Center(
                child: Container(
                  height: 100,
                  width: 100,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(25.0),
                      image: DecorationImage(
                          image: AssetImage('assets/logo.jpg'))),
                ),
              ),
              Positioned(
                  bottom: 20,
                  left: 10,
                  right: 10,
                  child: Column(
                    children: [
                      Text(
                        'by',
                        style: TextStyle(
                            fontFamily: 'SFPro',
                            fontSize: 18,
                            color: Colors.grey[500]),
                      ),
                      Text(
                        'Benzene',
                        style: TextStyle(
                            fontFamily: 'SFPro',
                            fontSize: 24,
                            color: Theme.of(context).primaryColor),
                      )
                    ],
                  ))
            ]),
          ),
        ));
  }
}
