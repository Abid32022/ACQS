import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:untitled6/provider/courses_provider.dart';
import 'package:untitled6/view/base/rating_bar.dart';

import '../../model/almahzeroon.dart';
import '../../model/ullama_data.dart';
import '../../utilities/colors.dart';
import 'alim_data.dart';

class AlmahazaratScreen extends StatefulWidget {
  AlmahazaratScreen({super.key});

  @override
  State<AlmahazaratScreen> createState() => _AlmahazaratScreenState();
}

class _AlmahazaratScreenState extends State<AlmahazaratScreen> {
  TextEditingController searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    bool isTablet = MediaQuery.of(context).size.width > 600;
    return Scaffold(
      body: Consumer<AllCoursedProvider>(
          builder: (context, allCoursedProvider, child) {
            return Container(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    width: double.infinity.w,
                    height: 210.h,
                    color: kPrimaryColor,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: EdgeInsets.only(top: 75.h, left: 19.w),
                          child: Image.asset('lib/assets/images/bar.png'),
                        ),
                        SizedBox(
                          height: 20.h,
                        ),
                        Padding(
                            padding: EdgeInsets.symmetric(horizontal: 14.w),
                            child: Center(
                              child: Container(
                                width: 366.w,
                                height: 52.h,
                                child: TextField(
                                  controller: searchController,
                                  onChanged: (value) {
                                    setState(() {});
                                  },
                                  style: const TextStyle(color: Color(0xff8E1839)),
                                  decoration: InputDecoration(
                                    filled: true,
                                    fillColor: Colors.white,
                                    hintStyle: TextStyle(
                                      fontSize: 14.sp,
                                      fontWeight: FontWeight.w400,
                                      color: const Color(0xff8E1839),
                                      fontFamily: 'gesndbook',
                                    ),
                                    prefixIcon: const Icon(
                                      Icons.search,
                                      color: Color(0xff8E1839),
                                    ),
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
                            ))
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 15.h,
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 23.w),
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
                              'المحاضرون',
                              style: TextStyle(
                                  fontSize: 20.sp,
                                  color: const Color(0xff8E1839),
                                  fontWeight: FontWeight.w600,
                                  fontFamily: 'gesndbook'),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 10.h,
                  ),
                  allCoursedProvider.coursesModel[0].tutors != null
                      ? allCoursedProvider.coursesModel[0].tutors!.isNotEmpty
                      ? searchController.text.toString().isEmpty
                      ? Expanded(
                    child: allCoursedProvider.loading
                        ? const Center(
                      child: CircularProgressIndicator(),
                    )
                        : GridView.count(
                      padding: EdgeInsets.symmetric(
                          horizontal: 23.w),
                      physics: const BouncingScrollPhysics(),
                      mainAxisSpacing: 12,
                      childAspectRatio: 0.70,
                      crossAxisSpacing: 12,
                      shrinkWrap: true,
                      crossAxisCount: 2,
                      children: List.generate(
                        allCoursedProvider
                            .coursesModel[0].tutors!.length,
                            (index) => GestureDetector(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) =>
                                      DataScreen(
                                          index: index,
                                          id: allCoursedProvider
                                              .coursesModel[0]
                                              .tutors![index]
                                              .id!,
                                          lecturers:
                                          allCoursedProvider
                                              .coursesModel[
                                          0]
                                              .tutors!),
                                ));
                          },
                          child: Container(
                            width: 171.w,
                            decoration: BoxDecoration(
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.black
                                      .withOpacity(0.25),
                                  // Shadow color
                                  spreadRadius: 0,
                                  // Spread radius
                                  blurRadius: 4,
                                  // Blur radius
                                  offset: const Offset(2,
                                      2), // Offset of the shadow
                                ),
                              ],
                              borderRadius:
                              BorderRadius.circular(8.r),
                              color: Colors.white,
                            ),
                            child: Column(
                              children: [
                                ClipRRect(
                                  borderRadius:
                                  const BorderRadius.only(
                                      topRight:
                                      Radius.circular(
                                          8),
                                      topLeft:
                                      Radius.circular(
                                          8)),
                                  child: Image.network(
                                    allCoursedProvider
                                        .coursesModel[0]
                                        .tutors![index]
                                        .imgTemp!,
                                    width: 171.w,
                                    height: 140.h,
                                    fit: BoxFit.cover,
                                  ),
                                ),
                                Padding(
                                  padding:  EdgeInsets.symmetric(horizontal: 5.w),
                                  child: Column(
                                    children: [
                                      Align(
                                        alignment: Alignment
                                            .centerRight,
                                        child: Text(
                                          allCoursedProvider
                                              .coursesModel[
                                          0]
                                              .tutors![
                                          index]
                                              .name.toString(),
                                          style:
                                          const TextStyle(
                                            fontSize: 10,
                                            color:
                                            kPrimaryColor,
                                            fontWeight:
                                            FontWeight
                                                .w700,
                                            fontFamily:
                                            'gesndbook',
                                          ),
                                          textAlign:
                                          TextAlign
                                              .right,
                                        ),
                                      ),
                                      SizedBox(
                                        height: 4.h,
                                      ),
                                      Align(
                                        alignment: Alignment
                                            .centerRight,
                                        child: SizedBox(
                                          width: 160,
                                          child: Text(
                                            allCoursedProvider
                                                .coursesModel[
                                            0]
                                                .tutors![
                                            index]
                                                .currentJob
                                                .toString(),
                                            style:
                                            const TextStyle(
                                              fontSize:
                                              10,
                                              color: Color(
                                                  0xff666666),
                                              fontWeight:
                                              FontWeight
                                                  .w400,
                                              fontFamily:
                                              'gesndbook',
                                            ),
                                            textAlign:
                                            TextAlign
                                                .right,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                const Spacer(),
                                Padding(
                                  padding:  EdgeInsets.symmetric(horizontal: 5.w),
                                  child: Row(
                                    mainAxisAlignment:
                                    MainAxisAlignment
                                        .spaceBetween,
                                    children: [
                                      RatingBar(
                                        rating: 0,
                                        size: 14,
                                        ratingCount: 0,
                                      ),
                                      const Spacer(),
                                      const Align(
                                        alignment: Alignment
                                            .centerRight,
                                        child: Text(
                                          '(0)',
                                          style: TextStyle(
                                            fontSize: 12,
                                            color: Color(
                                                0xff888C94),
                                            fontWeight:
                                            FontWeight
                                                .w400,
                                            fontFamily:
                                            'gesndbook',
                                          ),
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
                    ),
                  )
                      : Expanded(
                    child: allCoursedProvider.loading
                        ? const Center(
                      child: CircularProgressIndicator(),
                    )
                        : GridView.count(
                      padding: EdgeInsets.symmetric(
                          horizontal: 23.w),
                      physics: const BouncingScrollPhysics(),
                      mainAxisSpacing: 12,
                      childAspectRatio: 0.70,
                      crossAxisSpacing: 12,
                      shrinkWrap: true,
                      crossAxisCount: 2,
                      children: List.generate(
                        allCoursedProvider
                            .coursesModel[0].tutors!.length,
                            (index) => GestureDetector(
                            onTap: () {
                              // Navigator.push(
                              //     context,
                              //     MaterialPageRoute(
                              //       builder: (context) =>
                              //           DataScreen(alimdata: myUllamaData[index]),
                              //     ));
                            },
                            child:
                            allCoursedProvider
                                .coursesModel[0]
                                .tutors![index]
                                .name
                                .toString()
                                .toLowerCase()
                                .contains(
                                searchController
                                    .text
                                    .toString()
                                    .toLowerCase())
                                ? Container(
                              width: 171.w,
                              decoration:
                              BoxDecoration(
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors
                                        .black
                                        .withOpacity(
                                        0.25),
                                    // Shadow color
                                    spreadRadius: 0,
                                    // Spread radius
                                    blurRadius: 4,
                                    // Blur radius
                                    offset: const Offset(
                                        2,
                                        2), // Offset of the shadow
                                  ),
                                ],
                                borderRadius:
                                BorderRadius
                                    .circular(
                                    8.r),
                                color: Colors.white,
                              ),
                              child: Column(
                                children: [
                                  ClipRRect(
                                    borderRadius: const BorderRadius
                                        .only(
                                        topRight: Radius
                                            .circular(
                                            8),
                                        topLeft: Radius
                                            .circular(
                                            8)),
                                    child:
                                    Image.network(
                                      allCoursedProvider
                                          .coursesModel[
                                      0]
                                          .tutors![
                                      index]
                                          .imgTemp!,
                                      width: 171.w,
                                      height: 140.h,
                                      fit: BoxFit
                                          .cover,
                                    ),
                                  ),
                                  Padding(
                                    padding: EdgeInsets
                                        .symmetric(
                                      horizontal: 5.w,
                                    ),
                                    child: Column(
                                      mainAxisAlignment:
                                      MainAxisAlignment
                                          .spaceBetween,
                                      children: [
                                        SizedBox(
                                          height:
                                          isTablet
                                              ? 120
                                              : 70,
                                          child:
                                          Column(
                                            children: [
                                              Align(
                                                alignment:
                                                Alignment.centerRight,
                                                child:
                                                Text(
                                                  allCoursedProvider.coursesModel[0].tutors![index].name.toString(),
                                                  style:
                                                  const TextStyle(
                                                    fontSize: 10,
                                                    color: kPrimaryColor,
                                                    fontWeight: FontWeight.w700,
                                                    fontFamily: 'gesndbook',
                                                  ),
                                                  textAlign:
                                                  TextAlign.right,
                                                ),
                                              ),
                                              SizedBox(
                                                height:
                                                4.h,
                                              ),
                                              Align(
                                                alignment:
                                                Alignment.centerRight,
                                                child:
                                                SizedBox(
                                                  width:
                                                  160,
                                                  child:
                                                  Text(
                                                    allCoursedProvider.coursesModel[0].tutors![index].qualifications.toString(),
                                                    style: TextStyle(
                                                      fontSize: 10.sp,
                                                      color: const Color(0xff666666),
                                                      fontWeight: FontWeight.w400,
                                                      fontFamily: 'gesndbook',
                                                    ),
                                                    textAlign: TextAlign.right,
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                        Row(
                                          mainAxisAlignment:
                                          MainAxisAlignment
                                              .spaceBetween,
                                          children: [
                                            Align(
                                              alignment:
                                              Alignment.centerRight,
                                              child:
                                              RatingBar(
                                                rating: allCoursedProvider
                                                    .coursesModel[0]
                                                    .mostCourses![index]
                                                    .rating!
                                                    .toDouble(),
                                                size:
                                                14,
                                                ratingCount: allCoursedProvider
                                                    .coursesModel[0]
                                                    .mostCourses![index]
                                                    .ratingCount!
                                                    .toInt(),
                                              ),
                                            ),
                                            // RatingWidget2(),
                                            const Spacer(),
                                            Align(
                                              alignment:
                                              Alignment.centerRight,
                                              child:
                                              Text(
                                                '(${allCoursedProvider.coursesModel[0].mostCourses![index].ratingCount!.toInt()})',
                                                style:
                                                const TextStyle(
                                                  fontSize:
                                                  11,
                                                  color:
                                                  Color(0xff888C94),
                                                  fontWeight:
                                                  FontWeight.w400,
                                                  fontFamily:
                                                  'gesndbook',
                                                ),
                                              ),
                                            ),
                                          ],
                                        )
                                      ],
                                    ),
                                  )
                                ],
                              ),
                            )
                                : const SizedBox()),
                      ),
                    ),
                  )
                      : const CircularProgressIndicator(
                    color: Colors.red,
                  )
                      : const SizedBox(),
                ],
              ),
            );
          }),
    );
  }
}
