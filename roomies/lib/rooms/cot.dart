import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:roomies/ui/roombubble.dart';
import 'package:roomies/ui/text.dart';

class Cots extends StatefulWidget {
  final String uid, location;

  const Cots({Key key, this.uid, this.location}) : super(key: key);
  @override
  _CotsState createState() => _CotsState();
}

class _CotsState extends State<Cots> {
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
                bold_text(text: 'Cot Basis', size: 24),
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
                  builder: (context, cotsSnapshot) {
                    if (cotsSnapshot.connectionState ==
                        ConnectionState.waiting) {
                      return Center(child: CircularProgressIndicator());
                    } else {
                      final cotsDocs = cotsSnapshot.data.documents;
                      return Container(
                        height: 300,
                        child: ListView.builder(
                          scrollDirection: Axis.horizontal,
                          itemCount: cotsDocs.length,
                          itemBuilder: (context, index) {
                            if (cotsDocs[index]['type'] == '0') {
                              return RoomBubble(
                                name: cotsDocs[index]['name'],
                                address: cotsDocs[index]['address'],
                                description: cotsDocs[index]['description'],
                                rent: cotsDocs[index]['rent'],
                                time: cotsDocs[index]['time'],
                                whom: cotsDocs[index]['whom'].toString(),
                                uid: cotsDocs[index]['uid'],
                                 contact: cotsDocs[index]['contact'],
                                d0: cotsDocs[index]['display_image'],
                                d1: cotsDocs[index]['d1'],
                              d2: cotsDocs[index]['d2'],
                              d3: cotsDocs[index]['d3'],
                              d4: cotsDocs[index]['d4'],
                                place_location: cotsDocs[index]['location'],
                              );
                            } else {
                              return Container(
                                  // color: Colors.red,
                                  );
                            }
                            // return null;
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
