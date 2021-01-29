import 'package:flutter/material.dart';
import 'package:roomies/ui/divider.dart';
import 'package:roomies/ui/heading.dart';
import 'package:roomies/ui/text.dart';
import 'package:roomies/widgets/adddisplay.dart';
import 'package:roomies/widgets/addphotos.dart';
import 'package:roomies/widgets/otherinfo.dart';
import 'package:roomies/widgets/radio1.dart';

class AddPlace extends StatefulWidget {
  @override
  _AddPlaceState createState() => _AddPlaceState();
}

class _AddPlaceState extends State<AddPlace> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff0a0a0a),
      appBar: AppBar(
          backgroundColor: Colors.transparent,
          title: bold_text(text: 'Add Your Place')),
      body: ListView(
        children: [
          Heading(text: 'Display Information'),
          AddDisplay(),
          divider(),
          Heading(text: 'Add Photos'),
          AddPhotos(),
          divider(),
          Heading(text: 'For Whom the Place is ?'),
          Radio1(),
          divider(),
          Heading(text: 'Other Information'),
          OtherInfo(),
        ],
      ),
    );
  }
}
