import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:roomies/ui/roombubble.dart';
import 'package:roomies/ui/text.dart';

class Pg extends StatefulWidget {
  final String uid, location;

  const Pg({Key key, this.uid, this.location}) : super(key: key);
  @override
  _PgState createState() => _PgState();
}

class _PgState extends State<Pg> {
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
                bold_text(text: 'PG (Paying Guest)', size: 24),
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
                  builder: (context, pgSnapshot) {
                    if (pgSnapshot.connectionState == ConnectionState.waiting) {
                      return Center(child: CircularProgressIndicator());
                    } else {
                      final pgDocs = pgSnapshot.data.documents;
                      return Container(
                        height: 300,
                        child: ListView.builder(
                          scrollDirection: Axis.horizontal,
                          itemCount: pgDocs.length,
                          itemBuilder: (context, index) {
                            if (pgDocs[index]['type'] == '3') {
                              return RoomBubble(
                                name: pgDocs[index]['name'],
                                address: pgDocs[index]['address'],
                                description: pgDocs[index]['description'],
                                rent: pgDocs[index]['rent'],
                                time: pgDocs[index]['time'],
                                whom: pgDocs[index]['whom'].toString(),
                                uid: pgDocs[index]['uid'],
                                contact: pgDocs[index]['contact'],
                                d0: pgDocs[index]['display_image'],
                                place_location: pgDocs[index]['location'],
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
