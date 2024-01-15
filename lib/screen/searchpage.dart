import 'package:flutter/material.dart';
import 'package:instagram/Image%20page/ImageDetailsScreen.dart';
//import 'package:instagram/Image%20page/reseauArt.dart';
// Modèle d'une image avec sa description
class ImageInfo {
  final String imagePath;
  final String description;

  ImageInfo(this.imagePath, this.description);
}

class ExplorePage extends StatefulWidget {
  @override
  _ExplorePageState createState() => _ExplorePageState();
}
class _ExplorePageState extends State<ExplorePage>{
  final List<Map<String, dynamic>> imagesData = [
    {
      'image': 'images/Expo.jpg',
      'description': 'Reseaux Artistes',
    },
    {
      'image': 'images/galerie.jpg',
      'description': 'Lieux Exposition',
    },
    {
      'image': 'images/parte.jpg',
      'description': 'Partenaire Culturels',
    },
    // ... Ajoutez les autres images avec leurs descriptions ici
  ];
  List<Map<String, dynamic>> filteredImages = [];
   @override
  void initState() {
    super.initState();
    filteredImages = imagesData;
  }
   void filterImages(String query) {
    List<Map<String, dynamic>> filteredList = [];
    if (query.isNotEmpty) {
      filteredList = imagesData
          .where((image) => image['description']
              .toLowerCase()
              .contains(query.toLowerCase()))
          .toList();
    } else {
      filteredList = imagesData;
    }

    setState(() {
      filteredImages = filteredList;
    });
  }
  
   @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Explorer'),
        actions: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: IconButton(
              icon: Icon(Icons.search),
              onPressed: () {
                showSearch(
                  context: context,
                  delegate: ImageSearch(imagesData, filterImages),
                );
              },
            ),
          ),
        ],
      ),
      body: ListView.builder(
        itemCount: filteredImages.length,
        itemBuilder: (context, index) {
          return ListTile(
            leading: Image.asset(filteredImages[index]['image']),
            title: Text(filteredImages[index]['description']),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => ImageDetailsScreen(
                    imageData: filteredImages[index], allImages: [],
                  ),
                ),
              );
            },
          );
        },
      ),
    );
  }
}

