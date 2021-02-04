import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:roomies/ui/text.dart';

class appbar extends StatefulWidget {
  @override
  _appbarState createState() => _appbarState();
}

class _appbarState extends State<appbar> {
  String uid = '';
  @override
  void initState() {
    super.initState();
    finduid();
  }

  finduid() async {
    final FirebaseUser user = await FirebaseAuth.instance.currentUser();
    final userid = user.uid;
    setState(() {
      uid = userid;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(children: [
        Icon(Icons.room, color: Theme.of(context).primaryColor),
        SizedBox(width: 5),
        FutureBuilder(
            future: Firestore.instance
                .collection('userlocations')
                .document(uid)
                .get(),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return Center(child: Container());
              } else {
                return bold_text(
                    text: snapshot.data['location']
                            .substring(0, 1)
                            .toUpperCase() +
                        snapshot.data['location'].substring(1));
              }
            })
      ]),
    );
  }
}
