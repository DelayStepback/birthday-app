import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../data/models/general/slider-image-model.dart';
import '../../../data/models/general_data/slider-data.dart';

class SliderTop extends StatefulWidget {
  const SliderTop({super.key});

  @override
  State<SliderTop> createState() => _SliderTopState();
}

class _SliderTopState extends State<SliderTop> {
  int activePage = 1;
  final PageController _pageController = PageController(initialPage: 1);
  final List<SliderImageModel> sliderList = SliderData().getSliderList();
  late int imagesCount;

  @override
  void initState() {
    // TODO: implement initState
    imagesCount = sliderList.length;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 250.h,
      width: 375.w,
      child: Stack(children: [
        PageView.builder(
            itemCount: imagesCount,
            pageSnapping: true,
            controller: _pageController,
            onPageChanged: (page) {
              setState(() {
                activePage = page;
              });
            },
            itemBuilder: (context, pagePosition) {
              return Stack(fit: StackFit.expand, children: [
                Image.asset(
                  sliderList[pagePosition].filePath,
                  fit: BoxFit.cover,
                ),
                Padding(
                  padding: const EdgeInsets.all(15),
                  child: Container(
                    width: 128,
                    height: 63,
                    padding: const EdgeInsets.all(8),
                    decoration: ShapeDecoration(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(4)),
                    ),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          sliderList[pagePosition].title,
                          style:  TextStyle(
                            color: Colors.white,
                            fontSize: 24.sp,
                            fontFamily: 'Jost',
                            fontWeight: FontWeight.w700,
                            height: 24.h/24.sp,
                          ),
                        ),
                      ],
                    ),
                  ),
                )
              ]);
            }),
        Positioned.fill(
          bottom: 11.h,
          child: Align(
            alignment: Alignment.bottomCenter,
            child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: indicators(imagesCount, activePage)),
          ),
        )
      ]),
    );
  }
}

List<Widget> indicators(imagesLength, currentIndex) {
  return List<Widget>.generate(imagesLength, (index) {
    return AnimatedContainer(
      duration: Duration(seconds: 2),
      margin: const EdgeInsets.all(3),
      width: currentIndex == index ? 30 : 5,
      height: 5,
      decoration: BoxDecoration(
          color: Colors.white,
//          shape: currentIndex == index ? BoxShape.rectangle : BoxShape.circle,
          borderRadius: currentIndex == index
              ? const BorderRadius.all(Radius.circular(39))
              : const BorderRadius.all(Radius.circular(51))),
    );
  });
}
