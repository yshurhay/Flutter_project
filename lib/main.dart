import 'package:flutter/material.dart';
import 'package:concert_app/program.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: MySearch(),
      ),
    );
  }
}
