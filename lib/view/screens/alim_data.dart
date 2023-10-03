import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:untitled6/model/courses_model.dart';
import 'dart:math' as math;

import '../../model/ullama_data.dart';
import '../../utilities/colors.dart';
import '../base/custom_text.dart';

class DataScreen extends StatefulWidget {
  List<Tutors> lecturers;
  int id;
  int index;

  DataScreen({super.key, required this.lecturers,required this.id,required this.index});

  @override
  State<DataScreen> createState() => _DataScreenState();
}

class _DataScreenState extends State<DataScreen> {
  bool _isShow = false;
  bool _isShow1 = false;
  bool _isShow2 = false;

  @override
  Widget build(BuildContext context) {
    bool isTablet = MediaQuery.of(context).size.width > 600;
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        leadingWidth: double.infinity,
        toolbarHeight: 130,
        leading: Padding(
          padding: EdgeInsets.only(left: 10.w,right: 10.w,top: 40, ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                  height: 36.h,
                  width: 36.w,
                  padding: EdgeInsets.all(4).r,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(8.r)),
                  child: GestureDetector(
                      onTap: (){
                        Navigator.pop(context);
                      },
                      child: Center(
                          child: Icon(
                            Icons.arrow_back_ios_new_sharp,
                            size: 20.sp,
                            color: kPrimaryColor,
                          )))),
              CustomText(
                text: "تفاصيل المحاضر",
                fontSize: 24.sp,
                fontWeight: FontWeight.w400,
              )
            ],
          ),
        ),
      ),
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 14.w, vertical: 17),
              child: Container(
                width: 400.w,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(20.r),
                ),
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      SizedBox(
                        height: 10.h,
                      ),
                      Center(
                          child: ClipRRect(
                              borderRadius: const BorderRadius.all(
                                  Radius.circular(20)),
                              child: Image.network(
                                widget.lecturers[widget.index].imgTemp.toString(),
                                width: 400.w,
                                // height: 141.h,
                                fit: BoxFit.fill,
                              ))),
                      SizedBox(
                        height: 17.h,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(right: 10.0),
                        child: Align(
                          alignment: Alignment.topRight,
                          child: Text(
                            "الاسم:${widget.lecturers[widget.index].name.toString()}",
                            style: TextStyle(
                              fontSize: 16.sp,
                              color: const Color(0xff979797),
                              fontWeight: FontWeight.w400,
                              fontFamily: 'gesndbook',
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Align(
                          //alignment: Alignment.topRight,
                          child: Text(
                            "العمل الحالي:${widget.lecturers[widget.index].currentJob.toString()}",
                            style: TextStyle(
                              fontSize: 16.sp,
                              color: const Color(0xff979797),
                              fontWeight: FontWeight.w400,
                              fontFamily: 'gesndbook',
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 8.h,
                      ),
                      Stack(
                        fit: StackFit.loose,
                        children: [
                          Visibility(
                            visible: _isShow1,
                            child: Card(
                              elevation: 4,
                              margin: EdgeInsets.zero,
                              child: Padding(
                                padding:
                                EdgeInsets.only(right:22.w,left: 22.w,bottom: 10.h),
                                child: Column(
                                  crossAxisAlignment:
                                  CrossAxisAlignment.center,
                                  children: [
                                    SizedBox(
                                      height: 70.h,
                                    ),
                                    Align(
                                      alignment: Alignment.topRight,
                                      child: Column(
                                        children: [
                                          CustomText(
                                            text: widget.lecturers[widget.index].qualifications.toString(),
                                            color: Colors.black,
                                            fontSize: 14.sp,
                                            textAlign: TextAlign.right,
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
                                _isShow = false;
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
                                padding:
                                EdgeInsets.symmetric(horizontal: 18.w),
                                child: Row(
                                  mainAxisAlignment:
                                  MainAxisAlignment.spaceBetween,
                                  children: [
                                    Transform.rotate(
                                        angle: _isShow1 == true
                                            ? 360 * math.pi / 180
                                            : 90 * math.pi / 180,
                                        child: Image.asset('lib/assets/images/icon2.png',height: 25,width: 25)) ,
                                    Row(
                                      children: [
                                        Align(
                                          alignment: Alignment.centerRight,
                                          child: CustomText(
                                            text: "الخبرات و المؤهلات",
                                            fontSize: isTablet ? 10.sp :16.sp,
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
                      SizedBox(
                        height: 10.h,
                      ),
                      Stack(
                        fit: StackFit.loose,
                        children: [
                          Visibility(
                            visible: _isShow2,
                            child: Card(
                              margin: EdgeInsets.zero,
                              elevation: 4,
                              child: Padding(
                                padding:
                                EdgeInsets.only(right:22.w,left: 22.w,bottom: 10.h),
                                child: Column(
                                  crossAxisAlignment:
                                  CrossAxisAlignment.center,
                                  children: [
                                    SizedBox(
                                      height: 70.h,
                                    ),
                                    Align(
                                      alignment: Alignment.topRight,
                                      child: Column(
                                        children: [
                                          CustomText(
                                            text: widget.lecturers[0].qualifications.toString()
                                                .toString(),
                                            color: Color(0xff131313),
                                            fontSize: 14.sp,
                                            textAlign: TextAlign.right,
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
                                _isShow2 = !_isShow2;
                                _isShow1 = false;
                                _isShow = false;
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
                                padding:
                                EdgeInsets.symmetric(horizontal: 18.w),
                                child: Row(
                                  mainAxisAlignment:
                                  MainAxisAlignment.spaceBetween,
                                  children: [
                                    Transform.rotate(
                                        angle: _isShow2 == true
                                            ? 360 * math.pi / 180
                                            : 90 * math.pi / 180,
                                        child: Image.asset('lib/assets/images/icon2.png',height: 25,width: 25)),
                                    Row(
                                      children: [
                                        Align(
                                          alignment: Alignment.centerRight,
                                          child: CustomText(
                                            text: "المؤلفات",
                                            fontSize: isTablet ? 10.sp :16.sp,
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
                      SizedBox(
                        height: 10.h,
                      ),
                      Stack(
                        fit: StackFit.loose,
                        children: [
                          Visibility(
                            visible: _isShow,
                            child: Card(
                              elevation: 4,
                              margin: EdgeInsets.zero,
                              child: Padding(
                                padding:
                                EdgeInsets.only(right:22.w,left: 22.w,bottom: 10.h),
                                child: Column(
                                  crossAxisAlignment:
                                  CrossAxisAlignment.center,
                                  children: [
                                    SizedBox(
                                      height: 70.h,
                                    ),
                                    Align(
                                      alignment: Alignment.topRight,
                                      child: Column(
                                        children: [
                                          CustomText(
                                            text:widget.lecturers[0].qualifications.toString()
                                                .toString(),
                                            color: Color(0xff131313),
                                            fontSize: 14.sp,
                                            textAlign: TextAlign.right,
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
                                _isShow = !_isShow;
                                _isShow2 = false;
                                _isShow1 = false;
                              });
                            },
                            child: Container(
                              height: isTablet ? 80 :55,
                              width: double.infinity,
                              decoration: BoxDecoration(
                                color: kPrimaryColor,
                                borderRadius: BorderRadius.circular(10.r),
                              ),
                              child: Padding(
                                padding:
                                EdgeInsets.symmetric(horizontal: 18.w),
                                child: Row(
                                  mainAxisAlignment:
                                  MainAxisAlignment.spaceBetween,
                                  children: [
                                    Transform.rotate(
                                        angle: _isShow == true
                                            ? 360 * math.pi / 180
                                            : 90 * math.pi / 180,
                                        child: Image.asset('lib/assets/images/icon2.png',height: 25,width: 25)) ,
                                    Row(
                                      children: [
                                        Align(
                                          alignment: Alignment.centerRight,
                                          child: CustomText(
                                            text: "الشهادات",
                                            fontSize: isTablet ? 10.sp :16.sp,
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
                      SizedBox(
                          height: 20.h
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
