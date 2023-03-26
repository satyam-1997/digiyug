import 'package:digiyug/screens/plans/slide.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class PlansScreen extends StatefulWidget {
  const PlansScreen({super.key});

  @override
  State<PlansScreen> createState() => _PlansScreenState();
}

class _PlansScreenState extends State<PlansScreen> {
  int _currentPage = 0;
  late PageController _pageController;
  var controller = PageController(
    viewportFraction: 0.9,
  );
  @override
  void initState() {
    super.initState();

    _pageController =
        PageController(initialPage: _currentPage, viewportFraction: 1);
    controller = new PageController(
      viewportFraction: 1,
    );
  }

  @override
  void dispose() {
    super.dispose();
    _pageController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Container(
            child: Flexible(
              child: ListView.builder(itemBuilder: (context, _) {
                return SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: [
                      Container(
                        child: Planes(
                          plantext: "1 Month",
                          onTap: () {},
                        ),
                      ),
                      Container(
                        child: Planes(
                          plantext: "3 Months",
                          onTap: () {},
                        ),
                      ),
                      Container(
                        child: Planes(
                          plantext: "6 Months",
                          onTap: () {},
                        ),
                      ),
                      Container(
                        child: Planes(
                          plantext: "12 Months",
                          onTap: () {},
                        ),
                      ),
                    ],
                  ),
                );
              }),
            ),
          ),
          const SizedBox(
            height: 1,
          ),
          Container(
            child: AspectRatio(
              aspectRatio: 0.58,
              child: PageView.builder(
                  itemCount: slideList.length,
                  controller: _pageController,
                  physics: const ClampingScrollPhysics(),
                  itemBuilder: (context, index) {
                    return carouseView(index);
                  }),
            ),
          ),
        ],
      ),
    );
  }

  Widget carouseView(int index) {
    return carouseCard(slideList[index]);
  }

  Widget carouseCard(Slide data) {
    return Scaffold(
      body: Stack(
        //alignment: AlignmentDirectional.bottomCenter,
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 15, left: 20, right: 20),
            child: SizedBox(
              height: Get.height * .8,
              width: Get.width * 2,
              child: Container(
                // ignore: prefer_const_literals_to_create_immutables
                decoration: BoxDecoration(boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.2),
                    offset: const Offset(0, 0),
                    blurRadius: 66,
                    spreadRadius: 2,
                  ),
                ]),
                child: Card(
                  elevation: 5,
                  color: Colors.white,
                  child: Column(
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Container(
                            padding: const EdgeInsets.only(top: 21),
                            child: Text(
                              // slideList[index].text1,
                              data.text1,
                              style: const TextStyle(
                                  fontSize: 25, fontWeight: FontWeight.w700),
                            ),
                          ),
                          SizedBox(
                            height: Get.height * .02,
                          ),
                          Container(
                            width: Get.width * .8,
                            height: Get.height * .15,
                            decoration: BoxDecoration(color: data.color),
                            padding: const EdgeInsets.only(top: 20),
                            child: Text(
                              //slideList[index].title,
                              data.title,
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  fontSize: 60,
                                  fontWeight: FontWeight.w600,
                                  color: data.colortext),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 44,
                      ),
                      Container(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            ListTile(
                              //leading: MyBullet(),
                              title: Text(
                                "\u2022 ${data.desc2}",
                                style: const TextStyle(
                                    color: Color(0xff858585),
                                    fontWeight: FontWeight.w600,
                                    fontSize: 17),
                              ),
                            ),
                            ListTile(
                              //  leading: MyBullet(),
                              title: Text('\u2022 ${data.desc3}',
                                  style: const TextStyle(
                                      color: Color(0xff858585),
                                      fontWeight: FontWeight.w600,
                                      fontSize: 17)),
                            ),
                            ListTile(
                              //  leading: MyBullet(),
                              title: Text('\u2022 ${data.text2}',
                                  style: const TextStyle(
                                      color: Color(0xff858585),
                                      fontWeight: FontWeight.w600,
                                      fontSize: 17)),
                            )
                          ],
                        ),
                      ),
                      SizedBox(
                        height: Get.height * .02,
                      ),
                      Container(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              // slideList[index].price.toString(),
                              data.price.toString(),
                              style: const TextStyle(
                                  fontSize: 64, fontWeight: FontWeight.w600),
                            )
                          ],
                        ),
                      ),
                      SizedBox(
                        height: Get.height * .08,
                      ),
                      Container(
                        child: SizedBox(
                          width: Get.width * .8,
                          height: Get.height * 0.07,
                          child: ElevatedButton(
                            child: Text(
                              // slideList[index].text2,
                              data.text3,
                              style: const TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.w500,
                                  color: Colors.white),
                            ),
                            style: ElevatedButton.styleFrom(
                              primary: const Color(0xffA21B31),
                            ),
                            onPressed: () {},
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
          // Stack(
          //   children: [
          //     Container(
          //       margin: EdgeInsets.only(bottom: 35),
          //       child: Row(children: [
          //         for (int i = 0; i <= slideList.length; i++)
          //           if (i == _currentPage) SlideDots(true) else SlideDots(false)
          //       ]),
          //     )
          //   ],
          // )
        ],
      ),
    );
  }
}

// child: Padding(
//   padding: const EdgeInsets.only(top: 65, left: 3),
//   child: SingleChildScrollView(
//     scrollDirection: Axis.horizontal,
//     child: Row(
//       mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//       children: [
//         Container(
//           width: 106,
//           height: 45,
//           margin: EdgeInsets.all(4),
//           child: ElevatedButton.icon(
//               style: ElevatedButton.styleFrom(
//                   side: const BorderSide(
//                       color: Color(0xffCACACA), width: 1),
//                   backgroundColor: Colors.white),
//               onPressed: () {},
//               icon: const Icon(
//                 Icons.circle_rounded,
//                 color: Colors.black,
//                 size: 5,
//               ),
//               label: Text(
//                 "1 Month",
//                 style: TextStyle(
//                     color: Colors.black,
//                     fontSize: 12,
//                     fontWeight: FontWeight.w600),
//               )),
//         ),
// Container(
//   width: 106,
//   height: 45,
//   margin: EdgeInsets.all(4),
//   child: ElevatedButton.icon(
//       style: ElevatedButton.styleFrom(
//           side: const BorderSide(
//               color: Color(0xffCACACA), width: 1),
//           backgroundColor: Colors.white),
//       onPressed: () {},
//       icon: const Icon(
//         Icons.circle_rounded,
//         color: Colors.black,
//         size: 5,
//       ),
//       label: const Text(
//         "3 Months",
//         style: TextStyle(
//             color: Colors.black,
//             fontSize: 12,
//             fontWeight: FontWeight.w600),
//       )),
// ),
// Container(
//   width: 106,
//   height: 45,
//   margin: EdgeInsets.all(4),
//   child: ElevatedButton.icon(
//       style: ElevatedButton.styleFrom(
//           side: const BorderSide(
//               color: Color(0xffCACACA), width: 1),
//           backgroundColor: Color(0xffA21B31)),
//       onPressed: () {},
//       icon: const Icon(
//         Icons.circle_rounded,
//         color: Color.fromARGB(255, 255, 255, 255),
//         size: 5,
//       ),
//       label: const Text(
//         "6 Months",
//         style: TextStyle(
//             color: Color.fromARGB(255, 255, 255, 255),
//             fontSize: 12,
//             fontWeight: FontWeight.w600),
//       )),
// ),
// Container(
//   width: 106,
//   height: 45,
//   margin: EdgeInsets.all(4),
//   child: ElevatedButton.icon(
//       style: ElevatedButton.styleFrom(
//           side: const BorderSide(
//               color: Color(0xffCACACA), width: 1),
//           backgroundColor: Colors.white),
//       onPressed: () {},
//       icon: const Icon(
//         Icons.circle_rounded,
//         color: Colors.black,
//         size: 5,
//       ),
//       label: const Text(
//         "12 Months",
//         style: TextStyle(
//             color: Colors.black,
//             fontSize: 12,
//             fontWeight: FontWeight.w600),
//       )),
// ),
//       ],
//     ),
//   ),
// ),
