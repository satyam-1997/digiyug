import 'package:digiyug/screens/category/category_controller.dart';
import 'package:digiyug/screens/home_screen_ui/Dashboard/dashboard.dart';
import 'package:digiyug/util/theme/theme_manager.dart';
import 'package:dx_generator/dx_generator.dart';
import 'package:dx_router/dx_router.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
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
  RxInt _selectedIndex = 4.obs;
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
                height: 24,
              ),
              SizedBox(
                height: Get.height * 0.02,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // const Text(
                      //   "Choose your language and \ncategory type",
                      //   style: TextStyle(
                      //       fontSize: Dimens.font_16sp,
                      //       fontWeight: FontWeight.w700),
                      // ),
                      Text(
                        "Choose your language and \ncategory type",
                        style: GoogleFonts.ibmPlexSans(
                          fontWeight: FontWeight.w700,
                          fontSize: Dimens.font_20sp,
                          color: Colors.black,
                          letterSpacing: 0,
                        ),
                      ),
                    ],
                  ),
                  GestureDetector(
                    onTap: () {
                      showLanguageSheet(context, _selectedIndex);
                    },
                    child: SizedBox(
                      height: Get.height * 0.05,
                      width: Get.width * 0.14,
                      // color: Colors.black,
                      child: SvgPicture.asset(
                        "asset/images/language-translation.svg",
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: Get.height * 0.015,
              ),
              Text(
                "Select two categories",
                style: GoogleFonts.ibmPlexSans(
                  fontWeight: FontWeight.w500,
                  fontSize: Dimens.font_18sp,
                  color: Colors.black54,
                  letterSpacing: 1,
                ),
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
                  if (categoryController.selectedcategoryList.value.length ==
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
      height: Get.height * 0.2 + 4,
      width: Get.width * 0.43,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
      ),
      child: Stack(
        children: [
          Stack(
            children: [
              Container(
                height: Get.height * 0.2,
                width: Get.width * 0.43,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(24),
                ),
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
                  // if (categoryController.selectedcategoryList.value.length >
                  //     1) {
                    // Fluttertoast.showToast(
                    //   msg: "You can't select more then 2 category!",
                    //   toastLength: Toast.LENGTH_SHORT,
                    //   gravity: ToastGravity.BOTTOM,
                    //   fontSize: 16.0,
                    // );
                  // } else {
                  //   categoryController.setIsSelected(index);
                  //   setState(() {});
                  // }
                },
                child: Obx(
                  () => Container(
                    height: Get.height * 0.04,
                    width: Get.width * 0.08,
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(6),
                        border: Border.all()),
                    child:
                        categoryController.categoryList.value[index].isSelected
                            ? Padding(
                                padding: EdgeInsets.all(4),
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
          //WORD
          Align(
            alignment: Alignment.bottomRight,
            child: Padding(
              padding: const EdgeInsets.only(bottom: 10, right: 10),
              child: Text(
                categoryController.categoryList.value[index].name,
                style: GoogleFonts.ibmPlexSans(
                  fontWeight: FontWeight.w700,
                  fontSize: Dimens.font_16sp,
                  color: Colors.white,
                  letterSpacing: 0,
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
          color: Colors.white10,
          padding: EdgeInsets.all(28.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              SizedBox(
                height: 24,
              ),
              Text(
                'Select Language',
                style: GoogleFonts.ibmPlexSans(
                  fontWeight: FontWeight.w600,
                  fontSize: Dimens.font_20sp,
                  color: Colors.black,
                  letterSpacing: 0,
                ),
              ),
              Text(
                'Choose language according to your preference.',
                style: GoogleFonts.ibmPlexSans(
                  fontWeight: FontWeight.w700,
                  fontSize: Dimens.font_14sp,
                  color: Colors.black54,
                  letterSpacing: 0,
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
