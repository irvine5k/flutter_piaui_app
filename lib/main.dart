import 'package:flutter/material.dart';
import 'package:flutter_piaui_app/src/home/home_page.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Piauí',
      debugShowCheckedModeBanner: false,
      home: Home(),
    );
  }
}
