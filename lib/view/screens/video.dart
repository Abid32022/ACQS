import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:untitled6/provider/courses_provider.dart';
import 'package:untitled6/utilities/colors.dart';
import 'package:untitled6/view/base/custom_text.dart';
import 'package:untitled6/view/screens/quiz_screen.dart';
import 'package:video_player/video_player.dart';
import 'dart:math' as math;
import 'package:chewie/chewie.dart';
import '../../model/courses_model.dart';
import '../base/rating_bar.dart';

class Video extends StatefulWidget {
  MostCourses? courses;
  Video({super.key,  this.courses});

  @override
  State<Video> createState() => _VideoState();
}

class _VideoState extends State<Video> {

  VideoPlayerController? videoPlayerController;
  ChewieController? chewieController;
  List<Subjectvideos>? videoUrls = [];
  int currentVideoIndex = 0;
  List<ChewieController> chewieControllers = [];
  bool isSubscribed = false;
  bool isHide = false;

  @override
  void initState() {
    currentVideoIndex=0;
    if(widget.courses != null &&
        videoUrls != null &&
        widget.courses!.subjectcourses != null &&
        widget.courses!.subjectcourses!.isNotEmpty &&
        widget.courses!.subjectcourses![0].subjectvideos != null &&
        widget.courses!.subjectcourses![0].subjectvideos!.isNotEmpty){
      videoUrls=widget.courses!.subjectcourses![0].subjectvideos!;
      chewieControllers.clear();
      for (Subjectvideos? videoUrl in videoUrls!) {
        VideoPlayerController videoController = VideoPlayerController.network(videoUrl!.videoTemp.toString());
        ChewieController controller = ChewieController(
          videoPlayerController: videoController,
          aspectRatio: 16 / 9,
          autoPlay: true,
          looping: false,
          // showControls: isSubscribed==false?false:true,
        );
        videoController.initialize().then((_) {
          videoController.setLooping(false);
        });
        chewieControllers.add(controller);
      }
      for (int i = 0; i < chewieControllers.length; i++) {
        chewieControllers[i].videoPlayerController
            .addListener(() {
          if (chewieControllers[i].videoPlayerController.value.duration.inSeconds ==
              chewieControllers[i].videoPlayerController.value.position.inSeconds) {
            if (i + 1 < chewieControllers.length) {
              chewieController = chewieControllers[i + 1];
              currentVideoIndex++;
              setState(() {});
              chewieController!.dispose();
            } else {

            }
            if(currentVideoIndex==1){
              videoPlayerController?.pause();
              videoPlayerController?.dispose();
              chewieController?.pause();
              print("complete is ");
              isHide=false;
              subscriptionDialog(context);
            }
          } else {
            print("Video not complete");
          }
        });
      }
      chewieController = chewieControllers[currentVideoIndex];
    }else{
      return;
    }
  }




  @override
  void dispose() {
    for (var controller in chewieControllers) {
      controller.dispose();
    }
    chewieControllers.clear();
    chewieController!.dispose();
    videoUrls!.clear();
    currentVideoIndex=0;
    widget.courses!.subjectcourses!.clear();
    super.dispose();
  }


  void subscriptionDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text("Subscribe", style:TextStyle(color: Colors.black)),
          content: const Text("تحتاج إلى الاشتراك لمشاهدة المزيد من أشرطة الفيديو.",style: TextStyle(color: Colors.black),),
          actions: <Widget>[
            MaterialButton(
              child: const Text("Close"),
              onPressed: () {
                // Navigator.of(context).pop();
              },
            ),
            MaterialButton(
              child: const Text("Subscribe"),
              onPressed: () {
                //Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }
  int currentContainerIndex = 1;
  @override
  Widget build(BuildContext context) {
    Widget currentContainer = VideoProgress(
      courses: widget.courses!,
    );
    if (currentContainerIndex == 1) {
      currentContainer = VideoProgress(courses:widget.courses!);
    } else if (currentContainerIndex == 2) {
      currentContainer = QuizScreen(courseID: widget.courses!.id.toString(),);
    }
    bool isTablet = MediaQuery.of(context).size.width > 600;
    return Scaffold(
      appBar: AppBar(
        leadingWidth: double.infinity,
        leading: Container(
          width: 393.w,
          // height: 191.h,
          color: kPrimaryColor,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Padding(
                    padding: EdgeInsets.only(top: 40.h, left: 19.w),
                    child: Container(
                        height: 36.h,
                        width: 36.h,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8.r),
                          color: Colors.white,
                        ),
                        child: Center(
                          child: IconButton(
                              style: const ButtonStyle(),
                              icon: Icon(
                                Icons.arrow_back_ios,
                                size: 15.sp,
                                color: kPrimaryColor,
                              ),
                              onPressed: () {
                                videoUrls!.clear();
                                chewieControllers.clear();
                                chewieController?.pause();
                                widget.courses!.subjectcourses!.clear();
                                Navigator.pop(context);
                              }),
                        )),
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 40.h, right: 19.w),
                    child: Align(
                      alignment: Alignment.centerRight,
                      child: Padding(
                        padding: const EdgeInsets.only(left: 20.0),
                        child: Text(
                          currentContainerIndex == 2
                              ? 'الاختبار النهائي لدورة مدخل الي علم السنن'
                              : widget.courses!.title.toString(),
                          style: TextStyle(
                            fontSize:
                            currentContainerIndex == 2 ? 17.sp : 24.sp,
                            color: Colors.white,
                            fontWeight: FontWeight.w400,
                            fontFamily: 'gesndbook',
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              Padding(
                padding: EdgeInsets.only(top: 1.h, right: 19.w),
                child: Align(
                  alignment: Alignment.centerRight,
                  child: Text(
                    ' مشترك  •',
                    style: TextStyle(
                      fontSize: 14.sp,
                      color: Colors.white,
                      fontWeight: FontWeight.w400,
                      fontFamily: 'gesndbook',
                    ),
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(top: 1.h, right: 19.w),
                child: Align(
                  alignment: Alignment.centerRight,
                  child: Text(
                    '${''}المستوى للجميع  •',
                    style: TextStyle(
                      fontSize: 14.sp,
                      color: Colors.white,
                      fontWeight: FontWeight.w400,
                      fontFamily: 'gesndbook',
                    ),
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(top: 1.h, right: 19.w),
                child: Align(
                  alignment: Alignment.centerRight,
                  child: RatingBar(
                    rating: 3.5,
                    size: 15,
                    ratingCount: 1,
                  ),
                ),
              ),
              SizedBox(
                height: 10.h,
              )
            ],
          ),
        ),
        toolbarHeight: isTablet ? 240.h : 160.h,
      ),
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 13.w, vertical: 10.h),
          child: Column(
            children: [
              Container(
                decoration: BoxDecoration(
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.25),
                      // Shadow color
                      spreadRadius: 0,
                      // Spread radius
                      blurRadius: 4,
                      // Blur radius
                      offset: const Offset(2, 2), // Offset of the shadow
                    ),
                  ],
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(8.r),
                  border:
                  Border.all(color: const Color(0x1a000000), width: 1.r),
                ),
                width: 366.w,
                child: Padding(
                  padding:
                  EdgeInsets.symmetric(horizontal: 24.w, vertical: 24.h),
                  child: Column(
                    children: [
                      Center(
                        child: Container(

                          width: 317.w,
                          height: 242.h,
                          child: Chewie(
                            controller: chewieControllers[0],
                          ),
                        ),
                      ),
                      SizedBox(
                        width: 318.w,
                        child: Padding(
                          padding: EdgeInsets.only(top: 17.h, right: 8),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              Image.asset('lib/assets/images/ThumbsUp.png'),
                              SizedBox(
                                width: 19.w,
                              ),
                              Image.asset('lib/assets/images/ThumbsDown.png'),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              isHide==true? const Padding(
                padding: EdgeInsets.all(8.0),
                child: Text("تحتاج إلى الاشتراك لمشاهدة المزيد من أشرطة الفيديو",style: TextStyle(color: Colors.red),),
              ):const SizedBox(),
              SizedBox(
                  height: 600,
                  child: currentContainer),
              // SizedBox(
              //   height: 26.h,
              // ),
              // ElevatedButton(
              //   onPressed: () {
              //     setState(() {
              //       if (currentContainerIndex == 1) {
              //         currentContainerIndex = 2; // Switch to Container2
              //       } else if (currentContainerIndex == 2) {
              //         // Navigate to the next screen
              //         // Navigator.of(context).push(
              //         //   MaterialPageRoute(
              //         //     builder: (context) => NextScreen(),
              //         //   ),
              //         // );
              //       }
              //     });
              //   },
              //   style: ElevatedButton.styleFrom(
              //     backgroundColor: const Color(0xFF8E1839),
              //     // Replace with your desired hex color code
              //     minimumSize: Size(325.w, 52.h),
              //     // Set the desired width and height
              //     shape: RoundedRectangleBorder(
              //       borderRadius: BorderRadius.circular(
              //           10.0), // Set the desired border radius
              //     ),
              //     elevation: 0.0, // Set elevation to 0 to remove the shadow
              //   ),
              //   child: Center(
              //     child: Text(
              //       currentContainerIndex == 2
              //           ? 'الاشتراك بالدورة'
              //           : 'الانتقال الي الاختبار',
              //       style: TextStyle(
              //         fontFamily: 'gesndbook',
              //         fontWeight: FontWeight.w600,
              //         fontSize: 16.sp, // Adjust the font size as needed
              //         color: Colors.white, // Text color
              //       ),
              //     ),
              //   ),
              // ),
              // SizedBox(
              //   height: 21.h,
              // ),
            ],
          ),
        ),
      ),
    );
  }
}

/// Video GridView
class VideoProgress extends StatefulWidget {
  MostCourses? courses;
  VideoProgress({super.key, this.courses});

  @override
  State<VideoProgress> createState() => _VideoProgressState();
}

class _VideoProgressState extends State<VideoProgress> {
  bool _isShow1 = true;
  bool _isShow2 = false;
  List<bool> _isShowList = []; // Initialize as an empty list


  @override
  void initState() {
    super.initState();
    _isShowList = List.generate(widget.courses!.subjectcourses!.length, (_) => false);
  }
  int current = 0;
  int selectedIndex = -1;
  List<int> selectedIndices = [];
  bool otherIndex = false;

  @override
  Widget build(BuildContext context) {
    bool isTablet = MediaQuery.of(context).size.width > 600;
    return Consumer<AllCoursedProvider>(
        builder: (context, allCoursedProvider, child) {
          return  allCoursedProvider.loading?const SizedBox():ListView.builder(
              physics: const NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              itemCount: widget.courses!.subjectcourses!.length,
              itemBuilder: (context,indexMain){
                return Padding(
                  padding: const EdgeInsets.only(top: 20.0),
                  child: SizedBox(
                    height: _isShowList[indexMain] ? 470 : 70,
                    child: Stack(
                      children: [
                        Visibility(
                          visible: _isShowList[indexMain],
                          child: Container(
                            decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(10.r),
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.black26.withOpacity(0.3),
                                    blurRadius: 10,
                                    spreadRadius: 1,
                                  ),
                                ]),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                SizedBox(
                                  height: isTablet ? 80.h : 60.h,
                                ),
                                Align(
                                  alignment: Alignment.topRight,
                                  child: Column(
                                    children: [
                                      GridView.builder(
                                        itemCount: widget.courses!.subjectcourses![indexMain].subjectvideos!.isNotEmpty
                                            ? widget.courses!.subjectcourses![indexMain].subjectvideos!.length
                                            : 0, // Check if the list is not empty before accessing its length
                                        shrinkWrap: true,
                                        padding: const EdgeInsets.symmetric(horizontal: 20),
                                        physics: const NeverScrollableScrollPhysics(),
                                        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                                          crossAxisCount: 2,
                                          mainAxisSpacing: 20,
                                          crossAxisSpacing: 10,
                                          mainAxisExtent: 39,
                                        ),
                                        itemBuilder: (context, index) {
                                          bool isSelected = selectedIndices.contains(index);
                                          return GestureDetector(
                                            onTap: () {
                                              setState(() {
                                                if (isSelected) {
                                                  selectedIndices.remove(index);
                                                } else {
                                                  selectedIndices.add(index);
                                                }
                                              });
                                            },
                                            child: Container(
                                              height: 39,
                                              decoration: BoxDecoration(
                                                color: index<=0.toInt() ? kPrimaryColor : Colors.grey,
                                                borderRadius: BorderRadius.circular(8),
                                              ),
                                              child: Center(
                                                child: Text(
                                                  widget.courses!.subjectcourses![indexMain].subjectvideos![index].title.toString(),
                                                  style: const TextStyle(
                                                    fontSize: 11,
                                                    color: Colors.white,
                                                    fontFamily: 'gesndbook',
                                                    fontWeight: FontWeight.w400,
                                                  ),
                                                  textAlign: TextAlign.right,
                                                ),
                                              ),
                                            ),
                                          );
                                        },
                                      ),
                                    ],
                                  ),
                                ),
                                SizedBox(height: 18.h),
                              ],
                            ),
                          ),
                        ),
                        GestureDetector(
                          onTap: () {
                            setState(() {
                              _isShowList[indexMain] = !_isShowList[indexMain];
                            });
                          },
                          child: Container(
                            height: isTablet ? 80.h : 59.h,
                            width: double.infinity,
                            decoration: BoxDecoration(
                                color: _isShowList[indexMain] == true?Colors.white:kPrimaryColor,
                                borderRadius: BorderRadius.circular(10.r),
                                boxShadow: const [
                                  BoxShadow(
                                    color:  Colors.transparent,
                                    blurRadius: 0.5,
                                    spreadRadius: 0.1,
                                  ),
                                ]),
                            child: Padding(
                              padding: EdgeInsets.symmetric(horizontal: 24.w),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Transform.rotate(
                                      angle: _isShowList[indexMain] == true
                                          ? 360 * math.pi / 180
                                          : 180 * math.pi / 180,
                                      child: Image.asset(
                                        "lib/assets/images/icon1.png",
                                        height: 30.h,
                                        width: 20.w,
                                      )),
                                  Padding(
                                    padding: const EdgeInsets.only(right: 6),
                                    child: CustomText(
                                      text: widget.courses!.subjectcourses![indexMain].title.toString(),
                                      fontFamily: 'gesndbook',
                                      fontSize: isTablet ? 8.sp : 18.sp,
                                      textAlign: TextAlign.right,
                                      color: _isShowList[indexMain] == true?Colors.black:Colors.white,
                                    ),
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
              });
          // return allCoursedProvider.loading?const SizedBox():Column(
          //   children: [
          //     // otherIndex == false
          //     //     ? const Text('')
          //     //     : const Text(
          //     //   'لا يمكن مشاهدة الفيديو التالي حتى الانتهاء من الفيديو الحالي',
          //     //   style: TextStyle(
          //     //     color: kPrimaryColor,
          //     //     fontFamily: 'gesndbook',
          //     //   ),
          //     // ),
          //     const SizedBox(height: 10),
          //     Stack(
          //       children: [
          //         Visibility(
          //           visible: _isShow1,
          //           child: Container(
          //             decoration: BoxDecoration(
          //                 color: Colors.white,
          //                 borderRadius: BorderRadius.circular(10.r),
          //                 boxShadow: [
          //                   BoxShadow(
          //                     color: Colors.black26.withOpacity(0.3),
          //                     blurRadius: 10,
          //                     spreadRadius: 1,
          //                   ),
          //                 ]),
          //             child: Column(
          //               crossAxisAlignment: CrossAxisAlignment.center,
          //               children: [
          //                 SizedBox(
          //                   height: isTablet ? 80.h : 60.h,
          //                 ),
          //                 Align(
          //                   alignment: Alignment.topRight,
          //                   child: Column(
          //                     children: [
          //                       GridView.builder(
          //                         itemCount: widget.videoUrls.isNotEmpty
          //                             ? widget.videoUrls.length
          //                             : 0, // Check if the list is not empty before accessing its length
          //                         shrinkWrap: true,
          //                         padding: const EdgeInsets.symmetric(horizontal: 20),
          //                         physics: const NeverScrollableScrollPhysics(),
          //                         gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          //                           crossAxisCount: 2,
          //                           mainAxisSpacing: 20,
          //                           crossAxisSpacing: 10,
          //                           mainAxisExtent: 39,
          //                         ),
          //                         itemBuilder: (context, index) {
          //                           bool isSelected = selectedIndices.contains(index);
          //                           return GestureDetector(
          //                             onTap: () {
          //                               setState(() {
          //                                 AppConstant.videoUrl = allCoursedProvider.courseVideo.isNotEmpty
          //                                     ? allCoursedProvider.courseVideo[0]
          //                                     .course.subjects[0].videos[index].videoTemp
          //                                     : ''; // Make sure to handle the case where the list is empty
          //
          //                                 allCoursedProvider.addUrl(allCoursedProvider.courseVideo[0]
          //                                     .course.subjects[0].videos[index].videoTemp);
          //                                 // if (isSelected) {
          //                                 //   selectedIndices.remove(index);
          //                                 // } else {
          //                                 //   selectedIndices.add(index);
          //                                 // }
          //                               });
          //                             },
          //                             child: Container(
          //                               height: 39,
          //                               decoration: BoxDecoration(
          //                                 color: index<=widget.index!.toInt() ? kPrimaryColor : Colors.grey,
          //                                 borderRadius: BorderRadius.circular(8),
          //                               ),
          //                               child: Center(
          //                                 child: Text(
          //                                   widget.videoUrls[index].title,
          //                                   // Make sure to handle the case where the list is empty
          //                                   style: const TextStyle(
          //                                     fontSize: 11,
          //                                     color: Colors.white,
          //                                     fontFamily: 'gesndbook',
          //                                     fontWeight: FontWeight.w400,
          //                                   ),
          //                                   textAlign: TextAlign.right,
          //                                 ),
          //                               ),
          //                             ),
          //                           );
          //                         },
          //                       ),
          //                     ],
          //                   ),
          //                 ),
          //                 SizedBox(height: 18.h),
          //               ],
          //             ),
          //           ),
          //         ),
          //         GestureDetector(
          //           onTap: () {
          //             setState(() {
          //               _isShow1 = !_isShow1;
          //             });
          //           },
          //           child: Container(
          //             height: isTablet ? 80.h : 59.h,
          //             width: double.infinity,
          //             decoration: BoxDecoration(
          //                 color: Colors.white,
          //                 borderRadius: BorderRadius.circular(10.r),
          //                 boxShadow: [
          //                   BoxShadow(
          //                     color: _isShow1 == true
          //                         ? Colors.transparent
          //                         : Colors.black26.withOpacity(0.3),
          //                     blurRadius: 0.5,
          //                     spreadRadius: 0.1,
          //                   ),
          //                 ]),
          //             child: Padding(
          //               padding: EdgeInsets.symmetric(horizontal: 24.w),
          //               child: Row(
          //                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
          //                 children: [
          //                   Transform.rotate(
          //                       angle: _isShow1 == true
          //                           ? 360 * math.pi / 180
          //                           : 180 * math.pi / 180,
          //                       child: Image.asset(
          //                         "lib/assets/images/icon1.png",
          //                         height: 30.h,
          //                         width: 20.w,
          //                       )),
          //                   Padding(
          //                     padding: const EdgeInsets.only(right: 6),
          //                     child: CustomText(
          //                       text: "منهج الدورة",
          //                       fontFamily: 'gesndbook',
          //                       fontSize: isTablet ? 8.sp : 18.sp,
          //                       textAlign: TextAlign.right,
          //                       color: kPrimaryColor,
          //                     ),
          //                   ),
          //                 ],
          //               ),
          //             ),
          //           ),
          //         ),
          //       ],
          //     ),
          //     SizedBox(
          //       height: 15.h,
          //     ),
          //     Stack(
          //       children: [
          //         Visibility(
          //           visible: _isShow2,
          //           child: Container(
          //             decoration: BoxDecoration(
          //               color: Colors.white,
          //               boxShadow: [
          //                 BoxShadow(
          //                   color: Colors.black26.withOpacity(0.3),
          //                   blurRadius: 10,
          //                   spreadRadius: 1,
          //                 ),
          //               ],
          //               borderRadius: BorderRadius.circular(10.r),
          //             ),
          //             child: Padding(
          //               padding: EdgeInsets.symmetric(horizontal: 24.w),
          //               child: Column(
          //                 crossAxisAlignment: CrossAxisAlignment.center,
          //                 children: [
          //                   SizedBox(
          //                     height: isTablet ? 80.h : 60.h,
          //                   ),
          //                   Align(
          //                     alignment: Alignment.topRight,
          //                     child: GestureDetector(
          //                       onTap: () {
          //                         // Navigator.push(
          //                         //     context,
          //                         //     MaterialPageRoute(
          //                         //       builder: (context) =>  OpenBookScreen(),
          //                         //     ));
          //                       },
          //                       child: Padding(
          //                         padding:
          //                         const EdgeInsets.only(right: 10, top: 10),
          //                         child: CustomText(
          //                           text: allCoursedProvider.courseVideo[0].course.courseConditions,
          //                           color: const Color(0xff000000),
          //                           fontSize: isTablet ? 8.sp : 16.sp,
          //                           textAlign: TextAlign.right,
          //                         ),
          //                       ),
          //                     ),
          //                   ),
          //                   SizedBox(height: 15.h),
          //                 ],
          //               ),
          //             ),
          //           ),
          //         ),
          //         GestureDetector(
          //           onTap: () {
          //             setState(() {
          //               _isShow2 = !_isShow2;
          //             });
          //           },
          //           child: Container(
          //             height: isTablet ? 80.h : 59.h,
          //             width: double.infinity,
          //             decoration: BoxDecoration(
          //               color: _isShow2 ? Color(0xff8E1839) : Colors.white,
          //               boxShadow: [
          //                 BoxShadow(
          //                   color: _isShow2 == true
          //                       ? Colors.transparent
          //                       : Colors.black26.withOpacity(0.3),
          //                   blurRadius: 0.5,
          //                   spreadRadius: 0.1,
          //                 ),
          //               ],
          //               borderRadius: BorderRadius.circular(10.r),
          //             ),
          //             child: Padding(
          //               padding: EdgeInsets.symmetric(horizontal: 24.w),
          //               child: Row(
          //                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
          //                 children: [
          //                   Transform.rotate(
          //                       angle: _isShow2 == false
          //                           ? 180 * math.pi / 180
          //                           : 180 * math.pi / 180,
          //                       child: Image.asset(
          //                         _isShow2 == false
          //                             ? "lib/assets/images/icon1.png"
          //                             : "lib/assets/images/icon2.png",
          //                         height: 30.h,
          //                         width: 20.w,
          //                       )),
          //                   Padding(
          //                     padding: const EdgeInsets.only(right: 10),
          //                     child: CustomText(
          //                       text: "الكتب و المراجع",
          //                       fontSize: isTablet ? 8.sp : 18.sp,
          //                       color: _isShow2 ? Colors.white : Color(0xff8E1839),
          //                       fontWeight: FontWeight.w400,
          //                       textAlign: TextAlign.right,
          //                     ),
          //                   ),
          //                 ],
          //               ),
          //             ),
          //           ),
          //         ),
          //       ],
          //     ),
          //   ],
          // );
        });
  }
}
