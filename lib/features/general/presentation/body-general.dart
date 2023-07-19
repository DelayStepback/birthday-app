import 'package:birthday_app/features/general/presentation/widgets/menu/menu-grid.dart';
import 'package:birthday_app/features/general/presentation/widgets/slider-top.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class BodyGeneral extends StatelessWidget {
  const BodyGeneral({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SliderTop(),
        Padding(
          padding: EdgeInsets.only(left: 16.w, right: 27.w, top: 16.h),
          child: Text(
            'Приглашаю своих дорогих друзей отметить мой день рождения в замечательном месте с множеством развлечений, вкусных блюд и хорошим настроением!',
            style: TextStyle(
              color: Color(0xFF161010),
              fontSize: 14.sp,
              fontFamily: 'Jost',
              fontWeight: FontWeight.w400,
            ),
          ),
        ),
        SizedBox(height: 15.h,),

        Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.w),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
                NavButtonGeneral(title: 'Список гостей'),
              NavButtonGeneral(title: 'Вишлист')
            ],
          ),
        ),
        SizedBox(height: 30.h,),
        Text(
          'Меню',
          textAlign: TextAlign.center,
          style: TextStyle(
            color: Colors.black,
            fontSize: 24,
            fontFamily: 'Yeseva One',
            fontWeight: FontWeight.w400,
          ),
        ),
        SizedBox(height: 16.h,),
        MenuGrid(),
        SizedBox(height: 30.h,),
        Text(
          'Развлечения',
          textAlign: TextAlign.center,
          style: TextStyle(
            color: Colors.black,
            fontSize: 24,
            fontFamily: 'Yeseva One',
            fontWeight: FontWeight.w400,
          ),
        ),

      ],
    );
  }
}


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
          color: Color(0xFFFDAC07),
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