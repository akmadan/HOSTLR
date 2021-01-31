import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:roomies/ui/divider.dart';
import 'package:roomies/ui/heading.dart';
import 'package:roomies/ui/text.dart';
import 'package:roomies/widgets/adddisplay.dart';
import 'package:roomies/widgets/addphotos.dart';
import 'package:roomies/widgets/otherinfo.dart';
import 'package:roomies/widgets/radio1.dart';

class AddPlace extends StatefulWidget {
  final String uid, location;

  const AddPlace({Key key, this.uid, this.location}) : super(key: key);
  @override
  _AddPlaceState createState() => _AddPlaceState();
}

class _AddPlaceState extends State<AddPlace> {
  saveinfo() async {
    await Firestore.instance
        .collection('places')
        .document(OtherInfo.dropdownValue.toLowerCase())
        .collection('data')
        .document(AddDisplay.namecontroller.text)
        .setData({
      'uid': widget.uid,
      'name': AddDisplay.namecontroller.text,
      'whom': Radio1.value,
      'address': OtherInfo.addresscontroller.text,
      'rent': OtherInfo.rentcontroller.text,
      'time': OtherInfo.timecontroller.text,
      'description': OtherInfo.descriptioncontroller.text
    });

    await Firestore.instance
        .collection('users')
        .document(widget.location)
        .collection('data')
        .document(widget.uid,)
        .collection('places')
        .document(OtherInfo.dropdownValue.toLowerCase())
        .collection('data')
        .document(AddDisplay.namecontroller.text)
        .setData({
      'name': AddDisplay.namecontroller.text,
      'whom': Radio1.value,
      'address': OtherInfo.addresscontroller.text,
      'rent': OtherInfo.rentcontroller.text,
      'time': OtherInfo.timecontroller.text,
      'description': OtherInfo.descriptioncontroller.text
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff0a0a0a),
      appBar: AppBar(
          actions: [
            IconButton(
                icon: Icon(Icons.check),
                onPressed: () {
                  saveinfo();
                })
          ],
          backgroundColor: Colors.transparent,
          title: bold_text(text: 'Add Your Place')),
      body: ListView(
        children: [
          Heading(text: 'Display Information'),
          AddDisplay(),
          divider(),
          Heading(text: 'Add Photos'),
          AddPhotos(),
          divider(),
          Heading(text: 'For Whom the Place is ?'),
          Radio1(),
          divider(),
          Heading(text: 'Other Information'),
          OtherInfo(),
        ],
      ),
    );
  }
}
