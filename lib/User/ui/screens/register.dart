import 'package:flutter/material.dart';
import 'package:guru_app/User/ui/widgets/rounded_button.dart';
import 'package:guru_app/widgets/gradient_back.dart';

class Register extends StatelessWidget{

  final GlobalKey<FormState> _formRegisterKey = new GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      /*
      appBar: AppBar(
        title: Text("Log In"),
        backgroundColor: Color(0xFFFF5A5F),
      ),
      */
      body: Stack(
        children: <Widget>[
          GradientBack(),
          registerForm(context)
        ],
      )
    );
  }

}

Widget registerForm(BuildContext context) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.center,
    children: <Widget>[
      Container(
        margin: EdgeInsets.only(
            top: 90.0
        ),
        child: Text("Create your account",
          style: TextStyle(
              color: Colors.white,
              fontSize: 35.0
          ),
          textAlign: TextAlign.center,
        ),
      ),
      Container(
        margin: EdgeInsets.only(
            top: 20.0,
            left: 40.0,
            right: 40.0
        ),
        child: Form(
            //key: this._formRegisterKey,
            child: ListView(
              scrollDirection: Axis.vertical,
              shrinkWrap: true,
              children: <Widget>[
                TextFormField(
                  decoration: InputDecoration(
                      prefixIcon: Icon(Icons.mail)
                  ),
                  cursorColor: Colors.white,
                  initialValue: "Email",
                ),
                TextFormField(
                  decoration: InputDecoration(
                      prefixIcon: Icon(Icons.person)
                  ),
                  cursorColor: Colors.white,
                  initialValue: "Name",
                ),
                TextFormField(
                  decoration: InputDecoration(
                      prefixIcon: Icon(Icons.person_outline)
                  ),
                  cursorColor: Colors.white,
                  initialValue: "Surname",
                ),
                TextFormField(
                  decoration: InputDecoration(
                      prefixIcon: Icon(Icons.location_city)
                  ),
                  cursorColor: Colors.white,
                  initialValue: "City of residence"
                ),
                TextFormField(
                  decoration: InputDecoration(
                      prefixIcon: Icon(Icons.language)
                  ),
                  cursorColor: Colors.white,
                  initialValue: "Preferred Language",
                ),
                TextFormField(
                  decoration: InputDecoration(
                      prefixIcon: Icon(Icons.vpn_key)
                  ),
                  cursorColor: Colors.white,
                  initialValue: "Create a password",
                ),
                Container(
                  margin: EdgeInsets.only(
                      top: 35.0
                  ),
                  child: RoundedButton(buttonText: "Register"),
                ),
                Container(
                    child: FlatButton(
                      child: Text("< Go back",
                        style: TextStyle(
                            color: Colors.white
                        ),
                      ),
                      onPressed: () => {Navigator.pop(context)},
                    )
                )
              ],
            )
        ),
      )
    ],
  );
}