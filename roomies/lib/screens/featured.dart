import 'package:flutter/material.dart';
import 'package:roomies/featured/best_cot_basis.dart';
import 'package:roomies/featured/best_flats.dart';
import 'package:roomies/featured/best_hostels.dart';
import 'package:roomies/featured/best_pg.dart';

class Featured extends StatefulWidget {
  final String uid, location;

  const Featured({Key key, this.uid, this.location}) : super(key: key);
  @override
  _FeaturedState createState() => _FeaturedState();
}

class _FeaturedState extends State<Featured> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff0a0a0a),
      body: SingleChildScrollView(
        child: Column(children: [
          BestCots(
            uid: widget.uid,
            location: widget.location,
          ),
          BestFlats(
            uid: widget.uid,
            location: widget.location,
          ),
          BestHostels(
            uid: widget.uid,
            location: widget.location,
          ),
          BestPg(
            uid: widget.uid,
            location: widget.location,
          )
        ]),
      ),
    );
  }
}
