import 'package:flutter/material.dart';
import 'package:roomies/rooms/all.dart';
import 'package:roomies/ui/text.dart';
import 'package:roomies/widgets/appbar.dart';

class Rooms extends StatefulWidget {
  @override
  _RoomsState createState() => _RoomsState();
}

class _RoomsState extends State<Rooms> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff0a0a0a),
      body: SingleChildScrollView(child: Column(
        children:[
          AllRooms()
        ]
      ),),
    );
  }
}
