import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../widgets/drawer.dart';
import 'cartScreen.dart';
import '../widgets/products_grid.dart';
import '../widgets/21.1 badge.dart';
import 'package:provider/provider.dart';
import '../providers/CartProv.dart';

enum filterOption {
  favorite,
  all,
}

class Menu extends StatefulWidget {
  @override
  _MenuState createState() => _MenuState();
}

class _MenuState extends State<Menu> {
  var _showFav = false;
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
      appBar: AppBar(
        title: Text(
          'Notre menu ..',
          style: TextStyle(
            color: Colors.white,
            fontSize: 20,
            fontFamily: 'KiteOne',
          ),
        ),
        elevation: 0,
        backgroundColor: Colors.teal,
        actions: [
          PopupMenuButton(
              onSelected: (filterOption selectedValue) {
                setState(() {
                  if (selectedValue == filterOption.favorite) {
                    _showFav = true;
                  } else {
                    _showFav = false;
                  }
                });
              },
              icon: Icon(Icons.more_vert),
              itemBuilder: (_) => [
                    PopupMenuItem(
                      child: Text(
                        'Voir tous..',
                        style: TextStyle(
                          fontSize: 17,
                        ),
                      ),
                      value: filterOption.all,
                    ),
                    PopupMenuItem(
                      child: Text(
                        'Voir vos favories..',
                        style: TextStyle(
                          fontSize: 17,
                        ),
                      ),
                      value: filterOption.favorite,
                    )
                  ])
        ],
      ),
      drawer: Drawerr(),
      floatingActionButton: Consumer<Cart>(
        builder: (_, cartData, ch) => Badge(
          child: ch,
          value: cartData.itemCount.toString(),
          color: Colors.green[100],
        ),
        child: FloatingActionButton(
          heroTag: "btn10",
          onPressed: () {
            Get.to(CartScreen());
          },
          backgroundColor: Colors.lightGreen,
          child: Icon(
            Icons.add_shopping_cart,
            size: 40,
          ),
        ),
      ),
      backgroundColor: Colors.teal,
      body: ProductsGrid(_showFav),
    ));
  }
}
