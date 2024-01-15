import 'package:flutter/material.dart';
import 'package:instagram/Image%20page/reseauArt.dart';

class NotificationsPage extends StatefulWidget {
  const NotificationsPage({Key? key}) : super(key: key);
  

  @override
  State<NotificationsPage> createState() => _NotificationsPageState();
  
}

class _NotificationsPageState extends State<NotificationsPage> {
  
  List <String> allImages = [
    'images/h1.jpg',
    'images/Expo.jpg',
    'images/peinture.jpg',

  ];
  List<String> displayedImages = [];
 
  @override
  void initState() {
    super.initState();
    // Au démarrage, afficher toutes les images
    displayedImages.addAll(allImages);
  }

  void filterImages(String query) {
    // Réinitialiser la liste des images affichées
    setState(() {
      displayedImages = allImages
          .where((image) => image.toLowerCase().contains(query.toLowerCase()))
          .toList();
    });
  }
  
  @override
  
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Catégories'),
        ),
        
        body: Column(
          children: [
            Padding(
              padding: EdgeInsets.all(8.0),
              child: TextField(
                onChanged: (value){
                  filterImages(value);
                },
                decoration: InputDecoration(
                  labelText: 'Recherche',
                  border: OutlineInputBorder(),
                ),
              ),
              ),
              Expanded(
                child: GridView.builder(
                  itemCount: displayedImages.length,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
                  itemBuilder: (BuildContext context, int index){
                    return GestureDetector(
                      onTap: (){
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => ImageDetailPage(),
                            ),
                        );
                      },
                      child: Stack(
                        children: [
                          Image.asset(displayedImages[index]),
                          Positioned.fill(
                            child: Align(
                              alignment: Alignment.bottomCenter,
                              child: Container(
                                color: Colors.black54,
                                child: Padding(
                                  padding:EdgeInsets.all(8.0),
                                  child: Text('Voir+',
                                    style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                  ),),
                                  ),
                              ),
                            )
                            )
                        ],
                      ),
                    );
                    //Image.asset(displayedImages[index]);
                  }
                  )
                )
          ],
        ),
      ),
    );
  }
  }

