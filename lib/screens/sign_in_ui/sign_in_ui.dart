
import 'package:digiyug/routes/router.dart';
import 'package:digiyug/util/app_constants.dart';
import 'package:digiyug/util/theme/theme_manager.dart';
import 'package:dx_generator/dx_generator.dart';
import 'package:dx_router/dx_router.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:get/get.dart';
import 'package:get/get_connect/http/src/utils/utils.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../util/styles.dart';

@GenerateDxRoute(
  isInitialRoute: true,
)
class SignIn extends StatefulWidget {
  SignIn({super.key});

  @override
  State<SignIn> createState() => _SignInState();
}

class _SignInState extends State<SignIn> {

  @override
  void initState() {
    super.initState();
    getMobilePopup();

  }
  //fun for show mobile numbers
  Future<void> getMobilePopup() async {
    // try {
    //   // var data = await autofill.hint ?? '';
    //   // var buffer = new StringBuffer();
    //   // if (data.isNotEmpty) {
    //   //   mobileno = data.substring(3);
    //   //   for (int i = 0; i < mobileno!.length; i++) {
    //   //     buffer.write(mobileno![i]);
    //   //     var nonZeroIndex = i + 1;
    //   //     if (nonZeroIndex % 4 == 0 && nonZeroIndex != mobileno!.length) {
    //   //       buffer.write(' ');
    //   //     }
    //   //   }
    //   //   var autoSelectNumber = buffer.toString();
    //   //   mobileno = autoSelectNumber;
    //   //   mobileno = mobileno.toString() + ' ';
    //   //   _textController.text =
    //   //       FlutterLibphonenumber().formatNumberSync(mobileno.toString());
    //   }
    // } catch (e) {}
  }
  final TextEditingController phoneController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        return false;
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
              SizedBox(height: 98,),
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
                                "Sign In",
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
                        Container(
                          height: Get.height * 0.09,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(6),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(2.0),
                            child: Center(
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: FormBuilderTextField(

                                  inputFormatters: [
                                    FilteringTextInputFormatter.digitsOnly,

                                    LengthLimitingTextInputFormatter(10),
                                  ],
                                  style: const TextStyle(
                                      letterSpacing: 2,
                                      color: Colors.black,
                                      fontSize: Dimens.font_18sp,
                                      fontWeight: FontWeight.w800),
                                  name: 'mobile',
                                  autofocus: false,
                                  autocorrect: false,

                                  controller: phoneController,
                                  keyboardType: TextInputType.phone,
                                  decoration:  InputDecoration(
                                      errorStyle: robotoBold,
                                      border: InputBorder.none,
                                      hintText: "● ● ● ● ● ● ● ● ● ●",
                                      hintStyle: TextStyle(
                                        color: Color(0xffD9D9D9),
                                        fontSize: Dimens.font_18sp,
                                        fontWeight: FontWeight.w800,
                                        letterSpacing: 2,
                                        decorationThickness: 2,
                                        decorationStyle:
                                            TextDecorationStyle.solid,
                                      ),
                                      // prefixText: "+91 ",
                                      // prefixStyle:  TextStyle(
                                      //     color: Colors.black,
                                      //     fontSize: Dimens.font_16sp),
                                      prefixIcon: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        mainAxisSize: MainAxisSize.min,
                                        children: [
                                          Text(
                                            "+91 | ",
                                            style: TextStyle(
                                              color: Colors.black,
                                              fontSize: Dimens.font_18sp,
                                              fontWeight: FontWeight.w800,
                                              letterSpacing: 2,
                                            ),
                                          ),
                                        ],
                                      )),
                                ),
                              ),
                            ),
                          ),
                        ),
                        Expanded(
                          flex: 1,
                          child: GestureDetector(
                            onTap: () {
                              if (phoneController.value.text.length < 10) {
                                showDialog(
                                  context: Get.context!,
                                  builder: (context) {
                                    return const AlertDialog(
                                      title: Text("Error!"),
                                      content:
                                          Text("Enter a valid phone number"),
                                    );
                                  },
                                );
                              } else {
                                // DxRouter.to(DxVerify(), Get.context!);
                                Get.toNamed(MRouter.otp_screen);
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
                        )
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
