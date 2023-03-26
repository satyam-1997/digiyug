import 'package:flutter/material.dart';

class Slide {
  String text1;
  String title;
  String text3;
  String desc2;
  String desc3;
  int price;
  String text2;
  final Color? color;
  final Color? colortext;
  String textplan;

  Slide({
    required this.text1,
    required this.title,
    required this.text3,
    required this.desc2,
    required this.desc3,
    required this.price,
    required this.text2,
    required this.color,
    required this.colortext,
    required this.textplan,
  });
}

final slideList = [
  Slide(
      text1: "Sliver Plane",
      title: "Free",
      text3: "Selected",
      desc2: "You can make 1 poster",
      desc3: "With Watermark",
      price: 0,
      text2: "With ads",
      color: Color(0xffD9D9D9).withOpacity(0.4),
      colortext: Colors.black,
      textplan: '1 month'),
  Slide(
      text1: "Platinum Plane",
      title: "Platinum",
      text3: "Selected",
      desc2: "You can make 5 poster",
      desc3: "With Watermark",
      price: 0,
      text2: "With ads",
      color: Color(0xffD9D9D9).withOpacity(0.8),
      colortext: Colors.white,
      textplan: ''),
  Slide(
      text1: "Gold Plane",
      title: "Gold",
      text3: "Selected",
      desc2: "You can make unlimited poster",
      desc3: "No Watermark",
      price: 0,
      text2: "Without ads",
      color: Color(0xffF2C94C),
      colortext: Colors.white,
      textplan: ''),
];

class Planes extends StatelessWidget {
  String plantext;
  VoidCallback onTap;
  Planes({required this.plantext, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.only(top: 50, left: 3),
        child: SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Container(
                    width: 106,
                    height: 45,
                    margin: EdgeInsets.all(4),
                    child: ElevatedButton.icon(
                        style: ElevatedButton.styleFrom(
                            side: const BorderSide(
                                color: Color(0xffCACACA), width: 1),
                            backgroundColor: Colors.white),
                        onPressed: onTap,
                        icon: const Icon(
                          Icons.circle_rounded,
                          color: Colors.black,
                          size: 5,
                        ),
                        label: Text(
                          plantext,
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: 12,
                              fontWeight: FontWeight.w600),
                        )),
                  ),
                ])));
  }
}
