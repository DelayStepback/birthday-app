import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SliderTop extends StatefulWidget {
  const SliderTop({super.key});

  @override
  State<SliderTop> createState() => _SliderTopState();
}

class _SliderTopState extends State<SliderTop> {
  int imagesCount = 4;
  int activePage = 1;
  PageController _pageController = PageController(initialPage: 1);

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
                  'assets/images/general/image-slider-${pagePosition + 1}.png',
                  fit: BoxFit.cover,
                ),
                Padding(
                  padding: EdgeInsets.all(15),
                  child: Container(
                    width: 128,
                    height: 63,
                    padding: const EdgeInsets.all(8),
                    decoration: ShapeDecoration(
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(4)),
                    ),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          '25 августа\n2023',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 24,
                            fontFamily: 'Jost',
                            fontWeight: FontWeight.w700,
                            height: 1,
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
    return Container(
      margin: EdgeInsets.all(3),
      width: currentIndex == index ? 30 : 5,
      height: 5,
      decoration: BoxDecoration(
          color: Colors.white,
          shape: currentIndex == index ? BoxShape.rectangle : BoxShape.circle,
          borderRadius: currentIndex == index
              ? BorderRadius.all(Radius.circular(39))
              : null),
    );
  });
}