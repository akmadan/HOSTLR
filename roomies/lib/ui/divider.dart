import 'package:flutter/material.dart';

class divider extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(left:10, right:10),
      child: Divider(
        height: 1,
        color: Colors.white54,
      ),
    );
  }
}
