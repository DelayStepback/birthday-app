import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class NavButtonGeneral extends StatefulWidget {
  final String title;
  const NavButtonGeneral({super.key, required this.title});

  @override
  State<NavButtonGeneral> createState() => _NavButtonGeneralState();
}

class _NavButtonGeneralState extends State<NavButtonGeneral> {
  late bool _selected;
  @override
  void initState() {
    // TODO: implement initState
    _selected = true;
    super.initState();
  }

  void _changeSelected(){
    setState(() {
      _selected = !_selected;

    });
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius: BorderRadius.circular(15.0),
      onTap: () {
        _changeSelected();
      },
      child: AnimatedContainer(
        duration: Duration(seconds: 2),
        width: 156.w,
        height: 50.h,
        padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 12.h),
        decoration: ShapeDecoration(
          color: _selected ? Color(0xFFFDAC07): Color(0xFFFDBBBB),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15),
          ),
        ),
        child:
        Center(
          child: Text(
            widget.title,
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
