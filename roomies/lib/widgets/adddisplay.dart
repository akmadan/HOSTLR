import 'package:flutter/material.dart';
import 'package:roomies/widgets/add_display_photo.dart';

class AddDisplay extends StatefulWidget {
  static TextEditingController namecontroller = TextEditingController();

  @override
  _AddDisplayState createState() => _AddDisplayState();
}

class _AddDisplayState extends State<AddDisplay> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10),
      height: 250,
      child: Row(children: [
        AddDisplayPhoto(),
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
