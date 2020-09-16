import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../widgets/21.1%20badge.dart';
import '../providers/CartProv.dart';
import 'package:provider/provider.dart';
import '../providers/items.dart';
import '../providers/item_structure.dart';
import 'cartScreen.dart';

class DetailScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
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
              height: MediaQuery.of(context).size.height * 0.68,
              decoration: BoxDecoration(
                color: Colors.grey[100],
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(60),
                  bottomRight: Radius.circular(60),
                ),
              ),
              child: ListView(
                children: [
                  Container(
                    height: size.width * 0.75,
                    child: Stack(
                      alignment: Alignment.bottomCenter,
                      children: [
                        Container(
                          height: size.width * 0.7,
                          width: size.width * 0.7,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            shape: BoxShape.circle,
                          ),
                        ),
                        Image.network(
                          currentProduct.imageUrl,
                          height: size.width * 0.6,
                          width: size.width * 0.6,
                          fit: BoxFit.cover,
                        )
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 25,
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 25),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          currentProduct.title,
                          style: TextStyle(
                            fontSize: 22,
                            color: Colors.teal,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        Text(
                          'Prix :  \$${currentProduct.price}',
                          style: TextStyle(
                            fontSize: 18,
                          ),
                        ),
                        Text(
                          'Description : ${currentProduct.description}',
                          style: TextStyle(fontSize: 16, color: Colors.black),
                        ),
                        SizedBox(
                          height: 28,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Spacer(),
            Center(
              child: Container(
                  height: MediaQuery.of(context).size.height * 0.17,
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
