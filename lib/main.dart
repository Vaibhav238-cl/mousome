import 'package:flutter/material.dart';
import 'package:mousome/pages/home.dart';
import 'package:mousome/pages/loading.dart';

void main() {
  runApp(MaterialApp(
    title: "myapp",
    theme: ThemeData(
      primarySwatch: Colors.cyan,
    ),
    routes: {
      "/": (context) => LodingPage(),
      "/home": (context) => HomePage(),
      "/loading": (context) => LodingPage(),
    },
  ));
}
