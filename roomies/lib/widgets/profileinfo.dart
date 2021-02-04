import 'package:flutter/material.dart';
import 'package:roomies/ui/text.dart';

class ProfileInfo extends StatelessWidget {
  final String name, contact;

  const ProfileInfo({Key key, this.name, this.contact}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    var w = MediaQuery.of(context).size.width;
    return Container(
      padding: EdgeInsets.all(10),
      height: 80,
      width: w,
      child: Column(
        children: [
          Row(
            children: [
              bold_text(
                text:name,
                size: 28,
              ),
            ],
          ),
          Row(
            children: [
              modified_text(
                text: contact,
                size: 18,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
