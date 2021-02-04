import 'package:flutter/material.dart';
import 'package:roomies/ui/PlaceImages.dart';
import 'package:roomies/ui/divider.dart';
import 'package:roomies/ui/fullimage.dart';
import 'package:roomies/ui/placeheading.dart';

import 'package:roomies/widgets/appbar.dart';

class Place extends StatefulWidget {
  final String name,
      rent,
      time,
      whom,
      description,
      address,
      uid,
      d0,
      d1,
      d2,
      d3,
      d4,
      contact,
      place_location;

  const Place(
      {Key key,
      this.name,
      this.rent,
      this.time,
      this.whom,
      this.description,
      this.address,
      this.uid,
      this.d0,
      this.place_location,
      this.contact,
      this.d1,
      this.d2,
      this.d3,
      this.d4})
      : super(key: key);
  @override
  _PlaceState createState() => _PlaceState();
}

class _PlaceState extends State<Place> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        title: appbar(),
      ),
      body: Container(
          color: Color(0xff0a0a0a),
          child: ListView(
            children: [
              //------------------------
              PlaceHeading(
                description: widget.description,
                name: widget.name,
                contact: widget.contact,
                address: widget.address,
              ),
              divider(),
              SizedBox(height: 10),
              //------------------------
              PlaceRent(rent: widget.rent, time: widget.time),
              divider(),
              SizedBox(height: 10),
              //------------------------
              PlaceImages(
                d0: widget.d0,
                d1: widget.d1,
                d2: widget.d2,
                d3: widget.d3,
                d4: widget.d4,
              ),
              divider(),
              SizedBox(height: 10),
              //------------------------
            ],
          )),
    );
  }
}
