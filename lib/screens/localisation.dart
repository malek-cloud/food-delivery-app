import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'menu.dart';

class Localisation extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Stackk(),
      ),
    );
  }
}

class Stackk extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Stack(
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
              height: MediaQuery.of(context).size.height * 0.04,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                IconButton(
                    icon: Icon(
                      Icons.keyboard_return,
                      color: Colors.white,
                      size: 30,
                    ),
                    onPressed: () => Get.offAll(
                          Menu(),
                        )),
                Padding(
                  padding: const EdgeInsets.only(top: 8.0, left: 8.0),
                  child: Text(
                    'bienvenu chez',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 21,
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
                fontSize: 30,
                color: Colors.white,
                fontWeight: FontWeight.w600,
              ),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.01,
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
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.02,
            ),
            Expanded(
                child: ListView(
              children: [
                Text(
                  "Trouvez Nous",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 28,
                    color: Colors.teal,
                    fontWeight: FontWeight.bold,
                    fontFamily: 'GloriaHallelujah-Regular',
                  ),
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.03,
                ),
                Text(
                  '50 Avenue de Flandre, 59170 Croix, France',
                  textAlign: TextAlign.center,
                  softWrap: true,
                  style: TextStyle(
                    fontSize: 20,
                    color: Colors.black,
                    fontFamily: 'KiteOne',
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Text(
                  '07 64 46 32 63',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 20,
                    color: Colors.black,
                    fontFamily: 'KiteOne',
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Text(
                  'erric.oneal@gmail.com',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 20,
                    color: Colors.black,
                    fontFamily: 'KiteOne',
                  ),
                ),
                SizedBox(
                  height: 13,
                ),
              ],
            ))
          ],
        ),
      ],
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

