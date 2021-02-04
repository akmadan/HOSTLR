import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:roomies/ui/circular.dart';
import 'package:roomies/ui/divider.dart';
import 'package:roomies/ui/heading.dart';
import 'package:roomies/ui/text.dart';
import 'package:roomies/widgets/add_display_photo.dart';
import 'package:roomies/widgets/adddisplay.dart';
import 'package:roomies/widgets/addphotos.dart';
import 'package:roomies/widgets/otherinfo.dart';
import 'package:roomies/widgets/radio1.dart';
import 'package:roomies/widgets/radio2.dart';

class AddPlace extends StatefulWidget {
  final String uid, location, contact;

  const AddPlace({Key key, this.uid, this.location, this.contact})
      : super(key: key);
  @override
  _AddPlaceState createState() => _AddPlaceState();
}

class _AddPlaceState extends State<AddPlace> {
  bool isloading = false;
  //----------------------------------------------------

  saveinfo() async {
    setState(() {
      isloading = !isloading;
    });

    final ref0 = FirebaseStorage.instance
        .ref()
        .child('HostelImages')
        .child('DisplayImages')
        .child(AddDisplay.namecontroller.text + '.jpg');
    await ref0.putFile(AddDisplayPhoto.display_image).onComplete;
    final url0 = await ref0.getDownloadURL();

    final ref1 = FirebaseStorage.instance
        .ref()
        .child('HostelImages')
        .child('OtherImages')
        .child('d1.jpg');
    await ref1.putFile(AddPhotos.d1).onComplete;
    final url1 = await ref1.getDownloadURL();

    final ref2 = FirebaseStorage.instance
        .ref()
        .child('HostelImages')
        .child('OtherImages')
        .child('d2.jpg');
    await ref2.putFile(AddPhotos.d2).onComplete;
    final url2 = await ref2.getDownloadURL();

    final ref3 = FirebaseStorage.instance
        .ref()
        .child('HostelImages')
        .child('OtherImages')
        .child('d3.jpg');
    await ref3.putFile(AddPhotos.d3).onComplete;
    final url3 = await ref3.getDownloadURL();

    final ref4 = FirebaseStorage.instance
        .ref()
        .child('HostelImages')
        .child('OtherImages')
        .child('d4.jpg');
    await ref4.putFile(AddPhotos.d4).onComplete;
    final url4 = await ref4.getDownloadURL();

    //************** */

    await Firestore.instance
        .collection('places')
        .document(OtherInfo.dropdownValue.toLowerCase())
        .collection('data')
        .document(AddDisplay.namecontroller.text)
        .setData({
      'uid': widget.uid,
      'name': AddDisplay.namecontroller.text,
      'whom': Radio1.value.toString(),
      'address': OtherInfo.addresscontroller.text,
      'rent': OtherInfo.rentcontroller.text,
      'time': OtherInfo.timecontroller.text,
      'description': OtherInfo.descriptioncontroller.text,
      'type': Radio2.value.toString(),
      'contact': widget.contact,
      'display_image': url0,
      'd1': url1,
      'd2': url2,
      'd3': url3,
      'd4': url4,
      'location': OtherInfo.dropdownValue.toLowerCase()
    });

    //************** */

    await Firestore.instance
        .collection('users')
        .document(widget.location)
        .collection('data')
        .document(
          widget.uid,
        )
        .collection('places')
        .document(AddDisplay.namecontroller.text)
        .setData({
      'name': AddDisplay.namecontroller.text,
      'whom': Radio1.value,
      'address': OtherInfo.addresscontroller.text,
      'rent': OtherInfo.rentcontroller.text,
      'time': OtherInfo.timecontroller.text,
      'description': OtherInfo.descriptioncontroller.text,
      'type': Radio2.value,
      'contact': widget.contact,
      'display_image': url0,
      'd1': url1,
      'd2': url2,
      'd3': url3,
      'd4': url4,
      'location': OtherInfo.dropdownValue.toLowerCase()
    });

    //************** */

    Fluttertoast.showToast(
        msg: "Congratulations! The Place has been added",
        toastLength: Toast.LENGTH_LONG,
        gravity: ToastGravity.CENTER,
        timeInSecForIosWeb: 1,
        backgroundColor: Theme.of(context).primaryColor,
        textColor: Colors.white,
        fontSize: 16.0);

    setState(() {
      isloading = !isloading;
    });
  }

  //----------------------------------------------------

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff0a0a0a),
      appBar: AppBar(
          actions: [
            IconButton(
                icon: Icon(Icons.check),
                onPressed: () {
                  if (AddDisplay.namecontroller.text == '' ||
                      OtherInfo.addresscontroller.text == '' ||
                      OtherInfo.rentcontroller.text == '' ||
                      OtherInfo.timecontroller.text == '' ||
                      AddDisplayPhoto.display_image == null ||
                      AddPhotos.d1 == null ||
                      AddPhotos.d2 == null ||
                      AddPhotos.d3 == null ||
                      AddPhotos.d4 == null) {
                    Fluttertoast.showToast(
                        msg: "Please Add the Required Information",
                        gravity: ToastGravity.CENTER,
                        backgroundColor: Colors.black,
                        timeInSecForIosWeb: 1,
                        textColor: Colors.white,
                        fontSize: 16.0);
                  } else {
                    saveinfo();
                  }
                }),
          ],
          backgroundColor: Colors.transparent,
          title: bold_text(text: 'Add Your Place')),
      body: ListView(
        children: [
          Heading(text: 'Display Information'),
          AddDisplay(),
          divider(),
          isloading != false ? Circular() : Container(),
          Heading(text: 'Add Photos'),
          AddPhotos(),
          divider(),
          Heading(text: 'For Whom the Place is ?'),
          Radio1(),
          divider(),
          Heading(text: 'Flat/Hostel ?'),
          Radio2(),
          divider(),
          Heading(text: 'Other Information'),
          OtherInfo(),
          Container(height: 200)
        ],
      ),
    );
  }
}
