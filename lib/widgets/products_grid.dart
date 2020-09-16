import 'package:flutter/material.dart';
import 'package:happy__hummy/providers/items.dart';

import 'package:provider/provider.dart';

import 'item_apperance.dart';

class ProductsGrid extends StatefulWidget {
  final bool showFav;
  ProductsGrid(this.showFav);

  @override
  _ProductsGridState createState() => _ProductsGridState();
}

class _ProductsGridState extends State<ProductsGrid> {
  int selectedIndex = 0;
  List categories = [
    'SUSHIS',
    'POKE & BOWL',
    'WOK & AUTRES PLATS',
    'ENCAS',
    'DESSERTS',
  ];
  @override
  Widget build(BuildContext context) {
    final itemProvider = Provider.of<Items>(context);
    final products =
        widget.showFav ? itemProvider.favorite : itemProvider.items;

    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            SizedBox(
              width: MediaQuery.of(context).size.width * 0.6,
              child: Text(
                'Happy Yummy',
                softWrap: true,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 32,
                  fontWeight: FontWeight.w700,
                  fontFamily: 'GloriaHallelujah',
                ),
              ),
            ),
            Image.network(
              'https://i0.wp.com/happy-yummy.fr/wp-content/uploads/2020/03/LOGO2020_HAPPY_YUMMY_RVB.png?fit=100%2C100&ssl=1',
            ),
          ],
        ),
        Container(
          margin: EdgeInsets.symmetric(vertical: 10),
          height: 30,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: categories.length,
            itemBuilder: (context, index) => GestureDetector(
              onTap: () {
                setState(() {
                  selectedIndex = index;
                });
              },
              child: Container(
                alignment: Alignment.center,
                margin: EdgeInsets.only(
                  left: 20,
                  // At end item it add extra 20 right  padding
                  right: index == categories.length - 1 ? 20 : 0,
                ),
                padding: EdgeInsets.symmetric(horizontal: 20),
                decoration: BoxDecoration(
                  color: index == selectedIndex
                      ? Colors.white.withOpacity(0.4)
                      : Colors.transparent,
                  borderRadius: BorderRadius.circular(6),
                ),
                child: Text(
                  categories[index],
                  style: TextStyle(
                    color: Colors.white,
                    fontFamily: 'KiteOne',
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
            ),
          ),
        ),
        Expanded(
          child: Stack(
            children: [
              Container(
                margin: EdgeInsets.only(top: 70),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(40),
                    topRight: Radius.circular(40),
                  ),
                ),
              ),
              Expanded(
                child: ListView.builder(
                    itemCount: products.length,
                    itemBuilder: (context, i) {
                      if (categories[selectedIndex] == products[i].category) {
                        return (ChangeNotifierProvider.value(
                          value: products[i],
                          child: ProductCart(),
                        ));
                      } else
                        return Container();
                    }),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
