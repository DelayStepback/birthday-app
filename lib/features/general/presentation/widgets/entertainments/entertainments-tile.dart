import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class EntertainmentsTile extends StatelessWidget {
  final String title;
  final String description;
  final String imagePath;

  const EntertainmentsTile(
      {super.key,
      required this.title,
      required this.description,
      required this.imagePath});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: ()=>{},
      child: ListTile(
        leading: CircleAvatar(
          radius: 21.w,
          backgroundColor: Colors.transparent,
          child: Image.asset(
            imagePath,
          ),
        ),
        titleAlignment: ListTileTitleAlignment.titleHeight,
        title: Text(title),
        titleTextStyle: TextStyle(
          color: const Color(0xFF171010),
          fontSize: 14.sp,
          fontFamily: 'Jost',
          fontWeight: FontWeight.w500,
        ),
        subtitle: Text(description),
        subtitleTextStyle: TextStyle(
          color: const Color(0xFF4E4343),
          fontSize: 14.sp,
          fontFamily: 'Jost',
          fontWeight: FontWeight.w400,
        ),
        trailing: Icon(
          Icons.arrow_forward_ios,
          size: 11,
          color: Color(0xFF4E4343),
        ),
        isThreeLine: false,
      ),
    );
  }
}
