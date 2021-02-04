import 'package:flutter/material.dart';
import 'package:roomies/ui/text.dart';

class Radio1 extends StatefulWidget {
  static int value = 0;
  @override
  _Radio1State createState() => _Radio1State();
}

class _Radio1State extends State<Radio1> {
  List<String> method = ['For anyone', 'For Families'];

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
                groupValue: Radio1.value,
                activeColor: Theme.of(context).primaryColor,
                onChanged: i == 5
                    ? null
                    : (int value) {
                        setState(() {
                          Radio1.value = value;
                        });
                      },
              ),
            ),
        ],
      ),
    );
  }
}
