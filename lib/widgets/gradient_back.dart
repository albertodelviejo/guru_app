import 'package:flutter/material.dart';

class GradientBack extends StatelessWidget {
  double height = 0.0;

  GradientBack({Key key, this.height}); //height = null full screen

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidht = MediaQuery.of(context).size.width;

    if (height == null) {
      height = screenHeight;
    }

    return Container(
      width: screenWidht,
      height: height,
      decoration: BoxDecoration(
          gradient: LinearGradient(
              colors: [Color(0xFFFF5A5F), Color(0xFFFF7278)],
              begin: FractionalOffset(0.2, 0.0),
              end: FractionalOffset(1.0, 0.6),
              stops: [0.0, 0.6],
              tileMode: TileMode.clamp)),
    );
  }
}
