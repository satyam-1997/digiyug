import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:gradient_widgets/gradient_widgets.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'faq.dart';

// ignore_for_file: prefer_const_constructors
class DigiyugProfile extends StatefulWidget {
  const DigiyugProfile({super.key});

  @override
  State<DigiyugProfile> createState() => _DigiyugProfileState();
}

class _DigiyugProfileState extends State<DigiyugProfile> {
  late final Color? backgroundColor;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //backgroundColor: Color(0xffC9C4C4),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Container(
              height: Get.height * 0.14,
              child: Padding(
                padding: const EdgeInsets.only(top: 5, left: 16, right: 14),
                child: Card(
                  child: Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(4),
                        gradient: LinearGradient(
                            colors: [Color(0xffED213A), Color(0xff93291E)])),
                    child: Padding(
                      padding: const EdgeInsets.only(left: 16),
                      child: Row(
                        children: [
                          Image(
                            image: AssetImage("asset/new_images/logo.png"),
                            width: 60,
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 6, left: 17),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        "Kundan Singh Panwar",
                                        style: TextStyle(
                                            fontSize: 16,
                                            fontWeight: FontWeight.w700,
                                            color: Colors.white),
                                      ),
                                      SizedBox(
                                        height: 3,
                                      ),
                                      Text("8997879870",
                                          style: TextStyle(
                                              fontSize: 16,
                                              fontWeight: FontWeight.w700,
                                              color: Colors.white)),
                                    ]),
                                SizedBox(
                                  width: Get.width * 0.2,
                                ),
                                Align(
                                  alignment: Alignment.centerRight,
                                  child: Padding(
                                    padding: const EdgeInsets.only(
                                        left: 8.0, top: 30),
                                    child: Icon(
                                      Icons.keyboard_arrow_right,
                                      color: Colors.white,
                                      size: 30,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ),

            //Free Plan---------------------------------------------------------------------------
            Container(
              child: Column(
                children: [
                  Container(
                      child: Padding(
                    padding: const EdgeInsets.only(
                        top: 13, right: 300, bottom: 3, left: 5),
                    child: Text(
                      "Subscription",
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 12,
                          fontWeight: FontWeight.w600),
                    ),
                  )),

                  Container(
                    width: 384,
                    height: 67,
                    child: Card(
                      color: Color(0xffFFF0F0),
                      shadowColor: Color(0xffFFF0F0),
                      child: Container(
                        child: ListTile(
                          title: Padding(
                            padding: const EdgeInsets.only(left: 40),
                            child: GradientText(
                              'Free Plan',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                fontSize: 24,
                                fontWeight: FontWeight.w700,
                              ),
                              gradient: LinearGradient(colors: [
                                Color(0xffED213A),
                                Color(0xff93291E)
                              ]),
                            ),
                          ),
                          trailing: Icon(
                            Icons.keyboard_arrow_right,
                            color: Color(0xffA21B31),
                            size: 30,
                          ),
                          onTap: () {},
                        ),
                      ),
                    ),
                  ),

                  //Services-------------------------------------------------------------------------
                  Container(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Container(
                            child: Padding(
                          padding: const EdgeInsets.only(
                              top: 9, right: 325, bottom: 3, left: 5),
                          child: Text(
                            "Services",
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: 12,
                                fontWeight: FontWeight.w600),
                          ),
                        )),
                        Container(
                          width: 384,
                          height: 66,
                          child: Card(
                            color: Color(0xffFFF0F0),
                            shadowColor: Color(0xffFFF0F0),
                            child: Container(
                              child: ListTile(
                                leading: Container(
                                  height: 45,
                                  width: 45,
                                  child: CircleAvatar(
                                      radius: 56,
                                      backgroundColor: Color(0xffA21B31),
                                      child: SvgPicture.asset(
                                        "asset/new_images/live-support.svg",
                                        width: 25,
                                        height: 25,
                                        color: Colors.white,
                                      )),
                                ),
                                title: Text(
                                  'On Spot Post',
                                  style: TextStyle(
                                      fontSize: 14,
                                      fontWeight: FontWeight.bold,
                                      color: Color(0xffA21B31)),
                                ),
                                trailing: Icon(
                                  Icons.keyboard_arrow_right,
                                  color: Color(0xffA21B31),
                                  size: 30,
                                ),
                                onTap: () {},
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  //2 nd service-------------------------------------------------------------------------------
                  Container(
                      width: 384,
                      height: 66,
                      child: Card(
                        color: Color(0xffFFF0F0),
                        shadowColor: Color(0xffFFF0F0),
                        child: Container(
                          //padding: EdgeInsets.only(left: 1),
                          child: ListTile(
                            leading: Container(
                              height: 45,
                              width: 45,
                              child: CircleAvatar(
                                  radius: 56,
                                  backgroundColor: Color(0xffA21B31),
                                  child: SvgPicture.asset(
                                    "asset/new_images/language-translation.svg",
                                    width: 25,
                                    height: 25,
                                    color: Colors.white,
                                  )),
                            ),
                            title: Text(
                              'Change language of post',
                              style: TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.bold,
                                  color: Color(0xffA21B31)),
                            ),
                            trailing: Icon(
                              Icons.keyboard_arrow_right,
                              color: Color(0xffA21B31),
                              size: 30,
                            ),
                            onTap: () {},
                          ),
                        ),
                      )),
                  SizedBox(
                    height: 5,
                  ),
                  //3 nd service-------------------------------------------------------------------------------
                  Container(
                      width: 384,
                      height: 66,
                      child: Card(
                        color: Color(0xffFFF0F0),
                        shadowColor: Color(0xffFFF0F0),
                        child: Container(
                          //padding: EdgeInsets.only(left: 1),
                          child: ListTile(
                            leading: Container(
                              height: 45,
                              width: 45,
                              child: CircleAvatar(
                                  radius: 56,
                                  backgroundColor: Color(0xffA21B31),
                                  child: SvgPicture.asset(
                                    "asset/new_images/share.svg",
                                    width: 25,
                                    height: 25,
                                    color: Colors.white,
                                  )),
                            ),
                            title: Text(
                              'Refer a friend',
                              style: TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.bold,
                                  color: Color(0xffA21B31)),
                            ),
                            trailing: Icon(
                              Icons.keyboard_arrow_right,
                              color: Color(0xffA21B31),
                              size: 30,
                            ),
                            onTap: () {},
                          ),
                        ),
                      )),
                  SizedBox(
                    height: 5,
                  ),
                  //4 nd service-------------------------------------------------------------------------------
                  Container(
                      width: 384,
                      height: 66,
                      child: Card(
                        color: Color(0xffFFF0F0),
                        shadowColor: Color(0xffFFF0F0),
                        child: Container(
                          //padding: EdgeInsets.only(left: 1),
                          child: ListTile(
                            leading: Container(
                              height: 45,
                              width: 45,
                              child: CircleAvatar(
                                  radius: 56,
                                  backgroundColor: Color(0xffA21B31),
                                  child: SvgPicture.asset(
                                    "asset/new_images/category.svg",
                                    width: 25,
                                    height: 25,
                                    color: Colors.white,
                                  )),
                            ),
                            title: Text(
                              'Change category type',
                              style: TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.bold,
                                  color: Color(0xffA21B31)),
                            ),
                            trailing: Icon(
                              Icons.keyboard_arrow_right,
                              color: Color(0xffA21B31),
                              size: 30,
                            ),
                            onTap: () {},
                          ),
                        ),
                      )),
                  SizedBox(
                    height: 5,
                  ),
                  //5 nd service-------------------------------------------------------------------------------
                  Container(
                      width: 384,
                      height: 66,
                      child: Card(
                        color: Color(0xffFFF0F0),
                        shadowColor: Color(0xffFFF0F0),
                        child: Container(
                          //padding: EdgeInsets.only(left: 1),
                          child: ListTile(
                            leading: Container(
                              height: 45,
                              width: 45,
                              child: CircleAvatar(
                                  radius: 56,
                                  backgroundColor: Color(0xffA21B31),
                                  child: SvgPicture.asset(
                                    "asset/new_images/chat-bubbles.svg",
                                    width: 25,
                                    height: 25,
                                    color: Colors.white,
                                  )),
                            ),
                            title: Text(
                              'Faqs',
                              style: TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.bold,
                                  color: Color(0xffA21B31)),
                            ),
                            trailing: Icon(
                              Icons.keyboard_arrow_right,
                              color: Color(0xffA21B31),
                              size: 30,
                            ),
                            onTap: () {
                              Get.to(() => DigiyugFaq());
                            },
                          ),
                        ),
                      )),
                  SizedBox(
                    height: 5,
                  ),
                  //6 nd service-------------------------------------------------------------------------------
                  Container(
                      width: 384,
                      height: 66,
                      child: Card(
                        color: Color(0xffFFF0F0),
                        shadowColor: Color(0xffFFF0F0),
                        child: Container(
                          //padding: EdgeInsets.only(left: 1),
                          child: ListTile(
                            leading: Container(
                              height: 45,
                              width: 45,
                              child: CircleAvatar(
                                  radius: 56,
                                  backgroundColor: Color(0xffA21B31),
                                  child: SvgPicture.asset(
                                    "asset/new_images/feedback.svg",
                                    width: 25,
                                    height: 25,
                                    color: Colors.white,
                                  )),
                            ),
                            title: Text(
                              'Feedback',
                              style: TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.bold,
                                  color: Color(0xffA21B31)),
                            ),
                            trailing: Icon(
                              Icons.keyboard_arrow_right,
                              color: Color(0xffA21B31),
                              size: 30,
                            ),
                            onTap: () {},
                          ),
                        ),
                      )),
                  SizedBox(
                    height: 5,
                  ),
                  //7 nd service-------------------------------------------------------------------------------
                  Container(
                      width: 384,
                      height: 66,
                      child: Card(
                        color: Color(0xffFFF0F0),
                        shadowColor: Color(0xffFFF0F0),
                        child: Container(
                          //padding: EdgeInsets.only(left: 1),
                          child: ListTile(
                            leading: Container(
                              height: 45,
                              width: 45,
                              child: CircleAvatar(
                                  radius: 56,
                                  backgroundColor: Color(0xffA21B31),
                                  child: SvgPicture.asset(
                                    "asset/new_images/file.svg",
                                    width: 25,
                                    height: 25,
                                  )),
                            ),
                            title: Text(
                              'Privacy Policy',
                              style: TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.bold,
                                  color: Color(0xffA21B31)),
                            ),
                            trailing: Icon(
                              Icons.keyboard_arrow_right,
                              color: Color(0xffA21B31),
                              size: 30,
                            ),
                            onTap: () {},
                          ),
                        ),
                      )),
                  SizedBox(
                    height: 15,
                  ),
                  Container(
                    child: Column(
                      children: [
                        SizedBox(
                          width: 375,
                          height: 57,
                          child: ElevatedButton(
                            child: Text(
                              'Log out',
                              style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.w500,
                                  color: Colors.white),
                            ),
                            style: ElevatedButton.styleFrom(
                              primary: Color(0xffA21B31),
                            ),
                            onPressed: () {},
                          ),
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        Text(
                          "Version 1.0.1",
                          style: TextStyle(
                              fontSize: 10,
                              fontWeight: FontWeight.w400,
                              color: Color(0xff858585)),
                        )
                      ],
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
