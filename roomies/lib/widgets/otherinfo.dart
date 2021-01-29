import 'package:flutter/material.dart';
import 'package:roomies/ui/text.dart';

class OtherInfo extends StatefulWidget {
  @override
  _OtherInfoState createState() => _OtherInfoState();
}

class _OtherInfoState extends State<OtherInfo> {
  @override
  Widget build(BuildContext context) {
    return Container(
        child: Column(
      children: [
        Container(
          padding: EdgeInsets.all(10),
          child: TextField(
            decoration: InputDecoration(hintText: 'Address'),
          ),
        ),
        Container(
          padding: EdgeInsets.all(10),
          child: TextField(
            decoration: InputDecoration(hintText: 'Contact no.'),
          ),
        ),
        Row(children: [
          Expanded(
            child: Container(
              padding: EdgeInsets.all(10),
              child: TextField(
                decoration: InputDecoration(hintText: 'Rent in Rupees'),
              ),
            ),
          ),
          Container(padding: EdgeInsets.all(5), child: bold_text(text: 'for')),
          Expanded(
            child: Container(
              padding: EdgeInsets.all(10),
              child: TextField(
                decoration: InputDecoration(hintText: 'no. of months'),
              ),
            ),
          ),
        ]),
        Container(
          padding: EdgeInsets.all(10),
          child: TextField(
            decoration: InputDecoration(hintText: 'Description (optional)'),
          ),
        ),
      ],
    ));
  }
}
