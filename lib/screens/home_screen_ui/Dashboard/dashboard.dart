import 'package:digiyug/screens/plans/plans_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import '../../../util/styles.dart';
import '../../../util/theme/theme_manager.dart';
import '../Common/constants.dart';
import '../navigationbarItems/Home/home.dart';
import '../navigationbarItems/Profile/profile.dart';
import '../navigationbarItems/Subscriptions/subscriptions.dart';
import '../navigationbarItems/Template/template.dart';
import '../navigationbarItems/onSpot/onspot.dart';

class Dashboard extends StatefulWidget {
  const Dashboard({super.key});

  @override
  State<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  RxInt currentTab = 0.obs;

  final List<Widget> pages = [
    HomePage(),
    Template(),
    OnSpot(),
    DigiyugProfile(),
  ];

  final PageStorageBucket bucket = PageStorageBucket();

  Widget currentScreen = HomePage();
  RxInt _selectedIndex = 100.obs;
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
                    showLanguageSheet(context, _selectedIndex);
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
      body: Obx(
        () => Stack(
          children: [
            Column(
              children: [
                Expanded(
                  child: Container(
                    height: Get.height,
                    child: pages[currentTab.value],
                  ),
                ),
                SizedBox(
                  height: Get.height * 0.1,
                )
              ],
            ),
            Align(alignment: Alignment.bottomCenter, child: bottomNavBar())
          ],
        ),
      ),
    );
  }

  Widget bottomNavBar() {
    return Container(
      height: Get.height * 0.095,
      color: Colors.transparent,
      child: Stack(
        children: [
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              height: Get.height * 0.08,
              width: Get.width,
              color: Colors.transparent,
              child: oldBottomBar(),
            ),
          ),
          Align(
            alignment: Alignment.topCenter,
            child: Obx(
              () => Container(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    (currentTab.value == 1)
                        ? SizedBox(
                            width: Get.width * 0.1,
                          )
                        : SizedBox(),
                    SizedBox(
                      height: 43.0,
                      width: 43.0,
                      child: FloatingActionButton(
                        backgroundColor: primaryColor,
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const PlansScreen()),
                          );
                        },
                        shape: RoundedRectangleBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(10.0))),
                        child: SvgPicture.asset(
                          "asset/images/floatbutton.svg",
                          height: 29.0,
                          width: 29.0,
                        ),
                      ),
                    ),
                    (currentTab.value == 2)
                        ? SizedBox(
                            width: Get.width * 0.2,
                          )
                        : SizedBox(),
                  ],
                ),
              ),
            ),
          )
        ],
      ),
    );
  }

  Widget oldBottomBar() {
    return BottomAppBar(
      child: SizedBox(
        height: Get.height * 0.08,
        child: Row(
          //  mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Obx(
              () => Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  MaterialButton(
                    onPressed: () {
                      currentTab.value = 0;
                    },
                    minWidth: 40.0,
                    child: currentTab.value == 0
                        ? Container(
                            height: 38.0,
                            width: 90.0,
                            padding: EdgeInsets.all(5.0),
                            alignment: Alignment.center,
                            decoration: const BoxDecoration(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(5.0)),
                              color: lightShadeBackground,
                            ),
                            child: Row(
                              children: [
                                SizedBox(
                                    height: 26.0,
                                    width: 26.0,
                                    child: SvgPicture.asset(
                                      "asset/images/home.svg",
                                      color: primaryColor,
                                    )),
                                Container(
                                  padding: EdgeInsets.only(left: 10.0),
                                  child: const Text(
                                    'Home',
                                    style: TextStyle(
                                      fontFamily: 'IBMPlexSansHebrewRegular',
                                      fontWeight: FontWeight.w600,
                                      fontSize: 13.0,
                                      color: primaryColor,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          )
                        : SizedBox(
                            height: 27.0,
                            width: 27.0,
                            child: SvgPicture.asset("asset/images/home.svg"),
                          ),
                  ),
                  MaterialButton(
                    onPressed: () {
                      currentTab.value = 1;
                    },
                    minWidth: 40.0,
                    child: currentTab.value == 1
                        ? Container(
                            height: 38.0,
                            width: 100.0,
                            padding: EdgeInsets.all(5.0),
                            alignment: Alignment.center,
                            decoration: const BoxDecoration(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(5.0)),
                              color: lightShadeBackground,
                            ),
                            child: Row(
                              children: [
                                SizedBox(
                                    height: 25.0,
                                    width: 25.0,
                                    child: SvgPicture.asset(
                                      "asset/images/template.svg",
                                      color: primaryColor,
                                    )),
                                Container(
                                  padding: EdgeInsets.only(left: 10.0),
                                  child: const Text(
                                    'Template',
                                    style: TextStyle(
                                      fontFamily: 'IBMPlexSansHebrewRegular',
                                      fontWeight: FontWeight.w600,
                                      fontSize: 13.0,
                                      color: primaryColor,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          )
                        : SizedBox(
                            height: 27.0,
                            width: 27.0,
                            child:
                                SvgPicture.asset("asset/images/template.svg")),
                  ),
                ],
              ),
            ),
            SizedBox(
              width: MediaQuery.of(context).size.width * 0.10,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                MaterialButton(
                  onPressed: () {
                    currentTab.value = 2;
                  },
                  minWidth: 40.0,
                  child: currentTab.value == 2
                      ? Container(
                          height: 38.0,
                          width: 100.0,
                          padding: EdgeInsets.all(5.0),
                          alignment: Alignment.center,
                          decoration: const BoxDecoration(
                            borderRadius:
                                BorderRadius.all(Radius.circular(5.0)),
                            color: lightShadeBackground,
                          ),
                          child: Row(
                            children: [
                              SizedBox(
                                  height: 26.0,
                                  width: 26.0,
                                  child: SvgPicture.asset(
                                    "asset/images/onspot.svg",
                                    color: primaryColor,
                                  )),
                              Container(
                                padding: EdgeInsets.only(left: 10.0),
                                child: const Text(
                                  'onSpot',
                                  style: TextStyle(
                                      fontFamily: 'IBMPlexSansHebrewRegular',
                                      fontWeight: FontWeight.w600,
                                      fontSize: 13.0,
                                      color: primaryColor),
                                ),
                              ),
                            ],
                          ),
                        )
                      : SizedBox(
                          height: 27.0,
                          width: 27.0,
                          child: SvgPicture.asset(
                            "asset/images/onspot.svg",
                            color: Colors.black,
                          )),
                ),
                MaterialButton(
                  onPressed: () {
                    currentTab.value = 3;
                  },
                  minWidth: 40.0,
                  child: currentTab.value == 3
                      ? Container(
                          height: 38.0,
                          width: 100.0,
                          padding: EdgeInsets.all(5.0),
                          alignment: Alignment.center,
                          decoration: const BoxDecoration(
                            borderRadius:
                                BorderRadius.all(Radius.circular(5.0)),
                            color: lightShadeBackground,
                          ),
                          child: Row(
                            children: [
                              Container(
                                decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  border: currentTab == 3
                                      ? Border.all(
                                          color: primaryColor,
                                        )
                                      : null,
                                ),
                                height: 28.0,
                                width: 28.0,
                                child: Padding(
                                  padding: const EdgeInsets.all(2.0),
                                  child: Image.asset(
                                    "asset/images/Ellipse.png",
                                    // color: primaryColor,
                                  ),
                                ),
                              ),
                              Container(
                                padding: EdgeInsets.only(left: 10.0),
                                child: const Text(
                                  'Profile',
                                  style: TextStyle(
                                      fontFamily: 'IBMPlexSansHebrewRegular',
                                      fontWeight: FontWeight.w600,
                                      fontSize: 13.0,
                                      color: primaryColor),
                                ),
                              ),
                            ],
                          ),
                        )
                      : SizedBox(
                          height: 27.0,
                          width: 27.0,
                          child: Image.asset(
                            "asset/images/Ellipse.png",
                            // color: secondaryColorText,
                          ),
                        ),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}

showLanguageSheet(BuildContext context, RxInt _selectedIndex) {
  showModalBottomSheet<void>(
    context: context,
    constraints: BoxConstraints(
      minWidth: Get.width,
      maxWidth: Get.width,
      minHeight: 0.0,
      maxHeight: Get.height / 1.85,
    ),
    isScrollControlled: true,
    backgroundColor: Colors.transparent,
    builder: (BuildContext context) {
      return Column(
        children: [
          Align(
            alignment: Alignment.topCenter,
            child: GestureDetector(
              onTap: () {
                Navigator.pop(context);
              },
              child: CircleAvatar(
                backgroundColor: Colors.white,
                child: Center(
                    child: Icon(
                  Icons.close,
                  color: Colors.black,
                )),
              ),
            ),
          ),
          SizedBox(
            height: Get.height * 0.03,
          ),
          Container(
            color: Colors.white,
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
                SizedBox(
                  height: Get.height * 0.01,
                ),
                Text(
                  'Choose language according to your preference.',
                  style: TextStyle(
                    color: secondaryColorText,
                    fontFamily: 'IBMPlexSansHebrewRegular',
                  ),
                ),
                SizedBox(
                  height: Get.height * 0.02,
                ),
                GestureDetector(
                  onTap: () {
                    if (_selectedIndex.value == 0) {
                      _selectedIndex.value = 4;
                    } else {
                      _selectedIndex.value = 0;
                    }
                  },
                  child: Container(
                    height: 70.0,
                    width: Get.width,
                    decoration: const BoxDecoration(
                      image: DecorationImage(
                          image: AssetImage(
                            'asset/images/RectangleEng.png',
                          ),
                          fit: BoxFit.fill),
                      borderRadius: BorderRadius.all(Radius.circular(5.0)),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(15.0),
                      child: Row(
                        children: [
                          Obx(
                            () => Container(
                              height: 25.0,
                              width: 25.0,
                              padding: const EdgeInsets.all(2.0),
                              decoration: BoxDecoration(
                                border: Border.all(
                                  width: 1,
                                  color: Colors.white,
                                ),
                                shape: BoxShape.circle,
                              ),
                              child: _selectedIndex.value == 0
                                  ? Center(
                                      child: Container(
                                        height: 24.9,
                                        width: 24.9,
                                        decoration: BoxDecoration(
                                            shape: BoxShape.circle,
                                            color: primaryColor),
                                      ),
                                    )
                                  : SizedBox(),
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
                                fontFamily: 'IBMPlexSansHebrewRegular',
                                fontWeight: FontWeight.w500),
                          )
                        ],
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: Get.height * 0.03,
                ),
                GestureDetector(
                  onTap: () {
                    if (_selectedIndex.value == 1) {
                      _selectedIndex.value = 4;
                    } else {
                      _selectedIndex.value = 1;
                    }
                  },
                  child: Container(
                    height: 70.0,
                    width: Get.width,
                    decoration: const BoxDecoration(
                      image: DecorationImage(
                          image: AssetImage(
                            'asset/images/Rectanglehind.png',
                          ),
                          fit: BoxFit.fill),
                      borderRadius: BorderRadius.all(Radius.circular(5.0)),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(15.0),
                      child: Row(
                        children: [
                          Obx(
                            () => Container(
                              height: 25.0,
                              width: 25.0,
                              padding: const EdgeInsets.all(2.0),
                              decoration: BoxDecoration(
                                border: Border.all(
                                  width: 1,
                                  color: Colors.white,
                                ),
                                shape: BoxShape.circle,
                              ),
                              child: _selectedIndex.value == 1
                                  ? Center(
                                      child: Container(
                                        height: 24.9,
                                        width: 24.9,
                                        decoration: BoxDecoration(
                                            shape: BoxShape.circle,
                                            color: primaryColor),
                                      ),
                                    )
                                  : SizedBox(),
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
                                fontFamily: 'IBMPlexSansHebrewRegular',
                                fontWeight: FontWeight.w500),
                          )
                        ],
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: Get.height * 0.05,
                ),
                Container(
                  width: Get.width,
                  height: 52,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(
                        8.0), //Use this code to make rounded corners
                    color: AppColors.buttonColor,
                  ),
                  child: const Center(
                      child: Text(
                    "Select",
                    style: robotoBold,
                  )),
                )
              ],
            ),
          ),
        ],
      );
    },
  );
}
// Widget getBody() {
//   List<Widget> pages = [
//     HomePage(),
//     OnSpot(),
//     Subscriptions(),
//     Template(),
//     Profile()
//   ];
//   return IndexedStack(
//     index: _currentIndex,
//     children: pages,
//   );
// }

// Widget _buildBottomBar() {
//   return CustomAnimatedBottomBar(
//     containerHeight: 70,
//     backgroundColor: Colors.white,
//     selectedIndex: _currentIndex,
//     showElevation: true,
//     itemCornerRadius: 24,
//     curve: Curves.easeIn,
//     onItemSelected: (index) => setState(() => _currentIndex = index),
//     items: <BottomNavyBarItem>[
//       BottomNavyBarItem(
//         icon: Icon(Icons.apps),
//         title: Text('Home'),
//         activeColor: Colors.green,
//         inactiveColor: _inactiveColor,
//         textAlign: TextAlign.center,
//       ),
//       BottomNavyBarItem(
//         icon: Icon(Icons.people),
//         title: Text('Users'),
//         activeColor: Colors.purpleAccent,
//         inactiveColor: _inactiveColor,
//         textAlign: TextAlign.center,
//       ),
//       BottomNavyBarItem(
//         icon: Icon(Icons.message),
//         title: Text(
//           'Messages ',
//         ),
//         activeColor: Colors.pink,
//         inactiveColor: _inactiveColor,
//         textAlign: TextAlign.center,
//       ),
//       BottomNavyBarItem(
//         icon: Icon(Icons.settings),
//         title: Text('Settings'),
//         activeColor: Colors.blue,
//         inactiveColor: _inactiveColor,
//         textAlign: TextAlign.center,
//       ),
//     ],
//   );

// body: getBody(),
// bottomNavigationBar: _buildBottomBar(),
// floatingActionButtonLocation: FloatingActionButtonLocation.miniCenterDocked,
// floatingActionButton: SizedBox(
//   height: 100,
//   width: 100,
//   child: Column(
//     children: [
//       FloatingActionButton(
//         child: Icon(Icons.add), //child widget inside this button
//         shape: BeveledRectangleBorder(borderRadius: BorderRadius.zero),
//         onPressed: () {
//           print("Button is pressed.");
//           //task to execute when this button is pressed
//         },
//       ),
//       Text('sdfghjk')
//     ],
//   ),
// ),
// backgroundColor: Colors.blue[100], //background color of scaffold
// }
