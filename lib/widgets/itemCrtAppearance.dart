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
  @override
  Widget build(BuildContext context) {
    final itemProvider = Provider.of<Item>(context);
    final cartProvider = Provider.of<Cart>(context);
    var count = 0;
    Size size = MediaQuery.of(context).size;
    return GestureDetector(
      onTap: () {
        Get.to(DetailScreen(), arguments: itemProvider.id);
      },
      child: Container(
        //  height: 180,
        margin: EdgeInsets.symmetric(
          horizontal: 20,
          vertical: 10,
        ),
        child: Stack(
          alignment: Alignment.bottomCenter,
          children: [
            Container(
              height: 170,
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
                  width: 180,
                  child: Stack(
                    children: [
                      Center(
                        child: CircularProgressIndicator(),
                      ),
                      Image.network(
                          ("https://apisite.klikx.fr" + itemProvider.imageUrl)
                              .replaceAll('///', '/'),
                          fit: BoxFit.cover),
                    ],
                  )),
            ),
            Positioned(
              bottom: 0,
              left: 0,
              child: SizedBox(
                height: 170,
                width: size.width - 210,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Spacer(),
                    Flexible(
                      flex: 3,
                      child: Center(
                        child: Padding(
                          padding: const EdgeInsets.only(left: 8.0),
                          child: Text(
                            itemProvider.title,
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w600,
                              fontFamily: 'KiteOne',
                            ),
                            softWrap: true,
                          ),
                        ),
                      ),
                    ),
                    Spacer(),
                    Flexible(
                      flex: 3,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          IconButton(
                            icon: Icon(
                              Icons.remove_shopping_cart,
                              size: 35,
                              color: Colors.lightGreen,
                            ),
                            onPressed: () {
                              if (cartProvider.itemCount != 0) {
                                cartProvider.removeSingleItem(itemProvider.id);

                                Scaffold.of(context).hideCurrentSnackBar();
                                Scaffold.of(context).showSnackBar(
                                  SnackBar(
                                    content: Text('Supprimer de la panier'),
                                    duration: Duration(seconds: 2),
                                    action: SnackBarAction(
                                      label: 'UNDO',
                                      onPressed: () {
                                        cartProvider.addItemToCart(
                                          itemProvider.id,
                                          itemProvider.price,
                                          itemProvider.title,
                                          count,
                                          itemProvider.options,
                                          itemProvider.supplements,
                                        );
                                      },
                                    ),
                                  ),
                                );
                              }
                            },
                          ),
                          IconButton(
                            icon: Icon(
                              Icons.add_shopping_cart,
                              size: 35,
                              color: Colors.lightGreen,
                            ),
                            onPressed: () {
                              cartProvider.addItemToCart(
                                itemProvider.id,
                                itemProvider.price,
                                itemProvider.title,
                                count,
                                itemProvider.options,
                                itemProvider.supplements,
                              );

                              Scaffold.of(context).hideCurrentSnackBar();
                              Scaffold.of(context).showSnackBar(
                                SnackBar(
                                  content: Text('Ajouté à la panier'),
                                  duration: Duration(seconds: 2),
                                  action: SnackBarAction(
                                    label: 'UNDO',
                                    onPressed: () {
                                      if (cartProvider.itemCount != 0) {
                                        cartProvider
                                            .removeSingleItem(itemProvider.id);
                                      }
                                    },
                                  ),
                                ),
                              );
                            },
                          ),
                        ],
                      ),
                    ),
                    Spacer(),
                    Flexible(
                      flex: 3,
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Container(
                            padding: EdgeInsets.symmetric(
                              horizontal: 12,
                              vertical: 5,
                            ),
                            decoration: BoxDecoration(
                                color: Colors.lightGreen,
                                borderRadius: BorderRadius.only(
                                  bottomLeft: Radius.circular(22),
                                  topRight: Radius.circular(22),
                                )),
                            child: Text(
                              '€ ${itemProvider.price}',
                              style: TextStyle(
                                fontSize: 20,
                                color: Colors.white,
                              ),
                            ),
                          ),
                          Spacer(),
                          IconButton(
                            icon: Icon(
                              itemProvider.isFavorite
                                  ? Icons.favorite
                                  : Icons.favorite_border,
                              size: 30,
                              color: Colors.pink[900],
                            ),
                            onPressed: () {
                              itemProvider.toggleFav();
                            },
                          ),
                          Spacer(),
                        ],
                      ),
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
