
import 'package:flutter/material.dart';
import 'package:guru_app/User/ui/widgets/rounded_button.dart';
import 'package:guru_app/widgets/gradient_back.dart';

class Login extends StatelessWidget{
  final GlobalKey<FormState> _formKey = new GlobalKey<FormState>();

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
          logInForm(context)
        ],
      ),
    );
  }
  
  Widget logInForm(BuildContext context){
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        Container(
          margin: EdgeInsets.only(
            top: 150.0
          ),
          child: Text("Login in to your account",
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
            key: this._formKey,
            child: ListView(
              scrollDirection: Axis.vertical,
              shrinkWrap: true,
              children: <Widget>[
                 TextFormField(
                   decoration: InputDecoration(
                     prefixIcon: Icon(Icons.person)
                   ),
                 cursorColor: Colors.white,
                  ),
                TextFormField(
                  decoration: InputDecoration(
                    prefixIcon: Icon(Icons.vpn_key)
                  ),
                  cursorColor: Colors.white,
                ),
                Container(
                  margin: EdgeInsets.only(
                    top: 35.0
                  ),
                  child: RoundedButton(buttonText: "Log In"),
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


}