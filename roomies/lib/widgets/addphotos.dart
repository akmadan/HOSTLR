import 'package:flutter/material.dart';

class AddPhotos extends StatefulWidget {
  @override
  _AddPhotosState createState() => _AddPhotosState();
}

class _AddPhotosState extends State<AddPhotos> {
  @override
  Widget build(BuildContext context) {
    var h = MediaQuery.of(context).size.height;
    var w = MediaQuery.of(context).size.width;
    return Container(
      padding: EdgeInsets.all(10),
      height: 250,
      child: ListView(scrollDirection: Axis.horizontal, children: [
        Container(
            margin: EdgeInsets.all(5), width: w / 2.2, color: Colors.white),
        Container(
            margin: EdgeInsets.all(5), width: w / 2.2, color: Colors.white),
        Container(
            margin: EdgeInsets.all(5), width: w / 2.2, color: Colors.white),
        Container(
            margin: EdgeInsets.all(5), width: w / 2.2, color: Colors.white),
      ]),
    );
  }
}
