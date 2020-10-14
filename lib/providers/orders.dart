import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'CartProv.dart';
import 'package:http/http.dart' as http;

class OrderItem {
  final String id;
  final DateTime dateTime;
  final String paymentWay;
  final String adress;

  OrderItem({
    @required this.id,
    @required this.paymentWay,
    @required this.adress,
    @required this.dateTime,
  });
}

class Orders with ChangeNotifier {
  final String authToken;
  final String userId;
  List<OrderItem> _ordersList = [];
  Orders(this.authToken, this.userId, this._ordersList);
  List<OrderItem> get ordersList {
    return [..._ordersList];
  }

  Future<void> getOrders() async {
    final String url =
        'https://apisite.klikx.fr/user/v1/order/list?userId=$userId';
    final responce = await http.get(url, headers: {
      'Content-type': 'application/json; charset=utf-8',
      'Accept': 'application/json',
      'x-auth-token': authToken,
    });
    final List<OrderItem> loadedOrders = [];
    final responceData = jsonDecode(responce.body)['orders'];
    if (responceData == null) {
      return;
    }

    for (var i = 0; i < responceData.length; i++) {
      loadedOrders.add(OrderItem(
        dateTime: DateTime.parse(responceData[i]['date']),
        id: responceData[i]['_id'],
        paymentWay: responceData[i]['paymentGateway'],
        adress: responceData[i]['address'],
      ));
      //print(responceData[i]);
    }
    _ordersList = loadedOrders;
    // print(responceData);
    notifyListeners();
  }

  Future<void> addOrder(
    List<CartItemm> cartList,
    String firstname,
    String lastname,
    String code,
    bool justification,
    String address,
    String paymentGateway,
    bool pickup,
    String remarque,
    String phone,
    String email,
    String ville,
    String country,
  ) async {
    final url = 'https://apisite.klikx.fr/public/v1/orders/make';
    try {
      final timestamp = DateTime.now();
      final response = await http.post(url,
          body: jsonEncode({
            "firstName": firstname,
            "lastName": lastname,
            "phone": phone,
            "email": email,
            "city": ville,
            "country": country,
            "zipcode": code,
            "remarque": remarque,
            'products': cartList
                .map((e) => {
                      'id': e.id,
                      'quantity': e.quantity,
                      "selectedOptions": e.options,
                      "selectedSupplements": e.supplements,
                      "instructions": ""
                    })
                .toList(),
            "date": timestamp.toIso8601String(),
            "address": address,
            "pickup": pickup,
            "justificatif": justification,
            "paymentGateway": paymentGateway,
          }),
          headers: {
            'Content-type': 'application/json; charset=utf-8',
            'Accept': 'application/json',
            'x-auth-token': authToken,
          });
      _ordersList.insert(
          0,
          OrderItem(
              id: json.decode(response.body)['name'],
              dateTime: timestamp,
              paymentWay: json.decode(response.body)['paymentGateway'],
              adress: json.decode(response.body)['adress']));
      //print(response.statusCode);
      // print(json.decode(response.body)['remarque']);

      notifyListeners();
    } catch (e) {
      print(' here is the error :  $e ');
    }
  }
}
