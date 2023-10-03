import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';
import 'package:untitled6/model/courses_model.dart';
import 'package:untitled6/model/lecture_teacher_model.dart';
import 'package:untitled6/provider/courses_provider.dart';
import 'package:untitled6/utilities/app_constant.dart';
import 'package:untitled6/utilities/colors.dart';
import 'package:untitled6/view/base/rating_bar.dart';
import 'package:untitled6/view/screens/video.dart';

import '../base/rating.dart';

class Lecture extends StatefulWidget {
  Lecture({required this.title});

  String title;

  @override
  State<Lecture> createState() => _LectureState();
}

class _LectureState extends State<Lecture> {
  @override
  void initState() {
    super.initState();
    AllCoursedProvider allCoursedProvider = Provider.of<AllCoursedProvider>(context, listen: false);
    Future.microtask(() {
      allCoursedProvider.getAllCourses();

    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          leadingWidth: double.infinity,
          toolbarHeight: 190.h,
          leading: Container(
            width: 393.w,
            color: kPrimaryColor,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Padding(
                  padding: EdgeInsets.only(top: 40.h, left: 19.w),
                  child: Align(
                      alignment: Alignment.topLeft,
                      child: Image.asset('lib/assets/images/bar.png')),
                ),
                SizedBox(
                  height: 10.h,
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
                        prefixIcon: const Icon(Icons.search,color:Color(0xff8E1839),),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8.r),
                        ),
                        suffix: Text(
                          "ابحث هنا",
                          style: TextStyle(
                            fontSize: 14.sp,
                            fontWeight: FontWeight.w400,
                            color: const Color(0xff8E1839),
                            fontFamily: 'gesndbook',
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
        body: Consumer<AllCoursedProvider>(
            builder: (context, allCoursedProvider, child) {
          return allCoursedProvider.loading?const Center(child: CircularProgressIndicator(),):Column(children: [
            SizedBox(
              height: 10.h,
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 10.r),
              child: Row(
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
                  Padding(
                    padding: EdgeInsets.only(right: 10.w),
                    child: Align(
                      alignment: Alignment.topRight,
                      child: Text(
                        widget.title,
                        // 'االمحاضرات',
                        style: TextStyle(
                            fontSize: 20.sp,
                            color: Color(0xff8E1839),
                            fontWeight: FontWeight.w700,
                            fontFamily: 'gesndbook'),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 18.w),
                child: ListView.builder(
                    itemCount:
                        allCoursedProvider.allCourses[0].allcourses?.length,
                    shrinkWrap: true,
                    physics: const BouncingScrollPhysics(),
                    itemBuilder: (BuildContext context, int index) {
                      Color backgroundColor =
                          index.isEven ? kPrimaryColor : Colors.white;
                      return GestureDetector(
                        onTap: () {
                          // Get.to(()=>Video(courses: allCoursedProvider.allCourses[0].allcourses![index]))
                        },
                        child: Container(
                           height: 135.h,
                          margin: EdgeInsets.symmetric(vertical: 8.h),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: backgroundColor,
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.black.withOpacity(0.25),
                                  blurRadius: 4,
                                  offset: Offset(0, 2),
                                  spreadRadius: 0,
                                )
                              ]),
                          child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                SizedBox(
                                  width: 10.w,
                                ),
                                index.isEven
                                    ? Image.asset(
                                        "lib/assets/images/back2.png",
                                        width: 30.w,
                                        height: 20.h,
                                      )
                                    : Image.asset(
                                        "lib/assets/images/back1.png",
                                        width: 30.w,
                                        height: 20.h,
                                      ),
                                Expanded(
                                    child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.end,
                                        children: [
                                      SizedBox(
                                        height: 9.h,
                                      ),
                                      Text(
                                        allCoursedProvider.allCourses[0].allcourses![index].title.toString(),
                                        style: TextStyle(
                                          fontSize: 13,
                                          fontFamily: 'gesndbook',
                                          color: index.isEven
                                              ? Colors.white
                                              : Colors.black,
                                          fontWeight: FontWeight.w400,
                                        ),
                                        textAlign: TextAlign.right,
                                        overflow: TextOverflow.ellipsis,
                                      ),
                                      SizedBox(
                                        height: 6.h,
                                      ),
                                      Text(
                                        allCoursedProvider.allCourses[0].allcourses![index].lecturers![0].name.toString(),
                                        style: TextStyle(
                                          fontSize: 14.sp,
                                          color: index.isEven
                                              ? Colors.white
                                              : Colors.black,
                                          fontWeight: FontWeight.w400,
                                          fontFamily: 'gesndbook',
                                        ),
                                        overflow: TextOverflow.ellipsis,
                                        textAlign: TextAlign.right,
                                      ),
                                      SizedBox(
                                        height: 6.h,
                                      ),
                                      Container(
                                        // color: Colors.red,
                                        // height: 25,
                                        width: 180.w,
                                        child: Text(
                                         allCoursedProvider.allCourses[0].allcourses![index].lecturers![0].currentJob.toString(),
                                          style: TextStyle(
                                            fontSize: 10.sp,
                                            color: index.isEven
                                                ? Colors.white
                                                : Colors.black,
                                            fontWeight: FontWeight.w400,
                                            fontFamily: 'gesndbook',
                                          ),
                                          maxLines: 2,
                                          overflow: TextOverflow.ellipsis,
                                          textAlign: TextAlign.right,
                                        ),
                                      ),
                                      // SizedBox(height: 6.h),
                                      Spacer(),
                                      Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.end,
                                          children: [
                                            RatingBar(
                                              rating: 0,
                                              size: 11,
                                              ratingCount:0,
                                            ),
                                          ]),
                                      SizedBox(
                                        height: 12.h,
                                      ),
                                    ])),

                                Padding(
                                  padding:
                                      EdgeInsets.only(left: 12.w, right: 9),
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.circular(8),
                                    child: Image.network(
                                      allCoursedProvider.allCourses[0].allcourses![index].lecturers![0].imgTemp.toString(),
                                      width: 100.w,
                                      height: 110.h,
                                      fit: BoxFit.fill,
                                    ),
                                  ),
                                ),
                              ]),
                        ),
                      );
                    }),
              ),
            ),
          ]);
        }));
  }
}
