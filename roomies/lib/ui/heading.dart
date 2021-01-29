import 'package:flutter/material.dart';
import 'package:roomies/ui/text.dart';

class Heading extends StatelessWidget {
  final String text;

  const Heading({Key key, this.text}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
        padding: EdgeInsets.all(15),
        child: bold_text(
          text: text,
          size: 24,
        ));
  }
}
