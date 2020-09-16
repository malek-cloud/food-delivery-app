import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/CartProv.dart';

class ItemCartAppearance extends StatelessWidget {
  final String id;
  final String productId;
  final String title;
  final double price;
  final int quantity;
  ItemCartAppearance(
    this.id,
    this.productId,
    this.title,
    this.price,
    this.quantity,
  );
  @override
  Widget build(BuildContext context) {
    return Dismissible(
      confirmDismiss: (direction) {
        return showDialog(
            context: context,
            builder: (ctx) => AlertDialog(
                  title: Text('Etes vous sur ?'),
                  content: Text(
                    'Voulez-vous vraiment supprimer cet élement de votre panier ?',
                    softWrap: true,
                  ),
                  actions: [
                    FlatButton(
                      onPressed: () {
                        Navigator.of(ctx).pop(false);
                      },
                      child: Text('Non'),
                    ),
                    FlatButton(
                      onPressed: () {
                        Navigator.of(ctx).pop(true);
                      },
                      child: Text('Oui'),
                    ),
                  ],
                ));
      },
      key: ValueKey(id),
      background: Container(
        color: Colors.white,
        child: Icon(
          Icons.delete,
          size: 50,
          color: Colors.pink[900],
        ),
        alignment: Alignment.centerRight,
        padding: EdgeInsets.only(
          right: 20,
        ),
      ),
      direction: DismissDirection.endToStart,
      onDismissed: (direction) {
        Provider.of<Cart>(
          context,
          listen: false,
        ).removeItem(productId);
      },
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: 15, vertical: 7),
        padding: EdgeInsets.symmetric(horizontal: 15, vertical: 8),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: Colors.grey[100],
        ),
        child: ListTile(
          leading: CircleAvatar(
            backgroundColor: Colors.teal,
            child: Padding(
              padding: const EdgeInsets.all(3.0),
              child: FittedBox(
                  child: Text('\$$price',
                      style: TextStyle(
                        color: Colors.white,
                        fontFamily: 'KiteOne',
                      ))),
            ),
          ),
          title: Text(title,
              style: TextStyle(
                fontFamily: 'KiteOne',
                fontSize: 20,
              )),
          subtitle: Text(
            'Totale : \$${(price * quantity)},  ',
            style: TextStyle(
              fontFamily: 'KiteOne',
              fontSize: 15,
              fontWeight: FontWeight.w600,
            ),
          ),
          trailing: Text('$quantity x',
              style: TextStyle(
                fontFamily: 'KiteOne',
                fontSize: 17,
              )),
        ),
      ),
    );
  }
}
