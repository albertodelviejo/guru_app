import 'package:flutter/material.dart';
import 'package:guru_app/User/model/user.dart';
import 'package:guru_app/User/ui/screens/login.dart';
import 'package:guru_app/User/ui/screens/register.dart';
import 'package:guru_app/User/ui/screens/welcome.dart';
import 'package:guru_app/home.dart';

class DrawerMenu extends StatelessWidget {

  User user;

  DrawerMenu(this.user);

  @override
  Widget build(BuildContext context) {
    if (user != null && user.isLoggedIn) {
      return new Drawer(
          child: ListView(
            children: <Widget>[
              new UserAccountsDrawerHeader(
                accountName: Text(user.givenName + " " + user.userSurname,
                    style: TextStyle(color: Colors.white)),
                accountEmail: Text(user.userEmail,
                    style: TextStyle(color: Colors.white)),
                decoration: BoxDecoration(
                    image: DecorationImage(
                        image: NetworkImage(
                            "https://ichef.bbci.co.uk/news/660/cpsprodpb/6AFE/production/_102809372_machu.jpg"),
                        fit: BoxFit.cover
                    )
                ),
              ),
              Ink(
                color: Color(0xFFFF5A5F),
                child: new ListTile(
                  leading: Icon(Icons.home),
                  title: Text("Home", style: TextStyle(color: Colors.white),),
                  onTap: () {
                    Navigator.push(context, MaterialPageRoute(builder: (context) => Home(user: user)));
                  },
                ),
              ),
              new ListTile(
                leading: Icon(Icons.calendar_today),
                title: Text("Bookings"),
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) => Home(user: user, action: "Bookings",)));
                },
              ),
              new ListTile(
                leading: Icon(Icons.list),
                title: Text("My Tours"),
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) => Home(user: user, action: "MyTours",)));
                },
              ),
              new ListTile(
                leading: Icon(Icons.message),
                title: Text("Messages"),
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) => Home(user: user, action: "Messages",)));
                },
              ),
              new ListTile(
                leading: Icon(Icons.edit),
                title: Text("Edit Profile"),
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) => Home(user: user, action: "EditProfile",)));
                },
              ),
              new ListTile(
                leading: Icon(Icons.exit_to_app),
                title: Text("Logout"),
                onTap: () =>
                {
                  user.isLoggedIn = false,
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => Welcome()))
                },
              ),
            ],
          )
      );
    } else {
      return new Drawer(
          child: ListView(
            children: <Widget>[
              Ink(
                color: Color(0xFFFF5A5F),
                child: new ListTile(
                  leading: Icon(Icons.home),
                  title: Text("Home", style: TextStyle(color: Colors.white),),
                ),
              ),
              new ListTile(
                leading: Icon(Icons.person_add),
                title: Text("Register"),
                onTap: () => {
                Navigator.push(context, MaterialPageRoute(builder: (context) => Register()))
              },
              ),
              new ListTile(
                leading: Icon(Icons.person),
                title: Text("Login"),
                onTap: () => {
                Navigator.push(context, MaterialPageRoute(builder: (context) => Login()))
                },
              )

            ],
          )
      );
    }
  }
}