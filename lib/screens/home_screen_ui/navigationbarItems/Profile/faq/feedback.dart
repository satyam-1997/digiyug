import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../../../util/theme/theme_manager.dart';

class FeedBackForm extends StatelessWidget {
  FeedBackForm({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Feedback"),
      ),
      body: _body(),
    );
  }

  _body() {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: Get.height * 0.02,
            ),
            Text(
              "Feedback",
              style: GoogleFonts.ibmPlexSans(
                fontWeight: FontWeight.w600,
                fontSize: Dimens.font_16sp,
                color: Colors.black,
                letterSpacing: 1,
              ),
            ),
            SizedBox(
              height: Get.height * 0.02,
            ),
            Text(
              "Enter your name",
              style: GoogleFonts.ibmPlexSans(
                fontWeight: FontWeight.w300,
                fontSize: Dimens.font_12sp,
                color: Colors.black,
                letterSpacing: 1,
              ),
            ),
            SizedBox(
              height: Get.height * 0.01,
            ),
            _textField(
              _nameController,
              "Name",
              1,
            ),
            SizedBox(
              height: Get.height * 0.01,
            ),
            Text(
              "Enter your mobile",
              style: GoogleFonts.ibmPlexSans(
                fontWeight: FontWeight.w300,
                fontSize: Dimens.font_12sp,
                color: Colors.black,
                letterSpacing: 1,
              ),
            ),
            SizedBox(
              height: Get.height * 0.01,
            ),
            _textField(
              _mobileController,
              "Mobile Number",
              1,
            ),
            SizedBox(
              height: Get.height * 0.01,
            ),
            Text(
              "Message",
              style: GoogleFonts.ibmPlexSans(
                fontWeight: FontWeight.w300,
                fontSize: Dimens.font_12sp,
                color: Colors.black,
                letterSpacing: 1,
              ),
            ),
            SizedBox(
              height: Get.height * 0.01,
            ),
            _textField(
              _messageController,
              "Message",
              10,
            ),
            SizedBox(
              height: Get.height * 0.04,
            ),
            SizedBox(
              width: Get.width,
              height: Get.height * 0.06,
              child: ElevatedButton(
                child: Text(
                  'Send',
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
          ],
        ),
      ),
    );
  }

  TextEditingController _nameController = TextEditingController();
  TextEditingController _mobileController = TextEditingController();
  TextEditingController _messageController = TextEditingController();

  _textField(
    TextEditingController controller,
    String hintText,
    int maxLines,
  ) {
    return TextField(
      controller: controller,
      maxLines: maxLines,
      decoration: InputDecoration(
        hintText: hintText,
        hintStyle: GoogleFonts.ibmPlexSans(
          fontWeight: FontWeight.w300,
          fontSize: Dimens.font_12sp,
          color: Colors.black,
          letterSpacing: 1,
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide(
            color: Colors.black,
          ),
        ),
      ),
    );
  }
}
