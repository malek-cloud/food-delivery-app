import 'package:flutter/material.dart';

class DialogNotes extends StatefulWidget {
  @override
  _DialogNotesState createState() => _DialogNotesState();
}

class _DialogNotesState extends State<DialogNotes> {
  bool value1 = false;
  bool value2 = false;
  bool value3 = false;
  bool value4 = false;
  bool value5 = false;
  bool value6 = false;
  bool value7 = false;
  bool value8 = false;
  bool value9 = false;

  void onChangedValue1(bool value) {
    setState(() {
      value1 = value;
    });
  }

  void onChangedValue2(bool value) {
    setState(() {
      value2 = value;
    });
  }

  void onChangedValue3(bool value) {
    setState(() {
      value3 = value;
    });
  }

  void onChangedValue4(bool value) {
    setState(() {
      value4 = value;
    });
  }

  void onChangedValue5(bool value) {
    setState(() {
      value5 = value;
    });
  }

  void onChangedValue6(bool value) {
    setState(() {
      value6 = value;
    });
  }

  void onChangedValue7(bool value) {
    setState(() {
      value7 = value;
    });
  }

  void onChangedValue8(bool value) {
    setState(() {
      value8 = value;
    });
  }

  void onChangedValue9(bool value) {
    setState(() {
      value9 = value;
    });
  }

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: EdgeInsets.symmetric(
        horizontal: 12,
        vertical: 5,
      ),
      children: [
        /*Text(
          'Sauces',
          style: TextStyle(
            fontFamily: 'KiteOne',
            color: Colors.pink[900],
            fontSize: 22,
          ),
        ),
        CheckboxListTile(
          contentPadding: EdgeInsets.symmetric(
            horizontal: 10,
          ),
          title: Text(
            'Sauce soja sucrée',
            style: TextStyle(
              fontFamily: 'KiteOne',
              fontSize: 18,
            ),
          ),
          activeColor: Colors.pink[900],
          value: value1,
          onChanged: onChangedValue1,
        ),
        CheckboxListTile(
          contentPadding: EdgeInsets.symmetric(
            horizontal: 10,
          ),
          title: Text(
            'Sauce soja salée',
            style: TextStyle(
              fontFamily: 'KiteOne',
              fontSize: 18,
            ),
          ),
          activeColor: Colors.pink[900],
          value: value2,
          onChanged: onChangedValue2,
        ),
        CheckboxListTile(
          contentPadding: EdgeInsets.symmetric(
            horizontal: 10,
          ),
          title: Text(
            'Gingembre',
            style: TextStyle(
              fontFamily: 'KiteOne',
              fontSize: 18,
            ),
          ),
          activeColor: Colors.pink[900],
          value: value3,
          onChanged: onChangedValue3,
        ),
        CheckboxListTile(
          contentPadding: EdgeInsets.symmetric(
            horizontal: 10,
          ),
          title: Text(
            'Wasabi',
            style: TextStyle(
              fontFamily: 'KiteOne',
              fontSize: 18,
            ),
          ),
          activeColor: Colors.pink[900],
          value: value4,
          onChanged: onChangedValue4,
        ),
        Divider(),
        Text(
          'Accessoires',
          style: TextStyle(
            fontFamily: 'KiteOne',
            color: Colors.pink[900],
            fontSize: 22,
          ),
        ),
        CheckboxListTile(
          contentPadding: EdgeInsets.symmetric(
            horizontal: 10,
          ),
          title: Text(
            'Baguettes',
            style: TextStyle(
              fontFamily: 'KiteOne',
              fontSize: 18,
            ),
          ),
          activeColor: Colors.pink[900],
          value: value5,
          onChanged: onChangedValue5,
        ),
        CheckboxListTile(
          contentPadding: EdgeInsets.symmetric(
            horizontal: 10,
          ),
          title: Text(
            'Serviettes',
            style: TextStyle(
              fontFamily: 'KiteOne',
              fontSize: 18,
            ),
          ),
          activeColor: Colors.pink[900],
          value: value6,
          onChanged: onChangedValue6,
        ),
        Divider(),
        Text(
          'Accompagnements',
          style: TextStyle(
            fontFamily: 'KiteOne',
            color: Colors.pink[900],
            fontSize: 22,
          ),
        ),
        CheckboxListTile(
          contentPadding: EdgeInsets.symmetric(
            horizontal: 10,
          ),
          title: Text(
            'Salade wakamé',
            style: TextStyle(
              fontFamily: 'KiteOne',
              fontSize: 18,
            ),
          ),
          activeColor: Colors.pink[900],
          value: value7,
          onChanged: onChangedValue7,
        ),
        CheckboxListTile(
          contentPadding: EdgeInsets.symmetric(
            horizontal: 10,
          ),
          title: Text(
            'Salade de choux',
            style: TextStyle(
              fontFamily: 'KiteOne',
              fontSize: 18,
            ),
          ),
          activeColor: Colors.pink[900],
          value: value8,
          onChanged: onChangedValue8,
        ),
        CheckboxListTile(
          contentPadding: EdgeInsets.symmetric(
            horizontal: 10,
          ),
          title: Text(
            'Riz vinaigré',
            style: TextStyle(
              fontFamily: 'KiteOne',
              fontSize: 18,
            ),
          ),
          activeColor: Colors.pink[900],
          value: value9,
          onChanged: onChangedValue9,
        ),
        Divider(),
        */
        Text(
          'Instructions spéciales',
          style: TextStyle(
            fontFamily: 'KiteOne',
            color: Colors.pink[900],
            fontSize: 22,
          ),
        ),
        SizedBox(
          height: 15,
        ),
        Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(100.0),
          ),
          height: 150,
          child: TextField(
            decoration: InputDecoration(
                contentPadding: EdgeInsets.only(left: 20),
                border: InputBorder.none,
                hintText: "Exemple: mayo..."),
          ),
        )
      ],
    );
  }
}
