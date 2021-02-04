import 'package:flutter/material.dart';

import 'fullimage.dart';

class PlaceImages extends StatefulWidget {
  final String d0, d1, d2, d3, d4;

  const PlaceImages({Key key, this.d0, this.d1, this.d2, this.d3, this.d4})
      : super(key: key);
  @override
  _PlaceImagesState createState() => _PlaceImagesState();
}

class _PlaceImagesState extends State<PlaceImages> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10),
      height: 350,
      child: ListView(scrollDirection: Axis.horizontal, children: [
        GestureDetector(
          onTap: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => FullImage(
                          url: widget.d0,
                        )));
          },
          child: Container(
            margin: EdgeInsets.all(5),
            width: 250,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                image: DecorationImage(
                    image: widget.d0 != null
                        ? NetworkImage(widget.d0)
                        : AssetImage('assets/sample2.jpg'),
                    fit: BoxFit.cover)),
          ),
        ),
        GestureDetector(
          onTap: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => FullImage(
                          url: widget.d1,
                        )));
          },
          child: Container(
            margin: EdgeInsets.all(5),
            width: 250,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                image: DecorationImage(
                    image: widget.d1 != null
                        ? NetworkImage(widget.d1)
                        : AssetImage('assets/sample2.jpg'),
                    fit: BoxFit.cover)),
          ),
        ),
        GestureDetector(
          onTap: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => FullImage(
                          url: widget.d2,
                        )));
          },
          child: Container(
            margin: EdgeInsets.all(5),
            width: 250,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                image: DecorationImage(
                    image: widget.d2 != null
                        ? NetworkImage(widget.d2)
                        : AssetImage('assets/sample2.jpg'),
                    fit: BoxFit.cover)),
          ),
        ),
        GestureDetector(
          onTap: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => FullImage(
                          url: widget.d3,
                        )));
          },
          child: Container(
            margin: EdgeInsets.all(5),
            width: 250,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                image: DecorationImage(
                    image: widget.d3 != null
                        ? NetworkImage(widget.d3)
                        : AssetImage('assets/sample2.jpg'),
                    fit: BoxFit.cover)),
          ),
        ),
        GestureDetector(
          onTap: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => FullImage(
                          url: widget.d4,
                        )));
          },
          child: Container(
            margin: EdgeInsets.all(5),
            width: 250,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                image: DecorationImage(
                    image: widget.d4 != null
                        ? NetworkImage(widget.d4)
                        : AssetImage('assets/sample2.jpg'),
                    fit: BoxFit.cover)),
          ),
        ),
      ]),
    );
  }
}
