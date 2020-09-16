import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../providers/CartProv.dart';
import '../providers/item_structure.dart';
import '../screens/details.dart';

import 'package:provider/provider.dart';

class ProductCart extends StatefulWidget {
  @override
  _ProductCartState createState() => _ProductCartState();
}

class _ProductCartState extends State<ProductCart> {
  @override
  Widget build(BuildContext context) {
    final itemProvider = Provider.of<Item>(context);
    final cartProvider = Provider.of<Cart>(context);

    Size size = MediaQuery.of(context).size;
    return GestureDetector(
      onTap: () {
        Get.to(DetailScreen(), arguments: itemProvider.id);
      },
      child: Container(
        height: 160,
        margin: EdgeInsets.symmetric(
          horizontal: 20,
          vertical: 10,
        ),
        child: Stack(
          alignment: Alignment.bottomCenter,
          children: [
            Container(
              height: 136,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(22),
                color: Colors.lightGreen,
                boxShadow: [
                  BoxShadow(
                    offset: Offset(0, 15),
                    blurRadius: 27,
                    color: Colors.black12,
                  ),
                ],
              ),
              child: Container(
                margin: EdgeInsets.only(
                  right: 12,
                ),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(22),
                  color: Colors.white,
                ),
              ),
            ),
            Positioned(
              top: 0,
              right: 0,
              child: Container(
                padding: EdgeInsets.symmetric(
                  horizontal: 20,
                ),
                height: 160,
                width: 200,
                child: Image.network(itemProvider.imageUrl, fit: BoxFit.cover),
              ),
            ),
            Positioned(
              bottom: 0,
              left: 0,
              child: SizedBox(
                height: 136,
                width: size.width - 210,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Center(
                      child: Text(
                        itemProvider.title,
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.w400,
                          fontFamily: 'KiteOne',
                        ),
                        softWrap: true,
                      ),
                    ),
                    Spacer(),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        IconButton(
                          icon: Icon(
                            Icons.remove_shopping_cart,
                            size: 35,
                            color: Colors.lightGreen,
                          ),
                          onPressed: () {
                            setState(() {
                              cartProvider.moinsItem(itemProvider.id);
                            });
                            Scaffold.of(context).hideCurrentSnackBar();
                            Scaffold.of(context).showSnackBar(
                              SnackBar(
                                content: Text('Supprimer de la panier'),
                                duration: Duration(seconds: 2),
                                action: SnackBarAction(
                                  label: 'UNDO',
                                  onPressed: () {
                                    cartProvider.sommeItem(itemProvider.id);
                                  },
                                ),
                              ),
                            );
                          },
                        ),
                        Text(
                          cartProvider.showQuantity(itemProvider.id).toString(),
                          style:
                              TextStyle(fontSize: 5, color: Colors.pink[900]),
                        ),
                        IconButton(
                          icon: Icon(
                            Icons.add_shopping_cart,
                            size: 35,
                            color: Colors.lightGreen,
                          ),
                          onPressed: () {
                            setState(() {
                              cartProvider.sommeItem(itemProvider.id);
                            });
                            Scaffold.of(context).hideCurrentSnackBar();
                            Scaffold.of(context).showSnackBar(
                              SnackBar(
                                content: Text('Ajouté à la panier'),
                                duration: Duration(seconds: 2),
                                action: SnackBarAction(
                                  label: 'UNDO',
                                  onPressed: () {
                                    cartProvider
                                        .removeSingleItem(itemProvider.id);
                                  },
                                ),
                              ),
                            );
                          },
                        ),
                      ],
                    ),
                    Spacer(),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Container(
                          padding: EdgeInsets.symmetric(
                            horizontal: 20,
                            vertical: 5,
                          ),
                          decoration: BoxDecoration(
                              color: Colors.lightGreen,
                              borderRadius: BorderRadius.only(
                                bottomLeft: Radius.circular(22),
                                topRight: Radius.circular(22),
                              )),
                          child: Text(
                            '\$ ${itemProvider.price}',
                            style: TextStyle(
                              fontSize: 20,
                              color: Colors.white,
                            ),
                          ),
                        ),
                        IconButton(
                          icon: Icon(
                            itemProvider.isFavorite
                                ? Icons.favorite
                                : Icons.favorite_border,
                            size: 33,
                            color: Colors.pink[900],
                          ),
                          onPressed: () {
                            itemProvider.toggleFav();
                          },
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

