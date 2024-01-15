import 'package:flutter/material.dart';
import 'package:instagram/pages/ConnecterPage.dart';


void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: ConnecterPage(),
      debugShowCheckedModeBanner: false,
    );
  }
}
