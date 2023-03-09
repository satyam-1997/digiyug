import 'package:carousel_slider/carousel_slider.dart';
import 'package:digiyug/screens/home_screen_ui/Common/constants.dart';
import 'package:digiyug/screens/home_screen_ui/navigationbarItems/Home/home_controller.dart';
import 'package:digiyug/util/theme/theme_manager.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../template/template_screen.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  HomepageController homepageController = Get.put(HomepageController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _body(),
    );
  }

  _body() {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.only(
          left: 12,
          right: 12,
          top: 10,
          bottom: 10,
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
                height: Get.height * 0.22,
                width: Get.width,
                // color: Colors.amber,
                child: _bannerBody()),
            SizedBox(
              height: Get.height * 0.02,
            ),
            Container(
              height: Get.height * 0.25,
              width: Get.width,
              child: ListComponent(
                title: "Upcoming Post",
                voidCallback: () {},
                isHorizontal: true,
                hasPagination: false,
              ),
            ),
            Container(
              height: Get.height * 0.25,
              width: Get.width,
              child: ListComponent(
                title: "Today’s Post",
                voidCallback: () {},
                isHorizontal: true,
                hasPagination: false,
              ),
            ),
            ListComponent(
              title: "Old Post",
              voidCallback: () {},
              isHorizontal: false,
              hasPagination: false,
            ),
            Container(
              height: Get.height * 0.25,
              width: Get.width,
              child: ListComponent(
                title: "Today’s Post",
                voidCallback: () {},
                isHorizontal: true,
                hasPagination: false,
              ),
            ),
          ],
        ),
      ),
    );
  }

  _bannerBody() {
    return CarouselSlider(
      items: [
        Container(
          width: Get.width,
          margin: EdgeInsets.all(2.5),
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage("asset/images/co-operative.png"),
              fit: BoxFit.fill,
            ),
            // border:
            //     Border.all(color: Theme.of(context).accentColor),
            borderRadius: BorderRadius.circular(4.0),
          ),
        ),
        Container(
          width: Get.width,
          margin: EdgeInsets.all(2.5),
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage("asset/images/co-operative.png"),
              fit: BoxFit.fill,
            ),
            // border:
            //     Border.all(color: Theme.of(context).accentColor),
            borderRadius: BorderRadius.circular(4.0),
          ),
        ),
        Container(
          width: Get.width,
          margin: EdgeInsets.all(2.5),
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage("asset/images/co-operative.png"),
              fit: BoxFit.fill,
            ),
            // border:
            //     Border.all(color: Theme.of(context).accentColor),
            borderRadius: BorderRadius.circular(4.0),
          ),
        ),
      ],
      options: CarouselOptions(
        viewportFraction: 1,
        height: Get.height * 0.2,
        enlargeCenterPage: true,
        autoPlay: true,
        onPageChanged: (index, reason) {},
      ),
    );
  }
}

class ListComponent extends StatelessWidget {
  const ListComponent({
    super.key,
    required this.title,
    required this.voidCallback,
    // required this.list,
    required this.isHorizontal,
    required this.hasPagination,
  });
  final String title;
  final VoidCallback voidCallback;
  // final List list;
  final bool isHorizontal;
  final bool hasPagination;

  @override
  Widget build(BuildContext context) {
    // Vertical list
    if (isHorizontal == false) {
      return Container(
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  title,
                  style: TextStyle(
                    fontSize: Dimens.font_16sp,
                    fontWeight: FontWeight.w500,
                    color: Colors.black,
                  ),
                ),
                InkWell(
                  child: Text(
                    "See All",
                    style: TextStyle(
                      color: primaryColor,
                      fontWeight: FontWeight.w500,
                      fontSize: Dimens.font_12sp,
                    ),
                  ),
                )
              ],
            ),
            ListView.builder(
              itemBuilder: (context, index) {
                return Column(
                  children: [
                    Container(
                      height: Get.height * 0.22,
                      width: Get.width,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Expanded(
                            flex: 1,
                            child: _individualGrids(
                              0,
                              "Some text",
                              "asset/images/common_people.png",
                            ),
                          ),
                          Expanded(
                            flex: 1,
                            child: _individualGrids(
                              0,
                              "Some text",
                              "asset/images/co-operative.png",
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                );
              },
              itemCount: 5,
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              scrollDirection: Axis.vertical,
            ),
          ],
        ),
      );
    }
    // Horizontal list
    return Container(
      height: Get.height * 0.25,
      width: Get.width,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                title,
                style: TextStyle(
                  fontSize: Dimens.font_16sp,
                  fontWeight: FontWeight.w500,
                  color: Colors.black,
                ),
              ),
              InkWell(
                child: Text(
                  "See All",
                  style: TextStyle(
                    color: primaryColor,
                    fontWeight: FontWeight.w500,
                    fontSize: Dimens.font_12sp,
                  ),
                ),
              )
            ],
          ),
          SizedBox(
            height: Get.height * 0.01,
          ),
          Container(
            height: Get.height * 0.18,
            child: ListView.builder(
              itemBuilder: (context, index) {
                return _individualGrids(
                    index, "Some text", "asset/images/common_people.png");
              },
              shrinkWrap: true,
              itemCount: 10,
              scrollDirection: Axis.horizontal,
            ),
          ),
        ],
      ),
    );
  }

  _individualGrids(
    int index,
    String text,
    String image,
  ) {
    return GestureDetector(
      onTap: () {
        Get.to(() => TemplatePagePage());
      },
      child: Padding(
        padding: const EdgeInsets.only(right: 8),
        child: Container(
          height: Get.height * 0.2,
          width: Get.width * 0.43,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8),
          ),
          child: Stack(
            children: [
              Stack(
                children: [
                  Container(
                    height: Get.height * 0.2,
                    width: Get.width * 0.43,
                    child: Image.asset(
                      image,
                      fit: BoxFit.fill,
                    ),
                  ),
                  Container(
                    height: Get.height * 0.2,
                    width: Get.width * 0.43,
                    color: Colors.black.withOpacity(0.3),
                  ),
                ],
              ),
              //checkbox

              //word
              Align(
                alignment: Alignment.bottomRight,
                child: Padding(
                  padding: const EdgeInsets.only(bottom: 10, right: 10),
                  child: Text(
                    text,
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.w600,
                      fontSize: Dimens.font_16sp,
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
