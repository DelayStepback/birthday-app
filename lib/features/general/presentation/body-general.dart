import 'package:birthday_app/features/general/presentation/widgets/entertainments/entertainments-list-widget.dart';
import 'package:birthday_app/features/general/presentation/widgets/menu/menu-grid.dart';
import 'package:birthday_app/features/general/presentation/widgets/slider-top.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:url_launcher/url_launcher.dart';

class BodyGeneral extends StatelessWidget {
  const BodyGeneral({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        const SliderTop(),
        Padding(
          padding: EdgeInsets.only(left: 16.w, right: 27.w, top: 16.h),
          child: Text(
            'Приглашаю своих дорогих друзей отметить мой день рождения в замечательном месте с множеством развлечений, вкусных блюд и хорошим настроением!',
            style: TextStyle(
              color: const Color(0xFF161010),
              fontSize: 14.sp,
              fontFamily: 'Jost',
              fontWeight: FontWeight.w400,
            ),
          ),
        ),
        SizedBox(height: 15.h,),

        Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.w),
          child: const Row(
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
            fontSize: 24.sp,
            fontFamily: 'Yeseva One',
            fontWeight: FontWeight.w400,
          ),
        ),
        const SizedBox(height: 16,),
        const MenuGrid(),
        const SizedBox(height: 30,),
        Text(
          'Развлечения',
          textAlign: TextAlign.center,
          style: TextStyle(
            color: Colors.black,
            fontSize: 24.sp,
            fontFamily: 'Yeseva One',
            fontWeight: FontWeight.w400,
          ),
        ),
        const EntertainmentsListView(),
        const SizedBox(height: 30,),
        Text(
          'Место',
          textAlign: TextAlign.center,
          style: TextStyle(
            color: Colors.black,
            fontSize: 24.sp,
            fontFamily: 'Yeseva One',
            fontWeight: FontWeight.w400,
          ),
        ),
        const SizedBox(height: 16,),
        Container(
          width: 343.w,
          height: 246.w,
          decoration: const ShapeDecoration(
            image: DecorationImage(
              image: AssetImage("assets/images/general/map.png"),
              fit: BoxFit.fill,
            ),
            shape: RoundedRectangleBorder(
              side: BorderSide(width: 0.50, color: Color(0xFF4E4343)),
            ),
          ),
        ),
        Text(
          'Центральная ул., 84, хутор Седых',
          style: TextStyle(
            color: const Color(0xFF4D4242),
            fontSize: 14.sp,
            fontFamily: 'Jost',
            fontWeight: FontWeight.w400,
          ),
        ),
        const SizedBox(height: 10,),
        GestureDetector(
          onTap: () => _launchUrl('https://prosto-les.clients.site/'),
          child: Text(
            'Перейти на сайт места',
            style: TextStyle(
              color: const Color(0xFF171010),
              fontSize: 14.sp,
              fontFamily: 'Jost',
              fontWeight: FontWeight.w400,
              decoration: TextDecoration.underline,
            ),
          ),
        ),
        const SizedBox(height: 104,),


      ],
    );
  }
  Future<void> _launchUrl(url) async {
    final Uri _url = Uri.parse(url);
    if (!await launchUrl(_url)) {
      throw Exception('Could not launch $_url');
    }
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
