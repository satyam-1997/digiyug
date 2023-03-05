import 'package:digiyug/screens/home_screen_ui/navigationbarItems/Profile/edit_profile.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../Common/constants.dart';

class Profile extends StatefulWidget {
  const Profile({super.key});

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        margin: EdgeInsets.only(left: 10, right: 10),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Card(
              // color: Colors.redAccent,
              child: Container(
                decoration: BoxDecoration(
                    gradient: LinearGradient(
                  colors: [Color(0xffED213A), Color(0xff93291E)],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                )),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  // crossAxisAlignment: CrossAxisAlignment.s,
                  children: [
                    Row(
                      children: [
                        Container(
                            margin: EdgeInsets.all(10),
                            decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(50)),
                            height: 70,
                            width: 70,
                            // color: Colors.black,
                            child: Icon(Icons.person)),
                        Container(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Kundan Singh Panwar",
                                style: TextStyle(
                                    fontSize: 16,
                                    color: Colors.white,
                                    fontWeight: FontWeight.w900,
                                    letterSpacing: 0.3),
                              ),
                              SizedBox(
                                height: 8,
                              ),
                              Text(
                                "+91 9009611093",
                                style: TextStyle(
                                    fontSize: 14,
                                    color: Colors.white,
                                    fontWeight: FontWeight.w900,
                                    letterSpacing: 0.3),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                    InkWell(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute<void>(
                            builder: (BuildContext context) => EditProfile(),
                          ),
                        );
                        // Navigator.pushNamed(context,MRouter.sellAndEarnDetails);
                      },
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Center(
                            child: Icon(
                          Icons.arrow_forward_ios,
                          size: 18,
                          color: Colors.white,
                        )),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.only(left: 10),
              child: Text(
                'Subscription',
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 16,
                    fontWeight: FontWeight.w600),
              ),
            ),
            Container(
                child: Card(
              // color: Colors.redAccent,
              child: Padding(
                padding: const EdgeInsets.only(
                    left: 7.0, top: 15, bottom: 15, right: 7),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  // crossAxisAlignment: CrossAxisAlignment.s,
                  children: [
                    Expanded(
                      child: Container(
                        child: Center(
                          child: Text(
                            "Free Plan",
                            style: TextStyle(
                                fontSize: 22,
                                color: primaryColor,
                                fontWeight: FontWeight.w900,
                                letterSpacing: 0.3),
                          ),
                        ),
                      ),
                    ),
                    InkWell(
                      onTap: () {
                        // Navigator.pushNamed(context,MRouter.sellAndEarnDetails);
                      },
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Center(
                            child: Icon(
                          Icons.arrow_forward_ios,
                          size: 18,
                          color: primaryColor,
                        )),
                      ),
                    ),
                  ],
                ),
              ),
            )),
            Container(
              margin: EdgeInsets.only(left: 10),
              child: Text(
                'Service',
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 16,
                    fontWeight: FontWeight.w600),
              ),
            ),
            ListView.builder(
                itemCount: 6,
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                itemBuilder: (BuildContext context, int index) {
                  return Card(
                    // color: Colors.redAccent,
                    child: Padding(
                      padding: const EdgeInsets.only(
                          left: 7.0, top: 10, bottom: 10, right: 7),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        // crossAxisAlignment: CrossAxisAlignment.s,
                        children: [
                          Expanded(
                            child: Row(
                              children: [
                                Container(
                                    decoration: BoxDecoration(
                                        color: primaryColor,
                                        borderRadius:
                                            BorderRadius.circular(30)),
                                    height: 50,
                                    width: 50,
                                    // color: Colors.black,
                                    child: Icon(
                                      index == 0
                                          ? Icons.support_agent_outlined
                                          : index == 1
                                              ? Icons.translate_outlined
                                              : Icons.room_preferences_rounded,
                                      color: Colors.white,
                                    )),
                                SizedBox(
                                  width: 8,
                                ),
                                Container(
                                  child: Text(
                                    index == 0
                                        ? 'On spot post'
                                        : index == 1
                                            ? 'Change language of post'
                                            : index == 2
                                                ? 'Refer a friend'
                                                : index == 3
                                                    ? 'Change category type'
                                                    : index == 4
                                                        ? "Faq's"
                                                        : index == 5
                                                            ? 'Feedback'
                                                            : "Privacy policy",
                                    style: TextStyle(
                                        color: primaryColor,
                                        fontWeight: FontWeight.w900,
                                        letterSpacing: 0.3),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          InkWell(
                            onTap: () {
                              // Navigator.pushNamed(context,MRouter.sellAndEarnDetails);
                            },
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Center(
                                  child: Icon(
                                Icons.arrow_forward_ios,
                                size: 18,
                                color: primaryColor,
                              )),
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                }),
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
                  'Log out',
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
            ),
            SizedBox(
              height: 20,
            )
          ],
        ),
      ),
    );
  }
}
