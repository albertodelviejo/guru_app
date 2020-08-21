import 'package:flutter/material.dart';

class RoundedButton extends StatelessWidget {
  final String buttonText;
  final VoidCallback onPressed;

  RoundedButton({Key key, @required this.buttonText, @required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPressed,
      child: Container(
        margin: EdgeInsets.only(top: 15.0, left: 20.0, right: 20.0),
        height: 45.0,
        width: 400.0,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20.0),
            gradient: LinearGradient(
                colors: [Color(0xFFFFFFFF), Color(0xFFFFFFFF)],
                begin: FractionalOffset(0.2, 0.0),
                end: FractionalOffset(1.0, 0.6),
                stops: [0.0, 0.6],
                tileMode: TileMode.clamp)),
        child: Center(
          child: Text(
            buttonText,
            style: TextStyle(
                fontSize: 18.0, fontFamily: "Lato", color: Color(0xFFFF5A5F)),
          ),
        ),
      ),
    );
  }
}
