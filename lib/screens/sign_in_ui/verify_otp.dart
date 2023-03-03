import 'dart:developer';

import 'package:digiyug/routes/router.dart';
import 'package:digiyug/util/app_constants.dart';
import 'package:digiyug/util/theme/theme_manager.dart';
import 'package:dx_generator/dx_generator.dart';
import 'package:dx_router/dx_router.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';
import 'package:get/get.dart';
import 'package:get/get_connect/http/src/utils/utils.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../util/styles.dart';

@GenerateDxRoute()
class Verify extends StatelessWidget {
  const Verify({super.key});

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        DxRouter.pop(context);
        return true;
      },
      child: Scaffold(
        body: SingleChildScrollView(
          child: Stack(
            children: [
              _bgImage(),
              _body(),
            ],
          ),
        ),
      ),
    );
  }

  static String _code = '';

  Column _body() {
    return Column(
      children: [
        Container(
          width: Get.width,
          height: Get.height,
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: [AppColors.transparent, AppColors.blackSecond],
              begin: Alignment.centerRight,
              end: Alignment.bottomRight,
            ),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              SizedBox(
                height: 98,
              ),
              Expanded(
                child: Center(
                  child: Container(
                    height: Get.height * 0.4,
                    width: Get.width * 0.9,
                    color: AppColors.transparent,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Expanded(
                          flex: 1,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Verify OTP ",
                                style: GoogleFonts.ibmPlexSans(
                                  fontWeight: FontWeight.w700,
                                  fontSize: Dimens.font_24sp,
                                  color: Colors.white,
                                  letterSpacing: 1,
                                ),
                              ),
                              const SizedBox(
                                height: 8,
                              ),
                              Text(
                                "Please Verify Your Number To Use",
                                style: GoogleFonts.ibmPlexSans(
                                    fontWeight: FontWeight.w500,
                                    fontSize: Dimens.font_14sp,
                                    color: Colors.white,
                                    letterSpacing: 1),
                              ),
                              const SizedBox(
                                height: 2,
                              ),
                              const Text(
                                "Our Services.",
                                style: robotoBold,
                              ),
                            ],
                          ),
                        ),
                        OtpTextField(
                          fieldWidth: 50,
                          numberOfFields: 6,
                          filled: true,
                          fillColor: Colors.white,
                          enabledBorderColor: Colors.white30,

                          //set to true to show as box or false to show as dash
                          showFieldAsBox: true,
                          //runs when a code is typed in
                          onCodeChanged: (String code) {
                            //handle validation or checks here
                            _code = "${_code}${code}";
                            log(_code);
                          },
                          //runs when every textfield is filled
                          onSubmit: (String verificationCode) {
                            // DxRouter.to(DxOnBoardingPage(), Get.context!);

                            Get.toNamed(MRouter.select_category);
                          }, // end onSubmit
                        ),
                        Expanded(
                          flex: 1,
                          child: GestureDetector(
                            onTap: () {
                              if (_code.length < 6) {
                                showDialog(
                                  context: Get.context!,
                                  builder: (context) {
                                    return const AlertDialog(
                                      title: Text("Error!"),
                                      content: Text("Enter a valid OTP"),
                                    );
                                  },
                                );
                              } else {
                                // DxRouter.to(DxOnBoardingPage(), Get.context!);
                              }
                            },
                            child: Center(
                                child: Container(
                              width: Get.width,
                              height: 52,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(
                                    8.0), //Use this code to make rounded corners
                                color: AppColors.buttonColor,
                              ),
                              child: const Center(
                                  child: Text(
                                "Verify",
                                style: robotoBold,
                              )),
                            )),
                          ),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            GestureDetector(
                              onTap: () {
                                showDialog(
                                  context: Get.context!,
                                  builder: (context) {
                                    return const AlertDialog(
                                      title: Text("Resent OTP successfully"),
                                      content: Text('Succesfully resent OTP'),
                                    );
                                  },
                                );
                              },
                              child: const Text(
                                "Resend OTP?",
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: Dimens.font_16sp,
                                    fontWeight: FontWeight.w500),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Text('Proud to be Indian',
                      style: GoogleFonts.ibmPlexSans(
                        fontWeight: FontWeight.w400,
                        fontSize: Dimens.font_14sp,
                        color: Colors.white,
                      )),
                  SizedBox(
                    height: Get.height * 0.01,
                  ),
                  RichText(
                    text: TextSpan(
                      children: <TextSpan>[
                        TextSpan(
                          text: 'Digiyug ',
                          style: GoogleFonts.ibmPlexSans(
                            fontWeight: FontWeight.w600,
                            fontSize: Dimens.font_14sp,
                            color: Colors.white,
                          ),
                        ),
                        const TextSpan(text: 'Terms  & Conditions Applied.'),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: Get.height * 0.03,
                  ),
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }

  Column _bgImage() {
    return Column(
      children: [
        SizedBox(
          width: Get.width,
          height: Get.height,
          child: Stack(
            children: [
              Stack(
                children: [
                  Container(
                    height: Get.height,
                    width: Get.width,
                    child: Image.asset(
                      AppImages.signupModuleBG,
                      width: Get.width,
                      height: Get.height,
                      fit: BoxFit.fitHeight,
                      colorBlendMode: BlendMode.colorBurn,
                    ),
                  ),
                  Container(
                    height: Get.height,
                    width: Get.width,
                    decoration:
                        BoxDecoration(color: Colors.black.withOpacity(0.3)),
                  )
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }
}

// class CustomInputFormatter extends TextInputFormatter {
//   @override
//   TextEditingValue formatEditUpdate(
//       TextEditingValue oldValue, TextEditingValue newValue) {
//     var text = newValue.text;

//     if (newValue.selection.baseOffset == 0) {
//       return newValue;
//     }

//     var buffer = StringBuffer();
//     for (int i = 0; i < text.length; i++) {
//       buffer.write(text[i]);
//       var nonZeroIndex = i + 1;
//       if (nonZeroIndex % 4 == 0 && nonZeroIndex != text.length) {
//         buffer.write(' ');
//       }
//     }

//     var string = buffer.toString();
//     return newValue.copyWith(
//         text: string,
//         selection: TextSelection.collapsed(offset: string.length));
//   }
// }
