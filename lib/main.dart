import 'package:flutter/material.dart';
import 'package:sportbloc/ui/screens/home_screen.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Sportbloc",
      debugShowCheckedModeBanner: false,
      home: HomeScreen(),
    );
  }
}