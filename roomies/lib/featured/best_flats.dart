import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:roomies/ui/roombubble.dart';
import 'package:roomies/ui/text.dart';

class BestFlats extends StatefulWidget {
  final String uid, location;

  const BestFlats({Key key, this.uid, this.location, })
      : super(key: key);
  @override
  _BestFlatsState createState() => _BestFlatsState();
}

class _BestFlatsState extends State<BestFlats> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          height: 50,
          child: Row(
            children: [
              SizedBox(width: 10),
              bold_text(text: 'Best Flats', size: 24),
            ],
          ),
        ),
        Container(
            height: 300,
            child: StreamBuilder(
              stream: Firestore.instance
                  .collection('featured')
                  .document(widget.location)
                  .collection('bestflats')
                  .snapshots(),
              builder: (context, bflatsnapshot) {
                if (bflatsnapshot.connectionState == ConnectionState.waiting) {
                  return Center(child: CircularProgressIndicator());
                } else {
                  final bflatsdocs = bflatsnapshot.data.documents;
                  return ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: bflatsdocs.length,
                    itemBuilder: (context, index) {
                      return FutureBuilder(
                        future: Firestore.instance
                            .collection('places')
                            .document(widget.location)
                            .collection('data')
                            .document(bflatsdocs[index]['name'])
                            .get(),
                        builder: (context, bflats_snapshot) {
                          if (bflats_snapshot.connectionState ==
                              ConnectionState.waiting) {
                            return Center(child: Container());
                          } else {
                            return RoomBubble(
                              name: bflats_snapshot.data['name'],
                              address: bflats_snapshot.data['address'],
                              description:
                                  bflats_snapshot.data['description'],
                              rent: bflats_snapshot.data['rent'],
                              time: bflats_snapshot.data['time'],
                              whom: bflats_snapshot.data['whom'].toString(),
                              uid: bflats_snapshot.data['uid'],
                              d0: bflats_snapshot.data['display_image'],
                              place_location:
                                  bflats_snapshot.data['location'],
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
