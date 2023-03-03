import 'package:digiyug/util/theme/theme_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class BgScreen extends StatelessWidget {
  String? imageLocation;
  BgScreen(this.imageLocation, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height,
      color: AppColors.white,
      child: Image.asset(
        imageLocation!,
        fit: BoxFit.fill,
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
      ),
    );
  }
}

class LoginBgScreen extends StatelessWidget {
  String? imageLocation;
  LoginBgScreen(this.imageLocation, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
  return  Stack(
      children: <Widget>[
        SvgPicture.asset(
          imageLocation.toString(),
          alignment: Alignment.center,
          width:50,
          height: 100,
        ),
        Container(
          child: Column(
            children: <Widget>[Expanded(child: Text("Welcome User"))],
          ),
        ),
      ],
    );
  }
}
