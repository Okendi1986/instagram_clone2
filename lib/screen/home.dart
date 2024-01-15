import 'dart:io';

import 'package:flutter/material.dart';

import 'package:instagram/pages/ArtistesPage.dart';
import 'package:instagram/pages/ConnecterPage.dart';
import 'package:instagram/pages/ExpositionPage.dart';
import 'package:instagram/pages/GaleriePage.dart';
import 'package:instagram/pages/InscriptionPage.dart';
import 'package:instagram/screen/addpost.dart';

class HomePage extends StatelessWidget {
  final File? image;

  HomePage({required this.image});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Text(
          'Communi-Art',
          style: TextStyle(color: Colors.black),
        ),
        actions: [
          Theme(
            data: Theme.of(context).copyWith(
              dividerColor: Colors.white,
              iconTheme: const IconThemeData(color: Colors.black),
              textTheme: const TextTheme().apply(bodyColor: Colors.white),
            ), 
            child: PopupMenuButton<int>(
              icon:  Icon(Icons.menu), 
              color: Colors.teal,
              onSelected: (item) => onSelected(context, item),
              itemBuilder: (context) => [
                 const PopupMenuItem<int>(
                    value: 0,
                    child: Text('Artistes'),
                  ),
                  const PopupMenuItem<int>(
                    value: 1,
                    child: Text('Galerie'),
                  ),
                  PopupMenuDivider(),
                  const PopupMenuItem<int>(
                    value: 2,
                    child: Row(
                      children: [
                        SizedBox(width: 8),
                        Text('Categorie'),
                      ],
                    ),
                  ),
                    const PopupMenuItem<int>(
                    value: 3,
                    child: Row(
                      children: [
                        SizedBox(width: 8),
                        Text('Devenir-Menbre'),
                      ],
                    ),
                  ),
                    const PopupMenuItem<int>(
                    value: 4,
                    child: Row(
                      children: [
                        SizedBox(width: 8),
                        Text('Connecter'),
                      ],
                    ),
                  ),
              ]
            )
            )
          //IconButton(
            //icon: Icon(Icons.menu, color: Colors.black),
            //onPressed: () {},
          //),
        ],
      ),
      body: ListView(
        children: [
          Container(
            height: 120.0,
            padding: EdgeInsets.symmetric(horizontal: 10.0),
            child: Column(
              children: [
                Container(
                  height: 50,
                  child: Card(
                    color: Colors.black38,
                    elevation: 3,
                    margin: EdgeInsets.symmetric(horizontal: 30),
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                    child: TextFormField(
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        labelText: "Recherche",
                        labelStyle: TextStyle(
                          color: Colors.white38
                        ),
                        suffixIcon: Icon(Icons.search),
                        contentPadding: EdgeInsets.only(left: 20),
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
          AddPostPage(),
          Divider(),
          _Post(
            username: 'johndoe',
            caption: 'This is my first post!',
            imageUrl: 'https://picsum.photos/300/205',
          ),
          _Post(
            username: 'janedoe',
            caption: 'Hello, world!',
            imageUrl: 'https://picsum.photos/300/205',
          ),
          _Post(
            username: 'jimmy',
            caption: 'Flutter is awesome!',
            imageUrl: 'https://picsum.photos/300/205',
          ),
        ],
      ),
    );
  }
  void onSelected(BuildContext context, int item) {
    switch (item) {
      case 0:
        Navigator.of(context).push(
          MaterialPageRoute(builder: (context) => ArtistesPage()),
        );
        break;
      case 1:
        Navigator.of(context).push(
          MaterialPageRoute(builder: (context) => GaleriePage(theme: '', artist: '',)),
        );
        break;
      case 2:
        Navigator.of(context).pushAndRemoveUntil(
          MaterialPageRoute(builder: (context) => CategoriePage()),
          (route) => true,
        );
        break;
      case 3:
        Navigator.of(context).pushAndRemoveUntil(
          MaterialPageRoute(builder: (context) => InscriptionPage()),
          (route) => true,
        );
        break;
      case 4:
        Navigator.of(context).pushAndRemoveUntil(
          MaterialPageRoute(builder: (context) => ConnecterPage()),
          (route) => true,
        );
    }
  }
}

// ignore: unused_element
class _StoryButton extends StatelessWidget {
  const _StoryButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 70.0,
      width: 70.0,
      margin: EdgeInsets.symmetric(horizontal: 8.0),
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        border: Border.all(width: 3.0, color: Colors.pink),
      ),
      child: IconButton(
        icon: Icon(Icons.add),
        onPressed: () {},
      ),
    );
  }
}

// ignore: unused_element
Widget _buildStory(String image, String name) {
  return Padding(
    padding: const EdgeInsets.symmetric(horizontal: 8.0),
    child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          height: 70.0,
          width: 70.0,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            image: DecorationImage(
              fit: BoxFit.cover,
              image: AssetImage(image),
            ),
          ),
        ),
        SizedBox(
          height: 5.0,
        ),
        Text(
          name,
          style: TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
      ],
    ),
  );
}

class _Post extends StatelessWidget {
  final String username;
  final String caption;
  final String imageUrl;

  const _Post({
    Key? key,
    required this.username,
    required this.caption,
    required this.imageUrl,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 12.0, vertical: 10.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  CircleAvatar(
                    radius: 20.0,
                    backgroundImage: NetworkImage(
                      'https://picsum.photos/50',
                    ),
                  ),
                  SizedBox(width: 10.0),
                  Text(
                    username,
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                ],
              ),
              IconButton(
                icon: Icon(Icons.more_vert),
                onPressed: () {},
              ),
            ],
          ),
        ),
        Container(
          height: 400.0,
          decoration: BoxDecoration(
            image: DecorationImage(
              fit: BoxFit.cover,
              image: NetworkImage(imageUrl),
            ),
          ),
        ),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 12.0, vertical: 10.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  IconButton(
                    icon: Icon(Icons.favorite_border),
                    onPressed: () {},
                  ),
                  SizedBox(width: 10.0),
                  IconButton(
                    icon: Icon(Icons.comment_outlined),
                    onPressed: () {},
                  ),
                  SizedBox(width: 10.0),
                  IconButton(
                    icon: Icon(Icons.send),
                    onPressed: () {},
                  ),
                ],
              ),
              IconButton(
                icon: Icon(Icons.bookmark_border),
                onPressed: () {},
              ),
            ],
          ),
        ),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 12.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                '${username}',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 5.0),
              Text('${caption}'),
            ],
          ),
        ),
      ],
    );
  }
}
