import 'package:flutter/material.dart';

class FullImage extends StatelessWidget {
  final String url;

  const FullImage({Key key, this.url}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Place Image"),
      ),
      body: Center(
          child: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: Image.network(
          url,
          fit: BoxFit.cover,
        ),
      )),
    );
  }
}
