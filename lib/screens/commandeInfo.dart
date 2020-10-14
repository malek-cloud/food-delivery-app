import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'cartScreen.dart';
import '../providers/CartProv.dart';
import '../providers/orders.dart';
import 'package:provider/provider.dart';
import 'package:progress_dialog/progress_dialog.dart';
import '../providers/checkout.dart';

class Informations extends StatefulWidget {
  @override
  _InformationsState createState() => _InformationsState();
}

class _InformationsState extends State<Informations> {
  @override
  initState() {
    super.initState();
    StripeService.init();
  }

  payViaNewCard(BuildContext context, String money) async {
    ProgressDialog dialog = new ProgressDialog(context);
    dialog.style(message: 'Please wait...');
    await dialog.show();
    var response =
        await StripeService.payWithNewCard(amount: money, currency: 'eur');
    await dialog.hide();

    Get.snackbar(
      response.success ? 'Succès de transaction' : 'échec de transaction',
      '',
      snackPosition: SnackPosition.BOTTOM,
      isDismissible: true,
      duration: Duration(milliseconds: 3000),
    );
  }

  var check = 0;
  bool value1 = true;
  void onChanged1(bool value) {
    setState(() {
      value1 = value;
    });
  }

  bool value2 = false;
  void onChanged2(bool value) {
    setState(() {
      value2 = value;
    });
  }

  List<String> l = [
    'Espèces',
    'Carte bancaire',
    'Titres restaurant',
  ];
  int selectedIndex = 0;

  final _prenomFocusNode = FocusNode();
  final _numeroFocusNode = FocusNode();

  final _villeFocusNode = FocusNode();
  final _adresseFocusNode = FocusNode();
  final _emailFocusNode = FocusNode();
  final _codeFocusNode = FocusNode();
  final _sujetFocusNode = FocusNode();

  @override
  void dispose() {
    _prenomFocusNode.dispose();
    _numeroFocusNode.dispose();

    _villeFocusNode.dispose();
    _codeFocusNode.dispose();
    _adresseFocusNode.dispose();
    _emailFocusNode.dispose();

    _sujetFocusNode.dispose();

    super.dispose();
  }

  final _adressController = TextEditingController();
  final _paysController = TextEditingController();
  final _villeController = TextEditingController();
  final _emailController = TextEditingController();
  final _nomController = TextEditingController();
  final _prenomController = TextEditingController();
  final _codeController = TextEditingController();
  final _phoneController = TextEditingController();
  final _remarqueController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final carta = Provider.of<Cart>(context);
    return Scaffold(
      backgroundColor: Colors.grey[100],
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
                      onPressed: () {
                        Get.to(CartScreen());
                      }),
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
                  padding: EdgeInsets.symmetric(horizontal: 15),
                  children: [
                    Text(
                      "Plus d'informations sur la commande",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 26,
                        color: Colors.teal,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.03,
                    ),
                    Form(
                      child: Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(
                                top: 10.0, left: 10, right: 10),
                            child: Container(
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(100.0),
                              ),
                              child: TextFormField(
                                controller: _nomController,
                                textInputAction: TextInputAction.next,
                                onFieldSubmitted: (_) {
                                  FocusScope.of(context)
                                      .requestFocus(_prenomFocusNode);
                                },
                                decoration: InputDecoration(
                                  contentPadding: EdgeInsets.only(left: 9),
                                  border: InputBorder.none,
                                  labelText: 'Nom',
                                  hintText: "Nom",
                                  hintStyle: TextStyle(
                                    fontSize: 17,
                                    fontFamily: 'KiteOne',
                                  ),
                                ),
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(
                                top: 10.0, left: 10, right: 10),
                            child: Container(
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(100.0),
                              ),
                              child: TextFormField(
                                controller: _prenomController,
                                textInputAction: TextInputAction.next,
                                focusNode: _prenomFocusNode,
                                onFieldSubmitted: (_) {
                                  FocusScope.of(context)
                                      .requestFocus(_numeroFocusNode);
                                },
                                decoration: InputDecoration(
                                  contentPadding: EdgeInsets.only(left: 9),
                                  border: InputBorder.none,
                                  labelText: 'Prénom',
                                  hintText: "Prénom",
                                  hintStyle: TextStyle(
                                    fontSize: 17,
                                    fontFamily: 'KiteOne',
                                  ),
                                ),
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(
                                top: 10.0, left: 10, right: 10),
                            child: Container(
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(100.0),
                              ),
                              child: TextFormField(
                                controller: _phoneController,
                                textInputAction: TextInputAction.next,
                                focusNode: _numeroFocusNode,
                                keyboardType: TextInputType.phone,
                                decoration: InputDecoration(
                                  contentPadding: EdgeInsets.only(left: 9),
                                  border: InputBorder.none,
                                  labelText: 'Numéro de télephone',
                                  hintText: "Numéro de télephone",
                                  hintStyle: TextStyle(
                                    fontSize: 17,
                                    fontFamily: 'KiteOne',
                                  ),
                                ),
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(
                                top: 10.0, left: 10, right: 10),
                            child: Container(
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(100.0),
                              ),
                              child: TextFormField(
                                controller: _emailController,
                                textInputAction: TextInputAction.done,
                                focusNode: _emailFocusNode,
                                keyboardType: TextInputType.emailAddress,
                                decoration: InputDecoration(
                                  contentPadding: EdgeInsets.only(left: 9),
                                  border: InputBorder.none,
                                  labelText: 'Adresse Email',
                                  hintText: "Adresse Email",
                                  hintStyle: TextStyle(
                                    fontSize: 17,
                                    fontFamily: 'KiteOne',
                                  ),
                                ),
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 13,
                          ),
                          CheckboxListTile(
                            value: value2,
                            onChanged: onChanged2,
                            activeColor: Colors.teal,
                            title: Text(
                              'Justification',
                              softWrap: true,
                            ),
                          ),
                          Divider(
                            endIndent: 80,
                            indent: 80,
                            thickness: 1.5,
                            color: Colors.lightGreen,
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Text(
                            'Livraison',
                            style: TextStyle(
                              fontSize: 23,
                              fontWeight: FontWeight.w600,
                              color: Colors.teal,
                            ),
                          ),
                          CheckboxListTile(
                            value: value1,
                            onChanged: onChanged1,
                            activeColor: Colors.teal,
                            title: Text(
                              'Décocher si emporter',
                              softWrap: true,
                            ),
                          ),
                          Divider(
                            endIndent: 80,
                            indent: 80,
                            thickness: 1.5,
                            color: Colors.lightGreen,
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          if (value1)
                            (Column(
                              children: [
                                Padding(
                                    padding: const EdgeInsets.only(
                                        top: 10.0, left: 10, right: 10),
                                    child: Container(
                                      decoration: BoxDecoration(
                                        color: Colors.white,
                                        borderRadius:
                                            BorderRadius.circular(100.0),
                                      ),
                                      child: TextFormField(
                                        textInputAction: TextInputAction.next,
                                        controller: _paysController,
                                        onFieldSubmitted: (_) {
                                          FocusScope.of(context)
                                              .requestFocus(_villeFocusNode);
                                        },
                                        decoration: InputDecoration(
                                          contentPadding:
                                              EdgeInsets.only(left: 9),
                                          border: InputBorder.none,
                                          labelText: 'Pays',
                                          hintText: "Pays",
                                          hintStyle: TextStyle(
                                            fontSize: 17,
                                            fontFamily: 'KiteOne',
                                          ),
                                        ),
                                      ),
                                    )),
                                Padding(
                                    padding: const EdgeInsets.only(
                                        top: 10.0, left: 10, right: 10),
                                    child: Container(
                                      decoration: BoxDecoration(
                                        color: Colors.white,
                                        borderRadius:
                                            BorderRadius.circular(100.0),
                                      ),
                                      child: TextFormField(
                                        textInputAction: TextInputAction.next,
                                        controller: _villeController,
                                        onFieldSubmitted: (_) {
                                          FocusScope.of(context)
                                              .requestFocus(_adresseFocusNode);
                                        },
                                        decoration: InputDecoration(
                                          contentPadding:
                                              EdgeInsets.only(left: 9),
                                          border: InputBorder.none,
                                          labelText: 'Ville',
                                          hintText: "Ville",
                                          hintStyle: TextStyle(
                                            fontSize: 17,
                                            fontFamily: 'KiteOne',
                                          ),
                                        ),
                                      ),
                                    )),
                                Padding(
                                    padding: const EdgeInsets.only(
                                        top: 10.0, left: 10, right: 10),
                                    child: Container(
                                      decoration: BoxDecoration(
                                        color: Colors.white,
                                        borderRadius:
                                            BorderRadius.circular(100.0),
                                      ),
                                      child: TextFormField(
                                        textInputAction: TextInputAction.next,
                                        controller: _adressController,
                                        onFieldSubmitted: (_) {
                                          FocusScope.of(context)
                                              .requestFocus(_codeFocusNode);
                                        },
                                        decoration: InputDecoration(
                                          contentPadding:
                                              EdgeInsets.only(left: 9),
                                          border: InputBorder.none,
                                          labelText: 'Adresse',
                                          hintText: "Adresse",
                                          hintStyle: TextStyle(
                                            fontSize: 17,
                                            fontFamily: 'KiteOne',
                                          ),
                                        ),
                                      ),
                                    )),
                                Padding(
                                    padding: const EdgeInsets.only(
                                        top: 10.0, left: 10, right: 10),
                                    child: Container(
                                      decoration: BoxDecoration(
                                        color: Colors.white,
                                        borderRadius:
                                            BorderRadius.circular(100.0),
                                      ),
                                      child: TextFormField(
                                        controller: _codeController,
                                        keyboardType: TextInputType.number,
                                        textInputAction: TextInputAction.done,
                                        focusNode: _codeFocusNode,
                                        decoration: InputDecoration(
                                          contentPadding:
                                              EdgeInsets.only(left: 9),
                                          border: InputBorder.none,
                                          labelText: 'Code Postale',
                                          hintText: "Code Postale",
                                          hintStyle: TextStyle(
                                            fontSize: 17,
                                            fontFamily: 'KiteOne',
                                          ),
                                        ),
                                      ),
                                    )),
                                SizedBox(
                                  height: 12,
                                ),
                                Divider(
                                  endIndent: 80,
                                  indent: 80,
                                  thickness: 1.5,
                                  color: Colors.lightGreen,
                                ),
                                SizedBox(
                                  height: 10,
                                ),
                                Text(
                                  'Quel est votre mode de paiement ?',
                                  softWrap: true,
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                      fontSize: 21,
                                      fontWeight: FontWeight.w600,
                                      color: Colors.teal),
                                ),
                                SizedBox(
                                  height: 10,
                                ),
                                custonButton(l[1], 1),
                                custonButton(l[0], 0),
                                custonButton(l[2], 2),
                                SizedBox(
                                  height: 12,
                                ),
                                Divider(
                                  endIndent: 80,
                                  indent: 80,
                                  thickness: 1.5,
                                  color: Colors.lightGreen,
                                ),
                                SizedBox(
                                  height: 10,
                                ),
                              ],
                            )),
                          RaisedButton(
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(35)),
                            color: Colors.teal,
                            onPressed: () async {
                              final selectedTime = await _showingTime(context);
                              if (selectedTime == null) {
                                check += 1;
                                return;
                              }
                            },
                            child: Text(
                              'choisir la temps de la livraison',
                              softWrap: true,
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                color: Colors.white,
                                fontFamily: 'kiteOne',
                                fontSize: 19,
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 8,
                          ),
                          RaisedButton(
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(35)),
                            color: Colors.teal,
                            onPressed: () async {
                              final selectedDate = await _showingDate(context);
                              if (selectedDate == null) {
                                check += 1;
                                return;
                              }
                            },
                            child: Text(
                              'choisir la date de la livraison',
                              softWrap: true,
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                color: Colors.white,
                                fontFamily: 'kiteOne',
                                fontSize: 19,
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 12,
                          ),
                          Divider(
                            endIndent: 80,
                            indent: 80,
                            thickness: 1.5,
                            color: Colors.lightGreen,
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Padding(
                              padding: const EdgeInsets.only(
                                  top: 10.0, left: 10, right: 10),
                              child: Container(
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(30.0),
                                ),
                                child: TextFormField(
                                  controller: _remarqueController,
                                  textInputAction: TextInputAction.done,
                                  keyboardType: TextInputType.multiline,
                                  maxLines: 5,
                                  decoration: InputDecoration(
                                    contentPadding: EdgeInsets.only(
                                      left: 10,
                                      top: 10,
                                    ),
                                    border: InputBorder.none,
                                    hintText: "Remarque..",
                                    hintStyle: TextStyle(
                                      fontSize: 17,
                                      fontFamily: 'KiteOne',
                                    ),
                                  ),
                                ),
                              )),
                          SizedBox(
                            height: 12,
                          ),
                          Divider(
                            endIndent: 80,
                            indent: 80,
                            thickness: 1.5,
                            color: Colors.lightGreen,
                          ),
                          SizedBox(
                            height: 15,
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 100.0),
                      child: FloatingActionButton.extended(
                        onPressed: () async {
                          if (check == 0) {
                            if (selectedIndex == 1) {
                              payViaNewCard(context,
                                  (carta.total * 100).toInt().toString());
                            }
                            //now id payment succeeded i want to await the orders provider, if not return;
                            await Provider.of<Orders>(
                              context,
                              listen: false,
                            ).addOrder(
                              carta.items.values.toList(),
                              _nomController.text,
                              _prenomController.text,
                              _codeController.text,
                              value2,
                              _adressController.text,
                              l[selectedIndex],
                              value1,
                              _remarqueController.text,
                              _phoneController.text,
                              _emailController.text,
                              _villeController.text,
                              _paysController.text,
                            );
                            carta.clear();
                            //  Get.offAll(Menu());
                          } else {
                            Navigator.of(context).pop(false);
                            Get.snackbar(
                              'Echec !',
                              'Veuillez saisir les informations necessaires de la commande pour pouvoir l\'effectuer',
                              snackPosition: SnackPosition.BOTTOM,
                              duration: Duration(seconds: 5),
                              isDismissible: true,
                            );
                          }
                        },
                        label: Text(
                          'Acheter',
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.w500,
                            color: Colors.white,
                            fontFamily: 'KiteOne',
                          ),
                        ),
                        icon: Icon(
                          Icons.payment,
                          color: Colors.white,
                          size: 30,
                        ),
                        backgroundColor: Colors.teal,
                      ),
                    ),
                    SizedBox(
                      height: 28,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  void chandeIndex(int index) {
    setState(() {
      selectedIndex = index;
    });
  }

  Widget custonButton(String choix, int index) {
    return OutlineButton(
      onPressed: () => chandeIndex(index),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      borderSide:
          BorderSide(color: selectedIndex == index ? Colors.teal : Colors.grey),
      child: Text(
        choix,
        style: TextStyle(
            color: selectedIndex == index ? Colors.teal : Colors.grey,
            fontSize: 17,
            fontWeight: FontWeight.w600),
      ),
    );
  }
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
