import 'dart:math';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:path_provider/path_provider.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:untitled6/utilities/colors.dart';
import 'package:untitled6/view/base/custom_snackbar.dart';
import 'package:untitled6/view/base/custom_text.dart';

import 'dart:io';
import '../../model/all_books_model.dart';

import 'custom_button.dart';

// ignore: must_be_immutable
class OpenBookScreen_viewbooks extends StatefulWidget {
  List<Data> courses;
  int id;
  int index;
  OpenBookScreen_viewbooks({
    required this.courses,
    required this.index,
    required this.id,
  });

  @override
  State<OpenBookScreen_viewbooks> createState() =>
      _OpenBookScreen_viewbooksState();
}

class _OpenBookScreen_viewbooksState extends State<OpenBookScreen_viewbooks> {
  @override
  Widget build(BuildContext context) {
    String convertFileSizeToMB(String? fileSize) {
      if (fileSize != null) {
        try {
          int bytes = int.parse(fileSize);
          double megabytes = bytes / (1024 * 1024);
          return megabytes.toStringAsFixed(2) + ' MB';
        } catch (e) {
          // Handle the case where fileSize is not a valid number
          return 'Invalid file size';
        }
      }
      // Handle the case where fileSize is null
      return 'File size not available';
    }

    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              // height: 191.h,
              padding: EdgeInsets.only(bottom: 10.h),
              color: kPrimaryColor,
              width: double.infinity.w,
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 25.w),
                child: SafeArea(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        height: 36.h,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              GestureDetector(
                                onTap: () {
                                  Navigator.pop(context);
                                },
                                child: Container(
                                  padding: EdgeInsets.all(4.r),
                                  decoration: BoxDecoration(
                                      color: Colors.white,
                                      borderRadius: BorderRadius.circular(8).r),
                                  child: Icon(
                                    Icons.arrow_back_ios_rounded,
                                    size: 15.sp,
                                    color: kPrimaryColor,
                                  ),
                                ),
                              ),

                              // Container(
                              //   padding: EdgeInsets.all(4.r),
                              //   decoration: BoxDecoration(
                              //       color: Colors.white,
                              //       borderRadius: BorderRadius.circular(8).r),
                              //   child: Icon(
                              //     Icons.arrow_back_ios_rounded,
                              //     size: 15.sp,
                              //     color: kPrimaryColor,
                              //
                              //   ),
                              // ),

                              Flexible(
                                child: Text(
                                  widget.courses[widget.index].title,
                                  style: const TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontFamily: 'gesndbook',
                                      fontSize: 12,
                                      color: Colors.white,
                                      overflow: TextOverflow.fade),
                                ),
                              ),
                              // CustomText(
                              //   text:courses[index].title,
                              //   fontSize: 20.sp,
                              //
                              // ),
                            ],
                          ),
                          SizedBox(
                            height: 7.h,
                          ),
                          widget.courses[widget.index].fileSize == null
                              ? SizedBox()
                              : CustomText(
                                  text:
                                      "${convertFileSizeToMB(widget.courses[widget.index].fileSize.toString())}:حجم الملف ",
                                ),
                          SizedBox(
                            height: 4.h,
                          ),
                          widget.courses[widget.index].pageNumber == null
                              ? SizedBox()
                              : CustomText(
                                  text:
                                      "عدد الصفحات :${widget.courses[widget.index].pageNumber} ",
                                ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 16.h,
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 25.w),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  SizedBox(
                    height: 20.h,
                  ),
                  Center(
                    child: Image.network(widget.courses[widget.index].imgTemp,
                        width: 191.w, height: 274.h),
                  ),
                  SizedBox(
                    height: 10.h,
                  ),
                  CustomText(
                    textAlign: TextAlign.right,
                    text: "وصف الكتاب",
                    fontSize: 18.sp,
                    color: kPrimaryColor,
                  ),
                  widget.courses[widget.index].description == null
                      ? Text('')
                      : CustomText(
                          text: widget.courses[widget.index].description
                              .toString(),
                          fontSize: 18.sp,
                          color: const Color(0xff6F6F6F),
                          textAlign: TextAlign.right,
                        ),
                  SizedBox(
                    height: 20.h,
                  ),
                  CustomText(
                    text: "معلومات الكتاب",
                    fontSize: 18.sp,
                    color: kPrimaryColor,
                    textAlign: TextAlign.right,
                  ),
                  CustomText(
                    text:
                        "طرائق الله تعالى الثابتة المطردة في تدبير شؤون الكون، والحياة، وإجراء القَدَرِ بما تقتضيه حِكمتُه. أو: طرائقه الثابتة المطردة في تدبير شؤون خلقه وفق حكمته",
                    fontSize: 18.sp,
                    color: const Color(0xff6F6F6F),
                    textAlign: TextAlign.right,
                  ),
                  SizedBox(
                    height: 29.h,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Column(
                        children: [
                          !_downloading
                              ? SizedBox(
                                  width: 157.w,
                                  child: CustomButton(
                                    icon: Icons.save_alt,
                                    text: "تحميل",
                                    onPressed: () {
                                      setState(() {
                                        _downloading = true;
                                        _progress = 0;
                                      });
                                      try {
                                        downloadAndStoreFile(widget
                                            .courses[widget.index].filePath);
                                      } catch (e) {
                                        print(e.toString());
                                        // Handle error here
                                      }
                                    },
                                  ),
                                )
                              : SizedBox(
                                  width: 30.w,
                                  height: 30.h,
                                  child: CircularProgressIndicator(
                                      value: _progress)),
                          CustomText(
                            text: "لتحميلات    30",
                            fontSize: 13.sp,
                            color: Color(0xff6F6F6F),
                          ),
                        ],
                      ),
                      SizedBox(
                        width: 20.w,
                      ),
                      Column(
                        children: [
                          SizedBox(
                            width: 157.w,
                            child: CustomButton(
                              icon: Icons.menu_book,
                              text: "قراءة",
                              onPressed: () {
                                Navigator.pop(context);
                              },
                            ),
                          ),
                          CustomText(
                            text: "عدد القراءات     10",
                            fontSize: 13.sp,
                            color: Color(0xff6F6F6F),
                          )
                        ],
                      )
                    ],
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  bool _downloading = false;
  double _progress = 0;
  Future<void> downloadAndStoreFile(
    String fileUrl,
  ) async {
    final url = '$fileUrl'; // Remove unnecessary curly braces
    Random random = Random();
    String reo = random.nextInt(200).toString();
    final path = (await getExternalStorageDirectory())?.path;

    var file = File("${path}/AQAS${random.nextInt(200)}.pdf");
    if (Platform.isAndroid) {
      file = File('/storage/emulated/0/Download/aqas${reo}.pdf');
    } else {
      file = File("${path}/aqas${random.nextInt(200)}.pdf");
    }

    final dio = Dio();

    try {
      print(
          "---------------------------download function------------------------------------------------------");
      await dio.download(
        fileUrl,
        file,
        onReceiveProgress: (received, total) {
          if (total != -1) {
            print(
                "-----------------------${_progress}-${_downloading}---download function------------------------------------------------------");
            setState(() {
              _progress = received / total;
            });
          }
        },
      );
      setState(() {
        _downloading = false;
      });
      showCustomSnackBar("تم التنزيل بنجاح", isError: false);
      print("Downloaded file ==========================");
    } catch (e) {
      showCustomSnackBar(
        "هناك خطأ ما",
        isError: true,
      );
      // You can display an error message or handle the error as needed
    }
  }

  void requestStoragePermission(int index, String path) async {
    // Request storage permission
    PermissionStatus status = await Permission.storage.request();

    // Check the status of the storage permission
    if (status.isGranted) {
      try {
        await downloadAndStoreFile(
          path,
        );
      } catch (e) {
        print(e.toString());
        // Handle error here
      } finally {}
    } else if (await Permission.storage.request().isPermanentlyDenied) {
      await openAppSettings();
    } else if (await Permission.storage.request().isDenied) {
      setState(() {
        status.isDenied;
      });
    }
    var status1 = await Permission.manageExternalStorage.status;
    if (!status1.isGranted) {
      await Permission.manageExternalStorage.request();
    } else {
      // Storage permission denied, handle accordingly (e.g., show an explanation or navigate to settings)
    }
  }
}
