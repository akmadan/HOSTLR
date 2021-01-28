import 'package:flutter/material.dart';
import 'package:roomies/ui/text.dart';

class AllRooms extends StatefulWidget {
  @override
  _AllRoomsState createState() => _AllRoomsState();
}

class _AllRoomsState extends State<AllRooms> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 250,
      color: Colors.blue,
      child: Column(
        children: [
          Container(
            height: 50,
            child: Row(
              children: [
                SizedBox(width:10),
                bold_text(text: 'All Rooms', size: 24),
              ],
            ),
          ),
          Expanded(
            child: Container(
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: [
                  Container(
                    width: 100,
                    color: Colors.red,
                  ),
                  Container(
                    width: 100,
                    color: Colors.red,
                  ),
                  Container(
                    width: 100,
                    color: Colors.red,
                  ),
                  Container(
                    width: 100,
                    color: Colors.red,
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
