import 'package:flutter/material.dart';
import 'package:luci_driver/pages/my_profile.dart';
import 'package:luci_driver/pages/my_orders.dart';

class MyDrawer extends StatelessWidget{

  const MyDrawer({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  Drawer(
        // Add a ListView to the drawer. This ensures the user can scroll
        // through the options in the drawer if there isn't enough vertical
        // space to fit everything.
        child: ListView(
          // Important: Remove any padding from the ListView.
          padding: EdgeInsets.zero,
          children: <Widget>[

            DrawerHeader(
              child: Text('Drawer Header'),
              decoration: BoxDecoration(
                color: Colors.blue,
              ),
            ),
            ListTile(
              trailing: Icon(Icons.keyboard_arrow_right),
              title: Text('My Profile'),            
              onTap: () => {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                    builder: (context) =>
                     MyProfile(textData: 'Driver@luci.ai',))
                ),
              },
            ),
            ListTile(
              trailing: new Icon(Icons.keyboard_arrow_right),
              title: Text('Orders'),
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                    builder: (context) =>
                     MyOrders(textData: 'Driver@luci.ai',))
                     );
                     },
              ),
          ]
        ),
      );

  }
}