import 'package:flutter/material.dart';

class DrawerMenu extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return new Drawer(
      child: ListView(
        children: <Widget>[
          new UserAccountsDrawerHeader(
            accountName: Text("Nombre"),
            accountEmail: Text("email@email"),
            decoration: BoxDecoration(
                image: DecorationImage(
                    image: NetworkImage("https://ichef.bbci.co.uk/news/660/cpsprodpb/6AFE/production/_102809372_machu.jpg"),
                    fit: BoxFit.cover
                )
            ),
          ),
          Ink(
            color: Color(0xFFFF5A5F),
            child: new ListTile(
              leading: Icon(Icons.home),
              title: Text("Home", style: TextStyle(color: Colors.white),),
            ),
          ),
          new ListTile(
            leading: Icon(Icons.calendar_today),
            title: Text("Bookings"),
            onTap: (){},
          ),
          new ListTile(
            leading: Icon(Icons.list),
            title: Text("My Tours"),
          ),
          new ListTile(
            leading: Icon(Icons.message),
            title: Text("Messages"),
          ),
          new ListTile(
            leading: Icon(Icons.edit),
            title: Text("Edit Profile"),
          ),
          new ListTile(
            leading: Icon(Icons.exit_to_app),
            title: Text("Logout"),
          ),
          new ListTile(
            leading: Icon(Icons.person_add),
            title: Text("Register"),
          ),
          new ListTile(
            leading: Icon(Icons.person),
            title: Text("Login"),
          )

        ],
      ) ,
    );
  }
}
