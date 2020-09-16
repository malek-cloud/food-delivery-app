import 'package:flutter/material.dart';

import 'connecter.dart';

void main() => runApp(Reset());

class Reset extends StatefulWidget {
  @override
  _ResetState createState() => _ResetState();
}

class _ResetState extends State<Reset> {
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
                                        builder: (context) => Connect()));
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
                        SizedBox(
                          height: 5,
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 8.0),
                          child: Text(
                            'Happy Yummy',
                            style: TextStyle(
                                fontFamily: 'GloriaHallelujah',
                                color: Colors.white,
                                fontSize: 28,
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
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 30),
                  child: Column(
                    children: [
                      Center(
                        child: Text(
                          'Reinitialiser votre mot de passe',
                          softWrap: true,
                          style: TextStyle(
                            fontFamily: 'KiteOne',
                            color: Colors.teal,
                            fontSize: 25,
                            fontWeight: FontWeight.w900,
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ),
                      SizedBox(
                        height: MediaQuery.of(context).size.height * 0.025,
                      ),
                      Container(
                        padding: EdgeInsets.symmetric(horizontal: 12),
                        decoration: BoxDecoration(
                          gradient: LinearGradient(
                            colors: [firstColor, secondColor],
                          ),
                          borderRadius: BorderRadius.circular(100.0),
                        ),
                        child: TextField(
                          style: TextStyle(color: Colors.white, fontSize: 20),
                          decoration: InputDecoration(
                            contentPadding: EdgeInsets.only(left: 9),
                            border: InputBorder.none,
                            icon: Icon(
                              Icons.email,
                            ),
                            hintText: "Entrer votre adresse amail",
                            hintStyle: TextStyle(
                              color: Colors.white,
                              fontSize: 17,
                              fontFamily: 'KiteOne',
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                          height: MediaQuery.of(context).size.height * 0.025),
                      Center(
                        child: Column(
                          children: [
                            Text(
                              'Entrer votre email et nous allons vous envoyer un lien pour reinitialiser votre mot de passe',
                              textAlign: TextAlign.center,
                              softWrap: true,
                              style: TextStyle(
                                fontSize: 18,
                                fontFamily: 'KiteOne',
                                fontWeight: FontWeight.w300,
                                color: Colors.black,
                                shadows: [
                                  Shadow(
                                    blurRadius: 4.0,
                                    color: Colors.black38,
                                    offset: Offset(6.0, 4.0),
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(
                              height:
                                  MediaQuery.of(context).size.height * 0.025,
                            ),
                            FloatingActionButton.extended(
                                icon: Icon(Icons.send),
                                label: Text('envoyer',
                                    style: TextStyle(
                                      fontFamily: 'KiteOne',
                                    )),
                                backgroundColor: Colors.teal,
                                onPressed: () {}),
                          ],
                        ),
                      ),
                    ],
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
