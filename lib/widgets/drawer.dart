import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../screens/settings.dart';
import '../screens/localisation.dart';
import '../screens/Horaire.dart';
import '../screens/contact.dart';
import '../screens/OrdersScreen.dart';
import '../screens/menu.dart';

class Drawerr extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(children: [
        DrawerHeader(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Happy Yummy',
                style: TextStyle(
                  fontSize: 25,
                  fontFamily: 'GloriaHallelujah-Regular',
                  color: Colors.white,
                ),
              ),
              Image.network(
                'https://i0.wp.com/happy-yummy.fr/wp-content/uploads/2020/03/LOGO2020_HAPPY_YUMMY_RVB.png?fit=100%2C100&ssl=1',
              ),
            ],
          ),
          decoration: BoxDecoration(
            color: Colors.lightGreen,
          ),
        ),
        ListTile(
          title: Text(
            'Menu',
            style: TextStyle(
              fontSize: 20,
              fontFamily: 'KiteOne',
              color: Colors.black,
            ),
          ),
          subtitle: Text('Découvrez notre menu'),
          leading: Icon(Icons.fastfood),
          onTap: () {
            Get.offAll(Menu());
          },
        ),
        Divider(
          color: Colors.grey[350],
          thickness: 1.0,
          indent: 60,
          height: 0,
        ),
        ListTile(
          title: Text(
            'Ordres',
            style: TextStyle(
              fontSize: 20,
              fontFamily: 'KiteOne',
              color: Colors.black,
            ),
          ),
          subtitle: Text('Voir vos commandes'),
          leading: Icon(Icons.payment),
          onTap: () {
            Get.to(OrderScreen());
          },
        ),
        Divider(
          color: Colors.grey[350],
          thickness: 1.0,
          indent: 60,
          height: 0,
        ),
        ListTile(
          title: Text(
            'Paramètres',
            style: TextStyle(
              fontSize: 20,
              fontFamily: 'KiteOne',
              color: Colors.black,
            ),
          ),
          leading: Icon(Icons.settings),
          onTap: () {
            Get.to(Settings());
          },
        ),
        Divider(
          color: Colors.grey[350],
          thickness: 1.0,
          indent: 60,
          height: 0,
        ),
        ListTile(
          title: Text(
            "Horaires d'ouverture ",
            style: TextStyle(
              fontSize: 20,
              fontFamily: 'KiteOne',
              color: Colors.black,
            ),
          ),
          leading: Icon(Icons.timer),
          onTap: () {
            Get.to(Horaire());
          },
        ),
        Divider(
          color: Colors.grey[350],
          thickness: 1.0,
          indent: 60,
          height: 0,
        ),
        ListTile(
          title: Text(
            "Localisation",
            style: TextStyle(
              fontSize: 20,
              fontFamily: 'KiteOne',
              color: Colors.black,
            ),
          ),
          leading: Icon(Icons.my_location),
          onTap: () {
            Get.to(Localisation());
          },
        ),
        Divider(
          color: Colors.grey[350],
          thickness: 1.0,
          indent: 60,
          height: 0,
        ),
        ListTile(
          title: Text(
            "Contact",
            style: TextStyle(
              fontSize: 20,
              fontFamily: 'KiteOne',
              color: Colors.black,
            ),
          ),
          leading: Icon(Icons.contact_mail),
          onTap: () {
            Get.to(ContactScreen());
          },
        ),
      ]),
    );
  }
}
