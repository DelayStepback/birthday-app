import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';

class TextInputField extends StatelessWidget {
  TextInputField({
    super.key,
    required this.textEditingController,
    required this.labelText,
    required this.autofocus,
  });

  final TextEditingController textEditingController;
  final String labelText;
  final bool autofocus;


  var maskFormatter = MaskTextInputFormatter();
  late final TextInputType keyboardType;
  TextInputType getKeyboardType(String label) {
    if (label == 'Телефон'){
      keyboardType = TextInputType.phone; 
    }
    else{
      keyboardType = TextInputType.text;
    }
    return keyboardType;
  }
  
  MaskTextInputFormatter formatterForField(String label) {
    if (label == 'Телефон') {
      maskFormatter = new MaskTextInputFormatter(
          mask: '+# ### ### ## ##',
          filter: { "#": RegExp(r'[0-9]')},
          type: MaskAutoCompletionType.lazy
      );
    }
    return maskFormatter;
  }


  @override
  Widget build(BuildContext context) {
    return Container(
      color: const Color(0xFFF2F8EF),
      height: 61.sp,
      padding: EdgeInsets.only(left: 12.w, right: 12.w),
      child: Center(
        child: TextFormField(
          keyboardType: getKeyboardType(labelText),

          inputFormatters: [
            formatterForField(labelText)
          ],
          autofocus: autofocus,
          controller: textEditingController,
          style: const TextStyle(
            color: Color(0xFF171010),
            fontSize: 16,
            fontFamily: 'Jost',
            fontWeight: FontWeight.w500,
          ),
          decoration: InputDecoration(
            border: InputBorder.none,
            labelText: labelText,
            labelStyle: const TextStyle(
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
