import 'package:flutter/material.dart';
import 'package:roomies/ui/text.dart';

class Radio2 extends StatefulWidget {
  static int value = 0;
  @override
  _Radio2State createState() => _Radio2State();
}

class _Radio2State extends State<Radio2> {
  List<String> method = ['Flat', 'Hostel'];

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
                groupValue: Radio2.value,
                activeColor: Theme.of(context).primaryColor,
                onChanged: i == 5
                    ? null
                    : (int value) {
                        setState(() {
                          Radio2.value = value;
                        });
                      },
              ),
            ),
        ],
      ),
    );
  }
}
