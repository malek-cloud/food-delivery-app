import 'package:get/get.dart';

import 'home2.dart';
import 'inscri.dart';
import 'menu.dart';
import 'reinitialisation.dart';
import 'package:flutter/material.dart';

void main() => runApp(Connect());

class Connect extends StatefulWidget {
  @override
  _ConnectState createState() => _ConnectState();
}

class _ConnectState extends State<Connect> {
  Color firstColor = Colors.teal;

  Color secondColor = Colors.teal[300];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.white,
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
              ),
            ),
            ListView(
              children: [
                Row(
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(left: 15.0),
                          child: FloatingActionButton(
                              heroTag: "btn8",
                              elevation: 0,
                              backgroundColor: Colors.transparent,
                              child: Icon(Icons.keyboard_return),
                              onPressed: () {
                                Navigator.of(context).pop();
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => HomeTwo()));
                              }),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 8.0),
                          child: Text(
                            'Bienvenue chez',
                            style: TextStyle(
                                fontFamily: 'KiteOne',
                                color: Colors.white,
                                fontSize: 20,
                                fontWeight: FontWeight.w600),
                            textAlign: TextAlign.center,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 8.0),
                          child: Text(
                            'Happy Yummy',
                            style: TextStyle(
                                fontFamily: 'GloriaHallelujah',
                                color: Colors.white,
                                fontSize: 30,
                                fontWeight: FontWeight.w900),
                            textAlign: TextAlign.center,
                          ),
                        ),
                        SizedBox(
                          height: 25,
                        ),
                      ],
                    ),
                    SizedBox(
                      width: MediaQuery.of(context).size.width - 310,
                    ),
                    Container(
                      width: 100,
                      height: 100,
                      decoration: BoxDecoration(
                        image: DecorationImage(
                            image: NetworkImage(
                                'https://i0.wp.com/happy-yummy.fr/wp-content/uploads/2020/03/LOGO2020_HAPPY_YUMMY_RVB.png?fit=100%2C100&ssl=1'),
                            fit: BoxFit.contain),
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.15,
                ),
                Column(
                  children: [
                    Text(
                      'Se connecter',
                      style: TextStyle(
                          fontFamily: 'KiteOne',
                          color: Colors.teal,
                          fontSize: 25,
                          fontWeight: FontWeight.w600),
                      textAlign: TextAlign.center,
                    ),
                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.02,
                    ),
                    Container(
                      margin: EdgeInsets.symmetric(horizontal: 30),
                      padding: EdgeInsets.symmetric(horizontal: 15),
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          colors: [firstColor, secondColor],
                        ),
                        borderRadius: BorderRadius.circular(100.0),
                      ),
                      child: TextField(
                        style: TextStyle(color: Colors.white, fontSize: 20),
                        decoration: InputDecoration(
                          contentPadding: EdgeInsets.only(left: 10),
                          border: InputBorder.none,
                          icon: Icon(
                            Icons.email,
                          ),
                          hintText: "Adresse Email",
                          hintStyle: TextStyle(
                            color: Colors.white,
                            fontSize: 16,
                            fontFamily: 'KiteOne',
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.02,
                    ),
                    Container(
                      margin: EdgeInsets.symmetric(horizontal: 30),
                      padding: EdgeInsets.symmetric(horizontal: 15),
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          colors: [firstColor, secondColor],
                        ),
                        borderRadius: BorderRadius.circular(100.0),
                      ),
                      child: TextField(
                        style: TextStyle(color: Colors.white, fontSize: 20),
                        obscureText: true,
                        decoration: InputDecoration(
                          contentPadding: EdgeInsets.only(left: 10),
                          border: InputBorder.none,
                          icon: Icon(
                            Icons.lock,
                          ),
                          hintText: "Mot de passe",
                          hintStyle: TextStyle(
                            color: Colors.white,
                            fontSize: 16,
                            fontFamily: 'KiteOne',
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.02,
                ),
                Center(
                  child: Column(
                    children: [
                      FloatingActionButton(
                          heroTag: 'btn16',
                          child: Icon(
                            Icons.account_box,
                          ),
                          backgroundColor: Colors.teal,
                          onPressed: () {
                            Get.offAll(Menu());
                          }),
                      FlatButton(
                          onPressed: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => Reset()));
                          },
                          child: Text(
                            'mot de passe oublié ?',
                            style: TextStyle(
                              fontFamily: 'KiteOne',
                              fontSize: 16,
                              fontWeight: FontWeight.w600,
                            ),
                          )),
                      FlatButton(
                        onPressed: () {
                          Navigator.of(context).pop();
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => Inscription()));
                        },
                        child: Text(
                          'créer un compte',
                          style: TextStyle(
                              fontFamily: 'KiteOne',
                              color: Colors.teal,
                              fontSize: 27,
                              fontWeight: FontWeight.w600),
                        ),
                      ),
                    ],
                  ),
                )
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

    var firstEndPoint = Offset(size.width * .43, size.height * 0.58);
    var firstControlpoint = Offset(size.width * 0.1, size.height * 0.61);
    path.quadraticBezierTo(firstControlpoint.dx, firstControlpoint.dy,
        firstEndPoint.dx, firstEndPoint.dy);

    var secondEndPoint = Offset(size.width * .8, size.height * -0.15);
    var secondControlPoint = Offset(size.width * .7, size.height * 0.56);
    path.quadraticBezierTo(secondControlPoint.dx, secondControlPoint.dy,
        secondEndPoint.dx, secondEndPoint.dy);

    path.lineTo(size.width * .8, 0.0);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper oldClipper) => true;
}
