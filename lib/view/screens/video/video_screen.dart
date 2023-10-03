import 'dart:io';
import 'dart:math';
import 'dart:typed_data';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:path_provider/path_provider.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:provider/provider.dart';
import 'package:untitled6/model/courses_model.dart';
import 'package:untitled6/utilities/colors.dart';
import 'package:untitled6/view/base/custom_text.dart';
import 'package:untitled6/view/base/pdf_preview.dart';

import '../../base/custom_button.dart';
import '../../base/custom_snackbar.dart';
import '../books.dart';

class OpenBookScreen extends StatelessWidget {

  Books allcourse;

  OpenBookScreen({
    required this.allcourse,

  });

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
                                  allcourse.title.toString(),
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
                          allcourse.fileSize == null
                              ? SizedBox()
                              : CustomText(
                                  text:
                                      "${convertFileSizeToMB(allcourse.fileSize.toString())}:حجم الملف ",
                                ),
                          SizedBox(
                            height: 4.h,
                          ),
                          allcourse.pageNumber == null
                              ? SizedBox()
                              : CustomText(
                                  text:
                                      "عدد الصفحات :${allcourse.pageNumber} ",
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
                    child: Image.network(allcourse.imgTemp.toString(),
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
                  allcourse.description == null
                      ? Text('')
                      : CustomText(
                          text: allcourse.description.toString(),
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
                          SizedBox(
                            width: 157.w,
                            child:CustomButton(
                              icon: Icons.save_alt,
                              text: "تحميل",
                              onPressed: () {},
                            )
                            // child: Consumer<
                            //     DownloadProvider>(
                            //   builder: (context,
                            //       downloadProvider,
                            //       child) {
                            //     return downloadProvider
                            //         .downloadingStatus[index]
                            //         ? /*CircularProgressIndicator(
                            //                   value: downloadProvider.downloadingProgress[index] ?? 0.0,
                            //                   color: Colors.red,
                            //                 )*/
                            //     SizedBox(
                            //       width: 50.w, // Adjust this to your desired size
                            //       height: 50.h, // Adjust this to your desired size
                            //       child: const Stack(
                            //         alignment: Alignment.center,
                            //         children: [
                            //           CircularProgressIndicator(
                            //             //value: downloadProvider.downloadingProgress[index] ?? 0.0,
                            //             valueColor: AlwaysStoppedAnimation<Color>(Colors.red),
                            //           ),
                            //           // Text(
                            //           //   '${((downloadProvider.downloadingProgress[index] ?? 0.0) * 100).toInt()}%'.toString(),
                            //           //   style: const TextStyle(
                            //           //     color: Colors.red,
                            //           //     fontWeight: FontWeight.bold,
                            //           //   ),
                            //           // ),
                            //         ],
                            //       ),
                            //     )
                            //         : CustomButton(
                            //       icon: Icons.save_alt,
                            //       text: "تحميل",
                            //       onPressed: () {
                            //         //requestStoragePermission(index, courses[index].filePath);
                            //       },
                            //     );
                            //   },
                            // ),
                          ),
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
                                Get.to(() => VIEWPDF(
                                    path: allcourse
                                        .filePath.toString()));
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
  List<bool> _downloading = [];
  List<double?> _progress = [];

  Uint8List? downloadedfile;

  Future<void> downloadAndStoreFile(String fileUrl, int index) async {
    final url = '$fileUrl'; // Remove unnecessary curly braces

    final dio = Dio();

    final random = Random();
    String reo = random.nextInt(200).toString();
    final path = (await getExternalStorageDirectory())?.path;
    dynamic filePath = '/storage/emulated/0/Download/AQSA${reo}.pdf';
    if (Platform.isAndroid) {
      filePath = '/storage/emulated/0/Download/AQSA${reo}.pdf';
    } else {
      filePath = File("${path}/AQSA${random.nextInt(200)}.pdf");
    }

    try {
      print(
          "---------------------------download function------filePath-${filePath}-----------------------------------------------");
      await dio.download(
        url,
        filePath,
        onReceiveProgress: (received, total) {
          if (total != -1) {
            final progress = received / total;
            // Update the download progress in the DownloadProvider
            final downloadProvider =
            Provider.of<DownloadProvider>( BuildContext as BuildContext, listen: false);
            downloadProvider.updateDownloadProgress(index, progress);
          }
        },
      );
      showCustomSnackBar("تم التنزيل بنجاح", isError: false);
      print("Downloaded file ==========================");
    } catch (e) {
      print("Downloaded file ==========${e}================");
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
      final downloadProvider =
      Provider.of<DownloadProvider>( BuildContext as BuildContext, listen: false);

      downloadProvider.updateDownloadStatus(index, true); // Start download

      try {
        await downloadAndStoreFile(path, index);
      } catch (e) {
        print(e.toString());
        // Handle error here
      } finally {
        downloadProvider.updateDownloadStatus(
            index, false); // Download finished
      }
    } else {
      // Storage permission denied, handle accordingly (e.g., show an explanation or navigate to settings)
    }
  }
}
