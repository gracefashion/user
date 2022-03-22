import 'package:flutter/material.dart';
import 'package:kzn/ui/components/single/user_info.dart';
import 'package:kzn/ui/routes/about_route.dart';
import 'package:kzn/ui/routes/login_route.dart';
import 'package:kzn/ui/routes/privacy-policy.dart';
import 'package:kzn/ui/routes/tnc_route.dart';

class AppDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      // Add a ListView to the drawer. This ensures the user can scroll
      // through the options in the drawer if there isn't enough vertical
      // space to fit everything.
      child: ListView(
        // Important: Remove any padding from the ListView.
        padding: EdgeInsets.zero,
        children: <Widget>[
          DrawerHeader(
            decoration: BoxDecoration(
              color: Colors.white38,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // Text(appName,style: TextStyle(color: Colors.white,fontSize: 36),),
                UserInfo()
              ],
            ),
          ),
          Container(
            margin: EdgeInsets.all(8),
            child: ListTile(
              leading: Icon(Icons.privacy_tip, color: Colors.black,),
              title: Text('Privacy Policy', style: TextStyle(color: Colors.black)),
              onTap: () {
                // Update the state of the app
                // ...
                // Then close the drawer
                Navigator.pop(context);
                Navigator.pushNamed(context, PrivacyPolicyRoute.routeName);

              },
            ),
          ),
          Container(
            margin: EdgeInsets.all(8),
            child: ListTile(
              leading: Icon(Icons.book, color: Colors.black),
              title: Text('Terms of Conditions', style: TextStyle(color: Colors.black)),
              onTap: () {
                // Update the state of the app
                // ...
                // Then close the drawer
                Navigator.pop(context);
                Navigator.pushNamed(context, TnCRoute.routeName);
              },
            ),
          ),
          Container(
            margin: EdgeInsets.only(top: 8, left: 8, right: 8, bottom: 12),
            child: ListTile(
              leading: Icon(Icons.group, color: Colors.black),
              title: Text('About', style: TextStyle(color: Colors.black),),
              onTap: () {
                // Update the state of the app
                // ...
                // Then close the drawer
                Navigator.pop(context);
                Navigator.pushNamed(context, AboutRoute.routeName);
              },
            ),
          ),

          Divider(),

          Container(
            margin: EdgeInsets.only(top: 12, left: 8, right: 8),
            child: ListTile(
              leading: Icon(Icons.logout, color: Colors.black),
              title: Text('Logout', style: TextStyle(color: Colors.black)),
              onTap: () {
                // Update the state of the app
                // ...
                // Then close the drawer
                Navigator.pop(context);
                Navigator.pushReplacementNamed(context, LoginRoute.routeName);
              },
            ),
          ),
        ],
      ),
    );
  }
}
