import 'package:flutter/material.dart';
import 'package:roomies/rooms/all.dart';
import 'package:roomies/rooms/flats.dart';

class Rooms extends StatefulWidget {
  final String uid, location;

  const Rooms({Key key, this.uid, this.location}) : super(key: key);
  @override
  _RoomsState createState() => _RoomsState();
}

class _RoomsState extends State<Rooms> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff0a0a0a),
      body: SingleChildScrollView(
        child: Column(children: [
          Flats(
            uid: widget.uid,
            location: widget.location,
          ),
          AllRooms(
            uid: widget.uid,
            location: widget.location,
          ),
        ]),
      ),
    );
  }
}
