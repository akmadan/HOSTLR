import 'package:flutter/material.dart';

class Logo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var w = MediaQuery.of(context).size.width;
    return Container(
      padding: EdgeInsets.only(top: 20),
      height: 150,
      width: w,
      child: Center(
        child: Container(
            height: 80,
            width: 80,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: Colors.red,
                image: DecorationImage(image: AssetImage('assets/logo.jpg')))),
      ),
    );
  }
}
