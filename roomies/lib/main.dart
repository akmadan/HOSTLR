import 'package:flutter/material.dart';
import 'package:roomies/ui/splash.dart';

void main() => runApp(new MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
          primaryColor: Color(0xff4f59ca),
          brightness: Brightness.dark,
          accentColor: Color(0xff6B82D3)),
      home: SplashScreen(),
    );
  }
}
