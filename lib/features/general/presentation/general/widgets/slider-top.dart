import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../data/models/general/slider-image-model.dart';
import '../../blocs/slider_bloc/slider_bloc.dart';
import '../../blocs/slider_bloc/slider_event.dart';
import '../../blocs/slider_bloc/slider_state.dart';

class SliderTop extends StatelessWidget {
  SliderTop({super.key});

  final PageController _pageController = PageController(initialPage: 0);
  late int imagesCount;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SliderBloc, SliderState>(
      builder: (context, state) {
        if (state is SliderLoadingState) {
          BlocProvider.of<SliderBloc>(context)
              .add(LoadSliderEvent());
          return const Center(
            child: CircularProgressIndicator(),
          );
        }
        if (state is SliderLoadedState) {
          List<SliderImageModel> sliderList = state.sliders;
          imagesCount = sliderList.length;
        return SizedBox(
          height: 250.h,
          width: 375.w,
          child: Stack(children: [
            PageView.builder(
                itemCount: imagesCount,
                pageSnapping: true,
                controller: _pageController,
                onPageChanged: (page) {
                  BlocProvider.of<SliderBloc>(context).add(ChangeActivePageEvent(
                      state.sliders,
                      page));
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
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 24.sp,
                                fontFamily: 'Jost',
                                fontWeight: FontWeight.w700,
                                height: 24.h / 24.sp,
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
                    children: indicators(imagesCount, state.currPage)),
              ),
            )
          ]),
        );
        }
        if (state is SliderErrorState) {
          return Center(
            child: Text(state.error.toString()),
          );
        }
        return Container();
      },
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
