import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:happy__hummy/screens/menu.dart';

import 'package:provider/provider.dart';
import '../providers/orders.dart' show Orders;
import '../widgets/orderItem.dart';

class OrderScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final orderProv = Provider.of<Orders>(context);
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () => Get.offAll(Menu()),
        child: Icon(
          Icons.home,
        ),
        backgroundColor: Colors.teal,
      ),
      appBar: AppBar(
        title: Text(
          'Vos Ordres ..',
          style: TextStyle(
            color: Colors.white,
            fontSize: 20,
            fontFamily: 'KiteOne',
          ),
        ),
        elevation: 0,
        centerTitle: false,
        backgroundColor: Colors.teal,
        leading: IconButton(
            iconSize: 30,
            color: Colors.white,
            icon: Icon(Icons.keyboard_return),
            onPressed: () {
              Navigator.pop(context);
            }),
      ),
      backgroundColor: Colors.teal,
      body: Column(
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
          Expanded(
            child: Stack(
              alignment: Alignment.bottomCenter,
              children: [
                Container(
                  margin: EdgeInsets.only(top: 10),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(40),
                      topRight: Radius.circular(40),
                    ),
                  ),
                ),
                Column(
                  children: [
                    SizedBox(
                      height: 25,
                    ),
                    Expanded(
                      child: ListView.builder(
                        itemCount: orderProv.ordersList.length,
                        itemBuilder: (ctx, i) => OrderItem(
                          orderProv.ordersList[i],
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
