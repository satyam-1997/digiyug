import 'dart:developer';

import 'package:digiyug/screens/category/category_list_model.dart';
import 'package:digiyug/util/theme/theme_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:onboarding_overlay/onboarding_overlay.dart';

class CategoryController extends GetxController {
  Rx<List<CategoryModel>> categoryList = Rx<List<CategoryModel>>([]);
  Rx<List<CategoryModel>> selectedcategoryList = Rx<List<CategoryModel>>([]);
  RxBool isEnglishSelected = false.obs;
  RxBool isHindiSelected = false.obs;
  RxBool isLangSelected = false.obs;
  final List<FocusNode> overlayKeys = <FocusNode>[
    FocusNode(),
  ];
  final List<OnboardingStep> steps = [];
  final GlobalKey<OnboardingState> onboardingKey = GlobalKey<OnboardingState>();

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    assignCatList();
    steps.add(
      OnboardingStep(
          focusNode: overlayKeys[0],
          titleTextStyle: Theme.of(Get.context!).textTheme.headline5,
          overlayColor: Colors.black.withOpacity(0.5),
          titleText: "",
          arrowPosition: ArrowPosition.top,
          onTapCallback: (area, next, close) {
            if (area == TapArea.overlay || area == TapArea.label) {
              onboardingKey.currentState!.hide();
            }
          },
          stepBuilder: (
            BuildContext context,
            OnboardingStepRenderInfo renderInfo,
          ) {
            return Material(
              color: Colors.transparent,
              child: Stack(
                children: [
                  Align(
                    alignment: Alignment.topRight,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        SvgPicture.asset(
                          "asset/arrow_svg.svg",
                        ),
                        SizedBox(
                          width: Get.width * 0.07,
                        )
                      ],
                    ),
                  ),
                  Align(
                    alignment: Alignment.topLeft,
                    child: Column(
                      children: [
                        SizedBox(
                          height: Get.height * 0.1,
                        ),
                        Row(
                          children: [
                            SizedBox(
                              width: Get.width * 0.1,
                            ),
                            Text(
                              "Select Language",
                              style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.w600,
                                fontSize: 28,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  )
                ],
              ),
            );
          }),
    );
  }
  //
  //  Text(
  //                       "Select Language",
  //                       style: TextStyle(
  //                         color: Colors.white,
  //                         fontWeight: FontWeight.w600,
  //                         fontSize: Dimens.font_28sp,
  //                       ),
  //                     ),//

  assignCatList() {
    categoryList.value = [
      CategoryModel(
        name: "Political",
        svgPath: "political.png",
        isSelected: false,
      ),
      CategoryModel(
        name: "Common people \n/ Store operator",
        svgPath: "common_people.png",
        isSelected: false,
      ),
      CategoryModel(
        name: "Local Business",
        svgPath: "local_business.png",
        isSelected: false,
      ),
      CategoryModel(
        name: "School / Collage / \nHospital / Firms",
        svgPath: "school.png",
        isSelected: false,
      ),
      CategoryModel(
        name: "Social worker",
        svgPath: "social_worker.png",
        isSelected: false,
      ),
      CategoryModel(
        name: "Co-operative \nsocieties",
        svgPath: "co-operative.png",
        isSelected: false,
      ),
    ];
  }

  setIsSelected(int index) {
    if (categoryList.value[index].isSelected == true) {
      selectedcategoryList.value.removeWhere((element) {
        if (element == categoryList.value[index]) {
          return true;
        }
        return false;
      });
      categoryList.value[index].isSelected = false;
    } else {
      if (selectedcategoryList.value.length < 2) {
        categoryList.value[index].isSelected =
            !categoryList.value[index].isSelected;
        selectedcategoryList.value.add(categoryList.value[index]);
      } else {
        Fluttertoast.showToast(
          msg: "You can't select more then 2 category!",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.BOTTOM,
          fontSize: 16.0,
        );
      }
    }
  }
}
