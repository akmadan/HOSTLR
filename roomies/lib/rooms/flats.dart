import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:roomies/ui/roombubble.dart';
import 'package:roomies/ui/text.dart';

class Flats extends StatefulWidget {
  final String uid, location;

  const Flats({Key key, this.uid, this.location}) : super(key: key);
  @override
  _FlatsState createState() => _FlatsState();
}

class _FlatsState extends State<Flats> {
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
                bold_text(text: 'Flats', size: 24),
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
                                 contact: flatsDocs[index]['contact'],
                                d0: flatsDocs[index]['display_image'],
                                 d1: flatsDocs[index]['d1'],
                              d2: flatsDocs[index]['d2'],
                              d3: flatsDocs[index]['d3'],
                              d4: flatsDocs[index]['d4'],
                                place_location: flatsDocs[index]['location'],
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
