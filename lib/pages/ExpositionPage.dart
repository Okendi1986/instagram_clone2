import 'package:flutter/material.dart';
import 'package:instagram/pages/ArtistesPage.dart';

class Talent {
  final String nom;
  final String image;

  Talent({required this.nom, required this.image});
}

List<Talent> talents = [
  Talent(nom: 'Artiste', image: 'images/galerie.jpg'),
  //Talent(nom: 'Sculpture', image: 'assets/sculpture.png'),
  Talent(nom: 'Peinture', image: 'images/peinture.jpg'),
  //Talent(nom: 'Artisanat', image: 'assets/artisanat.png'),
  // Ajoutez d'autres talents si nécessaire
];

class CategoriePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Catégories'),
      ),
      body: GridView.builder(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          mainAxisSpacing: 10.0,
          crossAxisSpacing: 10.0,
          childAspectRatio: 0.8,
        ),
        itemCount: talents.length,
        itemBuilder: (BuildContext context, int index) {
          return GestureDetector(
            onTap: () {
              // Utilisation de ProfilPage dans la navigation
              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => ArtistesPage(), // Remplacez 0 par l'index du talent sélectionné
                ),
            );

            },
            child: Card(
              elevation: 5,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(
                    talents[index].image,
                    width: 80,
                    height: 80,
                  ),
                  SizedBox(height: 10),
                  Text(
                    talents[index].nom,
                    style: TextStyle(fontSize: 18),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}


