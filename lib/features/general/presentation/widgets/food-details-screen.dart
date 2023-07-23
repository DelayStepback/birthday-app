import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class FoodDetailsScreen extends StatefulWidget {
  final String imagePath;
  final String titleName;

  const FoodDetailsScreen(
      {super.key, required this.imagePath, required this.titleName});

  @override
  State<FoodDetailsScreen> createState() => _FoodDetailsScreenState();
}

class _FoodDetailsScreenState extends State<FoodDetailsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: InkWell(child: Icon(Icons.arrow_back_ios),
        onTap: () => Navigator.pop(context),),
        title: Text(widget.titleName),
        centerTitle: true,

      ),
      body: Hero(
        tag: widget.imagePath,
        child: GestureDetector(
          onTap: () => {
            Navigator.pop(context)
          },
          child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      height: 140.w,
                      width: 140.w,
                      decoration: BoxDecoration(
                        image: DecorationImage(
                            fit: BoxFit.cover,
                            image: AssetImage(
                                widget.imagePath)),
                        borderRadius: const BorderRadius.all(
                            Radius.circular(30.0)),
                      ),
                    ),
                  ],
                ),
                Align(
                  alignment: Alignment.center,
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 0.w),
                    child: Text(
                      widget.titleName,
                      textAlign: TextAlign.left,
                      style: TextStyle(
                        color: const Color(0xFF4D4242),
                        fontSize: 14.sp,
                        fontFamily: 'Jost',
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ),
                ),
              ])
        ),
      ),
    );
  }
}
