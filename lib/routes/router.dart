import 'package:flutter/widgets.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';

import '../screens/category/category_screen.dart';
import '../screens/sign_in_ui/sign_in_ui.dart';
import '../screens/sign_in_ui/verify_otp.dart';
import '../screens/splash_screen/splash_ui.dart';

class MRouter {
  static const String splashRoute = 'SplashWidget';
  static const String sign_in_screen = 'sign_in_screen';
  static const String otp_screen = 'otp_screen';
  static const String select_category = 'select_category';

  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case splashRoute:
        return CupertinoPageRoute(builder: (_) => SplashScreen());
      case sign_in_screen:
        return CupertinoPageRoute(builder: (_) => SignIn());
      case otp_screen:
        return CupertinoPageRoute(builder: (_) => Verify());
      case select_category:
        return CupertinoPageRoute(builder: (_) => CategoryScreen());

      default:
        return CupertinoPageRoute(builder: (_) => NoRouteScreen(settings.name));
    }
  }

  static Future<dynamic> pushNamedAndRemoveUntil(
      BuildContext context, String named) {
    return Navigator.of(context)
        .pushNamedAndRemoveUntil(named, (Route<dynamic> route) => false);
  }

  static Future<dynamic> pushReplacementNamed(
      BuildContext context, String route) {
    return Navigator.of(context).pushReplacementNamed(route);
  }

  static pop(BuildContext context) {
    return Navigator.pop(context);
  }
}

class NoRouteScreen extends StatelessWidget {
  final String? screenName;

  NoRouteScreen(this.screenName);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(child: Text('${'no_route_defined'} "$screenName"')),
    );
  }
}
