import 'package:flutter/material.dart';
import 'package:roomies/ui/text.dart';

class FlatBubble extends StatefulWidget {
  final String name, rent, time, whom, description, address, uid;

  const FlatBubble(
      {Key key,
      this.name,
      this.rent,
      this.time,
      this.whom,
      this.description,
      this.address,
      this.uid})
      : super(key: key);
  @override
  _FlatBubbleState createState() => _FlatBubbleState();
}

class _FlatBubbleState extends State<FlatBubble> {
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
            Stack(
              children: [
                Positioned(
                  child: Container(
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
                ),
                widget.whom == '0'
                    ? Positioned(
                        top: -1,
                        right: -1,
                        child: Image.asset('assets/ribbon.png'))
                    : Container()
              ],
            ),
            Container(
              padding: EdgeInsets.only(left: 8),
              height: 70,
              child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: Container(
                          child: bold_text(text: widget.name, size: 16)),
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
