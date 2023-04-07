library onspot_screen;

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:url_launcher/url_launcher.dart' as UrlLauncher;

import '../../../../util/theme/theme_manager.dart';
import '../../Common/constants.dart';

part 'widgets/onspot_list_component.dart';

class OnSpot extends StatefulWidget {
  const OnSpot({super.key});

  @override
  State<OnSpot> createState() => _OnSpotState();
}

class _OnSpotState extends State<OnSpot> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Center(
          child: Container(
        width: Get.width,
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: OnSpotListComponent(
            title: "On Spot",
            list: [],
          ),
        ),
      )),
    );
  }
}
