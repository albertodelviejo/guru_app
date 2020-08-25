
import 'package:flutter/material.dart';
import 'package:guru_app/User/model/user.dart';
import 'package:guru_app/User/repository/json_api_rest.dart';
import 'package:guru_app/User/ui/widgets/rounded_button.dart';
import 'package:guru_app/widgets/gradient_back.dart';

import '../../../home.dart';

class Login extends StatefulWidget{
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login>{
  final GlobalKey<FormState> _formKey = new GlobalKey<FormState>();
  LoginWithRestfulApi loginWithRestfulApi = LoginWithRestfulApi();
  User user;
  bool _isLoading = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      /*
      appBar: AppBar(
        title: Text("Log In"),
        backgroundColor: Color(0xFFFF5A5F),
      ),
      */
      body: Center(
        child: _isLoading
            ? CircularProgressIndicator()
            : Stack(
          children: <Widget>[
            GradientBack(),
            logInForm(context)
          ],
        ),
      ),
    );
  }

  Widget logInForm(BuildContext context){

    TextEditingController ecMail = new TextEditingController();
    TextEditingController ecPassword = new TextEditingController();

    return ListView(
      scrollDirection: Axis.vertical,
      shrinkWrap: true,
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
                    controller: ecMail,
                    decoration: InputDecoration(
                        hintText: "Email",
                        prefixIcon: Icon(Icons.person)
                    ),
                    style: TextStyle(
                      decorationColor: Colors.white,
                      color: Colors.white,
                    ),
                    cursorColor: Colors.white,
                  ),

                  TextFormField(
                    controller: ecPassword,
                    decoration: InputDecoration(
                        hintText: "Password",
                        prefixIcon: Icon(Icons.vpn_key)
                    ),
                    style: TextStyle(
                      decorationColor: Colors.white,
                      color: Colors.white,
                    ),
                    obscureText: true,
                    cursorColor: Colors.white,
                  ),

                  Container(
                    margin: EdgeInsets.only(
                        top: 35.0
                    ),
                    child: RoundedButton(buttonText: "Log In",
                    onPressed: () async {
                      setState(() => _isLoading = true);
                      var res = await loginWithRestfulApi.loginUser(
                      ecMail.text, ecPassword.text);
                      setState(() => _isLoading = false);
                    User user = User.fromJson(res);
                    print(user.userEmail);
                    if (user != null) {
                      user.userEmail = ecMail.text;
                      user.password = ecPassword.text;
                      user.isLoggedIn = true;
                      Navigator.push(context, MaterialPageRoute(builder: (context) => Home(action: "Home", user: user)));
                      } else {
                      Scaffold.of(context).showSnackBar(
                      SnackBar(content: Text("Wrong email or")));
                      }
                      }
                      ),
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