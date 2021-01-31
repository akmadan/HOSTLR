import 'package:flutter/material.dart';
import 'package:roomies/ui/text.dart';

class RoomBubble extends StatefulWidget {
  @override
  _RoomBubbleState createState() => _RoomBubbleState();
}

class _RoomBubbleState extends State<RoomBubble> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10),
      width: 300,
      child: Card(
        color: Colors.grey[900],
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Container(
              width: 300,
              height: 200,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(10),
                      topRight: Radius.circular(10)),
                  image: DecorationImage(
                      image: AssetImage('assets/sample2.jpg'),
                      fit: BoxFit.cover)),
            ),
            Container(
              padding: EdgeInsets.only(left: 8),
              height: 70,
              child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: Container(
                          child:
                              bold_text(text: 'Shyam Lal Hostels', size: 16)),
                    ),
                    IconButton(icon: Icon(Icons.bookmark), onPressed: () {})
                  ]),
            )
          ],
        ),
      ),
    );
  }
}
