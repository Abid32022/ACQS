
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:untitled6/utilities/colors.dart';


class LectureDetails extends StatefulWidget {
  const LectureDetails({super.key});

  @override
  State<LectureDetails> createState() => _LectureDetailsState();
}

class _LectureDetailsState extends State<LectureDetails> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              width: 393.w,
              height: 190.h,
              color: kPrimaryColor,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: EdgeInsets.only(top: 75.h, left: 19.w),
                    child: Image.asset('lib/assets/images/bar.png'),
                  ),
                  Padding(
                      padding: EdgeInsets.only(left: 14.w, top: 25.h),
                      child: Container(
                        width: 366.w,
                        height: 52.h,
                        child: TextField(
                          decoration: InputDecoration(
                            filled: true,
                            fillColor: Colors.white,
                            prefixIcon: Icon(Icons.search),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(8.r),
                            ),
                            suffix: Text(
                              "ابحث هنا",
                              style: TextStyle(
                                fontSize: 14.sp,
                                fontWeight: FontWeight.w400,
                                color: Color(0xff8E1839),
                                fontFamily: 'gesndbook',
                              ),
                            ),
                          ),
                        ),
                      )

                  )

                ],
              ),
            ),
            Container(
              child: Container(
                width: 393.w,

                color: Colors.white,
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 18.w),
                  child: Column(
                    children: [
                      SizedBox(height: 25.h),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Image.asset("lib/assets/images/logo.png",width: 14.w,height: 32.h,),
                          Align(
                            alignment: Alignment.centerRight,
                            child: Text(
                              'المحاضرون',
                              style: TextStyle(
                                fontSize: 24.sp,
                                color: kPrimaryColor,
                                fontWeight: FontWeight.w400,
                                fontFamily: 'gesndbook',
                              ),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 15.h),
                      GestureDetector(
                        onTap: () {
                          // Navigator.of(context)
                          //     .push(MaterialPageRoute(builder: (_) => Video()));
                        },
                        child: Container(

                          width: 365.w,
                          decoration: BoxDecoration(
                            boxShadow: [
                              BoxShadow(
                                color: Colors.black.withOpacity(0.25),
                                // Shadow color
                                spreadRadius: 0,
                                // Spread radius
                                blurRadius: 4,
                                // Blur radius
                                offset:
                                const Offset(2, 2), // Offset of the shadow
                              ),
                            ],
                            borderRadius: BorderRadius.circular(8.r),
                            color: Colors.white,
                          ),
                          child: Row(
                            children: [
                              Padding(
                                padding:
                                EdgeInsets.fromLTRB(18.w, 34.h, 22.w, 34.h),
                                child: Image.asset(
                                    'lib/assets/images/back_bg.png'),
                              ),
                              Expanded(

                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Align(
                                      alignment: Alignment.centerRight,
                                      child: Text(
                                        'عبد العظيم بن محمد صغيري',
                                        style: TextStyle(
                                          fontSize: 14.sp,
                                          color: Color(0xff131313),
                                          fontWeight: FontWeight.w400,
                                          fontFamily: 'gesndbook',
                                        ),
                                      ),
                                    ),
                                    Align(
                                      alignment: Alignment.centerRight,
                                      child: Text(
                                        '- أستاذ الثقافة والفلسفة الإسلامية ',
                                        style: TextStyle(
                                          fontSize: 10.sp,
                                          color: Color(0xff131313),
                                          fontWeight: FontWeight.w400,
                                          fontFamily: 'gesndbook',
                                        ),
                                      ),
                                    ),
                                    Align(
                                      alignment: Alignment.centerRight,
                                      child: Text(
                                        'كلية الشريعة والدراسات الإسلامية - جامعة قطر',
                                        style: TextStyle(
                                          fontSize: 10.sp,
                                          color: Color(0xff131313),
                                          fontWeight: FontWeight.w400,
                                          fontFamily: 'gesndbook',
                                        ),
                                      ),
                                    ),
                                    SizedBox(
                                      height: 6.h,
                                    ),
                                    Container(
                                      child: Row(
                                        mainAxisAlignment:
                                        MainAxisAlignment.spaceEvenly,
                                        children: [
                                          Align(
                                            alignment: Alignment.centerRight,
                                            child: Text(
                                              '4.0',
                                              style: TextStyle(
                                                fontSize: 11.sp,
                                                color: Color(0xff888C94),
                                                fontWeight: FontWeight.w400,
                                                fontFamily: 'gesndbook',
                                              ),
                                            ),
                                          ),
                                          Image.asset(
                                            'lib/assets/images/stars.jpg',
                                            height: 13.13.h,
                                            width: 71.w,
                                          ),
                                          SizedBox(
                                            width: 29.w,
                                          ),
                                          Align(
                                            alignment: Alignment.centerRight,
                                            child: Text(
                                              '(4051)',
                                              style: TextStyle(
                                                fontSize: 11.sp,
                                                color: Color(0xff888C94),
                                                fontWeight: FontWeight.w400,
                                                fontFamily: 'gesndbook',
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    )
                                  ],
                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.only(left: 8.w),
                                child: Image.asset(
                                  'lib/assets/images/lec22.jpg',
                                  width: 96.w,
                                  height: 83.h,
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 18.h,
                      ),
                      Container(

                        width: 365.w,
                        decoration: BoxDecoration(
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black.withOpacity(0.25),
                              // Shadow color
                              spreadRadius: 0,
                              // Spread radius
                              blurRadius: 4,
                              // Blur radius
                              offset:
                              const Offset(2, 2), // Offset of the shadow
                            ),
                          ],
                          borderRadius: BorderRadius.circular(8.r),
                          color: Colors.white,
                        ),
                        child: Row(
                          children: [
                            Padding(
                              padding:
                              EdgeInsets.fromLTRB(18.w, 34.h, 22.w, 34.h),
                              child: Image.asset(
                                  'lib/assets/images/back_bg.png'),
                            ),
                            Expanded(

                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Align(
                                    alignment: Alignment.centerRight,
                                    child: Text(
                                      'عبد العظيم بن محمد صغيري',
                                      style: TextStyle(
                                        fontSize: 14.sp,
                                        color: Color(0xff131313),
                                        fontWeight: FontWeight.w400,
                                        fontFamily: 'gesndbook',
                                      ),
                                    ),
                                  ),
                                  Align(
                                    alignment: Alignment.centerRight,
                                    child: Text(
                                      '- أستاذ الثقافة والفلسفة الإسلامية ',
                                      style: TextStyle(
                                        fontSize: 10.sp,
                                        color: Color(0xff131313),
                                        fontWeight: FontWeight.w400,
                                        fontFamily: 'gesndbook',
                                      ),
                                    ),
                                  ),
                                  Align(
                                    alignment: Alignment.centerRight,
                                    child: Text(
                                      'كلية الشريعة والدراسات الإسلامية - جامعة قطر',
                                      style: TextStyle(
                                        fontSize: 10.sp,
                                        color: Color(0xff131313),
                                        fontWeight: FontWeight.w400,
                                        fontFamily: 'gesndbook',
                                      ),
                                    ),
                                  ),
                                  SizedBox(
                                    height: 6.h,
                                  ),
                                  Container(
                                    child: Row(
                                      mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                      children: [
                                        Align(
                                          alignment: Alignment.centerRight,
                                          child: Text(
                                            '4.0',
                                            style: TextStyle(
                                              fontSize: 11.sp,
                                              color: Color(0xff888C94),
                                              fontWeight: FontWeight.w400,
                                              fontFamily: 'gesndbook',
                                            ),
                                          ),
                                        ),
                                        Image.asset(
                                          'lib/assets/images/stars.jpg',
                                          height: 13.13.h,
                                          width: 71.w,
                                        ),
                                        SizedBox(
                                          width: 29.w,
                                        ),
                                        Align(
                                          alignment: Alignment.centerRight,
                                          child: Text(
                                            '(4051)',
                                            style: TextStyle(
                                              fontSize: 11.sp,
                                              color: Color(0xff888C94),
                                              fontWeight: FontWeight.w400,
                                              fontFamily: 'gesndbook',
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  )
                                ],
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.only(left: 8.w),
                              child: Image.asset(
                                'lib/assets/images/lec22.jpg',
                                width: 96.w,
                                height: 83.h,
                                fit: BoxFit.cover,
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 18.h,
                      ),
                      Container(

                        width: 365.w,
                        decoration: BoxDecoration(
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black.withOpacity(0.25),
                              // Shadow color
                              spreadRadius: 0,
                              // Spread radius
                              blurRadius: 4,
                              // Blur radius
                              offset:
                              const Offset(2, 2), // Offset of the shadow
                            ),
                          ],
                          borderRadius: BorderRadius.circular(8.r),
                          color: Colors.white,
                        ),
                        child: Row(
                          children: [
                            Padding(
                              padding:
                              EdgeInsets.fromLTRB(18.w, 34.h, 22.w, 34.h),
                              child: Image.asset(
                                  'lib/assets/images/back_bg.png'),
                            ),
                            Expanded(

                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Align(
                                    alignment: Alignment.centerRight,
                                    child: Text(
                                      'عبد العظيم بن محمد صغيري',
                                      style: TextStyle(
                                        fontSize: 14.sp,
                                        color: Color(0xff131313),
                                        fontWeight: FontWeight.w400,
                                        fontFamily: 'gesndbook',
                                      ),
                                    ),
                                  ),
                                  Align(
                                    alignment: Alignment.centerRight,
                                    child: Text(
                                      '- أستاذ الثقافة والفلسفة الإسلامية ',
                                      style: TextStyle(
                                        fontSize: 10.sp,
                                        color: Color(0xff131313),
                                        fontWeight: FontWeight.w400,
                                        fontFamily: 'gesndbook',
                                      ),
                                    ),
                                  ),
                                  Align(
                                    alignment: Alignment.centerRight,
                                    child: Text(
                                      'كلية الشريعة والدراسات الإسلامية - جامعة قطر',
                                      style: TextStyle(
                                        fontSize: 10.sp,
                                        color: Color(0xff131313),
                                        fontWeight: FontWeight.w400,
                                        fontFamily: 'gesndbook',
                                      ),
                                    ),
                                  ),
                                  SizedBox(
                                    height: 6.h,
                                  ),
                                  Container(
                                    child: Row(
                                      mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                      children: [
                                        Align(
                                          alignment: Alignment.centerRight,
                                          child: Text(
                                            '4.0',
                                            style: TextStyle(
                                              fontSize: 11.sp,
                                              color: Color(0xff888C94),
                                              fontWeight: FontWeight.w400,
                                              fontFamily: 'gesndbook',
                                            ),
                                          ),
                                        ),
                                        Image.asset(
                                          'lib/assets/images/stars.jpg',
                                          height: 13.13.h,
                                          width: 71.w,
                                        ),
                                        SizedBox(
                                          width: 29.w,
                                        ),
                                        Align(
                                          alignment: Alignment.centerRight,
                                          child: Text(
                                            '(4051)',
                                            style: TextStyle(
                                              fontSize: 11.sp,
                                              color: Color(0xff888C94),
                                              fontWeight: FontWeight.w400,
                                              fontFamily: 'gesndbook',
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  )
                                ],
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.only(left: 8.w),
                              child: Image.asset(
                                'lib/assets/images/lec22.jpg',
                                width: 96.w,
                                height: 83.h,
                                fit: BoxFit.cover,
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 18.h,
                      ),
                      Container(

                        width: 365.w,
                        decoration: BoxDecoration(
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black.withOpacity(0.25),
                              // Shadow color
                              spreadRadius: 0,
                              // Spread radius
                              blurRadius: 4,
                              // Blur radius
                              offset:
                              const Offset(2, 2), // Offset of the shadow
                            ),
                          ],
                          borderRadius: BorderRadius.circular(8.r),
                          color: Colors.white,
                        ),
                        child: Row(
                          children: [
                            Padding(
                              padding:
                              EdgeInsets.fromLTRB(18.w, 34.h, 22.w, 34.h),
                              child: Image.asset(
                                  'lib/assets/images/back_bg.png'),
                            ),
                            Expanded(

                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Align(
                                    alignment: Alignment.centerRight,
                                    child: Text(
                                      'عبد العظيم بن محمد صغيري',
                                      style: TextStyle(
                                        fontSize: 14.sp,
                                        color: Color(0xff131313),
                                        fontWeight: FontWeight.w400,
                                        fontFamily: 'gesndbook',
                                      ),
                                    ),
                                  ),
                                  Align(
                                    alignment: Alignment.centerRight,
                                    child: Text(
                                      '- أستاذ الثقافة والفلسفة الإسلامية ',
                                      style: TextStyle(
                                        fontSize: 10.sp,
                                        color: Color(0xff131313),
                                        fontWeight: FontWeight.w400,
                                        fontFamily: 'gesndbook',
                                      ),
                                    ),
                                  ),
                                  Align(
                                    alignment: Alignment.centerRight,
                                    child: Text(
                                      'كلية الشريعة والدراسات الإسلامية - جامعة قطر',
                                      style: TextStyle(
                                        fontSize: 10.sp,
                                        color: Color(0xff131313),
                                        fontWeight: FontWeight.w400,
                                        fontFamily: 'gesndbook',
                                      ),
                                    ),
                                  ),
                                  SizedBox(
                                    height: 6.h,
                                  ),
                                  Container(
                                    child: Row(
                                      mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                      children: [
                                        Align(
                                          alignment: Alignment.centerRight,
                                          child: Text(
                                            '4.0',
                                            style: TextStyle(
                                              fontSize: 11.sp,
                                              color: Color(0xff888C94),
                                              fontWeight: FontWeight.w400,
                                              fontFamily: 'gesndbook',
                                            ),
                                          ),
                                        ),
                                        Image.asset(
                                          'lib/assets/images/stars.jpg',
                                          height: 13.13.h,
                                          width: 71.w,
                                        ),
                                        SizedBox(
                                          width: 29.w,
                                        ),
                                        Align(
                                          alignment: Alignment.centerRight,
                                          child: Text(
                                            '(4051)',
                                            style: TextStyle(
                                              fontSize: 11.sp,
                                              color: Color(0xff888C94),
                                              fontWeight: FontWeight.w400,
                                              fontFamily: 'gesndbook',
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  )
                                ],
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.only(left: 8.w),
                              child: Image.asset(
                                'lib/assets/images/lec22.jpg',
                                width: 96.w,
                                height: 83.h,
                                fit: BoxFit.cover,
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 18.h,
                      ),
                      Container(

                        width: 365.w,
                        decoration: BoxDecoration(
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black.withOpacity(0.25),
                              // Shadow color
                              spreadRadius: 0,
                              // Spread radius
                              blurRadius: 4,
                              // Blur radius
                              offset:
                              const Offset(2, 2), // Offset of the shadow
                            ),
                          ],
                          borderRadius: BorderRadius.circular(8.r),
                          color: Colors.white,
                        ),
                        child: Row(
                          children: [
                            Padding(
                              padding:
                              EdgeInsets.fromLTRB(18.w, 34.h, 22.w, 34.h),
                              child: Image.asset(
                                  'lib/assets/images/back_bg.png'),
                            ),
                            Expanded(

                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Align(
                                    alignment: Alignment.centerRight,
                                    child: Text(
                                      'عبد العظيم بن محمد صغيري',
                                      style: TextStyle(
                                        fontSize: 14.sp,
                                        color: Color(0xff131313),
                                        fontWeight: FontWeight.w400,
                                        fontFamily: 'gesndbook',
                                      ),
                                    ),
                                  ),
                                  Align(
                                    alignment: Alignment.centerRight,
                                    child: Text(
                                      '- أستاذ الثقافة والفلسفة الإسلامية ',
                                      style: TextStyle(
                                        fontSize: 10.sp,
                                        color: Color(0xff131313),
                                        fontWeight: FontWeight.w400,
                                        fontFamily: 'gesndbook',
                                      ),
                                    ),
                                  ),
                                  Align(
                                    alignment: Alignment.centerRight,
                                    child: Text(
                                      'كلية الشريعة والدراسات الإسلامية - جامعة قطر',
                                      style: TextStyle(
                                        fontSize: 10.sp,
                                        color: Color(0xff131313),
                                        fontWeight: FontWeight.w400,
                                        fontFamily: 'gesndbook',
                                      ),
                                    ),
                                  ),
                                  SizedBox(
                                    height: 6.h,
                                  ),
                                  Container(
                                    child: Row(
                                      mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                      children: [
                                        Align(
                                          alignment: Alignment.centerRight,
                                          child: Text(
                                            '4.0',
                                            style: TextStyle(
                                              fontSize: 11.sp,
                                              color: Color(0xff888C94),
                                              fontWeight: FontWeight.w400,
                                              fontFamily: 'gesndbook',
                                            ),
                                          ),
                                        ),
                                        Image.asset(
                                          'lib/assets/images/stars.jpg',
                                          height: 13.13.h,
                                          width: 71.w,
                                        ),
                                        SizedBox(
                                          width: 29.w,
                                        ),
                                        Align(
                                          alignment: Alignment.centerRight,
                                          child: Text(
                                            '(4051)',
                                            style: TextStyle(
                                              fontSize: 11.sp,
                                              color: Color(0xff888C94),
                                              fontWeight: FontWeight.w400,
                                              fontFamily: 'gesndbook',
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  )
                                ],
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.only(left: 8.w),
                              child: Image.asset(
                                'lib/assets/images/lec22.jpg',
                                width: 96.w,
                                height: 83.h,
                                fit: BoxFit.cover,
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 18.h,
                      ),
                      Container(

                        width: 365.w,
                        decoration: BoxDecoration(
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black.withOpacity(0.25),
                              // Shadow color
                              spreadRadius: 0,
                              // Spread radius
                              blurRadius: 4,
                              // Blur radius
                              offset:
                              const Offset(2, 2), // Offset of the shadow
                            ),
                          ],
                          borderRadius: BorderRadius.circular(8.r),
                          color: Colors.white,
                        ),
                        child: Row(
                          children: [
                            Padding(
                              padding:
                              EdgeInsets.fromLTRB(18.w, 34.h, 22.w, 34.h),
                              child: Image.asset(
                                  'lib/assets/images/back_bg.png'),
                            ),
                            Expanded(

                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Align(
                                    alignment: Alignment.centerRight,
                                    child: Text(
                                      'عبد العظيم بن محمد صغيري',
                                      style: TextStyle(
                                        fontSize: 14.sp,
                                        color: Color(0xff131313),
                                        fontWeight: FontWeight.w400,
                                        fontFamily: 'gesndbook',
                                      ),
                                    ),
                                  ),
                                  Align(
                                    alignment: Alignment.centerRight,
                                    child: Text(
                                      '- أستاذ الثقافة والفلسفة الإسلامية ',
                                      style: TextStyle(
                                        fontSize: 10.sp,
                                        color: Color(0xff131313),
                                        fontWeight: FontWeight.w400,
                                        fontFamily: 'gesndbook',
                                      ),
                                    ),
                                  ),
                                  Align(
                                    alignment: Alignment.centerRight,
                                    child: Text(
                                      'كلية الشريعة والدراسات الإسلامية - جامعة قطر',
                                      style: TextStyle(
                                        fontSize: 10.sp,
                                        color: Color(0xff131313),
                                        fontWeight: FontWeight.w400,
                                        fontFamily: 'gesndbook',
                                      ),
                                    ),
                                  ),
                                  SizedBox(
                                    height: 6.h,
                                  ),
                                  Container(
                                    child: Row(
                                      mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                      children: [
                                        Align(
                                          alignment: Alignment.centerRight,
                                          child: Text(
                                            '4.0',
                                            style: TextStyle(
                                              fontSize: 11.sp,
                                              color: Color(0xff888C94),
                                              fontWeight: FontWeight.w400,
                                              fontFamily: 'gesndbook',
                                            ),
                                          ),
                                        ),
                                        Image.asset(
                                          'lib/assets/images/stars.jpg',
                                          height: 13.13.h,
                                          width: 71.w,
                                        ),
                                        SizedBox(
                                          width: 29.w,
                                        ),
                                        Align(
                                          alignment: Alignment.centerRight,
                                          child: Text(
                                            '(4051)',
                                            style: TextStyle(
                                              fontSize: 11.sp,
                                              color: Color(0xff888C94),
                                              fontWeight: FontWeight.w400,
                                              fontFamily: 'gesndbook',
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  )
                                ],
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.only(left: 8.w),
                              child: Image.asset(
                                'lib/assets/images/lec22.jpg',
                                width: 96.w,
                                height: 83.h,
                                fit: BoxFit.cover,
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 22.h,
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
