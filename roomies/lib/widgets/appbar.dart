import 'package:flutter/material.dart';
import 'package:roomies/ui/text.dart';

class appbar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
          child: Row(children: [
            Icon(Icons.room, color: Theme.of(context).accentColor),
            SizedBox(width: 5),
            bold_text(text: 'Pimpri')
          ]),
        );
  }
}
