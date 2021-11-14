import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MyDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
        child: Container(
      // color: Colors.teal,
      child: ListView(
        children: <Widget>[
          const DrawerHeader(
            margin: EdgeInsets.zero,
            padding: EdgeInsets.zero,
            child: UserAccountsDrawerHeader(
              accountName: Text('Daniyal Ahmed'),
              accountEmail: Text('Daniahmedkhatri@gmail.com'),
              currentAccountPicture: CircleAvatar(
                backgroundImage: AssetImage('assets/images/daniyal.jpg'),
              ),
            ),
          ),
          ListTile(
            title: Text('Home'),
            leading: Icon(CupertinoIcons.home),
            onTap: () {
              Navigator.of(context).pushReplacementNamed('/');
            },
          ),
          ListTile(
            title: Text('My Account'),
            leading: Icon(CupertinoIcons.person),
            onTap: () {
              Navigator.of(context).pushReplacementNamed('/');
            },
          ),
          ListTile(
            title: Text('My Orders'),
            leading: Icon(CupertinoIcons.shopping_cart),
            onTap: () {
              Navigator.of(context).pushReplacementNamed('/');
            },
          ),
          ListTile(
            title: Text('Categories'),
            leading: Icon(CupertinoIcons.list_dash),
            onTap: () {
              Navigator.of(context).pushReplacementNamed('/');
            },
          ),
          ListTile(
            title: Text('Favourites'),
            leading: Icon(CupertinoIcons.heart),
            onTap: () {
              Navigator.of(context).pushReplacementNamed('/');
            },
          ),
          ListTile(
            title: Text('Settings'),
            leading: Icon(CupertinoIcons.gear),
            onTap: () {
              Navigator.of(context).pushReplacementNamed('/');
            },
          ),
          ListTile(
            title: Text('About'),
            leading: Icon(CupertinoIcons.info),
            onTap: () {
              Navigator.of(context).pushReplacementNamed('/');
            },
          ),
          ListTile(
            title: Text('Logout'),
            leading: Icon(Icons.exit_to_app),
            onTap: () {
              Navigator.of(context).pushReplacementNamed('/login');
            },
          ),
        ],
      ),
    ));
  }
}
