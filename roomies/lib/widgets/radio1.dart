import 'package:flutter/material.dart';
import 'package:roomies/ui/text.dart';

class Radio1 extends StatefulWidget {
  @override
  _Radio1State createState() => _Radio1State();
}

class _Radio1State extends State<Radio1> {
  int _value = 0;
  List<String> method = ['For Families', 'For anyone'];

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: <Widget>[
          for (int i = 0; i <= 1; i++)
            ListTile(
              title: bold_text(
                text: method[i],
                size: 18,
              ),
              leading: Radio(
                value: i,
                groupValue: _value,
                activeColor: Color(0xFF6200EE),
                onChanged: i == 5
                    ? null
                    : (int value) {
                        setState(() {
                          _value = value;
                        });
                      },
              ),
            ),
        ],
      ),
    );
  }
}
