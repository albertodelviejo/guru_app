import 'package:flutter/material.dart';
import 'package:guru_app/User/model/user.dart';
import 'package:guru_app/User/ui/widgets/rounded_button.dart';
import 'package:guru_app/widgets/drop_down_button.dart';
import 'package:guru_app/widgets/gradient_back.dart';

import '../../../home.dart';

class Register extends StatelessWidget{

  final GlobalKey<FormState> _formRegisterKey = new GlobalKey<FormState>();
  User user;

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
          registerForm(context, user)
        ],
      )
    );
  }

}

Widget registerForm(BuildContext context, User user) {
  TextEditingController ecMail = new TextEditingController();
  TextEditingController ecName = new TextEditingController();
  TextEditingController ecSurname = new TextEditingController();
  TextEditingController ecCityOR = new TextEditingController();
  TextEditingController ecPassword = new TextEditingController();
  return ListView(
    scrollDirection: Axis.vertical,
    shrinkWrap: true,
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
                      prefixIcon: Icon(Icons.mail),
                      hintText: "Email"
                  ),
                  style: TextStyle(
                    decorationColor: Colors.white,
                    color: Colors.white,
                  ),
                  controller: ecMail,
                  cursorColor: Colors.white,
                ),
                TextFormField(
                  decoration: InputDecoration(
                      prefixIcon: Icon(Icons.person),
                      hintText: "Name"
                  ),
                  style: TextStyle(
                    decorationColor: Colors.white,
                    color: Colors.white,
                  ),
                  controller: ecName,
                  cursorColor: Colors.white,
                ),
                TextFormField(
                  decoration: InputDecoration(
                      prefixIcon: Icon(Icons.person_outline),
                      hintText: "Surname",
                  ),
                  style: TextStyle(
                    decorationColor: Colors.white,
                    color: Colors.white,
                  ),
                  controller: ecSurname,
                  cursorColor: Colors.white,
                ),
                TextFormField(
                  decoration: InputDecoration(
                      prefixIcon: Icon(Icons.location_city),
                      hintText: "City of residence"
                  ),
                  style: TextStyle(
                    decorationColor: Colors.white,
                    color: Colors.white,
                  ),
                  controller: ecCityOR,
                  cursorColor: Colors.white,
                ),

                DropDownButton(defaultValue: "English"),
                TextFormField(
                  decoration: InputDecoration(
                      prefixIcon: Icon(Icons.vpn_key),
                      hintText: "Create a password"
                  ),
                  style: TextStyle(
                    decorationColor: Colors.white,
                    color: Colors.white,
                  ),
                  controller: ecPassword,
                  cursorColor: Colors.white,
                  obscureText: true
                ),
                Container(
                  margin: EdgeInsets.only(
                      top: 35.0
                  ),
                  child: RoundedButton(buttonText: "Register", onPressed: () => {
                    user = User(userEmail: ecMail.text, password: ecPassword.text, userSurname: ecSurname.text, preferredLanguage: "", userName: ecName.text, cityOfResidence: ecCityOR.text ),
                    Navigator.push(context, MaterialPageRoute(builder: (context) => Home(action: "Home")))
                  },),
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

