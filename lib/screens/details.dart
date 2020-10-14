import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../widgets/badge.dart';
import '../providers/CartProv.dart';
import 'package:provider/provider.dart';
import '../providers/items.dart';
import '../providers/item_structure.dart';
import 'cartScreen.dart';

class DetailScreen extends StatefulWidget {
  static const routeName = '/detail';

  @override
  _DetailScreenState createState() => _DetailScreenState();
}

class _DetailScreenState extends State<DetailScreen> {
  var count = 0;

  final List optionsList1 = [];
  final List optionsList2 = [];

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    final provid = Provider.of<Cart>(context);
    final prodId = ModalRoute.of(context).settings.arguments as String;
    final currentProduct = Provider.of<Items>(
      context,
      listen: false,
    ).findById(prodId);
    return ChangeNotifierProvider(
      create: (context) => Item(),
      child: Scaffold(
        backgroundColor: Colors.teal,
        appBar: AppBar(
          backgroundColor: Colors.grey[100],
          elevation: 0,
          centerTitle: false,
          title: Text(
            'retour',
            style: TextStyle(
                fontSize: 20, color: Colors.black, fontWeight: FontWeight.w700),
          ),
          leading: IconButton(
              iconSize: 30,
              color: Colors.black,
              icon: Icon(Icons.keyboard_return),
              onPressed: () {
                Navigator.pop(context);
              }),
          actions: [
            Consumer<Cart>(
                builder: (_, cartData, ch) => Badge(
                      child: ch,
                      value: cartData.itemCount.toString(),
                      color: Colors.teal,
                    ),
                child: IconButton(
                  color: Colors.black,
                  iconSize: 40,
                  icon: Icon(Icons.shopping_basket),
                  onPressed: () {
                    Get.to(CartScreen());
                  },
                )),
          ],
        ),
        body: SafeArea(
          child: Column(children: [
            Container(
              width: double.infinity,
              height: MediaQuery.of(context).size.height * 0.71,
              decoration: BoxDecoration(
                color: Colors.grey[100],
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(60),
                  bottomRight: Radius.circular(60),
                ),
              ),
              child: Stack(
                alignment: Alignment.bottomCenter,
                children: [
                  ListView(
                    children: [
                      Container(
                        height: size.width * 0.75,
                        child: Stack(
                          alignment: Alignment.bottomCenter,
                          children: [
                            Container(
                                height: size.width * 0.7,
                                width: size.width * 0.7,
                                child: Image.network(
                                  ("https://apisite.klikx.fr" +
                                          currentProduct.imageUrl)
                                      .replaceAll('///', '/'),
                                  height: size.width * 0.6,
                                  width: size.width * 0.6,
                                  fit: BoxFit.cover,
                                )),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 25),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                Container(
                                  width:
                                      MediaQuery.of(context).size.width * 0.5,
                                  child: Text(
                                    currentProduct.title,
                                    textAlign: TextAlign.center,
                                    softWrap: true,
                                    style: TextStyle(
                                      fontSize: 22,
                                      color: Colors.teal,
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                ),
                                Spacer(),
                                IconButton(
                                    icon: Icon(Icons.remove_shopping_cart),
                                    color: Colors.lightGreen,
                                    iconSize: 40,
                                    onPressed: () {
                                      if (provid.itemCount != 0) {
                                        provid.removeSingleItem(
                                          currentProduct.id,
                                        );

                                        Get.snackbar(
                                          'Effacer !',
                                          'Elevé de la panier avec succés',
                                          snackPosition: SnackPosition.BOTTOM,
                                          duration: Duration(seconds: 1),
                                          isDismissible: true,
                                        );
                                      }
                                    }),
                                SizedBox(
                                  width: 1,
                                ),
                                IconButton(
                                    color: Colors.lightGreen,
                                    icon: Icon(Icons.add_shopping_cart),
                                    iconSize: 40,
                                    onPressed: () {
                                      provid.addItemToCart(
                                        currentProduct.id,
                                        currentProduct.price,
                                        currentProduct.title,
                                        count,
                                        optionsList1,
                                        optionsList2,
                                        //  currentProduct.options,
                                        // currentProduct.supplements,
                                      );

                                      Get.snackbar(
                                        'Succés !',
                                        'Ajouté à la panier avec succés',
                                        snackPosition: SnackPosition.BOTTOM,
                                        duration: Duration(seconds: 1),
                                        isDismissible: true,
                                      );
                                    }),
                              ],
                            ),
                            SizedBox(
                              height: 15,
                            ),
                            Text(
                              'Prix :  ${currentProduct.price}€',
                              style: TextStyle(
                                fontSize: 18,
                              ),
                            ),
                            Text(
                              'Description : ${currentProduct.description}'
                                  .replaceAll("<p>", "")
                                  .replaceAll("</p>", ""),
                              style:
                                  TextStyle(fontSize: 16, color: Colors.black),
                            ),
                            SizedBox(
                              height: 28,
                            ),
                          ],
                        ),
                      ),
                      currentProduct.options != []
                          ? Column(
                              children: [
                                for (var i in currentProduct.options)
                                  Column(
                                    children: [
                                      Divider(),
                                      Text(
                                        i['name'],
                                        style: TextStyle(
                                            fontWeight: FontWeight.w900,
                                            fontSize: 20),
                                      ),
                                      for (var j in i['items'])
                                        Padding(
                                            padding: const EdgeInsets.symmetric(
                                                horizontal: 20.0),
                                            child: CheckboxListTile(
                                              value: optionsList1
                                                  .contains(j['name']),
                                              onChanged: (bool value) {
                                                setState(() {
                                                  if (value) {
                                                    optionsList1.add(j['name']);

                                                    // currentProduct.options =
                                                    //    optionsList1;
                                                  } else {
                                                    optionsList1
                                                        .remove(j['name']);
                                                  }
                                                });
                                              },
                                              title: Text(
                                                j['name'],
                                                softWrap: true,
                                                style: TextStyle(
                                                    fontWeight: FontWeight.w500,
                                                    fontSize: 15),
                                              ),
                                              subtitle: j['price'] != 0
                                                  ? Text(
                                                      '€ ${j['price'].toDouble()} ')
                                                  : Text(''),
                                              activeColor: Colors.teal,
                                            )),
                                    ],
                                  )
                              ],
                            )
                          : Container(
                              height: 0.0001,
                            ),
                      currentProduct.supplements != []
                          ? Column(
                              children: [
                                for (var i in currentProduct.supplements)
                                  Column(
                                    children: [
                                      Text(
                                        i['name'],
                                        style: TextStyle(
                                            fontWeight: FontWeight.w900,
                                            fontSize: 20),
                                      ),
                                      for (var j in i['items'])
                                        Padding(
                                          padding: const EdgeInsets.symmetric(
                                              horizontal: 20.0),
                                          child: CheckboxListTile(
                                            value: optionsList2
                                                .contains(j['name']),
                                            onChanged: (bool value) {
                                              setState(() {
                                                if (value) {
                                                  optionsList2.add(j['name']);
                                                } else {
                                                  optionsList2
                                                      .remove(j['name']);
                                                }
                                              });
                                            },
                                            title: Text(
                                              j['name'],
                                              softWrap: true,
                                              style: TextStyle(
                                                  fontWeight: FontWeight.w500,
                                                  fontSize: 17),
                                            ),
                                            subtitle: j['price'] != 0
                                                ? Text(
                                                    '€ ${j['price'].toDouble()} ')
                                                : Text(''),
                                            activeColor: Colors.teal,
                                          ),
                                        ),
                                    ],
                                  )
                              ],
                            )
                          : Container(
                              height: 0.0001,
                            ),
                      SizedBox(
                        height: 30,
                      ),
                    ],
                  ),
                  Icon(
                    Icons.arrow_drop_down,
                    size: 50,
                    color: Colors.black38,
                  ),
                ],
              ),
            ),
            Spacer(),
            Center(
              child: Container(
                  height: MediaQuery.of(context).size.height * 0.17,
                  width: double.infinity,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Text(
                        'Happy Yummy',
                        softWrap: true,
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 32,
                          fontWeight: FontWeight.w700,
                          fontFamily: 'GloriaHallelujah',
                        ),
                      ),
                      Image.network(
                          'https://i0.wp.com/happy-yummy.fr/wp-content/uploads/2020/03/LOGO2020_HAPPY_YUMMY_RVB.png?fit=100%2C100&ssl=1',
                          fit: BoxFit.cover),
                    ],
                  )),
            ),
            Spacer(),
          ]),
        ),
      ),
    );
  }
}

