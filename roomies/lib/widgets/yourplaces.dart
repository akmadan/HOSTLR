import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:roomies/ui/roombubble.dart';
import 'package:roomies/ui/text.dart';

class YourPlaces extends StatefulWidget {
  final String uid, location;

  const YourPlaces({Key key, this.uid, this.location}) : super(key: key);
  @override
  _YourPlacesState createState() => _YourPlacesState();
}

class _YourPlacesState extends State<YourPlaces> {
  bool yourdown = false;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10),
      child: Column(
        children: [
          SizedBox(height: 15),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  bold_text(
                    text: 'Your Places',
                    size: 24,
                  ),
                  modified_text(
                    text: 'The Places uploaded by you',
                    color: Colors.grey[400],
                  )
                ],
              ),
              IconButton(
                  icon: Icon(yourdown
                      ? Icons.keyboard_arrow_up
                      : Icons.keyboard_arrow_down),
                  onPressed: () {
                    setState(() {
                      yourdown = !yourdown;
                    });
                  })
            ],
          ),
          SizedBox(height: 15),
          yourdown
              ? Container(
                  height: 300,
                  child: StreamBuilder(
                      stream: Firestore.instance
                          .collection('users')
                          .document(widget.location)
                          .collection('data')
                          .document(
                            widget.uid,
                          )
                          .collection('places')
                          .snapshots(),
                      builder: (context, yourSnapshot) {
                        if (yourSnapshot.connectionState ==
                            ConnectionState.waiting) {
                          return Center(child: CircularProgressIndicator());
                        } else {
                          final yourDocs = yourSnapshot.data.documents;
                          return Container(
                            height: 300,
                            child: ListView.builder(
                              scrollDirection: Axis.horizontal,
                              itemCount: yourDocs.length,
                              itemBuilder: (context, index) {
                                return RoomBubble(
                                  name: yourDocs[index]['name'],
                                  address: yourDocs[index]['address'],
                                  description: yourDocs[index]['description'],
                                  rent: yourDocs[index]['rent'],
                                  contact: yourDocs[index]['contact'],
                                  time: yourDocs[index]['time'],
                                  whom: yourDocs[index]['whom'].toString(),
                                  uid: yourDocs[index]['uid'],
                                  d0: yourDocs[index]['display_image'],
                                  d1: yourDocs[index]['d1'],
                                  d2: yourDocs[index]['d2'],
                                  d3: yourDocs[index]['d3'],
                                  d4: yourDocs[index]['d4'],
                                  place_location: yourDocs[index]['location'],
                                );
                              },
                            ),
                          );
                        }
                      }))
              : Container()
        ],
      ),
    );
  }
}
