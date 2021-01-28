import 'package:flutter/material.dart';
import 'package:roomies/screens/profile.dart';
import 'package:roomies/screens/rooms.dart';
import 'package:roomies/screens/search.dart';
import 'package:roomies/ui/text.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selectedIndex = 0;
  final PageController _pageController = PageController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // extendBody: true,

      bottomNavigationBar: BottomNavigationBar(
        elevation: 1.0,
        backgroundColor: Colors.black54,
        currentIndex: _selectedIndex,
        selectedItemColor: Theme.of(context).primaryColor,
        unselectedItemColor: Theme.of(context).accentColor,
        selectedFontSize: 14,
        unselectedFontSize: 14,
        onTap: (value) {
          _onTappedBar(value);
        },
        items: [
          BottomNavigationBarItem(
            title: modified_text(text: 'Rooms'),
            icon: Icon(Icons.home_rounded),
          ),
          BottomNavigationBarItem(
            title: modified_text(text: 'Search'),
            icon: Icon(Icons.search),
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
        children: <Widget>[Rooms(), Search(), Profile()],
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
