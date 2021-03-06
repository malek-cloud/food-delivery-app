import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'menu.dart';

class HomeOne extends StatefulWidget {
  @override
  _HomeOneState createState() => _HomeOneState();
}

class _HomeOneState extends State<HomeOne> {
  bool change = false;
  void _change() {
    setState(() {
      change = !change;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Stack(
          children: [
            ClipPath(
                clipper: CustomShapeClipper(),
                child: Stack(
                  children: [
                    Container(
                      color: Colors.teal,
                      height: MediaQuery.of(context).size.height * 0.5,
                    ),
                    Opacity(
                      opacity: 0.3,
                      child: Container(
                        height: MediaQuery.of(context).size.height * 0.5,
                        decoration: BoxDecoration(
                          image: DecorationImage(
                              image: NetworkImage(
                                  'https://i2.wp.com/happy-yummy.fr/wp-content/uploads/2020/05/person-holding-brown-wooden-chopsticks-with-green-vegetable-3622476.jpg?resize=768%2C1152&ssl=1'),
                              fit: BoxFit.fitWidth),
                        ),
                      ),
                    ),
                  ],
                )),
            Column(
              children: [
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.035,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    FloatingActionButton(
                        heroTag: "btn5",
                        elevation: 0,
                        backgroundColor: Colors.transparent,
                        child: Icon(Icons.keyboard_return),
                        onPressed: () {
                          Get.off(Menu());
                        }),
                    Padding(
                      padding: const EdgeInsets.only(top: 8.0, left: 8.0),
                      child: Text(
                        'bienvenu chez',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 21,
                          fontFamily: 'KiteOne',
                          color: Colors.white,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 7,
                ),
                Text(
                  'Happy Yummy',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontFamily: 'GloriaHallelujah',
                    fontSize: 30,
                    color: Colors.white,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                Center(
                  child: Container(
                    height: MediaQuery.of(context).size.height * 0.18,
                    width: MediaQuery.of(context).size.width * 0.4,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                          image: NetworkImage(
                              'https://i0.wp.com/happy-yummy.fr/wp-content/uploads/2020/03/LOGO2020_HAPPY_YUMMY_RVB.png?fit=100%2C100&ssl=1'),
                          fit: BoxFit.contain),
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(left: 30, right: 30, top: 20),
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.transparent,
                      borderRadius: BorderRadius.circular(25),
                    ),
                    child: Column(
                      children: [
                        change
                            ? Text(
                                'Livraison',
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  fontFamily: 'KiteOne',
                                  fontSize: 27,
                                  color: Colors.teal,
                                  fontWeight: FontWeight.w900,
                                  fontStyle: FontStyle.italic,
                                ),
                              )
                            : Text(
                                "Notre fonctionnement",
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  fontFamily: 'KiteOne',
                                  fontSize: 26,
                                  color: Colors.teal,
                                  fontWeight: FontWeight.w900,
                                  fontStyle: FontStyle.italic,
                                ),
                              ),
                        SizedBox(
                          height: MediaQuery.of(context).size.height * 0.015,
                        ),
                        change
                            ? Text(
                                'Les livraisons commencent à 12h15 et couvrent une zone de 5km autour du restaurant.Pour toute commande inférieure à 40€, 1€ de frais de livraison sera appliquée à la commande',
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  fontFamily: 'KiteOne',
                                  fontSize: 16,
                                  color: Colors.black,
                                ),
                              )
                            : Text(
                                "Possibilié de passer les commandes du Lundi au Dimanche. Le paiement se fait soit en ligne soit à la livraison, par CB, Espèces ou Titres restaurant. Pour toute demande spécifique, nous sommes disponibles par mail et téléphone.",
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  fontFamily: 'KiteOne',
                                  fontSize: 16,
                                  color: Colors.black,
                                ),
                              ),
                        SizedBox(
                          height: 30,
                        ),
                        FloatingActionButton.extended(
                          onPressed: _change,
                          icon: Icon(
                            Icons.arrow_forward,
                            color: Colors.teal,
                          ),
                          backgroundColor: Colors.white,
                          elevation: 0,
                          label: change
                              ? Text(
                                  'Fonctionnement',
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    fontFamily: 'KiteOne',
                                    fontSize: 18,
                                    color: Colors.teal,
                                    fontWeight: FontWeight.w900,
                                    fontStyle: FontStyle.italic,
                                  ),
                                )
                              : Text(
                                  'Livraison',
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    fontFamily: 'KiteOne',
                                    fontSize: 18,
                                    color: Colors.teal,
                                    fontWeight: FontWeight.w900,
                                    fontStyle: FontStyle.italic,
                                  ),
                                ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class CustomShapeClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    final Path path = Path();
    path.lineTo(0.0, size.height);

    var firstEndPoint = Offset(size.width * .5, size.height * 0.64);
    var firstControlpoint = Offset(size.width * 0.05, size.height * 0.63);
    path.quadraticBezierTo(firstControlpoint.dx, firstControlpoint.dy,
        firstEndPoint.dx, firstEndPoint.dy);

    var secondEndPoint = Offset(size.width, size.height);
    var secondControlPoint = Offset(size.width * .95, size.height * 0.63);
    path.quadraticBezierTo(secondControlPoint.dx, secondControlPoint.dy,
        secondEndPoint.dx, secondEndPoint.dy);

    path.lineTo(size.width, 0.0);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper oldClipper) => true;
}
