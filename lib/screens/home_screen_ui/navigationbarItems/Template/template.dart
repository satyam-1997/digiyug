import 'dart:developer';
import 'dart:io';
import 'dart:ui';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:get/get.dart';
import 'package:image_gallery_saver/image_gallery_saver.dart';
import 'package:path_provider/path_provider.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:share_plus/share_plus.dart';
import '../../../../util/theme/theme_manager.dart';
import '../../Common/constants.dart';
import '../Home/home.dart';

class Template extends StatefulWidget {
  const Template({super.key});

  @override
  State<Template> createState() => _TemplateState();
}

class _TemplateState extends State<Template> {
  @override
  Widget build(BuildContext context) {
    return _scaffold(context);
  }

  Scaffold _scaffold(BuildContext context) {
    return Scaffold(
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
                        width: MediaQuery.of(context).size.width * 0.46,
                        height: MediaQuery.of(context).size.height * 0.05,
                        decoration: BoxDecoration(
                          color: const Color(0xffA21B31),
                          borderRadius: BorderRadius.circular(4),
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
                                    fontWeight: FontWeight.w500,
                                    fontSize: Dimens.font_16sp,
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
                        width: MediaQuery.of(context).size.width * 0.46,
                        height: MediaQuery.of(context).size.height * 0.05,
                        decoration: BoxDecoration(
                          color: shareImagePath.isNotEmpty
                              ? const Color(0xffA21B31)
                              : Colors.grey,
                          borderRadius: BorderRadius.circular(4),
                        ),
                        child: Center(
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: const [
                                Center(
                                  child: Icon(
                                    Icons.share_outlined,
                                    color: Colors.white,
                                    size: 32,
                                  ),
                                ),
                                Spacer(),
                                Text(
                                  "Share",
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.w500,
                                    fontSize: Dimens.font_16sp,
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
                        _layoutWidget(
                          context,
                          Alignment.bottomCenter,
                          // _userDetails(),
                          Colors.deepPurpleAccent,
                          Alignment.bottomRight,
                          "asset/images/bgImage.jpg",
                          Colors.lightGreen,
                          Colors.red,
                        ),
                        _layoutWidget(
                          context,
                          Alignment.bottomCenter,
                          // _userDetails(),
                          Colors.orange,
                          Alignment.bottomRight,
                          "asset/images/bgImage.jpg",
                          Colors.red,
                          Colors.indigo,
                        ),
                      ],
                    ),
                  ),
                ),
                Container(
                  child: ListComponent(
                    title: "Today’s Post",
                    voidCallback: () {},
                    isHorizontal: false,
                    hasPagination: false,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  String shareImagePath = '';

  final GlobalKey globalKey = GlobalKey();
  Future<void> _shareImage() async {
    await Permission.storage.request();
    XFile file = XFile(shareImagePath);
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
      Directory appDocDir = await getApplicationDocumentsDirectory();
      String appDocPath = appDocDir.path;
      log(appDocPath);
      var imagePath = '${appDocPath}/sharingImage.png';
      final file = File(imagePath);
      await file.writeAsBytes(pngBytes).then((File f) async {
        if (await f.exists()) {
          setState(() {
            shareImagePath = file.path.toString();
          });
          log("Saved");
          Get.showSnackbar(GetSnackBar(
            title: "Downloaded",
          ));

          // String downloadsPath = "/storage/emulated/0/Download/my_image.png";
          // file.create(recursive: true);
          // file.copySync(downloadsPath);
        }
      });
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
          Container(
            height: MediaQuery.of(context).size.height * 0.45,
            width: MediaQuery.of(context).size.width * 0.95,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage(bgImage),
                fit: BoxFit.fill,
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
                  Container(
                    height: MediaQuery.of(context).size.height * 0.08,
                    width: MediaQuery.of(context).size.width,
                    color: userDetailsColor,
                    child: _userDetails(),
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
