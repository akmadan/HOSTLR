import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:roomies/ui/roombubble.dart';

class SavedPosts extends StatefulWidget {
  final String userlocation, useruid;

  const SavedPosts({Key key, this.userlocation, this.useruid})
      : super(key: key);
  @override
  _SavedPostsState createState() => _SavedPostsState();
}

class _SavedPostsState extends State<SavedPosts> {
  @override
  Widget build(BuildContext context) {
    return Container(
        // color: Colors.red,
        height: 300,
        child: StreamBuilder(
          stream: Firestore.instance
              .collection('users')
              .document(widget.userlocation)
              .collection('data')
              .document(widget.useruid)
              .collection('saved')
              .snapshots(),
          builder: (context, savesnapshot) {
            if (savesnapshot.connectionState == ConnectionState.waiting) {
              return Center(child: CircularProgressIndicator());
            } else {
              final savedocs = savesnapshot.data.documents;
              return ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: savedocs.length,
                itemBuilder: (context, index) {
                  return FutureBuilder(
                    future: Firestore.instance
                        .collection('places')
                        .document(widget.userlocation)
                        .collection('data')
                        .document(savedocs[index]['place_name'])
                        .get(),
                    builder: (context, saved_places_snapshot) {
                      if (saved_places_snapshot.connectionState ==
                          ConnectionState.waiting) {
                        return Center(child: Container());
                      } else {
                        return RoomBubble(
                          name: saved_places_snapshot.data['name'],
                          address: saved_places_snapshot.data['address'],
                          description:
                              saved_places_snapshot.data['description'],
                          rent: saved_places_snapshot.data['rent'],
                          time: saved_places_snapshot.data['time'],
                          whom: saved_places_snapshot.data['whom'].toString(),
                          uid: saved_places_snapshot.data['uid'],
                          d0: saved_places_snapshot.data['display_image'],
                          place_location:
                              saved_places_snapshot.data['location'],
                        );
                      }
                    },
                  );
                },
              );
            }
          },
        ));
  }
}
