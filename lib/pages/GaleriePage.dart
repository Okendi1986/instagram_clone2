import 'package:flutter/material.dart';
class GaleriePage extends StatelessWidget {
  final String theme; // Thématique sélectionnée
  final String artist; // Artiste sélectionné

  GaleriePage({required this.theme, required this.artist});

  @override
  Widget build(BuildContext context) {
    // Obtenez les œuvres d'art en fonction de la thématique et de l'artiste
    List<String> artworkList = fetchArtworksForThemeAndArtist(theme, artist);

    return Scaffold(
      appBar: AppBar(
        title: Text('Galerie d\'art'),
      ),
      body: GridView.builder(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2, // Nombre de colonnes (peut varier en fonction de la taille de l'écran)
          crossAxisSpacing: 8.0,
          mainAxisSpacing: 8.0,
        ),
        itemCount: artworkList.length,
        itemBuilder: (context, index) {
          // Affichez les œuvres d'art avec des widgets personnalisés
          return ArtworkItem(imageUrl: artworkList[index]);
        },
      ),
    );
  }
}

class ArtworkItem extends StatelessWidget {
  final String imageUrl;

  ArtworkItem({required this.imageUrl});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        // Action à effectuer lorsqu'un artwork est sélectionné
        // Vous pouvez naviguer vers une page détaillée de l'œuvre d'art
      },
      child: Card(
        child: Image.network(imageUrl, fit: BoxFit.cover),
      ),
    );
  }
}

// Fonction de récupération factice des œuvres d'art
List<String> fetchArtworksForThemeAndArtist(String theme, String artist) {
  // Logique de récupération des œuvres d'art en fonction de la thématique et de l'artiste
  // Retourne une liste d'URL d'images (ou autre représentation des œuvres)
  // Cette fonction pourrait accéder à une source de données comme une API ou une base de données
  return [
    'https://picsum.photos/300/205',
    // ... autres œuvres d'art
  ];
}
// Exemple de modèle de données
class Artist {
  final String name;
  final List<String> imageUrls;

  Artist(this.name, this.imageUrls);
}

// Exemple de widget pour afficher la galerie
class GalleryPage extends StatelessWidget {
  final Artist artist; // L'artiste sélectionné

  GalleryPage(this.artist);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(artist.name),
      ),
      body: GridView.builder(
        itemCount: artist.imageUrls.length,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 3, // Nombre de colonnes
          crossAxisSpacing: 4.0,
          mainAxisSpacing: 4.0,
        ),
        itemBuilder: (BuildContext context, int index) {
          return Image.network(
            artist.imageUrls[index],
            fit: BoxFit.cover,
          );
        },
      ),
    );
  }
}

