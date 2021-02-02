import 'package:flutter/material.dart';

class Circular extends StatefulWidget {
  @override
  _CircularState createState() => _CircularState();
}

class _CircularState extends State<Circular> {
  @override
  Widget build(BuildContext context) {
    return Container(
        padding: EdgeInsets.all(5),
        child: Center(child: CircularProgressIndicator()));
  }
}
