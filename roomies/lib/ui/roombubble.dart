import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:roomies/ui/save_function.dart';
import 'package:roomies/ui/text.dart';

class RoomBubble extends StatefulWidget {
  final String name,
      rent,
      time,
      whom,
      description,
      address,
      uid,
      d0,
      place_location;

  const RoomBubble(
      {Key key,
      this.name,
      this.rent,
      this.time,
      this.whom,
      this.description,
      this.address,
      this.uid,
      this.d0,
      this.place_location})
      : super(key: key);
  @override
  _RoomBubbleState createState() => _RoomBubbleState();
}

class _RoomBubbleState extends State<RoomBubble> {
  bool issaved = false;
  @override
  void initState() {
    super.initState();
    checksaved();
  }

  checksaved() async {
    FirebaseUser user = await FirebaseAuth.instance.currentUser();
    String id = user.uid;
    var saved = await Firestore.instance
        .collection('saved')
        .document(widget.place_location)
        .collection(widget.name)
        .document(id)
        .get();
    if (saved.exists) {
      setState(() {
        issaved = true;
      });
    } else {
      setState(() {
        issaved = false;
      });
    }
  }

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
                            image: widget.d0 != null
                                ? NetworkImage(widget.d0)
                                : AssetImage('assets/sample2.jpg'),
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
                    issaved
                        ? IconButton(
                            icon: Icon(
                              Icons.bookmark,
                              color: Theme.of(context).primaryColor,
                            ),
                            onPressed: () {
                              remove_save(widget.name, widget.place_location);
                              setState(() {
                                issaved = !issaved;
                              });
                            })
                        : IconButton(
                            icon: Icon(Icons.bookmark),
                            onPressed: () {
                              save(widget.name, widget.place_location);
                              setState(() {
                                issaved = !issaved;
                              });
                            })
                  ]),
            )
          ],
        ),
      ),
    );
  }
}
