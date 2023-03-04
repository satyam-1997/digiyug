import 'package:flutter/material.dart';

class Template extends StatefulWidget {
  const Template({super.key});

  @override
  State<Template> createState() => _TemplateState();
}

class _TemplateState extends State<Template> {
  @override
  Widget build(BuildContext context) {
    return Center(
        child: Container(
      height: 50.0,
      width: 50.0,
      child: Text('Templates'),
    ));
  }
}
