import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:roomies/ui/roombubble.dart';
import 'package:roomies/ui/text.dart';

class BestCots extends StatefulWidget {
  final String uid, location;

  const BestCots({
    Key key,
    this.uid,
    this.location,
  }) : super(key: key);
  @override
  _BestCotsState createState() => _BestCotsState();
}

class _BestCotsState extends State<BestCots> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          height: 50,
          child: Row(
            children: [
              SizedBox(width: 10),
              bold_text(text: 'Best Cot Basis Rooms', size: 24),
            ],
          ),
        ),
        Container(
            height: 300,
            child: StreamBuilder(
              stream: Firestore.instance
                  .collection('featured')
                  .document(widget.location)
                  .collection('bestcot')
                  .snapshots(),
              builder: (context, bcotsnapshot) {
                if (bcotsnapshot.connectionState == ConnectionState.waiting) {
                  return Center(child: CircularProgressIndicator());
                } else {
                  final bcotdocs = bcotsnapshot.data.documents;
                  return ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: bcotdocs.length,
                    itemBuilder: (context, index) {
                      return FutureBuilder(
                        future: Firestore.instance
                            .collection('places')
                            .document(widget.location)
                            .collection('data')
                            .document(bcotdocs[index]['name'])
                            .get(),
                        builder: (context, bcot_snapshot) {
                          if (bcot_snapshot.connectionState ==
                              ConnectionState.waiting) {
                            return Center(child: Container());
                          } else {
                            return RoomBubble(
                              name: bcot_snapshot.data['name'],
                              address: bcot_snapshot.data['address'],
                              description: bcot_snapshot.data['description'],
                              rent: bcot_snapshot.data['rent'],
                              time: bcot_snapshot.data['time'],
                              whom: bcot_snapshot.data['whom'].toString(),
                              uid: bcot_snapshot.data['uid'],
                              d0: bcot_snapshot.data['display_image'],
                              place_location: bcot_snapshot.data['location'],
                            );
                          }
                        },
                      );
                    },
                  );
                }
              },
            )),
      ],
    );
  }
}
