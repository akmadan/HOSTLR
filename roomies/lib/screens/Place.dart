import 'package:flutter/material.dart';
import 'package:roomies/ui/divider.dart';
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
      this.contact})
      : super(key: key);
  @override
  _PlaceState createState() => _PlaceState();
}

class _PlaceState extends State<Place> {
  @override
  Widget build(BuildContext context) {
    var w = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        title: appbar(),
      ),
      body: Container(
          color: Color(0xff0a0a0a),
          child: ListView(
            children: [
              PlaceHeading(
                name: widget.name,
                contact: widget.contact,
                address: widget.address,
              ),
              divider(),
              SizedBox(height: 10),
              PlaceRent(rent: widget.rent, time: widget.time),
              divider(),
              SizedBox(height: 10),
              Container(
                padding: EdgeInsets.all(10),
                height: 250,
                child: ListView(scrollDirection: Axis.horizontal, children: [
                  Container(
                    margin: EdgeInsets.all(5),
                    width: w / 2.2,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        image: DecorationImage(
                            image: widget.d0 != null
                                ? NetworkImage(widget.d0)
                                : AssetImage('assets/sample2.jpg'),
                            fit: BoxFit.cover)),
                  ),
                  Container(
                    margin: EdgeInsets.all(5),
                    width: w / 2.2,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        image: DecorationImage(
                            image: AssetImage('assets/default.png'),
                            fit: BoxFit.cover)),
                  ),
                  Container(
                    margin: EdgeInsets.all(5),
                    width: w / 2.2,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        image: DecorationImage(
                            image: AssetImage('assets/default.png'),
                            fit: BoxFit.cover)),
                  ),
                  Container(
                    margin: EdgeInsets.all(5),
                    width: w / 2.2,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        image: DecorationImage(
                            image: AssetImage('assets/default.png'),
                            fit: BoxFit.cover)),
                  ),
                ]),
              )
            ],
          )),
    );
  }
}
