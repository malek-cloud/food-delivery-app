import 'package:flutter/foundation.dart';

class CartItemm with ChangeNotifier {
  final String id;
  final String title;
  int quantity;
  final double price;
  List options;
  List supplements;
  CartItemm({
    this.id,
    this.title,
    this.quantity,
    this.price,
    this.options,
    this.supplements,
  });
}

class Cart with ChangeNotifier {
  Map<String /*type mta l key, w lehne lkey houwal'id*/, CartItemm> _items = {};
  Map<String, CartItemm> get items {
    return {..._items};
  }

  int get itemCount {
    int count = 0;
    _items.forEach((key, value) {
      count += value.quantity;
    });
    return count;
  }

  void addItemToCart(
    String productId,
    double price,
    String title,
    int quantity,
    List option,
    List supplements,
  ) {
    if (_items.containsKey(productId)) {
      _items.update(
          productId,
          (existingCartItem) => CartItemm(
                id: existingCartItem.id,
                title: existingCartItem.title,
                price: existingCartItem.price,
                quantity: existingCartItem.quantity + 1,
                options: existingCartItem.options,
                supplements: existingCartItem.supplements,
              ));
    } else {
      _items.putIfAbsent(
        productId,
        () => CartItemm(
          id: DateTime.now().toString(),
          title: title,
          price: price,
          quantity: 1,
          options: option,
          supplements: supplements,
        ),
      );
    }
    notifyListeners();
  }

  double get total {
    var total = 0.0;
    _items.forEach((key, value) {
      total += value.price * value.quantity;
    });
    return total;
  }

  void removeItem(String productId) {
    _items.remove(productId);
    notifyListeners();
  }

  void clear() {
    _items = {};
    notifyListeners();
  }

  void removeSingleItem(String prodId) {
    if (!_items.containsKey(prodId)) {
      return;
    }
    if (_items[prodId].quantity > 1) {
      _items.update(
        prodId,
        (existingCartItem) => CartItemm(
          id: existingCartItem.id,
          title: existingCartItem.title,
          price: existingCartItem.price,
          quantity: existingCartItem.quantity - 1,
          options: existingCartItem.options,
          supplements: existingCartItem.supplements,
        ),
      );
    } else {
      _items.remove(prodId);
    }
    notifyListeners();
  }

  int showQuantity(productId) {
    return _items[productId].quantity ?? 0;
  }
}
