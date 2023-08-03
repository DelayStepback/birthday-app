import 'package:birthday_app/features/general/presentation/general/widgets/entertainments/entertainments-list-widget.dart';
import 'package:birthday_app/features/general/presentation/general/widgets/mapkit-yandex-widget.dart';
import 'package:birthday_app/features/general/presentation/general/widgets/menu/menu-grid.dart';
import 'package:birthday_app/features/general/presentation/general/widgets/nav-button-general.dart';
import 'package:birthday_app/features/general/presentation/general/widgets/slider-top.dart';
import 'package:birthday_app/features/general/presentation/guests_page/guests_view.dart';
import 'package:birthday_app/features/general/presentation/wishlist_page/wishlist_view.dart';
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
        SliderTop(),
        const _TextAfterUpAnimated(),
        SizedBox(
          height: 15.h,
        ),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.w),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              GestureDetector(
                  onTap: () => {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const GuestsPage()))
                      },
                  child: const NavButtonGeneral(title: 'Список гостей')),
              GestureDetector(
                  onTap: () => {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const WishItemsPage()))
                      },
                  child: const NavButtonGeneral(title: 'Вишлист')),
            ],
          ),
        ),
        SizedBox(
          height: 30.h,
        ),
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
        SizedBox(
          height: 16.h,
        ),
        const MenuGrid(),
        SizedBox(
          height: 30.h,
        ),
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
        SizedBox(
          height: 30.h,
        ),
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
        SizedBox(
          height: 16.h,
        ),
        const MapKitYandexWidget(),
        Text(
          'Центральная ул., 84, хутор Седых',
          style: TextStyle(
            color: const Color(0xFF4D4242),
            fontSize: 14.sp,
            fontFamily: 'Jost',
            fontWeight: FontWeight.w400,
          ),
        ),
        SizedBox(
          height: 10.h,
        ),
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
              height: 18.55.h / 14.sp,
            ),
          ),
        ),
        SizedBox(
          height: 104.h,
        ),
      ],
    );
  }

  Future<void> _launchUrl(url) async {
    final Uri url0 = Uri.parse(url);
    if (!await launchUrl(url0)) {
      throw Exception('Could not launch $url0');
    }
  }
}

class _TextAfterUpAnimated extends StatefulWidget {
  const _TextAfterUpAnimated({super.key});

  @override
  State<_TextAfterUpAnimated> createState() => _TextAfterUpAnimatedState();
}

class _TextAfterUpAnimatedState extends State<_TextAfterUpAnimated> {
  bool _selectedBottomAppBarText = false;

  void _changeText() {
    setState(
      () {
        _selectedBottomAppBarText =
            _selectedBottomAppBarText == true ? false : true;
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => {
        _changeText(),
      },
      child: AnimatedDefaultTextStyle(
        style: _selectedBottomAppBarText
            ? TextStyle(
                color: const Color(0xFF191999),
                fontSize: 18.sp,
                fontFamily: 'Jost',
                fontWeight: FontWeight.w400,
                height: 36 / 18.h,
              )
            : TextStyle(
                color: const Color(0xFF161010),
                fontSize: 14.sp,
                fontFamily: 'Jost',
                fontWeight: FontWeight.w400,
                height: 14 / 14.h,
              ),
        duration: const Duration(seconds: 2),
        child: Padding(
          padding: EdgeInsets.only(left: 16.w, right: 27.w, top: 16.h),
          child: const Text(
            'Приглашаю своих дорогих друзей отметить мой день рождения в замечательном месте с множеством развлечений, вкусных блюд и хорошим настроением!',
          ),
        ),
      ),
    );
  }
}
