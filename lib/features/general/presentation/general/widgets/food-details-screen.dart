import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../utils/appBar-regular.dart';

class FoodDetailsScreen extends StatefulWidget {
  final String imagePath;
  final String titleName;
  final List<String> ingredients;

  const FoodDetailsScreen(
      {super.key,
      required this.imagePath,
      required this.titleName,
      required this.ingredients});

  @override
  State<FoodDetailsScreen> createState() => _FoodDetailsScreenState();
}

class _FoodDetailsScreenState extends State<FoodDetailsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
          preferredSize: Size.fromHeight(48.h),
          child: AppBarRegular(titleName: widget.titleName, appBar: AppBar(),)),
      body: SingleChildScrollView(
        child: GestureDetector(
          onTap: () => {Navigator.pop(context)},
          child: Column(
            children: [
              SizedBox(
                height: 216.w,
                child: Stack(
                  children: [
                    Positioned(
                      left: 100.w,
                      top: -48.w,
                      child: Container(
                        width: 357.w,
                        height: 264.w,
                        decoration: ShapeDecoration(
                          shape: const OvalBorder(),
                          image: DecorationImage(
                              fit: BoxFit.cover,
                              image: AssetImage(widget.imagePath)),
                        ),
                      ),
                    ),
                    Positioned(
                      left: 16.w,
                      bottom: 26,
                      child: Text(
                        widget.titleName,
                        textAlign: TextAlign.left,
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 24.sp,
                          fontFamily: 'Yeseva One',
                          fontWeight: FontWeight.w400,
                          height: 24 / 24,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 34,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: GridView.builder(
                  physics: const NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    mainAxisSpacing: 0,
                    crossAxisSpacing: 0,
                    childAspectRatio: 4.w,
                    crossAxisCount: 2,
                  ),
                  itemCount: widget.ingredients.length,
                  itemBuilder: (BuildContext ctx, index) {
                    return Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Image.asset('assets/images/general/fork.png'),
                        const SizedBox(
                          width: 17,
                        ),
                        Flexible(
                          child: Text(
                            widget.ingredients[index],
                            style: TextStyle(
                              color: const Color(0xFF4E4343),
                              fontSize: 14.sp,
                              fontFamily: 'Jost',
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                        )
                      ],
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}


