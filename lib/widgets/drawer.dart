import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../screens/home1.dart';
import '../providers/authprov.dart';
import 'package:provider/provider.dart';
import '../screens/settings.dart';
import '../screens/localisation.dart';
import '../screens/Horaire.dart';
import '../screens/contact.dart';
import '../screens/OrdersScreen.dart';

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
            'Historique',
            style: TextStyle(
              fontSize: 20,
              fontFamily: 'KiteOne',
              color: Colors.black,
            ),
          ),
          subtitle: Text('Voir vos ordres'),
          leading: Icon(Icons.payment),
          onTap: () {
            Navigator.of(context).pop();
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
            "à propos",
            style: TextStyle(
              fontSize: 20,
              fontFamily: 'KiteOne',
              color: Colors.black,
            ),
          ),
          subtitle: Text('Savois notre fonctionnement'),
          leading: Icon(Icons.info),
          onTap: () {
            Navigator.of(context).pop();
            Get.to(HomeOne());
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
            Navigator.of(context).pop();
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
            Navigator.of(context).pop();
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
            "Notre Localisation",
            style: TextStyle(
              fontSize: 20,
              fontFamily: 'KiteOne',
              color: Colors.black,
            ),
          ),
          leading: Icon(Icons.my_location),
          onTap: () {
            Navigator.of(context).pop();
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
            Navigator.of(context).pop();
            Get.to(ContactScreen());
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
            "Se déconnecter",
            style: TextStyle(
              fontSize: 20,
              fontFamily: 'KiteOne',
              color: Colors.black,
            ),
          ),
          leading: Icon(Icons.exit_to_app),
          onTap: () {
            Navigator.of(context).pop();
            Provider.of<Auth>(context, listen: false).logout();
          },
        ),
      ]),
    );
  }
}

