import 'package:flutter/material.dart';
import 'package:get/get.dart';
import './screens/home1.dart';

import './providers/CartProv.dart';
import './providers/items.dart';
import 'package:provider/provider.dart';
import './providers/orders.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (ctx) => Items(),
        ),
        ChangeNotifierProvider(
          create: (ctx) => Cart(),
        ),
        ChangeNotifierProvider(
          create: (ctx) => Orders(),
        ),
        ChangeNotifierProvider(
          create: (ctx) => CartItemm(),
        ),
      ],
      child: GetMaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          accentColor: Colors.teal,
          fontFamily: 'KiteOne',
        ),
        initialRoute: '/',
        home: HomeOne(),
      ),
    );
  }
}
