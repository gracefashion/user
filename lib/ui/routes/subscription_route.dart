import 'package:flutter/material.dart';

class SubscriptionRoute extends StatefulWidget {
  static const routeName = '/subscription_route';
  @override
  _SubscriptionRouteState createState() => _SubscriptionRouteState();
}

class _SubscriptionRouteState extends State<SubscriptionRoute> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.black),
        backgroundColor: Colors.white,
        title: Text("Subscription", style: TextStyle(fontWeight: FontWeight.w700,
            fontSize: 16.0,
            color: Colors.black
        )),),
      body: Center(
        child: Text("To see this course, please subscribe."),
      ),
      // floatingActionButton: AppFab(),
    );
  }
}

