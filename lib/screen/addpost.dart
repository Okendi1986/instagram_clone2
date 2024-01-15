import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_toastr/flutter_toastr.dart';
import 'package:image_picker/image_picker.dart';
import 'package:instagram/screen/home.dart';

class AddPostPage extends StatefulWidget {
  AddPostPage({Key? key}) : super(key: key);

  @override
  _AddPostPageState createState() => _AddPostPageState();
}

class _AddPostPageState extends State<AddPostPage> {
  File? _image;

  Future<void> _pickImage() async {
    final imagePicker = ImagePicker();
    final pickedImage = await imagePicker.pickImage(source: ImageSource.gallery);

    if (pickedImage != null) {
      setState(() {
        _image = File(pickedImage.path);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Add Post'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            _image != null
                ? Image.file(
                    _image!,
                    height: 100.0,
                  )
                : Placeholder(
                    fallbackHeight: 100.0,
                    fallbackWidth: double.infinity,
                  ),
            ElevatedButton(
              onPressed: _pickImage,
              child: Text('Sélectionner une image'),
            ),
            ElevatedButton(
              onPressed: () {
                if (_image != null) {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => HomePage(image: _image),
                    ),
                  );
                } else {
                  FlutterToastr.show('Inscription reussir', context);
                  // Gérer le cas où aucune image n'a été sélectionnée
                }
              },
              child: Text('Publier'),
            ),
          ],
        ),
      ),
    );
  }
}