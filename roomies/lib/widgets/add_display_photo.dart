import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class AddDisplayPhoto extends StatefulWidget {
  static File display_image;
  @override
  _AddDisplayPhotoState createState() => _AddDisplayPhotoState();
}

class _AddDisplayPhotoState extends State<AddDisplayPhoto> {
  upload_Display_Image() async {
    File picked = await ImagePicker.pickImage(
        source: ImageSource.gallery, imageQuality: 20);
    setState(() {
      AddDisplayPhoto.display_image = picked;
    });
  }

  @override
  Widget build(BuildContext context) {
    var w = MediaQuery.of(context).size.width;
    return GestureDetector(
      onTap: () {
        upload_Display_Image();
      },
      child: Container(
        width: w / 2.2,
        decoration: BoxDecoration(
            color: Colors.red,
            borderRadius: BorderRadius.circular(20),
            image: DecorationImage(
                image: AddDisplayPhoto.display_image != null
                    ? FileImage(AddDisplayPhoto.display_image)
                    : AssetImage('assets/default.png'),
                fit: BoxFit.cover)),
      ),
    );
  }
}
