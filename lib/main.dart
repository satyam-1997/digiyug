import 'dart:io';

import 'package:digiyug/routes/router.dart';
import 'package:digiyug/util/theme/theme_manager.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_windowmanager/flutter_windowmanager.dart';

void main() {
  runApp(const MyApp());
  // WidgetsBinding.instance.addPostFrameCallback((timeStamp) async {
  //   if (Platform.isAndroid) {
  //     await FlutterWindowManager.addFlags(FlutterWindowManager.FLAG_SECURE);
  //   }
  // });
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Digiyug App',
      theme: ThemeManager.appTheme,
      locale: const Locale('en', 'US'),
      onGenerateRoute: MRouter.generateRoute,
    
      initialRoute: MRouter.splashRoute,
      debugShowCheckedModeBanner: false,
    );
  }
}
