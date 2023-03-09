import 'dart:io';
import 'dart:ui';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:get/get.dart';
import 'package:image_gallery_saver/image_gallery_saver.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:share_plus/share_plus.dart';

import '../home_screen_ui/Common/constants.dart';

class TemplatePagePage extends StatefulWidget {
  TemplatePagePage({super.key});

  @override
  State<TemplatePagePage> createState() => _TemplatePagePageState();
}

class _TemplatePagePageState extends State<TemplatePagePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 70.0,
        automaticallyImplyLeading: false,
        title: Text(
          'DigiYug',
          style: TextStyle(
              fontFamily: 'IBMPlexSansHebrewBold',
              fontWeight: FontWeight.w600,
              color: primaryColor,
              fontSize: 25.0),
        ),
        actions: [
          Row(
            children: [
              Container(
                // margin: EdgeInsets.all(value),
                padding:
                    const EdgeInsets.only(top: 15.0, bottom: 15.0, right: 15.0),
                child: GestureDetector(
                  onTap: () {},
                  child: Container(
                    height: 30.0,
                    width: 83.0,
                    decoration: const BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(5.0)),
                      color: appBarButtonColor,
                    ),
                    alignment: Alignment.center,
                    child: const Text(
                      'Free Plan',
                      style: TextStyle(
                          fontFamily: 'IBMPlexSansHebrewRegular',
                          fontWeight: FontWeight.w600,
                          fontSize: 12.0,
                          color: secondaryColorText),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(right: 15.0),
                child: GestureDetector(
                  onTap: () {
                    showModalBottomSheet<void>(
                      context: context,
                      builder: (BuildContext context) {
                        return Container(
                          padding: EdgeInsets.all(20.0),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Text(
                                'Select Language',
                                style: TextStyle(
                                  fontFamily: 'IBMPlexSansHebrewBold',
                                  fontWeight: FontWeight.w500,
                                  fontSize: 20.0,
                                ),
                              ),
                              Text(
                                'Choose language according to your preference.',
                                style: TextStyle(
                                  color: secondaryColorText,
                                  fontFamily: 'IBMPlexSansHebrewRegular',
                                ),
                              ),
                              SizedBox(
                                height: 20.0,
                              ),
                              GestureDetector(
                                onTap: () {},
                                child: Container(
                                  height: 70.0,
                                  width: Get.width,
                                  decoration: const BoxDecoration(
                                    image: DecorationImage(
                                        image: AssetImage(
                                          'asset/images/RectangleEng.png',
                                        ),
                                        fit: BoxFit.fill),
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(5.0)),
                                  ),
                                  child: Padding(
                                    padding: const EdgeInsets.all(15.0),
                                    child: Row(
                                      children: [
                                        Container(
                                          height: 25.0,
                                          width: 25.0,
                                          padding: const EdgeInsets.all(2.0),
                                          decoration: BoxDecoration(
                                            border: Border.all(
                                                width: 1, color: Colors.white),
                                            borderRadius: BorderRadius.all(
                                                Radius.circular(100)),
                                          ),
                                        ),
                                        SizedBox(
                                          width: 10.0,
                                        ),
                                        Text(
                                          'English',
                                          style: TextStyle(
                                              color: Color(0xffFFFFFF),
                                              fontSize: 24.0,
                                              fontFamily:
                                                  'IBMPlexSansHebrewRegular',
                                              fontWeight: FontWeight.w500),
                                        )
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                              SizedBox(
                                height: 20.0,
                              ),
                              GestureDetector(
                                onTap: () {},
                                child: Container(
                                  height: 70.0,
                                  width: Get.width,
                                  decoration: const BoxDecoration(
                                    image: DecorationImage(
                                        image: AssetImage(
                                          'asset/images/Rectanglehind.png',
                                        ),
                                        fit: BoxFit.fill),
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(5.0)),
                                  ),
                                  child: InkWell(
                                    hoverColor: secondaryColorText,
                                    onTap: () {},
                                    child: Padding(
                                      padding: const EdgeInsets.all(15.0),
                                      child: Row(
                                        children: [
                                          Container(
                                            height: 25.0,
                                            width: 25.0,
                                            padding: const EdgeInsets.all(2.0),
                                            decoration: BoxDecoration(
                                              border: Border.all(
                                                  width: 1,
                                                  color: Colors.white),
                                              borderRadius: BorderRadius.all(
                                                  Radius.circular(100)),
                                            ),
                                          ),
                                          SizedBox(
                                            width: 10.0,
                                          ),
                                          Text(
                                            'हिंदी',
                                            style: TextStyle(
                                                color: Color(0xffFFFFFF),
                                                fontSize: 24.0,
                                                fontFamily:
                                                    'IBMPlexSansHebrewRegular',
                                                fontWeight: FontWeight.w500),
                                          )
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                              )
                            ],
                          ),
                        );
                      },
                    );
                  },
                  child: Image.asset("asset/images/GoogleTranslate.png"),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(right: 20.0),
                child: GestureDetector(
                    onTap: () {},
                    child: Image.asset("asset/images/Doorbell.png")),
              ),
            ],
          ),
        ],
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Center(
                  child: _layoutScreenWidget(
                    context,
                    userDetailsAlignmentcard,
                    userDetailsColorcard,
                    userProfileImageAlignmentcard,
                    bgImagecard,
                    nameColorcard,
                    profileImageBorderColorcard,
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    GestureDetector(
                      onTap: _saveImage,
                      child: Container(
                        width: MediaQuery.of(context).size.width * 0.45,
                        height: MediaQuery.of(context).size.height * 0.05,
                        decoration: BoxDecoration(
                          color: const Color(0xffA21B31),
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: Center(
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: const [
                                Icon(
                                  Icons.download,
                                  size: 30,
                                  color: Colors.white,
                                ),
                                Spacer(),
                                Text(
                                  "Download",
                                  style: TextStyle(
                                    color: Colors.white,
                                  ),
                                ),
                                Spacer(),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                    GestureDetector(
                      onTap: _shareImage,
                      child: Container(
                        width: MediaQuery.of(context).size.width * 0.45,
                        height: MediaQuery.of(context).size.height * 0.05,
                        decoration: BoxDecoration(
                          color: const Color(0xffA21B31),
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: Center(
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: const [
                                Icon(
                                  Icons.share_outlined,
                                  color: Colors.white,
                                  size: 30,
                                ),
                                Spacer(),
                                Text(
                                  "Share",
                                  style: TextStyle(
                                    color: Colors.white,
                                  ),
                                ),
                                Spacer(),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 15,
                ),
                Row(
                  children: [
                    Text(
                      'Templates',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    Spacer(),
                    InkWell(
                      child: Text(
                        "See All",
                        style: TextStyle(
                          color: primaryColor,
                          fontSize: 14,
                        ),
                      ),
                      onTap: () {},
                    )
                  ],
                ),
                const SizedBox(
                  height: 15,
                ),
                SizedBox(
                    height: MediaQuery.of(context).size.height * 0.22,
                    width: MediaQuery.of(context).size.width,
                    child: SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Row(
                        children: [
                          _layoutWidget(
                            context,
                            Alignment.bottomCenter,
                            // _userDetails(),
                            Colors.yellow,
                            Alignment.bottomRight,
                            "asset/images/bgImage.jpg",
                            Colors.green,
                            Colors.yellow,
                          ),
                          _layoutWidget(
                            context,
                            Alignment.bottomCenter,
                            // _userDetails(),
                            Colors.red,
                            Alignment.bottomRight,
                            "asset/images/bgImage.jpg",
                            Colors.blue,
                            Colors.black,
                          ),
                          _layoutWidget(
                            context,
                            Alignment.bottomCenter,
                            // _userDetails(),
                            Colors.purple,
                            Alignment.bottomRight,
                            "asset/images/bgImage.jpg",
                            Colors.black,
                            Colors.yellow,
                          ),
                          _layoutWidget(
                            context,
                            Alignment.bottomCenter,
                            // _userDetails(),
                            Colors.teal,
                            Alignment.bottomRight,
                            "asset/images/bgImage.jpg",
                            Colors.blueGrey,
                            Colors.red,
                          ),
                          _layoutWidget(
                            context,
                            Alignment.bottomCenter,
                            // _userDetails(),
                            Colors.pink,
                            Alignment.bottomRight,
                            "asset/images/bgImage.jpg",
                            Colors.lightGreen,
                            Colors.indigo,
                          ),
                          _layoutWidget(
                            context,
                            Alignment.bottomCenter,
                            // _userDetails(),
                            Colors.indigo,
                            Alignment.bottomRight,
                            "asset/images/bgImage.jpg",
                            Colors.lime,
                            Colors.black,
                          ),
                        ],
                      ),
                    ))
              ],
            ),
          ),
        ),
      ),
    );
  }

  final GlobalKey globalKey = GlobalKey();
  Future<void> _shareImage() async {
    await Permission.storage.request();
    XFile file = XFile('/storage/emulated/0/Download/my_image.png');
    Share.shareXFiles(
      [file],
      text: "Digiyug",
      subject: "Digiyug",
    );
  }

  Future<void> _saveImage() async {
    if (await Permission.storage.request().isGranted ||
        await Permission.storage.request().isLimited) {
      RenderRepaintBoundary boundary =
          globalKey.currentContext!.findRenderObject() as RenderRepaintBoundary;
      var image = await boundary.toImage();
      ByteData? byteData = await image.toByteData(format: ImageByteFormat.png);
      Uint8List pngBytes = byteData!.buffer.asUint8List();
      const imagePath = '/storage/emulated/0/Download/my_image.png';
      final file = File(imagePath);
      await file.writeAsBytes(pngBytes);
      final result = await ImageGallerySaver.saveImage(pngBytes);
      if (kDebugMode) {
        print(result);
      }
    } else {
      if (kDebugMode) {
        print('Permission denied');
      }
    }
  }

  Alignment userDetailsAlignmentcard = Alignment.bottomCenter;

  Color userDetailsColorcard = Colors.yellow;

  Alignment userProfileImageAlignmentcard = Alignment.bottomRight;

  String bgImagecard = "asset/images/bgImage.jpg";

  Color nameColorcard = Colors.green;

  Color profileImageBorderColorcard = Colors.yellow;

  _layoutWidget(
    BuildContext context,
    Alignment userDetailsAlignmentt,
    Color userDetailsColorr,
    Alignment userProfileImageAlignmentt,
    String bgImagee,
    Color nameColorr,
    Color profileImageBorderColorr,
  ) {
    return GestureDetector(
      onTap: () {
        userDetailsAlignmentcard = userDetailsAlignmentt;
        userDetailsColorcard = userDetailsColorr;
        userProfileImageAlignmentcard = userProfileImageAlignmentt;
        bgImagecard = bgImagee;
        nameColorcard = nameColorr;
        profileImageBorderColorcard = profileImageBorderColorr;
        setState(() {});
      },
      child: Stack(
        children: [
          Card(
            elevation: 2.0,
            child: SizedBox(
              height: MediaQuery.of(context).size.height * 0.2,
              width: MediaQuery.of(context).size.width * 0.43,
            ),
          ),
          Positioned(
            bottom: 0,
            right: 0,
            left: 0,
            child: Align(
              alignment: Alignment.bottomCenter,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 8.0, right: 8.0),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Container(
                          height: MediaQuery.of(context).size.height * 0.05,
                          width: MediaQuery.of(context).size.width * 0.24,
                          color: nameColorr,
                        ),
                        Container(
                          height: MediaQuery.of(context).size.height * 0.07,
                          width: MediaQuery.of(context).size.width * 0.14,
                          decoration: BoxDecoration(
                              border: Border.all(
                            color: profileImageBorderColorr,
                            width: 4.0,
                          )),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      height: MediaQuery.of(context).size.height * 0.06,
                      width: MediaQuery.of(context).size.width * 0.45,
                      color: userDetailsColorr,
                    ),
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }

  _layoutScreenWidget(
    BuildContext context,
    Alignment userDetailsAlignment,
    Color userDetailsColor,
    Alignment userProfileImageAlignment,
    String bgImage,
    Color nameColor,
    Color profileImageBorderColor,
  ) {
    return RepaintBoundary(
      key: globalKey,
      child: Stack(
        children: [
          Card(
            elevation: 10.0,
            child: Container(
              height: MediaQuery.of(context).size.height * 0.45,
              width: MediaQuery.of(context).size.width * 0.9,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage(bgImage),
                  fit: BoxFit.fill,
                ),
              ),
            ),
          ),
          Positioned(
            bottom: 0,
            right: 0,
            left: 0,
            child: Align(
              alignment: Alignment.bottomCenter,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Padding(
                    padding:
                        const EdgeInsets.only(left: 4, right: 8.0, bottom: 4),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Container(
                          height: MediaQuery.of(context).size.height * 0.06,
                          width: MediaQuery.of(context).size.width * 0.4,
                          color: nameColor,
                          child: const Center(
                            child: Text(
                              "Johnathan Doe",
                              style: TextStyle(
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ),
                        const Spacer(),
                        Container(
                          height: MediaQuery.of(context).size.height * 0.15,
                          width: MediaQuery.of(context).size.width * 0.32,
                          decoration: BoxDecoration(
                            color: Colors.grey,
                            border: Border.all(
                              color: profileImageBorderColor,
                              width: 4.0,
                            ),
                          ),
                          child: const Icon(
                            Icons.image,
                            size: 50,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(1.5),
                    child: Container(
                      height: MediaQuery.of(context).size.height * 0.08,
                      width: MediaQuery.of(context).size.width,
                      color: userDetailsColor,
                      child: _userDetails(),
                    ),
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }

  Widget _userDetails() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: const [
              Text("fb_username"),
              Text("ig_username"),
              Text("twitter_username"),
            ],
          ),
          const Spacer(),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: const [
              Text("email@gmail.com"),
              Text("+91 9999999999"),
            ],
          )
        ],
      ),
    );
  }
}
