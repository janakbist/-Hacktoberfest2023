import 'package:flutter/material.dart';

class CardView {
  final String title;
  final String imageUrl;

  CardView({required this.title, required this.imageUrl});

  factory CardView.fromJson(Map<String, dynamic> json) {
    return CardView(
      title: json['title'],
      imageUrl: json['imageUrl'],
    );
  }
}

class DynamicCardView extends StatefulWidget {
  @override
  _DynamicCardViewState createState() => _DynamicCardViewState();
}

class _DynamicCardViewState extends State<DynamicCardView> {
  List<CardView> _cardViews = [];

  @override
  void initState() {
    super.initState();
    _loadData();
  }

  void _loadData() {
    // Load data from API or any other source
    // For this example, we'll just use static data
    final data = [
      {"title": "Card 1", "imageUrl": "https://via.placeholder.com/150"},
      {"title": "Card 2", "imageUrl": "https://via.placeholder.com/150"},
      {"title": "Card 3", "imageUrl": "https://via.placeholder.com/150"},
      {"title": "Card 4", "imageUrl": "https://via.placeholder.com/150"},
      {"title": "Card 5", "imageUrl": "https://via.placeholder.com/150"},
    ];

    setState(() {
      _cardViews = data
          .map((item) => CardView.fromJson(item))
          .toList(); // Convert each JSON object to a CardView object and add it to the list
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Dynamic Card View"),
      ),
      body: GridView.count(
        crossAxisCount: 2, // Number of columns
        padding: EdgeInsets.all(16.0),
        children: List.generate(_cardViews.length, (index) {
          return GestureDetector(
            onTap: () {
              // Handle card tap event
              print("Card ${index + 1} tapped");
            },
            child: Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(16.0),
              ),
              elevation: 4.0,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Image.network(
                    _cardViews[index].imageUrl,
                    height: 150.0,
                    width: double.infinity,
                    fit: BoxFit.cover,
                  ),
                  SizedBox(height: 10.0),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 10.0),
                    child: Text(
                      _cardViews[index].title,
                      style: TextStyle(
                        fontSize: 18.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  SizedBox(height: 10.0),
                ],
              ),
            ),
          );
        }),
      ),
    );
  }
}
