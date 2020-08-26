import 'package:flutter/material.dart';
import 'package:guru_app/User/ui/screens/login.dart';
import 'package:guru_app/User/ui/screens/register.dart';
import 'package:guru_app/User/ui/widgets/rounded_button.dart';
import 'package:guru_app/home.dart';

class WelcomeColumn extends StatelessWidget {

  final pathImage = "logo_guruwalk_blanco.png";

  @override
  Widget build(BuildContext context) {
    return Center(
        child: Column(
      children: <Widget>[
        Container(
          margin: EdgeInsets.only(
            left: 35.0,
            top: 250.0,
            right: 35.0,
            bottom: 150.0
          ),
          child: Image.asset(pathImage)
        ),
        buttons(context)
      ],
    ));
  }

}

Widget buttons(BuildContext context){
  return Container(
    margin: EdgeInsets.only(
      top: 50.0,
        bottom: 0.0
    ),
    child: Column(
      children: <Widget>[
        RoundedButton(
          buttonText: "Start",
          onPressed: (){
           Navigator.push(context, MaterialPageRoute(builder: (context) => Login()));
          },
        ),
      ],
    ),
  );
}
