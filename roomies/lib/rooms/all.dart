import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:roomies/ui/roombubble.dart';
import 'package:roomies/ui/text.dart';

class AllRooms extends StatefulWidget {
  final String uid, location;

  const AllRooms({Key key, this.uid, this.location}) : super(key: key);
  @override
  _AllRoomsState createState() => _AllRoomsState();
}

class _AllRoomsState extends State<AllRooms> {
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
                bold_text(text: 'All Rooms', size: 24),
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
                  builder: (context, allroomsSnapshot) {
                    if (allroomsSnapshot.connectionState ==
                        ConnectionState.waiting) {
                      return Center(child: CircularProgressIndicator());
                    } else {
                      final allroomsDocs = allroomsSnapshot.data.documents;
                      return Container(
                        height: 300,
                        child: ListView.builder(
                          scrollDirection: Axis.horizontal,
                          itemCount: allroomsDocs.length,
                          itemBuilder: (context, index) {
                            return RoomBubble(
                              name: allroomsDocs[index]['name'],
                              address: allroomsDocs[index]['address'],
                              description: allroomsDocs[index]['description'],
                              rent: allroomsDocs[index]['rent'],
                              time: allroomsDocs[index]['time'],
                              whom: allroomsDocs[index]['whom'].toString(),
                              uid: allroomsDocs[index]['uid'],
                              d0: allroomsDocs[index]['display_image'],
                              place_location: allroomsDocs[index]['location'],
                            );
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
