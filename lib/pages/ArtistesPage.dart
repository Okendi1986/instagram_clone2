import 'package:flutter/material.dart';

class Artist {
  final String name;
  final String biography;
  final String profileImage;

  Artist({
    required this.name,
    required this.biography,
    required this.profileImage,
  });
}

List<Artist> artists = [
  Artist(
    name: 'Artiste 1',
    biography: 'Biographie de l\'artiste 1...',
    profileImage: 'images/h1.jpg',
  ),
  Artist(
    name: 'Artiste 2',
    biography: 'Biographie de l\'artiste 2...',
    profileImage:'images/h1.jpg',
  ),
  // Ajoutez d'autres artistes ici
];

class ArtistesPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Catalogue d\'Artistes')),
      body: ListView.builder(
        itemCount: artists.length,
        itemBuilder: (context, index) {
          return ListTile(
            leading: CircleAvatar(
              backgroundImage: AssetImage(artists[index].profileImage),
            ),
            title: Text(artists[index].name),
            onTap: () {
              // Action lors du clic sur un artiste, par exemple, afficher le profil de l'artiste
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => ArtistProfilePage(artist: artists[index]),
                ),
              );
            },
          );
        },
      ),
    );
  }
}

class ArtistProfilePage extends StatelessWidget {
  final Artist artist;

  const ArtistProfilePage({Key? key, required this.artist}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(artist.name)),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CircleAvatar(
              backgroundImage: AssetImage(artist.profileImage),
              radius: 50.0,
            ),
            SizedBox(height: 20.0),
            Text(artist.name, style: TextStyle(fontSize: 24.0, fontWeight: FontWeight.bold)),
            SizedBox(height: 10.0),
            Text(artist.biography),
            // Ajoutez plus de détails de l'artiste ici
          ],
        ),
      ),
    );
  }
}

