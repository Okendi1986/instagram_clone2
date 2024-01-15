import 'package:flutter/material.dart';

class ImageDetailsScreen extends StatefulWidget {
  final Map<String, dynamic> imageData;
  final List<String> allImages;

  const ImageDetailsScreen({required this.imageData, required this.allImages});

  @override
  _ImageDetailsScreenState createState() => _ImageDetailsScreenState();
}

class _ImageDetailsScreenState extends State<ImageDetailsScreen> {
  late List<String> filteredImages;

  @override
  void initState() {
    super.initState();
    filteredImages = widget.allImages;
  }

  void filterImages(String query) {
    setState(() {
      filteredImages = widget.allImages.where((image) {
        return image.toLowerCase().contains(query.toLowerCase());
      }).toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: <Widget>[
          SliverAppBar(
            expandedHeight: 200.0,
            flexibleSpace: FlexibleSpaceBar(
              title: Text(widget.imageData['description']),
              background: Image.asset(
                widget.imageData['image'],
                fit: BoxFit.cover,
              ),
            ),
          ),
          SliverFillRemaining(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextField(
                    onChanged: filterImages,
                    decoration: InputDecoration(
                      labelText: 'Recherche',
                      border: OutlineInputBorder(),
                    ),
                  ),
                ),
                Expanded(
                  child: ListView.builder(
                    itemCount: filteredImages.length,
                    itemBuilder: (context, index) {
                      return Image.asset(
                        filteredImages[index],
                        fit: BoxFit.cover,
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
class ImageSearch extends SearchDelegate<String> {
  final List<Map<String, dynamic>> imageData;
  final Function(String) onFilter;

  ImageSearch(this.imageData, this.onFilter);

  @override
  List<Widget> buildActions(BuildContext context) {
    return [
      IconButton(
        icon: Icon(Icons.clear),
        onPressed: () {
          query = '';
        },
      ),
    ];
  }

  @override
  Widget buildLeading(BuildContext context) {
    return IconButton(
      icon: Icon(Icons.arrow_back),
      onPressed: () {
        close(context, '');
      },
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    onFilter(query);
    return Container();
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    return ListView.builder(
      itemCount: imageData.length,
      itemBuilder: (context, index) {
        return ListTile(
          title: Text(imageData[index]['description']),
          onTap: () {
            query = imageData[index]['description'];
            onFilter(query);
            close(context, query);
          },
        );
      },
    );
  }
}
