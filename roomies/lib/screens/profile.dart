import 'package:flutter/material.dart';
import 'package:roomies/ui/divider.dart';
import 'package:roomies/ui/roombubble.dart';

import 'package:roomies/ui/text.dart';
import 'package:roomies/widgets/appbar.dart';
import 'package:roomies/widgets/logout.dart';
import 'package:roomies/widgets/profileinfo.dart';

class Profile extends StatefulWidget {
  @override
  _ProfileState createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  bool savedown = false;
  bool rentdown = false;
  @override
  Widget build(BuildContext context) {
    var h = MediaQuery.of(context).size.height;
    var w = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        title: appbar(),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            ProfileInfo(),
            divider(),

            //---------------------------------------

            Container(
              padding: EdgeInsets.all(10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(height: 15),
                      bold_text(
                        text: 'Rent a Place',
                        size: 24,
                      ),
                      modified_text(
                          text: 'Add your Rooms/Flats/Hostels for Renting'),
                      SizedBox(height: 15),
                    ],
                  ),
                  IconButton(
                      icon: Icon(rentdown
                          ? Icons.keyboard_arrow_up
                          : Icons.keyboard_arrow_down),
                      onPressed: () {
                        setState(() {
                          rentdown = !rentdown;
                        });
                      })
                ],
              ),
            ),

            rentdown
                ? Container(
                    child: Container(
                    height: 80,
                    width: double.infinity,
                    padding: EdgeInsets.all(10),
                    child: RaisedButton(
                        color: Colors.black54,
                        child: bold_text(text: 'Add your Place', size: 20),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(5)),
                        onPressed: () {}),
                  ))
                : Container(),
            divider(),

            //---------------------------------

            Container(
              padding: EdgeInsets.all(10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(height: 15),
                      bold_text(
                        text: 'Saved',
                        size: 24,
                      ),
                      modified_text(text: 'Your Saved Places'),
                      SizedBox(height: 15),
                    ],
                  ),
                  IconButton(
                      icon: Icon(savedown
                          ? Icons.keyboard_arrow_up
                          : Icons.keyboard_arrow_down),
                      onPressed: () {
                        setState(() {
                          savedown = !savedown;
                        });
                      })
                ],
              ),
            ),

            savedown
                ? Container(
                    height: 300,
                    child: ListView(
                      scrollDirection: Axis.horizontal,
                      children: [RoomBubble(), RoomBubble()],
                    ))
                : Container(),
            divider(),

            //--------------------------------------

            LogoutWidget(),
            divider()
          ],
        ),
      ),
    );
  }
}
