import 'package:flutter/material.dart';
import 'package:roomies/ui/text.dart';

class PlaceHeading extends StatelessWidget {
  final String name, contact, address;

  const PlaceHeading({Key key, this.name, this.contact, this.address})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    var w = MediaQuery.of(context).size.width;
    return Container(
      padding: EdgeInsets.all(10),
      height: 130,
      width: w,
      child: Column(
        children: [
          SizedBox(height: 5),
          Row(
            children: [
              bold_text(
                text: name,
                size: 28,
              ),
            ],
          ),
          Row(
            children: [
              modified_text(
                text: contact,
                size: 18,
              ),
            ],
          ),
          Row(
            children: [
              Expanded(
                child: modified_text(
                  text: address,
                  size: 18,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class PlaceRent extends StatelessWidget {
  final String rent, time;

  const PlaceRent({Key key, this.rent, this.time}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10),
      height: 100,
      // color: Colors.blue,
      child: Column(
        children: [
          Row(
            children: [
              bold_text(
                text: 'Rent: ',
                size: 28,
              ),
            ],
          ),
          Row(
            children: [
              modified_text(
                text: '₹ ' + rent + ' for ' + time + ' months',
                size: 24,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
