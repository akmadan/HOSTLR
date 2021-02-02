import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class AddPhotos extends StatefulWidget {
  static File d1, d2, d3, d4;
  @override
  _AddPhotosState createState() => _AddPhotosState();
}

class _AddPhotosState extends State<AddPhotos> {
  upload_Image(String which) async {
    File picked = await ImagePicker.pickImage(
        source: ImageSource.gallery, imageQuality: 20);
    if (which == 'd1') {
      setState(() {
        AddPhotos.d1 = picked;
      });
    }
    if (which == 'd2') {
      setState(() {
        AddPhotos.d2 = picked;
      });
    }
    if (which == 'd3') {
      setState(() {
        AddPhotos.d3 = picked;
      });
    }
    if (which == 'd4') {
      setState(() {
        AddPhotos.d4 = picked;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    var w = MediaQuery.of(context).size.width;
    return Container(
      padding: EdgeInsets.all(10),
      height: 250,
      child: ListView(scrollDirection: Axis.horizontal, children: [
        GestureDetector(
          onTap: () {
            upload_Image('d1');
          },
          child: Container(
            margin: EdgeInsets.all(5),
            width: w / 2.2,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                image: DecorationImage(
                    image: AddPhotos.d1 != null
                        ? FileImage(AddPhotos.d1)
                        : AssetImage('assets/default.png'),
                    fit: BoxFit.cover)),
          ),
        ),
        GestureDetector(
          onTap: () {
            upload_Image('d2');
          },
          child: Container(
            margin: EdgeInsets.all(5),
            width: w / 2.2,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                image: DecorationImage(
                    image: AddPhotos.d2 != null
                        ? FileImage(AddPhotos.d2)
                        : AssetImage('assets/default.png'),
                    fit: BoxFit.cover)),
          ),
        ),
        GestureDetector(
          onTap: () {
            upload_Image('d3');
          },
          child: Container(
            margin: EdgeInsets.all(5),
            width: w / 2.2,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                image: DecorationImage(
                    image: AddPhotos.d3 != null
                        ? FileImage(AddPhotos.d3)
                        : AssetImage('assets/default.png'),
                    fit: BoxFit.cover)),
          ),
        ),
        GestureDetector(
          onTap: () {
            upload_Image('d4');
          },
          child: Container(
            margin: EdgeInsets.all(5),
            width: w / 2.2,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                image: DecorationImage(
                    image: AddPhotos.d4 != null
                        ? FileImage(AddPhotos.d4)
                        : AssetImage('assets/default.png'),
                    fit: BoxFit.cover)),
          ),
        ),
      ]),
    );
  }
}
