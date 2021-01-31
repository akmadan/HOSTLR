import 'package:flutter/material.dart';

class AddDisplay extends StatefulWidget {
  static TextEditingController namecontroller = TextEditingController();

  @override
  _AddDisplayState createState() => _AddDisplayState();
}

class _AddDisplayState extends State<AddDisplay> {
  @override
  Widget build(BuildContext context) {
    var w = MediaQuery.of(context).size.width;

    return Container(
      padding: EdgeInsets.all(10),
      height: 250,
      // color: Colors.red,
      child: Row(children: [
        Container(width: w / 2.2, color: Colors.white),
        Expanded(
            child: Column(
          children: [
            Container(
              padding: EdgeInsets.all(10),
              child: TextField(
                controller: AddDisplay.namecontroller,
                decoration: InputDecoration(
                    hintText: 'Name of Place', border: OutlineInputBorder()),
              ),
            ),
          ],
        ))
      ]),
    );
  }
}
