import 'package:flutter/material.dart';
import 'item_structure.dart';

class Items with ChangeNotifier {
  List<Item> _itemsList = [
    Item(
      id: 'p1',
      title: 'Salad',
      description: 'A red shirt - it is pretty red!',
      price: 29.99,
      imageUrl:
          'https://encrypted-tbn0.gstatic.com/images?q=tbn%3AANd9GcSLmU5xXKu9mtLzD-mN6h9IoSDJ_PFH4QWKRw&usqp=CAU',
      category: 'POKE & BOWL',
    ),
    Item(
      id: 'p2',
      title: 'Hamberger',
      description: 'A nice pair of trousers.',
      price: 4.99,
      imageUrl:
          'https://encrypted-tbn0.gstatic.com/images?q=tbn%3AANd9GcS24wvA9ozipJc5-IStQrqZIo_a3urpEZGIGA&usqp=CAU',
      category: 'WOK & AUTRES PLATS',
    ),
    Item(
      id: 'p3',
      title: 'makrouna',
      description: 'A nice pair of trousers.',
      price: 9.99,
      imageUrl:
          'https://encrypted-tbn0.gstatic.com/images?q=tbn%3AANd9GcTNbG0DNfCqEl0RwzNQb11QUG4Edsna7ESCsg&usqp=CAU',
      category: 'SUSHIS',
    ),
    Item(
      id: 'p4',
      title: 'Pizza',
      description: 'A nice pair of trousers.',
      price: 6.99,
      imageUrl:
          'https://encrypted-tbn0.gstatic.com/images?q=tbn%3AANd9GcSZWdDdAtDKxPpJhAfzRP6DjA-PCRmZHn38ag&usqp=CAU',
      category: 'DESSERTS',
    ),
    Item(
      id: 'p5',
      title: 'chakchouka',
      description: 'A nice pair of trousers.',
      price: 5.99,
      imageUrl:
          'https://encrypted-tbn0.gstatic.com/images?q=tbn%3AANd9GcRpka_F-Iz5svr0GM_1rhKi9ja2x3zREuLK-g&usqp=CAU',
      category: 'SUSHIS',
    ),
  ];
  List<Item> get items {
    return [..._itemsList];
  }

  Item findById(String id) {
    return _itemsList.firstWhere((prod) => prod.id == id);
  }

  List<Item> get favorite {
    return _itemsList.where((prodItem) => prodItem.isFavorite).toList();
  }
}
