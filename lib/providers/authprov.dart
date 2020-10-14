import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:happy__hummy/models/exception.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class Auth with ChangeNotifier {
  String _token;
  String _userId;
  bool get isAuth {
    return _token != null;
  }

  void logout() {
    _token = null;
    _userId = null;
    notifyListeners();
  }

  String get token {
    return _token;
  }

  String get id {
    return _userId;
  }

  Future<void> signUp(
    String email,
    String password,
    String phone,
    String firstName,
    String lastname,
  ) async {
    const url = 'https://apisite.klikx.fr/user/v1/auth/register';

    final responce = await http.post(url,
        body: jsonEncode({
          "email": email,
          "password": password,
          "phone": phone,
          "firstName": firstName,
          "lastname": lastname,
        }),
        headers: {
          'Content-type': 'application/json; charset=utf-8',
          'Accept': 'application/json',
        });
    _userId = jsonDecode(responce.body)['_id'];
    print(jsonDecode(responce.body));
    if (jsonDecode(responce.body)['error'] != null) {
      throw HttpException(jsonDecode(responce.body)['message']);
    }
  }

  Future<void> logIn(
    String email,
    String password,
  ) async {
    const url = 'https://apisite.klikx.fr/user/v1/auth/login';

    try {
      final responce = await http.post(url,
          body: jsonEncode({
            "email": email,
            "password": password,
          }),
          headers: {
            'Content-type': 'application/json; charset=utf-8',
            'Accept': 'application/json',
          });

      // print(jsonDecode(responce.body));
      //print(responce.statusCode);
      if (jsonDecode(responce.body)['error'] != null) {
        throw HttpException(jsonDecode(responce.body)['message']);
      }
      _userId = jsonDecode(responce.body)['_id'];
      print(_token);
      _token = jsonDecode(responce.body)['token'];
      notifyListeners();
    } catch (error) {
      throw (error);
    }
  }
}
