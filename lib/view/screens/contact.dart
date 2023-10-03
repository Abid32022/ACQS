import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:untitled6/main.dart';
import 'package:untitled6/utilities/colors.dart';


class Contact extends StatelessWidget {
  const Contact({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: [
          Container(
            width: 393.w,
            height: 142.h,
            color: kPrimaryColor,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Padding(
                      padding: EdgeInsets.only(top: 82.h, left: 19.w),
                      child: Container(
                          height: 36.h,
                          width: 36.h,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8.r),
                            color: Colors.white,
                          ),
                          child: Container(
                              child: Row(
                            children: [
                              SizedBox(
                                width: 4.w,
                              ),
                              Container(
                                width: 20.w,
                                child: IconButton(
                                    style: ButtonStyle(),
                                    icon: Icon(
                                      Icons.arrow_back_ios,
                                      size: 20.sp,
                                    ),
                                    onPressed: () {}),
                              ),
                            ],
                          ))),
                    ),
                    Padding(
                      padding: EdgeInsets.only(top: 82.h, right: 19.w),
                      child: Align(
                        alignment: Alignment.centerRight,
                        child: Text(
                          'المحاضرون',
                          style: TextStyle(
                            fontSize: 24.sp,
                            color: Colors.white,
                            fontWeight: FontWeight.w400,
                            fontFamily: 'gesndbook',
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              ],
            ),
          ),
          Container(
            child: Container(
              width: 393.w,
              height: 650.h,
              color: Colors.white,
              child: SingleChildScrollView(
                child: Padding(
                  padding:
                      EdgeInsets.symmetric(horizontal: 30.w, vertical: 35.h),
                  child: Column(
                    children: [
                      TextFormField(
                        decoration: InputDecoration(
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(
                                10.0), // Set the desired border radius
                          ),
                          labelText: 'الاسم الكامل',
                          contentPadding: EdgeInsets.fromLTRB(32.w, 18.h, 0.0,
                              18.h), // 15 units of left padding
                        ),
                        style:
                            GoogleFonts.poppins(color: const Color(0xff263238)),
                      ),
                      SizedBox(height: 14.h),
                      TextFormField(
                        decoration: InputDecoration(
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(
                                10.0), // Set the desired border radius
                          ),
                          labelText: 'الايميل',
                          hintText: 'K********i.ux@gmail.com',
                          contentPadding: EdgeInsets.fromLTRB(32.w, 18.h, 0.0,
                              18.h), // 15 units of left padding
                        ),
                        style:
                            GoogleFonts.poppins(color: const Color(0xff263238)),
                      ),
                      SizedBox(height: 14.h),
                      TextFormField(
                        decoration: InputDecoration(
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(
                                10.0), // Set the desired border radius
                          ),
                          labelText: 'رسالة',
                          contentPadding: EdgeInsets.fromLTRB(32.w, 18.h, 0.0,
                              18.h), // 15 units of left padding
                        ),
                        style:
                            GoogleFonts.poppins(color: const Color(0xff263238)),
                        maxLines: 4,
                        minLines: 2,
                      ),
                      SizedBox(height: 25.h),
                      ElevatedButton(
                        onPressed: () {
                          // Add your onPressed logic here
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Color(0xFF8E1839),
                          // Replace with your desired hex color code
                          minimumSize: Size(325.w, 52.h),
                          // Set the desired width and height
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(
                                10.0), // Set the desired border radius
                          ),
                          elevation:
                              0.0, // Set elevation to 0 to remove the shadow
                        ),
                        child: Center(
                          child: Text(
                            'تسجيل الدخول',
                            style: TextStyle(
                              fontFamily: 'gesndbook',
                              fontWeight: FontWeight.w600,
                              fontSize: 16.sp, // Adjust the font size as needed
                              color: Colors.white, // Text color
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(top: 22.h, bottom: 13.h),
                        child: Align(
                          alignment: Alignment.centerRight,
                          child: Text(
                            'عنوان',
                            style: TextStyle(
                              fontSize: 20.sp,
                              color: kPrimaryColor,
                              fontWeight: FontWeight.w400,
                              fontFamily: 'gesndbook',
                            ),
                          ),
                        ),
                      ),
                      Image.asset('lib/assets/images/map.jpg'),
                      SizedBox(
                        height: 19.h,
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 4.w),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Align(
                              alignment: Alignment.centerRight,
                              child: Text(
                                '+44179285 974',
                                style: TextStyle(
                                  fontSize: 16.sp,
                                  color: Color(0xff979797),
                                  fontWeight: FontWeight.w400,
                                  fontFamily: 'gesndbook',
                                ),
                              ),
                            ),
                            SizedBox(
                              width: 28.w,
                            ),
                            Container(
                              height: 24.h,
                              width: 24.h,
                              child: Icon(CupertinoIcons.phone_fill,
                                  size: 24.sp, color: kPrimaryColor),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 10.h,
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 4.w),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Align(
                              alignment: Alignment.centerRight,
                              child: Text(
                                'INFO@QATARCH.COM',
                                style: TextStyle(
                                  fontSize: 16.sp,
                                  color: Color(0xff979797),
                                  fontWeight: FontWeight.w400,
                                  fontFamily: 'gesndbook',
                                ),
                              ),
                            ),
                            SizedBox(
                              width: 28.w,
                            ),
                            Container(
                              height: 24.h,
                              width: 24.h,
                              child: Icon(Icons.mail,
                                  size: 24.sp, color: kPrimaryColor),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
