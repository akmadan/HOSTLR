import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_admob/firebase_admob.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:roomies/screens/Place.dart';
import 'package:roomies/ui/save_function.dart';
import 'package:roomies/ui/text.dart';

class RoomBubble extends StatefulWidget {
  final String name,
      rent,
      time,
      whom,
      description,
      contact,
      address,
      uid,
      d0,
      d1,
      d2,
      d3,
      d4,
      place_location;

  const RoomBubble(
      {Key key,
      this.name,
      this.rent,
      this.time,
      this.whom,
      this.description,
      this.address,
      this.uid,
      this.d0,
      this.place_location,
      this.contact,
      this.d1,
      this.d2,
      this.d3,
      this.d4})
      : super(key: key);
  @override
  _RoomBubbleState createState() => _RoomBubbleState();
}

class _RoomBubbleState extends State<RoomBubble> {
  bool issaved = false;
  bool isme = false;

  checksavedandme() async {
    FirebaseUser user = await FirebaseAuth.instance.currentUser();
    String id = user.uid;
    var saved = await Firestore.instance
        .collection('saved')
        .document(widget.place_location)
        .collection(widget.name)
        .document(id)
        .get();
    if (saved.exists) {
      setState(() {
        issaved = true;
      });
    } else {
      setState(() {
        issaved = false;
      });
    }
    if (widget.uid == id) {
      setState(() {
        isme = true;
      });
    }
  }

  //------------ADMOB------------------------
  static final MobileAdTargetingInfo targetInfo = new MobileAdTargetingInfo(
    testDevices: <String>[],
    keywords: <String>['games', 'shoes', 'fashion', 'clothes', 'food'],
    birthday: new DateTime.now(),
    childDirected: true,
  );
  InterstitialAd _interstitialAd;

  InterstitialAd createInterstitialAd() {
    return InterstitialAd(
      adUnitId: 'ca-app-pub-3937702122719326/5422134299',
      targetingInfo: targetInfo,
      listener: (MobileAdEvent event) {
        print("InterstitialAd event $event");
      },
    );
  }

  @override
  void initState() {
    checksavedandme();
    super.initState();
    FirebaseAdMob.instance
        .initialize(appId: "ca-app-pub-3937702122719326~4461789302");
  }

  @override
  void dispose() {
    _interstitialAd?.dispose();
    super.dispose();
  }

  //------------ADMOB------------------------

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        _interstitialAd?.dispose();
        _interstitialAd = createInterstitialAd()
          ..load()
          ..show();
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => Place(
                      name: widget.name,
                      rent: widget.rent,
                      time: widget.time,
                      whom: widget.whom,
                      description: widget.description,
                      address: widget.address,
                      uid: widget.uid,
                      d0: widget.d0,
                      d1: widget.d1,
                      d2: widget.d2,
                      d3: widget.d3,
                      d4: widget.d4,
                      contact: widget.contact,
                      place_location: widget.place_location,
                    )));
      },
      child: Container(
        padding: EdgeInsets.all(10),
        width: 350,
        child: Card(
          color: Colors.grey[900],
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Stack(
                children: [
                  Positioned(
                    child: Container(
                      height: 200,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(10),
                              topRight: Radius.circular(10)),
                          image: DecorationImage(
                              image: widget.d0 != null
                                  ? NetworkImage(widget.d0)
                                  : AssetImage('assets/sample2.jpg'),
                              fit: BoxFit.cover)),
                    ),
                  ),
                  isme
                      ? Positioned(
                          child: IconButton(
                          onPressed: () {
                            deleteplace(
                                widget.place_location, widget.uid, widget.name);
                          },
                          icon: Icon(
                            Icons.delete,
                            color: Colors.black,
                          ),
                        ))
                      : Container(),
                  widget.whom == '1'
                      ? Positioned(
                          top: -1,
                          right: -1,
                          child: Image.asset('assets/ribbon.png'))
                      : Container()
                ],
              ),
              Container(
                padding: EdgeInsets.only(left: 9),
                height: 70,
                child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                                child: bold_text(text: widget.name, size: 19)),
                            Container(
                                child: modified_text(
                                    text: 'Rent : ₹ ' +
                                        widget.rent +
                                        ' / ' +
                                        widget.time +
                                        ' months',
                                    size: 15)),
                          ],
                        ),
                      ),
                      issaved
                          ? IconButton(
                              icon: Icon(
                                Icons.bookmark,
                                color: Theme.of(context).primaryColor,
                              ),
                              onPressed: () {
                                remove_save(widget.name, widget.place_location);
                                setState(() {
                                  issaved = !issaved;
                                });
                              })
                          : IconButton(
                              icon: Icon(Icons.bookmark),
                              onPressed: () {
                                save(widget.name, widget.place_location);
                                setState(() {
                                  issaved = !issaved;
                                });
                              })
                    ]),
              )
            ],
          ),
        ),
      ),
    );
  }
}
