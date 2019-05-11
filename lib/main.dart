import 'package:flutter/material.dart';
import 'blender.dart';


void main() => runApp(App());

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Blender(),
    );
  }
}