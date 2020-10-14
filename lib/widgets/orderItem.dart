import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '../providers/orders.dart' as ord;

class OrderItem extends StatefulWidget {
  final ord.OrderItem order;
  OrderItem(this.order);

  @override
  _OrderItemState createState() => _OrderItemState();
}

class _OrderItemState extends State<OrderItem> {
  var _expanded = false;
  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.all(12),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ListTile(
            title: Text(
              //'${widget.order.amount.toStringAsFixed(2)}€',
              'L\'ordre du :',
              style: TextStyle(color: Colors.black, fontSize: 19),
            ),
            subtitle: Text(
              DateFormat('dd/mm/yyyy  hh:mm').format(widget.order.dateTime),
              style: TextStyle(color: Colors.teal, fontSize: 15),
            ),
            trailing: IconButton(
                color: Colors.pink[900],
                icon: Icon(
                  _expanded ? Icons.expand_less : Icons.expand_more,
                ),
                onPressed: () {
                  setState(() {
                    _expanded = !_expanded;
                  });
                }),
          ),
          if (_expanded)
            /* Container(
              padding: EdgeInsets.symmetric(horizontal: 15, vertical: 7),
              //height: min(widget.order.products.length * 20.0 + 20, 120),
              child:*/
            /* widget.order.products
                    .map(
                      (prod) => Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children:*/

            /* Container(
                  width: MediaQuery.of(context).size.width * 0.65,
                  child:*/
            Padding(
              padding: const EdgeInsets.only(left: 18.0),
              child: Text(
                'Payement par : ${widget.order.paymentWay}',
                softWrap: true,
                style: TextStyle(
                  color: Colors.grey[700],
                  fontFamily: 'KiteOne',
                  fontSize: 17,
                ),
              ),
            ),
          // ),
          if (_expanded)
            if (widget.order.adress != '')
              Padding(
                padding: const EdgeInsets.only(left: 18.0),
                child: Text('à l\'adresse : ${widget.order.adress}',
                    /*'${prod.quantity}x ${prod.price}€'*/
                    style: TextStyle(
                      color: Colors.grey[700],
                      fontFamily: 'KiteOne',
                      fontSize: 16,
                    )),
              ),
        ],
      ),
      /*  ),
                   .toList(),
              ),
            )*/
    );
  }
}
