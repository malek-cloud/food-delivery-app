import 'dart:convert';

import 'package:flutter/material.dart';
import 'item_structure.dart';
import 'package:http/http.dart' as http;

class Items with ChangeNotifier {
  List<Item> _itemsList = [];
  Future<void> getData() async {
    const url = 'https://apisite.klikx.fr/public/v1/products/list';

    final jsonData = await http.get(url);
    final jsonResponse = json.decode(jsonData.body) as List;
    final List<Item> loadedProduct = [];
    for (var i = 0; i < jsonResponse.length; i++) {
      loadedProduct.add(Item(
          id: jsonResponse[i]['_id'],
          title: jsonResponse[i]['name'],
          description: jsonResponse[i]['description'],
          price: jsonResponse[i]['price'].toDouble(),
          imageUrl: jsonResponse[i]['picture'],
          category: jsonResponse[i]['category']['name'],
          options: jsonResponse[i]['options'],
          supplements: jsonResponse[i]['supplements']));
    }

    _itemsList = loadedProduct;
    //print(jsonResponse);
    notifyListeners();
  }

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
