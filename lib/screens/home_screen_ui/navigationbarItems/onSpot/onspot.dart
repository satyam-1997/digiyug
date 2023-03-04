import 'package:flutter/material.dart';

class OnSpot extends StatefulWidget {
  const OnSpot({super.key});

  @override
  State<OnSpot> createState() => _OnSpotState();
}

class _OnSpotState extends State<OnSpot> {
  @override
  Widget build(BuildContext context) {
    return Center(child: Container(height: 50.0, width: 50.0,child: Text('Onspot'),));
  }
}