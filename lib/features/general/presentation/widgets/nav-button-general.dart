import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class NavButtonGeneral extends StatelessWidget {
  final String title;
  const NavButtonGeneral({super.key, required this.title, navigate});


  @override
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius: BorderRadius.circular(15.0),
      onTap: () {

      },
      child: Container(
        width: 156.w,
        height: 50.h,
        padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 12.h),
        decoration: ShapeDecoration(
          color: const Color(0xFFFDAC07),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15),
          ),
        ),
        child:
        Center(
          child: Text(
            title,
            style: TextStyle(
              color: Colors.white,
              fontSize: 16.sp,
              fontFamily: 'Jost',
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
      ),
    );
  }
}
