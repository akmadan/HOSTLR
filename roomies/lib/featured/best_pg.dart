import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:roomies/ui/roombubble.dart';
import 'package:roomies/ui/text.dart';

class BestPg extends StatefulWidget {
  final String uid, location;

  const BestPg({
    Key key,
    this.uid,
    this.location,
  }) : super(key: key);
  @override
  _BestPgState createState() => _BestPgState();
}

class _BestPgState extends State<BestPg> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          height: 50,
          child: Row(
            children: [
              SizedBox(width: 10),
              bold_text(text: 'Best PGs (Paying Guest)', size: 24),
            ],
          ),
        ),
        Container(
            height: 300,
            child: StreamBuilder(
              stream: Firestore.instance
                  .collection('featured')
                  .document(widget.location)
                  .collection('bestpg')
                  .snapshots(),
              builder: (context, bpgnapshot) {
                if (bpgnapshot.connectionState == ConnectionState.waiting) {
                  return Center(child: CircularProgressIndicator());
                } else {
                  final bpgdocs = bpgnapshot.data.documents;
                  return ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: bpgdocs.length,
                    itemBuilder: (context, index) {
                      return FutureBuilder(
                        future: Firestore.instance
                            .collection('places')
                            .document(widget.location)
                            .collection('data')
                            .document(bpgdocs[index]['name'])
                            .get(),
                        builder: (context, bpg_snapshot) {
                          if (bpg_snapshot.connectionState ==
                              ConnectionState.waiting) {
                            return Center(child: Container());
                          } else {
                            return RoomBubble(
                              name: bpg_snapshot.data['name'],
                              address: bpg_snapshot.data['address'],
                              description: bpg_snapshot.data['description'],
                              rent: bpg_snapshot.data['rent'],
                              time: bpg_snapshot.data['time'],
                              whom: bpg_snapshot.data['whom'].toString(),
                              uid: bpg_snapshot.data['uid'],
                              d0: bpg_snapshot.data['display_image'],
                              place_location: bpg_snapshot.data['location'],
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
