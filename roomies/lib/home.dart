import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:roomies/screens/profile.dart';
import 'package:roomies/screens/rooms.dart';
import 'package:roomies/screens/search.dart';
import 'package:roomies/ui/text.dart';
import 'package:roomies/widgets/appbar.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selectedIndex = 0;
  final PageController _pageController = PageController();
  String uid = '';
  String location = '';
  String contact = '';

  @override
  void initState() {
    finduserinfo();
    super.initState();
  }

  finduserinfo() async {
    final FirebaseUser user = await FirebaseAuth.instance.currentUser();
    final userid = user.uid;
    DocumentSnapshot location_snapshot = await Firestore.instance
        .collection('userlocations')
        .document(userid)
        .get();
    DocumentSnapshot contact_snapshot = await Firestore.instance
        .collection('users')
        .document(location_snapshot['location'])
        .collection('data')
        .document(userid)
        .get();
    setState(() {
      uid = userid;
      location = location_snapshot['location'];
      contact = contact_snapshot['phone'];
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: Color(0xff0a0a0a),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        title: appbar(),
      ),
      // extendBody: true,

      bottomNavigationBar: BottomNavigationBar(
        elevation: 1.0,
        backgroundColor: Colors.black54,
        currentIndex: _selectedIndex,
        selectedItemColor: Theme.of(context).primaryColor,
        unselectedItemColor: Colors.white,
        selectedFontSize: 14,
        unselectedFontSize: 14,
        onTap: (value) {
          _onTappedBar(value);
        },
        items: [
          BottomNavigationBarItem(
            title: modified_text(text: 'All Rooms'),
            icon: Icon(Icons.home_rounded),
          ),
          BottomNavigationBarItem(
            title: modified_text(text: 'Featured'),
            icon: Icon(Icons.favorite_rounded),
          ),
          BottomNavigationBarItem(
            title: modified_text(text: 'Profile'),
            icon: Icon(Icons.person),
          ),
        ],
      ),

      //********************************************** */

      body: PageView(
        controller: _pageController,
        children: <Widget>[
          Rooms(
            uid: uid,
            location: location,
          ),
          Featured(),
          Profile(
            contact: contact,
            uid: uid,
            location: location,
          )
        ],
        onPageChanged: (page) {
          setState(() {
            _selectedIndex = page;
          });
        },
      ),
    );
  }

  void _onTappedBar(int value) {
    setState(() {
      _selectedIndex = value;
    });
    _pageController.jumpToPage(value);
  }
}
