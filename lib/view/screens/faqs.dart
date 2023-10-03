// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_faq/flutter_faq.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:provider/provider.dart';
// import 'package:untitled6/main.dart';
// import 'package:untitled6/provider/faq_provider.dart';
// import 'package:untitled6/utilities/colors.dart';
//
//
// class Faqs extends StatefulWidget {
//   const Faqs({super.key});
//
//   @override
//   State<Faqs> createState() => _FaqsState();
// }
//
// class _FaqsState extends State<Faqs> {
//   @override
//   void initState() {
//     Provider.of<FaqProvider>(context,listen: false).getAllFaq();
//     // TODO: implement initState
//     super.initState();
//   }
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Color(0xffF5F0E6),
//       body: Container(
//         decoration: const BoxDecoration(
//           image: DecorationImage(
//             image: AssetImage("lib/assets/images/shrine_bg.png"),
//             fit: BoxFit.cover,
//           ),
//         ),
//         child: SingleChildScrollView(
//           child: Column(
//             children: [
//               Stack(
//                 children: <Widget>[
//                   Image.asset(
//                     'lib/assets/images/shrine.png',
//                     width: double.infinity,
//                     fit: BoxFit.cover,
//                   ),
//                   Positioned(
//                     top: 80.h,
//                     left: 14.w,
//                     //give the values according to your requirement
//                     child: Container(
//                         padding: EdgeInsets.all(3.r),
//
//                         decoration: BoxDecoration(
//                           borderRadius: BorderRadius.circular(8.r),
//                           color: Colors.white,
//                         ),
//                         child: Center(
//                           child: IconButton(
//
//                               style: const ButtonStyle(
//                               ),
//                               icon: Icon(
//                                 Icons.arrow_back_ios,
//                                 size: 20.sp,
//                               ),
//                               onPressed: () {
//                                 Navigator.pop(context);
//                               }),
//                         )),
//                   ),
//                 ],
//               ),
//               Container(
//                 width: double.infinity,
//                 height: 600.h,
//                 padding: EdgeInsets.symmetric(horizontal: 18.w),
//                 child: SingleChildScrollView(
//                   child: Column(
//                     children: [
//                       SizedBox(height: 25.h),
//                       Row(
//                         mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                         children: [
//                           Padding(
//                             padding:  EdgeInsets.only(left: 10.w),
//                             child: Image.asset(
//                               "lib/assets/images/logo.png",
//                               width: 14.w,
//                               height: 32.h,
//                             ),
//                           ),
//
//                           Align(
//                             alignment: Alignment.centerRight,
//                             child: Text(
//                               'الأسئلة المتداولة',
//                               style: TextStyle(
//                                 fontSize: 24.sp,
//                                 color: kPrimaryColor,
//                                 fontWeight: FontWeight.w400,
//                                 fontFamily: 'gesndbook',
//                               ),
//                             ),
//                           ),
//                         ],
//                       ),
//                       SizedBox(height: 26.h),
//                       Consumer<FaqProvider>(builder: (context, provider, child) {
//                         return  provider.Faq.length!=0?
//                         SizedBox(height: 350,
//                           child: ListView.builder(
//                             itemCount: provider.Faq.length,
//                             itemBuilder: (context, index) {
//                               return       Container(
//                                 width: 365.w,
//                                 decoration: BoxDecoration(
//                                   boxShadow: [
//                                     BoxShadow(
//                                       color: Colors.black.withOpacity(0.25),
//                                       // Shadow color
//                                       spreadRadius: 0,
//                                       // Spread radius
//                                       blurRadius: 4,
//                                       // Blur radius
//                                       offset: const Offset(2, 2), // Offset of the shadow
//                                     ),
//                                   ],
//                                   color: Colors.white,
//                                   borderRadius: BorderRadius.circular(8.r),
//                                   border: Border.all(
//                                       color: const Color(0x1a000000), width: 1.r),
//                                 ),
//                                 child: Directionality(
//                                   textDirection: TextDirection.rtl,
//                                   child: FAQ(
//                                     collapsedIcon: Container(
//                                       width: 22.w,
//                                       height: 22.w,
//                                       decoration: BoxDecoration(
//                                           color: kPrimaryColor,
//                                           borderRadius: BorderRadius.circular(20.r)),
//                                       child: Icon(Icons.keyboard_arrow_left,
//                                           color: Colors.white, size: 22.sp),
//                                     ),
//                                     expandedIcon: Container(
//                                       width: 22.w,
//                                       height: 22.w,
//                                       decoration: BoxDecoration(
//                                           color: kPrimaryColor,
//                                           borderRadius: BorderRadius.circular(20.r)),
//                                       child: Icon(Icons.keyboard_arrow_down,
//                                           color: Colors.white, size: 22.sp),
//                                     ),
//                                     showDivider: false,
//                                     queDecoration: const BoxDecoration(),
//                                     ansDecoration: const BoxDecoration(),
//
//                                     question: "${provider.Faq[index].data!.title}",
//                                     isExpanded: true,
//                                     answer:
//                                     "${provider.Faq[index].data!.body}",
//                                     queStyle: TextStyle(
//                                       fontSize: 16.sp,
//                                       color: Color(0xff131313),
//                                       fontWeight: FontWeight.w400,
//                                       fontFamily: 'gesndbook',
//                                     ),
//                                     ansStyle: TextStyle(
//                                       fontSize: 16.sp,
//                                       color: Color(0xff131313),
//                                       fontWeight: FontWeight.w400,
//                                       fontFamily: 'gesndbook',
//                                     ),
//                                     ansPadding: EdgeInsets.symmetric(
//                                         horizontal: 18.w, vertical: 18.w),
//                                   ),
//                                 ),
//                               );
//                             },),
//                         ):CircularProgressIndicator();
//                       },),
//                       // SizedBox(height: 17.h),
//                       // Container(
//                       //   width: 365.w,
//                       //   decoration: BoxDecoration(
//                       //     boxShadow: [
//                       //       BoxShadow(
//                       //         color: Colors.black.withOpacity(0.25),
//                       //         // Shadow color
//                       //         spreadRadius: 0,
//                       //         // Spread radius
//                       //         blurRadius: 4,
//                       //         // Blur radius
//                       //         offset: const Offset(2, 2), // Offset of the shadow
//                       //       ),
//                       //     ],
//                       //     color: Colors.white,
//                       //     borderRadius: BorderRadius.circular(8.r),
//                       //     border: Border.all(
//                       //         color: const Color(0x1a000000), width: 1.r),
//                       //   ),
//                       //   child: Directionality(
//                       //     textDirection: TextDirection.rtl,
//                       //     child: FAQ(
//                       //       collapsedIcon: Container(
//                       //         width: 22.w,
//                       //         height: 22.w,
//                       //         decoration: BoxDecoration(
//                       //             color: kPrimaryColor,
//                       //             borderRadius: BorderRadius.circular(20.r)),
//                       //         child: Icon(Icons.keyboard_arrow_left,
//                       //             color: Colors.white, size: 22.sp),
//                       //       ),
//                       //       expandedIcon: Container(
//                       //         width: 22.w,
//                       //         height: 22.w,
//                       //         decoration: BoxDecoration(
//                       //             color: kPrimaryColor,
//                       //             borderRadius: BorderRadius.circular(20.r)),
//                       //         child: Icon(Icons.keyboard_arrow_down,
//                       //             color: Colors.white, size: 22.sp),
//                       //       ),
//                       //       showDivider: false,
//                       //       queDecoration: const BoxDecoration(),
//                       //       ansDecoration: const BoxDecoration(),
//                       //       question: "هل هذه المحاضرات مجانية؟",
//                       //       isExpanded: false,
//                       //       answer:
//                       //           "هذه المحاضرات مجانية 100% ولكن للوصول إليها أولا عليك التسجيل كطالب",
//                       //       queStyle: TextStyle(
//                       //         fontSize: 16.sp,
//                       //         color: Color(0xff131313),
//                       //         fontWeight: FontWeight.w400,
//                       //         fontFamily: 'gesndbook',
//                       //       ),
//                       //       ansStyle: TextStyle(
//                       //         fontSize: 16.sp,
//                       //         color: Color(0xff131313),
//                       //         fontWeight: FontWeight.w400,
//                       //         fontFamily: 'gesndbook',
//                       //       ),
//                       //       ansPadding: EdgeInsets.symmetric(
//                       //           horizontal: 18.w, vertical: 18.w),
//                       //     ),
//                       //   ),
//                       // ),
//                       // SizedBox(height: 17.h),
//                       // Container(
//                       //   width: 365.w,
//                       //   decoration: BoxDecoration(
//                       //     boxShadow: [
//                       //       BoxShadow(
//                       //         color: Colors.black.withOpacity(0.25),
//                       //         // Shadow color
//                       //         spreadRadius: 0,
//                       //         // Spread radius
//                       //         blurRadius: 4,
//                       //         // Blur radius
//                       //         offset: const Offset(2, 2), // Offset of the shadow
//                       //       ),
//                       //     ],
//                       //     color: Colors.white,
//                       //     borderRadius: BorderRadius.circular(8.r),
//                       //     border: Border.all(
//                       //         color: const Color(0x1a000000), width: 1.r),
//                       //   ),
//                       //   child: Directionality(
//                       //     textDirection: TextDirection.rtl,
//                       //     child: FAQ(
//                       //       collapsedIcon: Container(
//                       //         width: 22.w,
//                       //         height: 22.w,
//                       //         decoration: BoxDecoration(
//                       //             color: kPrimaryColor,
//                       //             borderRadius: BorderRadius.circular(20.r)),
//                       //         child: Icon(Icons.keyboard_arrow_left,
//                       //             color: Colors.white, size: 22.sp),
//                       //       ),
//                       //       expandedIcon: Container(
//                       //         width: 22.w,
//                       //         height: 22.w,
//                       //         decoration: BoxDecoration(
//                       //             color: kPrimaryColor,
//                       //             borderRadius: BorderRadius.circular(20.r)),
//                       //         child: Icon(Icons.keyboard_arrow_down,
//                       //             color: Colors.white, size: 22.sp),
//                       //       ),
//                       //       showDivider: false,
//                       //       queDecoration: const BoxDecoration(),
//                       //       ansDecoration: const BoxDecoration(),
//                       //       question: "هل هذه المحاضرات مجانية؟",
//                       //       isExpanded: false,
//                       //       answer:
//                       //           "هذه المحاضرات مجانية 100% ولكن للوصول إليها أولا عليك التسجيل كطالب",
//                       //       queStyle: TextStyle(
//                       //         fontSize: 16.sp,
//                       //         color: Color(0xff131313),
//                       //         fontWeight: FontWeight.w400,
//                       //         fontFamily: 'gesndbook',
//                       //       ),
//                       //       ansStyle: TextStyle(
//                       //         fontSize: 16.sp,
//                       //         color: Color(0xff131313),
//                       //         fontWeight: FontWeight.w400,
//                       //         fontFamily: 'gesndbook',
//                       //       ),
//                       //       ansPadding: EdgeInsets.symmetric(
//                       //           horizontal: 18.w, vertical: 18.w),
//                       //     ),
//                       //   ),
//                       // ),
//                       // SizedBox(height: 17.h),
//                       // Container(
//                       //   width: 365.w,
//                       //   decoration: BoxDecoration(
//                       //     boxShadow: [
//                       //       BoxShadow(
//                       //         color: Colors.black.withOpacity(0.25),
//                       //         // Shadow color
//                       //         spreadRadius: 0,
//                       //         // Spread radius
//                       //         blurRadius: 4,
//                       //         // Blur radius
//                       //         offset: const Offset(2, 2), // Offset of the shadow
//                       //       ),
//                       //     ],
//                       //     color: Colors.white,
//                       //     borderRadius: BorderRadius.circular(8.r),
//                       //     border: Border.all(
//                       //         color: const Color(0x1a000000), width: 1.r),
//                       //   ),
//                       //   child: Directionality(
//                       //     textDirection: TextDirection.rtl,
//                       //     child: FAQ(
//                       //       collapsedIcon: Container(
//                       //         width: 22.w,
//                       //         height: 22.w,
//                       //         decoration: BoxDecoration(
//                       //             color: kPrimaryColor,
//                       //             borderRadius: BorderRadius.circular(20.r)),
//                       //         child: Icon(Icons.keyboard_arrow_left,
//                       //             color: Colors.white, size: 22.sp),
//                       //       ),
//                       //       expandedIcon: Container(
//                       //         width: 22.w,
//                       //         height: 22.w,
//                       //         decoration: BoxDecoration(
//                       //             color: kPrimaryColor,
//                       //             borderRadius: BorderRadius.circular(20.r)),
//                       //         child: Icon(Icons.keyboard_arrow_down,
//                       //             color: Colors.white, size: 22.sp),
//                       //       ),
//                       //       showDivider: false,
//                       //       queDecoration: const BoxDecoration(),
//                       //       ansDecoration: const BoxDecoration(),
//                       //       question: "هل هذه المحاضرات مجانية؟",
//                       //       isExpanded: false,
//                       //       answer:
//                       //           "هذه المحاضرات مجانية 100% ولكن للوصول إليها أولا عليك التسجيل كطالب",
//                       //       queStyle: TextStyle(
//                       //         fontSize: 16.sp,
//                       //         color: Color(0xff131313),
//                       //         fontWeight: FontWeight.w400,
//                       //         fontFamily: 'gesndbook',
//                       //       ),
//                       //       ansStyle: TextStyle(
//                       //         fontSize: 16.sp,
//                       //         color: Color(0xff131313),
//                       //         fontWeight: FontWeight.w400,
//                       //         fontFamily: 'gesndbook',
//                       //       ),
//                       //       ansPadding: EdgeInsets.symmetric(
//                       //           horizontal: 18.w, vertical: 18.w),
//                       //     ),
//                       //   ),
//                       // ),
//                       // SizedBox(height: 16.h),
//                       Align(
//                         alignment: Alignment.centerRight,
//                         child: Text(
//                           'لمزيد من الاستفسارات تواصل معنا',
//                           style: TextStyle(
//                             fontSize: 14.sp,
//                             color: kPrimaryColor,
//                             fontWeight: FontWeight.w400,
//                             fontFamily: 'gesndbook',
//                           ),
//                         ),
//                       ),
//                     ],
//                   ),
//                 ),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:untitled6/utilities/colors.dart';
import 'dart:math' as math;
import '../base/custom_text.dart';

class Faqs extends StatefulWidget {
  const Faqs({super.key});

  @override
  State<Faqs> createState() => _FaqsState();
}

class _FaqsState extends State<Faqs> {
  bool _isShow1 = false;
  bool _isShow2 = false;
  bool _isShow3 = false;
  bool _isShow4 = false;

  @override
  Widget build(BuildContext context) {
    bool isTablet = MediaQuery.of(context).size.width > 600;
    return Scaffold(
      backgroundColor: Color(0xffF5F0E6),
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage("lib/assets/images/shrine_bg.png"),
            fit: BoxFit.cover,
          ),
        ),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Stack(
                children: <Widget>[
                  Image.asset(
                    'lib/assets/images/shrine.png',
                    width: double.infinity,
                    fit: BoxFit.cover,
                  ),
                  Positioned(
                    top: 80.h,
                    left: 14.w,
                    //give the values according to your requirement
                    child: Container(
                        height: 36.h,
                        width: 36.w,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8.r),
                          color: Colors.white,
                        ),
                        child: Center(
                          child: IconButton(
                              style: const ButtonStyle(),
                              icon: Icon(
                                Icons.arrow_back_ios,
                                size: 20.sp,
                              ),
                              onPressed: () {
                                Navigator.pop(context);
                              }),
                        )),
                  ),
                ],
              ),
              Container(
                width: double.infinity,
                height: 600.h,
                padding: EdgeInsets.symmetric(horizontal: 18.w),
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      SizedBox(height: 25.h),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Padding(
                            padding: EdgeInsets.only(left: 10.w),
                            child: Image.asset(
                              "lib/assets/images/logo.png",
                              width: 14.w,
                              height: 32.h,
                            ),
                          ),
                          Align(
                            alignment: Alignment.centerRight,
                            child: Text(
                              'الأسئلة المتداولة',
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
                      SizedBox(height: 26.h),
                      Stack(
                        fit: StackFit.loose,
                        children: [
                          Visibility(
                            visible: _isShow1,
                            child: Card(
                              elevation: 4,
                              margin: EdgeInsets.zero,
                              child: Padding(
                                padding: EdgeInsets.only(
                                    right: 22.w, left: 22.w, bottom: 10.h),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    SizedBox(
                                      height: 70.h,
                                    ),
                                    Align(
                                      alignment: Alignment.topRight,
                                      child: Column(
                                        children: [
                                          Padding(
                                            padding: const EdgeInsets.only(
                                                top: 8, bottom: 8),
                                            child: CustomText(
                                              text:
                                              'هذه المحاضرات مجانية 100% ولكن للوصول إليها أولا '
                                                  'عليك التسجيل كطالب'
                                                  .toString(),
                                              color: Colors.black,
                                              fontSize: 14.sp,
                                              textAlign: TextAlign.right,
                                            ),
                                          ),
                                        ],
                                      ),
                                    )
                                  ],
                                ),
                              ),
                            ),
                          ),
                          GestureDetector(
                            onTap: () {
                              setState(() {
                                _isShow1 = !_isShow1;
                                _isShow2 = false;
                                _isShow3 = false;
                                _isShow4 = false;
                              });
                            },
                            child: Container(
                              height: isTablet ? 80 : 55,
                              width: double.infinity,
                              decoration: BoxDecoration(
                                color: kPrimaryColor,
                                borderRadius: BorderRadius.circular(10.r),
                              ),
                              child: Padding(
                                padding: EdgeInsets.symmetric(horizontal: 18.w),
                                child: Row(
                                  mainAxisAlignment:
                                  MainAxisAlignment.spaceBetween,
                                  children: [
                                    Transform.rotate(
                                        angle: _isShow1 == true
                                            ? 360 * math.pi / 180
                                            : 90 * math.pi / 180,
                                        child: Image.asset(
                                            'lib/assets/images/icon2.png',
                                            height: 25,
                                            width: 25)),
                                    Row(
                                      children: [
                                        Align(
                                          alignment: Alignment.centerRight,
                                          child: CustomText(
                                            text: "هل هذه المحاضرات مجانية؟",
                                            fontSize: isTablet ? 10.sp : 16.sp,
                                            textAlign: TextAlign.right,
                                          ),
                                        ),
                                        Icon(
                                          Icons.arrow_back_ios_sharp,
                                          size: 20.sp,
                                          color: Colors.white,
                                        )
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 17.h),
                      Stack(
                        fit: StackFit.loose,
                        children: [
                          Visibility(
                            visible: _isShow2,
                            child: Card(
                              elevation: 4,
                              margin: EdgeInsets.zero,
                              child: Padding(
                                padding: EdgeInsets.only(
                                    right: 22.w, left: 22.w, bottom: 10.h),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    SizedBox(
                                      height: 70.h,
                                    ),
                                    Align(
                                      alignment: Alignment.topRight,
                                      child: Column(
                                        children: [
                                          Padding(
                                            padding: const EdgeInsets.symmetric(
                                                vertical: 8.0),
                                            child: CustomText(
                                              text:
                                              'هذه المحاضرات مجانية 100% ولكن للوصول إليها أولا '
                                                  'عليك التسجيل كطالب'
                                                  .toString(),
                                              color: Colors.black,
                                              fontSize: 14.sp,
                                              textAlign: TextAlign.right,
                                            ),
                                          ),
                                        ],
                                      ),
                                    )
                                  ],
                                ),
                              ),
                            ),
                          ),
                          GestureDetector(
                            onTap: () {
                              setState(() {
                                _isShow1 = false;
                                _isShow2 = !_isShow2;
                                _isShow3 = false;
                                _isShow4 = false;
                              });
                            },
                            child: Container(
                              height: isTablet ? 80 : 55,
                              width: double.infinity,
                              decoration: BoxDecoration(
                                color: kPrimaryColor,
                                borderRadius: BorderRadius.circular(10.r),
                              ),
                              child: Padding(
                                padding: EdgeInsets.symmetric(horizontal: 18.w),
                                child: Row(
                                  mainAxisAlignment:
                                  MainAxisAlignment.spaceBetween,
                                  children: [
                                    Transform.rotate(
                                        angle: _isShow2 == true
                                            ? 360 * math.pi / 180
                                            : 90 * math.pi / 180,
                                        child: Image.asset(
                                            'lib/assets/images/icon2.png',
                                            height: 25,
                                            width: 25)),
                                    Row(
                                      children: [
                                        Align(
                                          alignment: Alignment.centerRight,
                                          child: CustomText(
                                            text: "هل هذه المحاضرات مجانية؟",
                                            fontSize: isTablet ? 10.sp : 16.sp,
                                            textAlign: TextAlign.right,
                                          ),
                                        ),
                                        Icon(
                                          Icons.arrow_back_ios_sharp,
                                          size: 20.sp,
                                          color: Colors.white,
                                        )
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 17.h),
                      Stack(
                        fit: StackFit.loose,
                        children: [
                          Visibility(
                            visible: _isShow3,
                            child: Card(
                              elevation: 4,
                              margin: EdgeInsets.zero,
                              child: Padding(
                                padding: EdgeInsets.only(
                                    right: 22.w, left: 22.w, bottom: 10.h),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    SizedBox(
                                      height: 70.h,
                                    ),
                                    Align(
                                      alignment: Alignment.topRight,
                                      child: Column(
                                        children: [
                                          Padding(
                                            padding: const EdgeInsets.symmetric(vertical: 8.0),
                                            child: CustomText(
                                              text: 'هذه المحاضرات مجانية 100% ولكن للوصول إليها أولا '
                                                  'عليك التسجيل كطالب'
                                                  .toString(),
                                              color: Colors.black,
                                              fontSize: 14.sp,
                                              textAlign: TextAlign.right,
                                            ),
                                          ),
                                        ],
                                      ),
                                    )
                                  ],
                                ),
                              ),
                            ),
                          ),
                          GestureDetector(
                            onTap: () {
                              setState(() {
                                _isShow1 = false;
                                _isShow2 = false;
                                _isShow3 = !_isShow3;
                                _isShow4 = false;
                              });
                            },
                            child: Container(
                              height: isTablet ? 80 : 55,
                              width: double.infinity,
                              decoration: BoxDecoration(
                                color: kPrimaryColor,
                                borderRadius: BorderRadius.circular(10.r),
                              ),
                              child: Padding(
                                padding: EdgeInsets.symmetric(horizontal: 18.w),
                                child: Row(
                                  mainAxisAlignment:
                                  MainAxisAlignment.spaceBetween,
                                  children: [
                                    Transform.rotate(
                                        angle: _isShow3 == true
                                            ? 360 * math.pi / 180
                                            : 90 * math.pi / 180,
                                        child: Image.asset(
                                            'lib/assets/images/icon2.png',
                                            height: 25,
                                            width: 25)),
                                    Row(
                                      children: [
                                        Align(
                                          alignment: Alignment.centerRight,
                                          child: CustomText(
                                            text: "هل هذه المحاضرات مجانية؟",
                                            fontSize: isTablet ? 10.sp : 16.sp,
                                            textAlign: TextAlign.right,
                                          ),
                                        ),
                                        Icon(
                                          Icons.arrow_back_ios_sharp,
                                          size: 20.sp,
                                          color: Colors.white,
                                        )
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 17.h),
                      Stack(
                        fit: StackFit.loose,
                        children: [
                          Visibility(
                            visible: _isShow4,
                            child: Card(
                              elevation: 4,
                              margin: EdgeInsets.zero,
                              child: Padding(
                                padding: EdgeInsets.only(
                                    right: 22.w, left: 22.w, bottom: 10.h),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    SizedBox(
                                      height: 70.h,
                                    ),
                                    Align(
                                      alignment: Alignment.topRight,
                                      child: Column(
                                        children: [
                                          Padding(
                                            padding: const EdgeInsets.symmetric(vertical: 8.0),
                                            child: CustomText(
                                              text: 'هذه المحاضرات مجانية 100% ولكن للوصول إليها أولا '
                                                  'عليك التسجيل كطالب'
                                                  .toString(),
                                              color: Colors.black,
                                              fontSize: 14.sp,
                                              textAlign: TextAlign.right,
                                            ),
                                          ),
                                        ],
                                      ),
                                    )
                                  ],
                                ),
                              ),
                            ),
                          ),
                          GestureDetector(
                            onTap: () {
                              setState(() {
                                _isShow1 = false;
                                _isShow2 = false;
                                _isShow3 = false;
                                _isShow4 = !_isShow4;
                              });
                            },
                            child: Container(
                              height: isTablet ? 80 : 55,
                              width: double.infinity,
                              decoration: BoxDecoration(
                                color: kPrimaryColor,
                                borderRadius: BorderRadius.circular(10.r),
                              ),
                              child: Padding(
                                padding: EdgeInsets.symmetric(horizontal: 18.w),
                                child: Row(
                                  mainAxisAlignment:
                                  MainAxisAlignment.spaceBetween,
                                  children: [
                                    Transform.rotate(
                                        angle: _isShow4 == true
                                            ? 360 * math.pi / 180
                                            : 90 * math.pi / 180,
                                        child: Image.asset(
                                            'lib/assets/images/icon2.png',
                                            height: 25,
                                            width: 25)),
                                    Row(
                                      children: [
                                        Align(
                                          alignment: Alignment.centerRight,
                                          child: CustomText(
                                            text: "هل هذه المحاضرات مجانية؟",
                                            fontSize: isTablet ? 10.sp : 16.sp,
                                            textAlign: TextAlign.right,
                                          ),
                                        ),
                                        Icon(
                                          Icons.arrow_back_ios_sharp,
                                          size: 20.sp,
                                          color: Colors.white,
                                        )
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 16.h),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'تواصل معنا',
                            style: TextStyle(
                                fontSize: 14.sp,
                                color: kPrimaryColor,
                                fontWeight: FontWeight.w600,
                                fontFamily: 'gesndbook',
                                decoration: TextDecoration.underline
                            ),
                          ),

                          SizedBox(width: 4.w,),

                          Text(
                            ' لمزيد من الاستفسارات',
                            style: TextStyle(
                              fontSize: 14.sp,
                              color: kPrimaryColor,
                              fontWeight: FontWeight.w400,
                              fontFamily: 'gesndbook',
                            ),
                          ),

                          Text(
                            'تواصل معنا',
                            style: TextStyle(
                              fontSize: 14.sp,
                              color: kPrimaryColor,
                              fontWeight: FontWeight.w400,
                              fontFamily: 'gesndbook',
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
