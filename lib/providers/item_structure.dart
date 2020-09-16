import 'package:flutter/foundation.dart';

class Item with ChangeNotifier {
  final String id;
  final String title;
  final String description;
  final double price;
  final String imageUrl;
  final String category;
  bool isFavorite;
  Item({
    this.id,
    this.title,
    this.description,
    this.price,
    this.imageUrl,
    this.isFavorite = false,
    this.category,
  });
  void toggleFav() {
    isFavorite = !isFavorite;
    notifyListeners();
  }
}
