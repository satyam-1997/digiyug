import 'package:digiyug/routes/router.dart';
import 'package:digiyug/util/theme/theme_manager.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

void main() {
  runApp(const MyApp());
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
