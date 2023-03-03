import 'dart:async';

import 'package:digiyug/routes/router.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../util/theme/theme_manager.dart';
import '../sign_in_ui/sign_in_ui.dart';

class SplashScreen extends StatefulWidget {
  SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    // requestCameraPermission();

    Timer(Duration(seconds: 3), () => launchLoginWidget());
  }

  // launch login screen
  Future<void> launchLoginWidget() async {
    Get.toNamed(MRouter.sign_in_screen);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: buildSplashForMobile(),
    );
  }

  Widget buildSplashForMobile() {
    return Stack(
      children: [
        buildSplashBG(),
        buildSplashLogo(),
      ],
    );
  }

  Widget buildSplashLogo() {
    return Center(
      child: Image.asset(
        "asset/images/app_logo.png",
        width: 148,
        height: 148,
      ),
    );
  }

  Widget buildSplashBG() {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height,
      color: AppColors.white,
    );
  }

  // Future<void> requestCameraPermission() async {
  //   final serviceStatus = await Permission.camera.isGranted;
  //
  //   bool isCameraOn = serviceStatus == ServiceStatus.enabled;
  //
  //   final status = await Permission.camera.request();
  //
  //   if (status == PermissionStatus.granted) {
  //     print('Permission Granted');
  //   } else if (status == PermissionStatus.denied) {
  //     print('Permission denied');
  //   } else if (status == PermissionStatus.permanentlyDenied) {
  //     print('Permission Permanently Denied');
  //     await openAppSettings();
  //   }
  // }
}
