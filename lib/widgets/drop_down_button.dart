import 'package:flutter/material.dart';

class DropDownButton extends StatefulWidget {
  String defaultValue;

  DropDownButton({Key key, @required this.defaultValue}) : super(key: key);

  @override
  _MyStatefulWidgetState createState() => _MyStatefulWidgetState(defaultValue: this.defaultValue);
}

class _MyStatefulWidgetState extends State<DropDownButton> {
  String defaultValue;


  _MyStatefulWidgetState({Key key, @required this.defaultValue});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
    Row(
    children: <Widget>[
    Padding(
    padding: const EdgeInsets.only(
        left:12.0,
        right: 12.0),
    child: Icon(Icons.language,
    color: Colors.black54),
    ),
    DropdownButton<String>(

    value: defaultValue,
    elevation: 10,
    style: TextStyle(color: Colors.black54,
    fontSize: 16.0),
    underline: Container(
    height: 0,
    color: Colors.black26,
    ),
    onChanged: (String newValue) {
    setState(() {
    defaultValue = newValue;
    });
    },
    items: <String>['English', 'Español', 'Italiano', 'Deutsch']
        .map<DropdownMenuItem<String>>((String value) {
    return DropdownMenuItem<String>(
    value: value,
    child: Text(value),
    );
    }).toList(),
    )
    ],
    ),
        Padding(
          padding: EdgeInsets.only(),
          child: Divider(
            color: Colors.black87,
          ),
        )
      ],
    );

  }
}
