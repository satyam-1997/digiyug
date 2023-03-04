import 'package:flutter/material.dart';

class Subscriptions extends StatefulWidget {
  const Subscriptions({super.key});

  @override
  State<Subscriptions> createState() => _SubscriptionsState();
}

class _SubscriptionsState extends State<Subscriptions> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(),
        body: Center(
            child: Container(
      height: 50.0,
      width: 50.0,
      child: Text('Subscriptions'),
    )));
  }
}
