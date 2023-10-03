// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:provider/provider.dart';
// import 'package:untitled6/provider/quiz_provider.dart';
// import 'package:untitled6/utilities/colors.dart';
// import 'package:untitled6/view/base/custom_text.dart';
// import 'package:video_player/video_player.dart';
// import 'dart:math' as math;
// import 'package:chewie/chewie.dart';
//
// import '../../model/quiz_model.dart';
//
// class QuizScreen extends StatefulWidget {
//   String courseID;
//    QuizScreen({super.key,required this.courseID});
//
//   @override
//   State<QuizScreen> createState() => _QuizScreenState();
// }
//
// class _QuizScreenState extends State<QuizScreen> {
//
//   VideoPlayerController? videoPlayerController;
//   ChewieController? chewieController;
//   int current = 0;
//   int selectedIndex = 1;
//   int selectedIndex2 = 1;
//
//
//
//   @override
//   void initState() {
//     super.initState();
//     // videoPlayerController = VideoPlayerController.network(
//     //   '', // Replace with your video URL
//     // );
//     // chewieController = ChewieController(
//     //   videoPlayerController: videoPlayerController!,
//     //   aspectRatio: 16 / 9, // You can adjust the aspect ratio as needed
//     //   autoPlay: true, // Set to true if you want the video to auto-play
//     //   looping: false, // Set to true if you want the video to loop
//     //   // You can customize other ChewieController properties here
//     // );
//     QuizProvider quizProvider = Provider.of<QuizProvider>(context, listen: false);
//     Future.microtask(() {
//       quizProvider.getQuiz();
//     });
//   }
//
//   // @override
//   // void dispose() {
//   //   videoPlayerController?.dispose();
//   //   chewieController?.dispose();
//   //   super.dispose();
//   // }
//
//
//   @override
//   Widget build(BuildContext context) {
//     bool isTablet = MediaQuery.of(context).size.width > 600;
//     return SingleChildScrollView(
//       child: Padding(
//         padding: EdgeInsets.symmetric(horizontal: 13.w, vertical: 10.h),
//         child: Consumer<QuizProvider>(
//             builder: (context, quizProvider, child){
//           return quizProvider.loading?const CircularProgressIndicator():Column(
//             crossAxisAlignment: CrossAxisAlignment.end,
//             children: [
//               SizedBox(
//                 height: 19.h,
//               ),
//               const SizedBox(height: 10),
//               Padding(
//                 padding: const EdgeInsets.only(right: 8.0),
//                 child: CustomText(
//                     color: Colors.black,
//                     text: 'الامتحان النهائي لمدخل إلى علم السنن'),
//               ),
//               Padding(
//                 padding: const EdgeInsets.only(right: 8.0),
//                 child: CustomText(
//                     color: Colors.black ,
//                     text: 'اختر الإجابة', fontSize: isTablet ? 7.sp : 12.sp),
//               ),
//               SizedBox(height: 10.h),
//
//               ListView.builder(
//                 shrinkWrap: true,
//                 reverse: false,
//                 physics: const NeverScrollableScrollPhysics(),
//                 itemCount: quizProvider.quizModel[0].exam.questions.length,
//                   itemBuilder: (context,index){
//                 return Padding(
//                   padding: const EdgeInsets.symmetric(vertical: 8.0),
//                   child: Card(
//                     elevation: 2,
//                     child: QuestionWidget(
//                       question: quizProvider.quizModel[0].exam.questions[index].questionBody.toString(),
//                       choices: quizProvider.quizModel[0].exam.questions[index],
//                     ),
//                   ),
//                 );
//               })
//             ],
//           );
//         }),
//       ),
//     );
//   }
// }
//
//
//
// class QuestionWidget extends StatefulWidget {
//   final String question;
//   final Questions choices;
//
//
//   const QuestionWidget({super.key, required this.question, required this.choices});
//
//   @override
//   _QuestionWidgetState createState() => _QuestionWidgetState();
// }
//
// class _QuestionWidgetState extends State<QuestionWidget> {
//   int selectedIdx = -1; // Initialize with a value that represents no selection
//
//   @override
//   Widget build(BuildContext context) {
//     return Column(
//       children: [
//         GestureDetector(
//           onTap: () {
//             setState(() {
//               selectedIdx = -1; // Reset selection when question is tapped
//             });
//           },
//           child: Container(
//             height: 50.h,
//             width: double.infinity,
//             padding: EdgeInsets.symmetric(horizontal: 3.w),
//             decoration: BoxDecoration(
//                 color: kPrimaryColor,
//                 borderRadius: BorderRadius.circular(10)),
//             child: Center(
//               child: CustomText(
//                 textAlign: TextAlign.start,
//                 text: widget.question,
//               ),
//             ),
//           ),
//         ),
//         ListView.builder(
//           itemCount: widget.choices.multichoices.length,
//           shrinkWrap: true,
//           physics: const NeverScrollableScrollPhysics(),
//           itemBuilder: (context, index) {
//             return Padding(
//               padding: EdgeInsets.symmetric(horizontal: 23.w),
//               child: GestureDetector(
//                 onTap: () {
//                   setState(() {
//                     selectedIdx = index;
//                   });
//                 },
//                 child: Row(
//                   crossAxisAlignment: CrossAxisAlignment.end,
//                   mainAxisAlignment: MainAxisAlignment.end,
//                   children: [
//                     Icon(
//                       selectedIdx == index ? Icons.check : Icons.check,
//                       color:
//                       selectedIdx == index ? Colors.green : Colors.white,
//                       size:  20,
//                     ),
//                     SizedBox(width: 6.h),
//                     Padding(
//                       padding: const EdgeInsets.only(top: 5.0),
//                       child: CustomText(
//                         text: widget.choices.multichoices[index].choice,
//                         color: Colors.black,
//                       ),
//                     )
//                   ],
//                 ),
//               ),
//             );
//           },
//         ),
//       ],
//     );
//   }
// }

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:untitled6/provider/quiz_provider.dart';
import 'package:untitled6/utilities/colors.dart';
import 'package:untitled6/view/base/custom_text.dart';
import 'package:video_player/video_player.dart';
import 'dart:math' as math;
import 'package:chewie/chewie.dart';
class QuizScreen extends StatefulWidget {
  String courseID;

  QuizScreen({super.key, required this.courseID});

  @override
  State<QuizScreen> createState() => _QuizScreenState();
}

class _QuizScreenState extends State<QuizScreen> {
  VideoPlayerController? videoPlayerController;
  ChewieController? chewieController;
  int current = 0;
  int selectedIndex = 1;
  int selectedIndex2 = 1;
  bool isLoading=true;

  @override
  void initState() {
    super.initState();
    QuizProvider quizProvider =
    Provider.of<QuizProvider>(context, listen: false);
    Future.microtask(() {
      quizProvider.getQuiz();
    });

    Future.delayed(Duration(seconds: 3), () {
      // After 3 seconds, hide the circular progress indicator
      setState(() {
        isLoading = false;
      });
    });

  }

  List<List<bool>> selectedOptions = [];

  bool call = true;
  int selectedIdx = -1;
  int focusedIndex = 0;

  @override
  Widget build(BuildContext context) {
    bool isTablet = MediaQuery.of(context).size.width > 600;
    QuizProvider quizProvider =
    Provider.of<QuizProvider>(context, listen: false);

    void nextItem() {
      setState(() {
        if (focusedIndex < quizProvider.quizModel[0].exam.questions.length) {
          focusedIndex++;
        }
      });
    }

    return SingleChildScrollView(
      child: isLoading
          ? const Center(
        child: CircularProgressIndicator(),
      ):Padding(
        padding: EdgeInsets.symmetric(horizontal: 13.w, vertical: 10.h),
        child: Consumer<QuizProvider>(builder: (context, quizProvider, child) {
          if (call == true) {
            correct_answer.clear();
            selectedOptions.clear();
            selectedOptions = List.generate(
              quizProvider.quizModel[0].exam.questions.length,
                  (index) => List<bool>.filled(
                  quizProvider
                      .quizModel[0].exam.questions[index].multichoices.length,
                  false),
            );
          }
          call = false;

          return quizProvider.loading
              ? const CircularProgressIndicator()
              : Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              SizedBox(
                height: 19.h,
              ),
              const SizedBox(height: 10),
              Padding(
                padding: const EdgeInsets.only(right: 8.0),
                child: CustomText(
                    color: Colors.black,
                    text: 'الامتحان النهائي لمدخل إلى علم السنن'),
              ),
              Padding(
                padding: const EdgeInsets.only(right: 8.0),
                child: CustomText(
                    color: Colors.black,
                    text: 'اختر الإجابة',
                    fontSize: isTablet ? 7.sp : 12.sp),
              ),
              SizedBox(height: 10.h),
              ListView.builder(
                  shrinkWrap: true,
                  reverse: false,
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount:
                  quizProvider.quizModel[0].exam.questions.length,
                  itemBuilder: (context, question_index) {
                    bool isFocused = focusedIndex == question_index;
                    return Padding(
                      padding: const EdgeInsets.symmetric(vertical: 8.0),
                      child: Stack(
                        children: [
                          Card(
                            elevation: 2,
                            child: Column(
                              children: [
                                Container(
                                  height: 50.h,
                                  width: double.infinity,
                                  padding: EdgeInsets.symmetric(
                                      horizontal: 3.w),
                                  decoration: BoxDecoration(
                                      color: kPrimaryColor,
                                      borderRadius:
                                      BorderRadius.circular(10)),
                                  child: Center(
                                    child: CustomText(
                                      textAlign: TextAlign.start,
                                      text: quizProvider
                                          .quizModel[0]
                                          .exam
                                          .questions[question_index]
                                          .questionBody
                                          .toString(),
                                    ),
                                  ),
                                ),
                                ListView.builder(
                                  itemCount: quizProvider
                                      .quizModel[0]
                                      .exam
                                      .questions[question_index]
                                      .multichoices
                                      .length,
                                  shrinkWrap: true,
                                  physics:
                                  const NeverScrollableScrollPhysics(),
                                  itemBuilder: (context, index) {
                                    return Padding(
                                      padding: EdgeInsets.symmetric(
                                          horizontal: 23.w),
                                      child: GestureDetector(
                                        onTap: () {
                                          correct_answer.add(
                                              Correct_answer(
                                                  Question_id: quizProvider
                                                      .quizModel[0]
                                                      .exam
                                                      .questions[
                                                  question_index]
                                                      .id
                                                      .toString(),
                                                  Answer_id: quizProvider
                                                      .quizModel[0]
                                                      .exam
                                                      .questions[
                                                  question_index]
                                                      .multichoices[index]
                                                      .id
                                                      .toString()));

                                          selectedOptions[question_index]
                                          [index] = true;
                                          for (int i = 0;
                                          i < correct_answer.length;
                                          i++) {
                                            print(
                                                ".xvcb..${correct_answer[i].Question_id}...................${correct_answer[i].Answer_id}........${index}.............${selectedOptions[question_index][index]}");
                                          }
                                          print(
                                              ".xvcb...................${correct_answer.length}........${index}.............${selectedOptions[question_index][index]}");
                                          setState(() {
                                            selectedIdx = index;
                                          });
                                          nextItem();
                                        },
                                        child: Row(
                                          crossAxisAlignment:
                                          CrossAxisAlignment.end,
                                          mainAxisAlignment:
                                          MainAxisAlignment.end,
                                          children: [
                                            Icon(
                                              selectedOptions[question_index]
                                              [index] ==
                                                  true
                                                  ? Icons.check
                                                  : Icons.check,
                                              color: selectedOptions[
                                              question_index]
                                              [index] ==
                                                  true
                                                  ? Colors.green
                                                  : Colors.white,
                                              size: 20,
                                            ),
                                            SizedBox(width: 6.h),
                                            Padding(
                                              padding:
                                              const EdgeInsets.only(
                                                  top: 5.0),
                                              child: CustomText(
                                                text: quizProvider
                                                    .quizModel[0]
                                                    .exam
                                                    .questions[
                                                question_index]
                                                    .multichoices[index]
                                                    .choice,
                                                color: Colors.black,
                                              ),
                                            )
                                          ],
                                        ),
                                      ),
                                    );
                                  },
                                ),
                              ],
                            )

                            //       QuestionWidget(
                            //       question: quizProvider.quizModel[0]
                            //           .exam.questions[index].questionBody.toString
                            //       (),
                            //   choices: quizProvider.quizModel[0].exam
                            //       .questions[index],
                            // )
                            ,
                          ),
                          isFocused
                              ? const SizedBox(
                            height: 1,
                            width: 1,
                          )
                              : Container(
                            height: 150,
                            color: Colors.white.withOpacity(0.7),
                          )
                        ],
                      ),
                    );
                  })
            ],
          );
        }),
      ),
    );
  }
}


List<Correct_answer> correct_answer = [];

class Correct_answer {
  String Question_id;
  String Answer_id;

  Correct_answer({required this.Question_id, required this.Answer_id});
}