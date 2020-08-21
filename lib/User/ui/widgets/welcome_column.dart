import 'package:flutter/material.dart';
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
            top: 200.0,
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
      top: 25,
        bottom: 0.0
    ),
    child: Column(
      children: <Widget>[
        RoundedButton(
          buttonText: "Log In",
          onPressed: (){
           Navigator.push(context, MaterialPageRoute(builder: (context) => Home(action: "LogIn")));
          },
        ),
        RoundedButton(
          buttonText: "Register",
          onPressed: (){
            Navigator.push(context, MaterialPageRoute(builder: (context) => Home(action: "Register")));
          },
        ),
        Container(
          margin: EdgeInsets.only(top: 0.0),

          child:FlatButton(
            onPressed: (){
              Navigator.push(context, MaterialPageRoute(builder: (context) => Home(action: "Home")));
            },
            child:
          Text("Navigate as guest >",
              style: TextStyle(color: Colors.white))
        ),
        )
      ],
    ),
  );
}
/*

// Define un widget de formulario personalizado
class MyCustomForm extends StatefulWidget {
  @override
  MyCustomFormState createState() {
    return MyCustomFormState();
  }
}

// Define una clase de estado correspondiente. Esta clase contendrá los datos
// relacionados con el formulario.
class MyCustomFormState extends State<MyCustomForm> {
  final User user = User();
  // Crea una clave global que identificará de manera única el widget Form
  // y nos permita validar el formulario
  //
  // Nota: Esto es un `GlobalKey<FormState>`, no un GlobalKey<MyCustomFormState>!
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    // Cree un widget Form usando el _formKey que creamos anteriormente
    return Form(
        key: _formKey,
        child: Column(
          children: <Widget>[
            Text("Email"),
            TextFormField(
                // El validator recibe el texto que el usuario ha digitado
                validator: (value) {
              if (value.isEmpty) {
                return 'The field is required';
              } else {
                user.email = value;
              }
            }),
            Text("Password"),
            TextFormField(
              // El validator recibe el texto que el usuario ha digitado
              validator: (value) {
                if (value.isEmpty) {
                  return 'The field is required';
                } else {
                  user.password = value;
                }
              },
            )
          ],
        ));
  }
}
*/

