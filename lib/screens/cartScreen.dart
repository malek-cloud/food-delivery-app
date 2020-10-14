import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../screens/commandeInfo.dart';
import 'menu.dart';
import '../widgets/itemCrtAppearance.dart';
import 'package:provider/provider.dart';
import '../providers/CartProv.dart';

class CartScreen extends StatefulWidget {
  @override
  _CartScreenState createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  var check = 0;
  @override
  Widget build(BuildContext context) {
    final carta = Provider.of<Cart>(context);
    return MaterialApp(
      home: Scaffold(
        floatingActionButton: FloatingActionButton.extended(
          heroTag: 'btn13',
          onPressed: () {
            if (carta.itemCount != 0) {
              Get.to(Informations());
            } else {
              showDialog(
                  context: context,
                  builder: (context) => AlertDialog(
                        title: Text(
                          'Oups !',
                          style: TextStyle(
                            fontSize: 22,
                            fontWeight: FontWeight.w800,
                            color: Colors.teal,
                            fontFamily: 'KiteOne',
                          ),
                        ),
                        content: Text(
                          'Mais vous n\'avez rien commandé !!',
                          softWrap: true,
                          style: TextStyle(
                            fontSize: 18,
                            fontFamily: 'KiteOne',
                          ),
                        ),
                        actions: [
                          FlatButton(
                            onPressed: () {
                              Get.to(Menu());
                            },
                            child: Text(
                              'Retour',
                              style: TextStyle(
                                fontSize: 20,
                                color: Colors.teal,
                                fontWeight: FontWeight.w700,
                                fontFamily: 'KiteOne',
                              ),
                            ),
                          ),
                        ],
                      ));
            }
          },
          backgroundColor: Colors.teal,
          icon: Icon(
            Icons.get_app,
            size: 25,
            color: Colors.white,
          ),
          label: Text(
            'Commander',
            style: TextStyle(
              color: Colors.white,
              fontFamily: 'KiteOne',
              fontSize: 19,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
        backgroundColor: Colors.white,
        body: Stack(
          children: [
            ClipPath(
              clipper: CustomShapeClipper(),
              child: Stack(
                children: [
                  Container(
                    color: Colors.teal,
                    height: MediaQuery.of(context).size.height * 0.4,
                  ),
                  Opacity(
                    opacity: 0.3,
                    child: Container(
                      height: MediaQuery.of(context).size.height * 0.4,
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
            Column(
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 15.0, top: 12),
                      child: FloatingActionButton(
                          heroTag: "btn9",
                          elevation: 0,
                          backgroundColor: Colors.transparent,
                          child: Icon(Icons.keyboard_return),
                          onPressed: () {
                            Get.offAll(Menu());
                          }),
                    ),
                    Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(left: 8.0),
                          child: Text(
                            'HAPPY YUMMY',
                            softWrap: true,
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 28,
                              fontWeight: FontWeight.w700,
                              fontFamily: 'GloriaHallelujah',
                            ),
                          ),
                        ),
                        Spacer(),
                        Column(
                          children: [
                            Container(
                              width: 100,
                              height: 100,
                              decoration: BoxDecoration(
                                image: DecorationImage(
                                    image: NetworkImage(
                                        'https://i0.wp.com/happy-yummy.fr/wp-content/uploads/2020/03/LOGO2020_HAPPY_YUMMY_RVB.png?fit=100%2C100&ssl=1'),
                                    fit: BoxFit.cover),
                              ),
                            ),
                          ],
                        ),
                      ],
                    )
                  ],
                ),
                SizedBox(
                  height: 40,
                ),
                Container(
                  padding: EdgeInsets.symmetric(
                    horizontal: 20,
                    vertical: 10,
                  ),
                  child: Text(
                    'Totale : ${carta.total.toStringAsFixed(2)} €',
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                        fontWeight: FontWeight.w600,
                        fontFamily: 'KiteOne'),
                  ),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(30),
                    color: Colors.teal,
                  ),
                ),
                Expanded(
                  child: ListView.builder(
                    itemCount: carta.items.length,
                    itemBuilder: (ctx, i) => ItemCartAppearance(
                        carta.items.values.toList()[i].id,
                        carta.items.keys.toList()[i],
                        carta.items.values.toList()[i].title,
                        carta.items.values.toList()[i].price,
                        carta.items.values.toList()[i].quantity),
                  ),
                ),
                SizedBox(
                  height: 30,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Future<DateTime> _showingDate(BuildContext context) {
    return showDatePicker(
      context: context,
      initialDate: DateTime.now().add(Duration(seconds: 1)),
      firstDate: DateTime.now(),
      lastDate: DateTime(2030),
    );
  }

  Future<TimeOfDay> _showingTime(BuildContext context) {
    return showTimePicker(
      context: context,
      initialTime: TimeOfDay(
        hour: DateTime.now().hour,
        minute: DateTime.now().minute,
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

