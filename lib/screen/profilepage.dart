import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';


class ProfilePage extends StatefulWidget {
  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  List<XFile>? _imageFiles = [];

  Future<void> _pickImages() async {
    final picker = ImagePicker();
    List<XFile>? pickedFiles = await picker.pickMultiImage();

    setState(() {
      _imageFiles = pickedFiles;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Profile'),
      ),
      body: _buildImageGallery(),
      floatingActionButton: FloatingActionButton(
        onPressed: _pickImages,
        tooltip: 'Choisir des images',
        child: Icon(Icons.add_a_photo),
      ),
    );
  }

  Widget _buildImageGallery() {
    return GridView.builder(
      itemCount: _imageFiles?.length ?? 0,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 4.0,
        mainAxisSpacing: 4.0,
      ),
      itemBuilder: (context, index) {
        if (_imageFiles != null && _imageFiles!.isNotEmpty) {
          return Image.file(File(_imageFiles![index].path));
        } else {
          return Center(
            child: Text('Pas d\'images sélectionnées'),
          );
        }
      },
    );
  }
}