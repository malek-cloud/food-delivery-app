import 'package:flutter/foundation.dart';
import 'CartProv.dart';

class OrderItem {
  final String id;
  final double amount;
  final List<CartItemm> products;
  final DateTime dateTime;
  OrderItem({
    @required this.id,
    @required this.amount,
    @required this.products,
    @required this.dateTime,
  });
}

class Orders with ChangeNotifier {
  final List<OrderItem> _ordersList = [];
  List<OrderItem> get ordersList {
    return [..._ordersList];
  }

  void addOrder(List<CartItemm> cartList, double total) {
    _ordersList.insert(
        0,
        OrderItem(
          id: DateTime.now().toString(),
          amount: total,
          dateTime: DateTime.now(),
          products: cartList,
        ));
    notifyListeners();
  }
}
