import 'package:flutter/material.dart';
import 'package:roomies/ui/text.dart';

class ProfileInfo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var h = MediaQuery.of(context).size.height;
    var w = MediaQuery.of(context).size.width;
    return Container(
      padding: EdgeInsets.all(10),
      height: 100,
      width: w,
      child: Column(
        children: [
          Row(
            children: [
              bold_text(
                text: 'Akshit Madan',
                size: 28,
              ),
            ],
          ),
          Row(
            children: [
              modified_text(
                text: '8669164552',
                size: 18,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
