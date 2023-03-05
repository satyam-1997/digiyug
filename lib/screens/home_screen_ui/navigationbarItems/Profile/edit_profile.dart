import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../Common/constants.dart';

class EditProfile extends StatefulWidget {
  const EditProfile({super.key});

  @override
  State<EditProfile> createState() => _EditProfileState();
}

class _EditProfileState extends State<EditProfile> {
  final _formKeyUsername = GlobalKey<FormState>();
  final _formKeyMobileNumber = GlobalKey<FormState>();
  final _formKeyEmail = GlobalKey<FormState>();
  final _formKeyPassword = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 70.0,
        automaticallyImplyLeading: false,
        title: SizedBox(
          height: 35.0,
          width: 120.0,
          child: Row(
            children: [
              InkWell(
                onTap: (){
                  Navigator.of(context).pop();
                },
                child: Icon(
                  Icons.arrow_back_ios,
                  color: primaryColor,
                ),
              ),
              Text(
                'DigiYug',
                style: TextStyle(
                    fontFamily: 'IBMPlexSansHebrewBold',
                    fontWeight: FontWeight.w600,
                    color: primaryColor,
                    fontSize: 25.0),
              ),
            ],
          ),
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
        child: Container(
          margin: EdgeInsets.only(left: 10, right: 10),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                child: Text('Complete your details',style: TextStyle(color: Colors.black,fontSize: 16,fontWeight: FontWeight.w600),),
              ),
              Row(
                children: [
                  Column(
                    children: [
                      Center(child: Icon(Icons.support,size: 70,)),
                      SizedBox(height: 4),
                      Container(
                        child: Text('Company logo',style: TextStyle(color: Colors.black,fontSize: 14,fontWeight: FontWeight.w600),),
                      ),                    ],
                  ),
                  SizedBox(width: 20,),
                  Column(
                    children: [
                      Container(
                          margin: EdgeInsets.all(10),
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(50)
                          ),
                          height: 60,
                          width: 60,
                          // color: Colors.black,
                          child: Icon(Icons.person,size: 55)),
                      Container(
                        child: Text('Profile Pic',style: TextStyle(color: Colors.black,fontSize: 14,fontWeight: FontWeight.w600),),
                      ),                    ],
                  )
                ],
              ),

SizedBox(height: 20,),
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Enter your name',
                  style: TextStyle(color: Colors.grey),
                  ),
                  SizedBox(height: 7,),
                  TextFormField(
                    validator: (value) {
                      if (value!.isNotEmpty) {
                        return null;
                      } else {
                        return 'Enter your name';
                      }
                    },
                    decoration: InputDecoration(
                        isDense: true,
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(4)),
                        label: const Text(''),
                        focusColor: primaryColor),
                    // controller: usernameTextEditingController,
                  ),
                ],
              ),
              SizedBox(
                height: 10,
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Enter mobile number',
                    style: TextStyle(color: Colors.grey),
                  ),
                  SizedBox(height: 7,),
                  TextFormField(
                    validator: (value) {
                      if (value!.isNotEmpty) {
                        return null;
                      } else {
                        return 'Enter your name';
                      }
                    },
                    decoration: InputDecoration(
                        isDense: true,
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(4)),
                        label: const Text(''),
                        focusColor: primaryColor),
                    // controller: usernameTextEditingController,
                  ),
                ],
              ),
              SizedBox(
                height: 10,
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Enter your email',
                    style: TextStyle(color: Colors.grey),
                  ),
                  SizedBox(height: 7,),
                  TextFormField(
                    validator: (value) {
                      if (value!.isNotEmpty) {
                        return null;
                      } else {
                        return 'Enter your email';
                      }
                    },
                    decoration: InputDecoration(
                        isDense: true,
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(4)),
                        label: const Text(''),
                        focusColor: primaryColor),
                    // controller: usernameTextEditingController,
                  ),
                ],
              ),
              SizedBox(
                height: 10,
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('State',
                    style: TextStyle(color: Colors.grey),
                  ),
                  SizedBox(height: 7,),
                  TextFormField(
                    validator: (value) {
                      if (value!.isNotEmpty) {
                        return null;
                      } else {
                        return 'Enter your email';
                      }
                    },
                    decoration: InputDecoration(
                        isDense: true,
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(4)),
                        label: const Text(''),
                        focusColor: primaryColor),
                    // controller: usernameTextEditingController,
                  ),
                ],
              ),
              SizedBox(
                height: 10,
              ),
              TextFormField(
                validator: (value) {
                  if (value!.isNotEmpty) {
                    return null;
                  } else {
                    return 'Enter your email';
                  }
                },
                decoration: InputDecoration(
                    isDense: true,
                    prefixIcon: Image.asset("asset/images/facebookIcon.webp",
                      width: 10,
                      height: 10,
                    ),

                    border: OutlineInputBorder(

                        borderRadius: BorderRadius.circular(4)),
                    label: const Text(''),
                    focusColor: primaryColor),
                // controller: usernameTextEditingController,
              ),
              SizedBox(height: 10,),
              TextFormField(
                validator: (value) {
                  if (value!.isNotEmpty) {
                    return null;
                  } else {
                    return 'Enter your email';
                  }
                },
                decoration: InputDecoration(
                    isDense: true,
                    prefixIcon: Image.asset("asset/images/insta.jpeg",
                      width: 10,
                      height: 10,
                    ),

                    border: OutlineInputBorder(

                        borderRadius: BorderRadius.circular(4)),
                    label: const Text(''),
                    focusColor: primaryColor),
                // controller: usernameTextEditingController,
              ),
              SizedBox(
                height: 10,
              ),
              TextFormField(
                validator: (value) {
                  if (value!.isNotEmpty) {
                    return null;
                  } else {
                    return 'Enter your email';
                  }
                },

                decoration: InputDecoration(
                  isDense: true,
                    prefixIcon: Container(
                      height: 2,
                      width: 2,
                      child: Image.asset("asset/images/twitericon.png",
                      width: 2,
                        height: 2,
                      ),
                    ),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(4)),
                    label: const Text(''),
                    focusColor: primaryColor),
                // controller: usernameTextEditingController,
              ),

              SizedBox(
                height: 20,
              ),
              SizedBox(
                width: double.infinity,
                height: 50.0,
                child: ElevatedButton(
                  style: ButtonStyle(
                    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                        RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(5.0),
                            side: BorderSide(color: primaryColor))),
                    elevation: MaterialStateProperty.all(3.0),
                    backgroundColor: MaterialStateProperty.all(primaryColor),
                    foregroundColor: MaterialStateProperty.all(Colors.white),
                  ),
                  child: Text(
                    'Save',
                    style: TextStyle(
                        color: Colors.white, fontSize: 18, letterSpacing: 0.6),
                  ),
                  onPressed: () {
                    // if (!_formKeyUsername.currentState!.validate() || !_formKeyMobileNumber.currentState!.validate() ||!_formKeyEmail.currentState!.validate() || !_formKeyPassword.currentState!.validate() ) {
                    //   return;
                    // } else if(_signUpController.passwordTextEditingController.text.length < 6 ) {
                    //   Fluttertoast.showToast(msg: "Sorry!! You can't enter less than 6 character of password!!");
                    // }else{
                    //   setState(() {
                    //     _signUpController.isLoading.value = true;
                    //   });
                    //   _signUpController.signUpClick();
                    // }
                  },
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
