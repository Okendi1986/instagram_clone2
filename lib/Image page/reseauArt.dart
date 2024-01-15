import 'package:flutter/material.dart';

class ImageDetailPage extends StatefulWidget {
  
  @override
  State<ImageDetailPage> createState() => _ImageDetailPageState();
}

class _ImageDetailPageState extends State<ImageDetailPage> {
  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
          title: Text('Resaux Artistes'),
          centerTitle: true,
          backgroundColor: Colors.teal,
        ),
      );
}