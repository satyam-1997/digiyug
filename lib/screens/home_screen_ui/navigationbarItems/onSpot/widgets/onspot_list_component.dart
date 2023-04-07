part of onspot_screen;

class OnSpotListComponent extends StatelessWidget {
  const OnSpotListComponent({
    super.key,
    required this.title,
    required this.list,
    // required this.list,
  });
  final String title;
  final List<dynamic> list;

  @override
  Widget build(BuildContext context) {
    // Vertical list

    return Container(
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                title,
                style: TextStyle(
                  fontSize: Dimens.font_16sp,
                  fontWeight: FontWeight.w500,
                  color: Colors.black,
                ),
              ),
              InkWell(
                child: Text(
                  "See All",
                  style: TextStyle(
                    color: primaryColor,
                    fontWeight: FontWeight.w500,
                    fontSize: Dimens.font_12sp,
                  ),
                ),
              )
            ],
          ),
          GridView.builder(
            itemCount: 5,
            shrinkWrap: true,
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              crossAxisSpacing: 4.0,
              mainAxisSpacing: 4.0,
            ),
            itemBuilder: (context, index) {
              return _individualGrids(
                index,
                "Some Text",
                "asset/images/common_people.png",
              );
            },
          )
        ],
      ),
    );

    // Horizontal list
  }

  _individualGrids(
    int index,
    String text,
    String image,
  ) {
    return GestureDetector(
      onTap: () {
        _redirectToWhatsapp(index);
      },
      child: Padding(
        padding: const EdgeInsets.only(right: 8),
        child: Container(
          height: Get.height * 0.2,
          width: Get.width * 0.435,
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
                      image,
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
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Align(
                  alignment: Alignment.topRight,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: SvgPicture.asset("asset/whatsapp_icon.svg"),
                  ),
                ),
              ),

              //word
              Align(
                alignment: Alignment.bottomRight,
                child: Padding(
                  padding: const EdgeInsets.only(bottom: 20, right: 10),
                  child: Text(
                    text,
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
        ),
      ),
    );
  }

  _redirectToWhatsapp(int index) {
    var whatsappAndroid = Uri.parse("https://wa.me/");
    UrlLauncher.launch(whatsappAndroid.toString());
  }
}
