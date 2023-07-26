
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class TextInputField extends StatelessWidget {
  const TextInputField({
    super.key,
    required this.textEditingController,
    required this.labelText,
  });

  final TextEditingController textEditingController;
  final String labelText;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Color(0xFFF2F8EF),
      height: 61.sp,
      padding: EdgeInsets.only(top: 8, left: 12, right: 12, bottom: 8),
      child: Center(
        child: TextFormField(
          controller: textEditingController,
          style: TextStyle(
            color: Color(0xFF171010),
            fontSize: 16,
            fontFamily: 'Jost',
            fontWeight: FontWeight.w500,
          ),
          decoration: InputDecoration(
            border: InputBorder.none,
            labelText: labelText,
            labelStyle:  TextStyle(
              color: Color(0xFF4E4343),
              fontSize: 13,
              fontFamily: 'Jost',
              fontWeight: FontWeight.w400,
            ),

          ),
        ),
      ),
    );
  }
}
