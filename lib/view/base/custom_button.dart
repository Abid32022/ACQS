import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:untitled6/utilities/colors.dart';

import 'custom_text.dart';

class CustomButton extends StatelessWidget {
  final IconData icon;
  final String text;
  Color color;
  Color textColor;
  final VoidCallback onPressed;


  CustomButton({super.key,
    required this.icon,
    required this.text,
    this.color = kPrimaryColor,
    this.textColor = Colors.white,
    required this.onPressed,

  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(

        primary: color,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(5.0).r, // Adjust the radius as needed
        ),// Change the button's background color as needed
        // Change the text color as needed
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(icon,size: 20.sp,color: textColor,),
          SizedBox(width: 8.0.w), // Adjust the spacing between the icon and text
          CustomText(text: text,color: Colors.white,fontSize: 18.sp,)
        ],
      ),
    );
  }
}
