import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
class AppBarRegular extends StatelessWidget implements PreferredSizeWidget{
  const AppBarRegular({
    super.key,
    required this.titleName,
    required this.appBar,
  });
  final String titleName;
  final AppBar appBar;
  @override
  Size get preferredSize => Size.fromHeight(appBar.preferredSize.height);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      toolbarHeight: 48.h,
      leading: InkWell(
        child: Icon(
          Icons.arrow_back_ios,
          size: 14.sp,
          color: Color(0xFFC0C0CA),
        ),
        onTap: () => Navigator.pop(context),
      ),
      title: Text(
        titleName,
        style: TextStyle(
          color: Colors.black,
          fontSize: 20.sp,
          fontFamily: 'Jost',
          fontWeight: FontWeight.w500,
          height: 1,
        ),
      ),
      centerTitle: true,
      elevation: 3,
      backgroundColor: Colors.white,
    );
  }
}