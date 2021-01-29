import 'package:flutter/material.dart';
import 'package:roomies/ui/text.dart';

class LocationCaution extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 30,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Icon(
            Icons.warning,
            color: Colors.yellow[700],
          ),
          SizedBox(width:5),
          bold_text(
            text: "Location can't be changed later !",
            color: Colors.white,
          )
        ],
      ),
    );
  }
}
