import 'package:digiyug/screens/category/category_controller.dart';
import 'package:digiyug/screens/home_screen_ui/Dashboard/dashboard.dart';
import 'package:digiyug/util/theme/theme_manager.dart';
import 'package:dx_generator/dx_generator.dart';
import 'package:dx_router/dx_router.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import '../../util/styles.dart';
import '../home_screen_ui/Common/constants.dart';

@GenerateDxRoute()
class CategoryScreen extends StatefulWidget {
  CategoryScreen({super.key});

  @override
  State<CategoryScreen> createState() => _CategoryScreenState();
}

class _CategoryScreenState extends State<CategoryScreen> {
  final CategoryController categoryController = Get.put(CategoryController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
          child: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(left: 20, right: 20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: Get.height * 0.01,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        "Choose your language and \ncategory type",
                        style: TextStyle(
                            fontSize: Dimens.font_16sp,
                            fontWeight: FontWeight.w700),
                      ),
                      SizedBox(
                        height: Get.height * 0.015,
                      ),
                      const Text(
                        "Select at least two categories",
                        style: TextStyle(
                            fontSize: Dimens.font_14sp,
                            fontWeight: FontWeight.w400),
                      )
                    ],
                  ),
                  GestureDetector(
                    onTap: () {
                      filterBottomSheet();
                    },
                    child: SizedBox(
                      height: Get.height * 0.08,
                      width: Get.width * 0.12,
                      // color: Colors.black,
                      child: Image.asset(
                        "asset/images/language.jpg",
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: Get.height * 0.03,
              ),
              Wrap(
                spacing: 6,
                runSpacing: 6,
                children: [
                  _individualGrids(0),
                  _individualGrids(1),
                  _individualGrids(2),
                  _individualGrids(3),
                  _individualGrids(4),
                  _individualGrids(5),
                ],
              ),
              SizedBox(
                height: Get.height * 0.02,
              ),
              GestureDetector(
                onTap: () {
                  if (categoryController.selectedcategoryList.value.length >=
                      2) {
                    Get.to(() => Dashboard());
                  }
                },
                child: Center(
                    child: Obx(
                  () => Container(
                    width: Get.width,
                    height: 52,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(
                            8.0), //Use this code to make rounded corners
                        color: categoryController
                                    .selectedcategoryList.value.length >=
                                2
                            ? AppColors.buttonColor
                            : AppColors.buttonColor.withOpacity(0.4)),
                    child: const Center(
                        child: Text(
                      "Next",
                      style: robotoBold,
                    )),
                  ),
                )),
              ),
            ],
          ),
        ),
      )),
    );
  }

  _individualGrids(int index) {
    return Container(
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
                  "asset/images/${categoryController.categoryList.value[index].svgPath.toString()}",
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
          Padding(
            padding: const EdgeInsets.only(right: 10, top: 10),
            child: Align(
              alignment: Alignment.topRight,
              child: GestureDetector(
                onTap: () {
                  categoryController.setIsSelected(index);
                  setState(() {});
                },
                child: Obx(
                  () => Container(
                    height: Get.height * 0.04,
                    width: Get.width * 0.08,
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(4),
                        border: Border.all()),
                    child:
                        categoryController.categoryList.value[index].isSelected
                            ? Padding(
                                padding: EdgeInsets.all(2),
                                child: Container(
                                  color: Color(0xffA21B31),
                                ),
                              )
                            : SizedBox(),
                  ),
                ),
              ),
            ),
          ),
          //word
          Align(
            alignment: Alignment.bottomRight,
            child: Padding(
              padding: const EdgeInsets.only(bottom: 10, right: 10),
              child: Text(
                categoryController.categoryList.value[index].name,
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
    );
  }

  filterBottomSheet() {
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
                onTap: () {
                  categoryController.isEnglishSelected.value = true;
                  categoryController.isLangSelected.value = true;
                  setState(() {});
                },
                child: Obx(
                  () => Container(
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
                          Container(
                            height: 25.0,
                            width: 25.0,
                            padding: const EdgeInsets.all(2.0),
                            decoration: BoxDecoration(
                              border: Border.all(width: 1, color: Colors.white),
                              borderRadius:
                                  BorderRadius.all(Radius.circular(100)),
                            ),
                            child: categoryController.isEnglishSelected.value
                                ? Icon(Icons.done)
                                : null,
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
                    borderRadius: BorderRadius.all(Radius.circular(5.0)),
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
                              border: Border.all(width: 1, color: Colors.white),
                              borderRadius:
                                  BorderRadius.all(Radius.circular(100)),
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
              )
            ],
          ),
        );
      },
    );
  }
}
