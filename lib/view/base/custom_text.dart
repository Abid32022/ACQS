import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomText extends StatelessWidget {
  final String text;
  FontWeight fontWeight;
  String? fontFamily;
  double fontSize;
  Color color;
  TextAlign? textAlign;

  CustomText({super.key,
    required this.text,
    this.fontWeight = FontWeight.w400,
    this.textAlign,
    this.fontSize = 16,
    this.fontFamily,
    this.color = Colors.white


  });

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
        fontWeight: fontWeight,
        fontFamily: 'gesndbook',
        fontSize: fontSize.sp,
        color: color,



      ),
      textAlign: textAlign,

    );
  }
}




