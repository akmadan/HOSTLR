import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import 'package:roomies/ui/roombubble.dart';
import 'package:roomies/ui/text.dart';

class Hostels extends StatefulWidget {
  final String uid, location;

  const Hostels({Key key, this.uid, this.location}) : super(key: key);
  @override
  _HostelsState createState() => _HostelsState();
}

class _HostelsState extends State<Hostels> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 350,
      child: Column(
        children: [
          Container(
            height: 50,
            child: Row(
              children: [
                SizedBox(width: 10),
                bold_text(text: 'Hostels', size: 24),
              ],
            ),
          ),
          Container(
              height: 300,
              child: StreamBuilder(
                  stream: Firestore.instance
                      .collection('places')
                      .document(widget.location)
                      .collection('data')
                      .snapshots(),
                  builder: (context, flatsSnapshot) {
                    if (flatsSnapshot.connectionState ==
                        ConnectionState.waiting) {
                      return Center(child: CircularProgressIndicator());
                    } else {
                      final flatsDocs = flatsSnapshot.data.documents;
                      return Container(
                        height: 300,
                        child: ListView.builder(
                          scrollDirection: Axis.horizontal,
                          itemCount: flatsDocs.length,
                          itemBuilder: (context, index) {
                            if (flatsDocs[index]['type'] == '1') {
                              return RoomBubble(
                                name: flatsDocs[index]['name'],
                                address: flatsDocs[index]['address'],
                                description: flatsDocs[index]['description'],
                                rent: flatsDocs[index]['rent'],
                                time: flatsDocs[index]['time'],
                                whom: flatsDocs[index]['whom'].toString(),
                                uid: flatsDocs[index]['uid'],
                                d0: flatsDocs[index]['display_image'],
                                place_location: flatsDocs[index]['location'],
                              );
                            } else {
                              return Container();
                            }
                          },
                        ),
                      );
                    }
                  }))
        ],
      ),
    );
  }
}
