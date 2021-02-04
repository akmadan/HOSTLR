import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:roomies/ui/roombubble.dart';
import 'package:roomies/ui/text.dart';

class BestHostels extends StatefulWidget {
  final String uid, location;

  const BestHostels({Key key, this.uid, this.location, })
      : super(key: key);
  @override
  _BestHostelsState createState() => _BestHostelsState();
}

class _BestHostelsState extends State<BestHostels> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          height: 50,
          child: Row(
            children: [
              SizedBox(width: 10),
              bold_text(text: 'Best Hostels', size: 24),
            ],
          ),
        ),
        Container(
            height: 300,
            child: StreamBuilder(
              stream: Firestore.instance
                  .collection('featured')
                  .document(widget.location)
                  .collection('besthostels')
                  .snapshots(),
              builder: (context, bhostelsnapshot) {
                if (bhostelsnapshot.connectionState == ConnectionState.waiting) {
                  return Center(child: CircularProgressIndicator());
                } else {
                  final bhostelsdocs = bhostelsnapshot.data.documents;
                  return ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: bhostelsdocs.length,
                    itemBuilder: (context, index) {
                      return FutureBuilder(
                        future: Firestore.instance
                            .collection('places')
                            .document(widget.location)
                            .collection('data')
                            .document(bhostelsdocs[index]['name'])
                            .get(),
                        builder: (context, bhostels_snapshot) {
                          if (bhostels_snapshot.connectionState ==
                              ConnectionState.waiting) {
                            return Center(child: Container());
                          } else {
                            return RoomBubble(
                              name: bhostels_snapshot.data['name'],
                              address: bhostels_snapshot.data['address'],
                              description:
                                  bhostels_snapshot.data['description'],
                              rent: bhostels_snapshot.data['rent'],
                              time: bhostels_snapshot.data['time'],
                              whom: bhostels_snapshot.data['whom'].toString(),
                              uid: bhostels_snapshot.data['uid'],
                              d0: bhostels_snapshot.data['display_image'],
                              place_location:
                                  bhostels_snapshot.data['location'],
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
