import 'dart:math';
import 'dart:typed_data';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:path_provider/path_provider.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:provider/provider.dart';
import 'package:untitled6/provider/books_provider.dart';
import 'package:untitled6/utilities/colors.dart';
import 'dart:io';
import 'package:dio/dio.dart';
import '../base/custom_snackbar.dart';
import '../base/openbooks_for_books_tab.dart';
import '../base/pdf_preview.dart';
import '../base/rating_bar.dart';

class BooksScreen extends StatefulWidget {
  const BooksScreen({super.key});

  @override
  State<BooksScreen> createState() => _BooksScreenState();
}

class _BooksScreenState extends State<BooksScreen> {
  TextEditingController searchController = TextEditingController();
  int selectedCategoryIndex = 0;
  int selectedCategoryId = 0; // Assuming 0 is the default selected category ID

  // Assuming 0 is the default selected index
  void onCategoryToggle(int index) {
    setState(() {
      selectedCategoryIndex = index;
    });
  }

  @override
  void initState() {
    super.initState();
    AllBooksProvider allBooksProvider =
    Provider.of<AllBooksProvider>(context, listen: false);
    Future.microtask(() {
      allBooksProvider.getAllBooksByCategory(catID: selectedCategoryId);
    });
  }

  @override
  Widget build(BuildContext context) {
    Provider.of<AllBooksProvider>(context, listen: false)
        .getAllBooksByCategory(catID: selectedCategoryId);
    bool isTablet = MediaQuery.of(context).size.width > 600;
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        toolbarHeight: isTablet ? 240.h : 210.h,
        leadingWidth: double.infinity,
        leading: Container(
          // height: 400.h,
          color: kPrimaryColor,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: EdgeInsets.only(top: 20, left: 19.w),
                child: Image.asset('lib/assets/images/bar.png'),
              ),
              SizedBox(
                height: 20.h,
              ),
              Center(
                child: Container(
                  // padding: EdgeInsets.zero,
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
                  height: 52.h,
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 16.w),
                    child: Row(
                      children: [
                        const Icon(CupertinoIcons.search,
                            color: kPrimaryColor, size: 18),
                        SizedBox(
                          height: 52.h,
                          width: 290.w,
                          // padding: EdgeInsets.only(top: 10.h),
                          child: TextField(
                            controller: searchController,
                            // onChanged: (query) {
                            //   Provider.of<AllBooksProvider>(context, listen: false).searchBooks(query);
                            // },
                            onChanged: (value) {
                              setState(() {});
                            },
                            decoration: InputDecoration(
                              border: InputBorder.none,
                              hintText: 'ابحث هنا',
                              hintStyle: TextStyle(
                                fontSize: 16.sp,
                                fontFamily: 'gesndbook',
                                color: kPrimaryColor,
                                // Set text color to black
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                            style: TextStyle(
                              color: kPrimaryColor,
                              fontSize: 16.sp,
                              fontFamily: 'gesndbook',
                              fontWeight: FontWeight.w400,
                            ),
                            textAlign: TextAlign.right,
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ),
              Consumer<AllBooksProvider>(
                  builder: (context, allBooksProvider, child) {
                    return allBooksProvider.loading
                        ? const CircularProgressIndicator()
                        : Padding(
                      padding: EdgeInsets.symmetric(
                          horizontal: 13.w, vertical: 15.h),
                      child: SizedBox(
                        height: 50.h,
                        width: double.infinity.w,
                        child: SizedBox(
                          width: 70.482.w,
                          child: ListView.builder(
                            scrollDirection: Axis.horizontal,
                            itemCount: allBooksProvider.booksByCategory[0].category!.length + 1, // Add 1 for the default category
                            itemBuilder: (context, index) {
                              bool isSelected = index == selectedCategoryIndex;
                              if (index == 0) {
                                // This is the default category with ID 0
                                return GestureDetector(
                                  onTap: () {
                                    onCategoryToggle(index);
                                    selectedCategoryId = 0; // Set the selectedCategoryId to 0
                                    print("hdh ${selectedCategoryId}");
                                  },
                                  child: Padding(
                                    padding: const EdgeInsets.only(left: 8.0),
                                    child: Container(
                                      width: 77.482.w,
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(8.r),
                                        border: Border.all(
                                          color: Colors.white,
                                          width: 1.sp,
                                        ),
                                        color: isSelected ? Colors.white : kPrimaryColor,
                                      ),
                                      child: Center(
                                        child: Text(
                                          "الجميع", // Replace with the name of your default category
                                          style: TextStyle(
                                            fontSize: 17.sp,
                                            color: isSelected ? Colors.black : Colors.white,
                                            fontWeight: FontWeight.w400,
                                            fontFamily: 'gesndbook',
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                );
                              }

                              // For other categories (IDs > 0)
                              return GestureDetector(
                                onTap: () {
                                  onCategoryToggle(index);
                                  selectedCategoryId = allBooksProvider.booksByCategory[0].category![index - 1].id!;
                                  print("moed ${selectedCategoryId}");
                                },
                                child: Padding(
                                  padding: const EdgeInsets.only(left: 8.0),
                                  child: Container(
                                    width: 77.482.w,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(8.r),
                                      border: Border.all(
                                        color: Colors.white,
                                        width: 1.sp,
                                      ),
                                      color: isSelected ? Colors.white : kPrimaryColor,
                                    ),
                                    child: Center(
                                      child: Text(
                                        allBooksProvider.booksByCategory[0].category![index - 1].name.toString(),
                                        style: TextStyle(
                                          fontSize: 17.sp,
                                          color: isSelected ? Colors.black : Colors.white,
                                          fontWeight: FontWeight.w400,
                                          fontFamily: 'gesndbook',
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              );
                            },
                          )
                          ,
                        ),
                      ),
                    );
                  }),
            ],
          ),
        ),
      ),
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Column(
          children: [
            Container(
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
                            alignment: Alignment.centerRight,
                            child: Text(
                              'الكتب',
                              style: TextStyle(
                                fontSize: 24.sp,
                                color: kPrimaryColor,
                                fontWeight: FontWeight.w400,
                                fontFamily: 'gesndbook',
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 5.h),
                  ],
                ),
              ),
            ),
            SizedBox(height: 20.h),
            Consumer<AllBooksProvider>(builder: (context, books, child) {
              return books.loading
                  ? const Center(
                child: CircularProgressIndicator(),
              )
                  : Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 17.0),
                  child: books.booksByCategory != null
                      ? books.booksByCategory.length > 0
                      ? searchController.text.toString().isEmpty
                      ? GridView.builder(
                    itemCount:
                    books.booksByCategory[0].books!.length,
                    // itemCount: books.search.isNotEmpty
                    //     ? books.search[0].data.length
                    //     : books.booksByCategory[0].books.length,
                    shrinkWrap: true,
                    physics:
                    const NeverScrollableScrollPhysics(),
                    gridDelegate:
                    SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: isTablet ? 3 : 2,
                        mainAxisExtent: 300,
                        mainAxisSpacing: 30,
                        crossAxisSpacing: 15),
                    itemBuilder: (context, index) {
                      final downloadProvider =
                      Provider.of<DownloadProvider>(
                          context,
                          listen: false);
                      downloadProvider.initializeDownloads(
                          books.booksByCategory[0].books!
                              .length);
                      return GestureDetector(
                        behavior: HitTestBehavior.translucent,
                        onTap: () {
                          print("Before BOOK PREVIEW");
                          print(
                              ".............BOOK PREVIEW.............................");
                          Get.to(() => VIEWPDF(
                              path: books.booksByCategory[0]
                                  .books![index].filePath.toString()));
                        },
                        child: Container(
                          width: 171.w,
                          decoration: BoxDecoration(
                            boxShadow: [
                              BoxShadow(
                                color: Colors.black
                                    .withOpacity(0.25),
                                spreadRadius: 0,
                                blurRadius: 4,
                                offset: const Offset(2, 2),
                              ),
                            ],
                            borderRadius:
                            BorderRadius.circular(8.0),
                            color: Colors.white,
                          ),
                          child: Column(
                            children: [
                              Stack(
                                children: <Widget>[
                                  ClipRRect(
                                    borderRadius:
                                    BorderRadius.circular(
                                        8),
                                    child: Image.network(
                                      books
                                          .booksByCategory[0]
                                          .books![index]
                                          .imgTemp.toString(),
                                      width: double.infinity,
                                      height: 248.0,
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                  Positioned(
                                    bottom: 104.0,
                                    child: Padding(
                                      padding:  EdgeInsets.symmetric(horizontal: isTablet ? 15 : 30),
                                      child: Row(
                                        mainAxisAlignment:
                                        MainAxisAlignment
                                            .spaceBetween,
                                        children: [
                                          GestureDetector(
                                              onTap: () {
                                                Get.to(() => VIEWPDF(
                                                    path: books.booksByCategory[0]
                                                        .books![index].filePath.toString()));
                                                // Get.to(()=>OpenBookScreen_viewbooks(courses: books.books[0].books.data, index: index, id: books.books[0].books.data[index].id,));
                                              },
                                              child: Image.asset(
                                                  width: 50.w,
                                                  height:
                                                  50.h,
                                                  'lib/assets/images/view.png')),
                                          Consumer<
                                              DownloadProvider>(
                                            builder: (context,
                                                downloadProvider,
                                                child) {
                                              return downloadProvider
                                                  .downloadingStatus[
                                              index]
                                                  ? /*CircularProgressIndicator(
                                              value: downloadProvider.downloadingProgress[index] ?? 0.0,
                                              color: Colors.red,
                                            )*/
                                              SizedBox(
                                                width:
                                                50.w,
                                                // Adjust this to your desired size
                                                height:
                                                50.h,
                                                // Adjust this to your desired size
                                                child:
                                                Stack(
                                                  alignment:
                                                  Alignment.center,
                                                  children: [
                                                    CircularProgressIndicator(
                                                      value: downloadProvider.downloadingProgress[index] ?? 0.0,
                                                      valueColor: AlwaysStoppedAnimation<Color>(Colors.red),
                                                    ),
                                                    Text(
                                                      '${((downloadProvider.downloadingProgress[index] ?? 0.0) * 100).toInt()}%'.toString(),
                                                      style: const TextStyle(
                                                        color: Colors.red,
                                                        fontWeight: FontWeight.bold,
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              )
                                                  : GestureDetector(
                                                onTap:
                                                    () async {
                                                  requestStoragePermission(
                                                      index,
                                                      books.booksByCategory[0].books![index].filePath.toString());
                                                },
                                                child: Image
                                                    .asset(
                                                  'lib/assets/images/download.png',
                                                  // You had a mistake in the asset path
                                                  width:
                                                  50.w,
                                                  height:
                                                  50.h,
                                                ),
                                              );
                                            },
                                          )
                                        ],
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              Padding(
                                padding: const EdgeInsets
                                    .symmetric(
                                    horizontal: 5.0,
                                    vertical: 2.0),
                                child: Column(
                                  children: [
                                    Align(
                                      alignment: Alignment
                                          .centerRight,
                                      child: Text(
                                        books
                                            .booksByCategory[
                                        0]
                                            .books![index]
                                            .title
                                            .toString(),
                                        style:
                                        const TextStyle(
                                          fontSize: 10.0,
                                          color: Colors.blue,
                                          // Change to your preferred color
                                          fontWeight:
                                          FontWeight.w400,
                                          fontFamily:
                                          'gesndbook',
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                  )
                      : GridView.builder(
                    itemCount:
                    books.booksByCategory[0].books!.length,
                    // itemCount: books.search.isNotEmpty
                    //     ? books.search[0].data.length
                    //     : books.booksByCategory[0].books.length,
                    shrinkWrap: true,
                    physics:
                    const NeverScrollableScrollPhysics(),
                    gridDelegate:
                    const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        mainAxisExtent: 300,
                        mainAxisSpacing: 30,
                        crossAxisSpacing: 15),
                    itemBuilder: (context, index) {
                      final downloadProvider =
                      Provider.of<DownloadProvider>(
                          context,
                          listen: false);
                      downloadProvider.initializeDownloads(
                          books.booksByCategory[0].books
                          !.length);

                      final assetPath = index.isOdd
                          ? 'lib/assets/images/b2.jpg'
                          : 'lib/assets/images/b1.jpg';

                      return books.booksByCategory[0]
                          .books![index].title
                          .toString()
                          .toLowerCase()
                          .contains(searchController.text
                          .toString()
                          .toLowerCase())
                          ? GestureDetector(
                        behavior:
                        HitTestBehavior.translucent,
                        onTap: () {
                          Get.to(() => VIEWPDF(
                              path: books
                                  .booksByCategory[0]
                                  .books![index]
                                  .filePath.toString()));
                        },
                        child: Container(
                          width: 171.w,
                          decoration: BoxDecoration(
                            boxShadow: [
                              BoxShadow(
                                color: Colors.black
                                    .withOpacity(0.25),
                                spreadRadius: 0,
                                blurRadius: 4,
                                offset:
                                const Offset(2, 2),
                              ),
                            ],
                            borderRadius:
                            BorderRadius.circular(
                                8.0),
                            color: Colors.white,
                          ),
                          child: Column(
                            children: [
                              Stack(
                                children: <Widget>[
                                  ClipRRect(
                                    borderRadius:
                                    BorderRadius
                                        .circular(
                                        8),
                                    child:
                                    Image.network(
                                      books
                                          .booksByCategory[
                                      0]
                                          .books![index]
                                          .imgTemp.toString(),
                                      width: 171.0,
                                      height: 248.0,
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                  Positioned(
                                    bottom: 104.0,
                                    left: 37.0,
                                    child: SizedBox(
                                      height: 42.0,
                                      width: 106.0,
                                      child: Row(
                                        mainAxisAlignment:
                                        MainAxisAlignment
                                            .spaceBetween,
                                        children: [
                                          GestureDetector(
                                              onTap:
                                                  () {
                                                Get.to(() =>
                                                    OpenBookScreen_viewbooks(
                                                      courses: books.books[0].books.data,
                                                      index: index,
                                                      id: books.books[0].books.data[index].id,
                                                    ));
                                              },
                                              child: Image.asset(
                                                  width: 50
                                                      .w,
                                                  height:
                                                  50.h,
                                                  'lib/assets/images/view.png')),
                                          Consumer<
                                              DownloadProvider>(
                                            builder: (context,
                                                downloadProvider,
                                                child) {
                                              return downloadProvider
                                                  .downloadingStatus[index]
                                                  ? /*CircularProgressIndicator(
                                              value: downloadProvider.downloadingProgress[index] ?? 0.0,
                                              color: Colors.red,
                                            )*/
                                              SizedBox(
                                                width: 50.w,
                                                // Adjust this to your desired size
                                                height: 50.h,
                                                // Adjust this to your desired size
                                                child: Stack(
                                                  alignment: Alignment.center,
                                                  children: [
                                                    CircularProgressIndicator(
                                                      value: downloadProvider.downloadingProgress[index] ?? 0.0,
                                                      valueColor: const AlwaysStoppedAnimation<Color>(Colors.red),
                                                    ),
                                                    Text(
                                                      '${((downloadProvider.downloadingProgress[index] ?? 0.0) * 100).toInt()}%'.toString(),
                                                      style: const TextStyle(
                                                        color: Colors.red,
                                                        fontWeight: FontWeight.bold,
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              )
                                                  : GestureDetector(
                                                onTap: () async {
                                                  requestStoragePermission(index, books.booksByCategory[0].books![index].filePath.toString());
                                                },
                                                child: Image.asset(
                                                  'lib/assets/images/download.png',
                                                  // You had a mistake in the asset path
                                                  width: 50.w,
                                                  height: 50.h,
                                                ),
                                              );
                                            },
                                          )
                                        ],
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              Padding(
                                padding:
                                const EdgeInsets
                                    .symmetric(
                                    horizontal: 5.0,
                                    vertical: 2.0),
                                child: Column(
                                  children: [
                                    Align(
                                      alignment: Alignment
                                          .centerRight,
                                      child: Text(
                                        books
                                            .booksByCategory[
                                        0]
                                            .books![
                                        index]
                                            .title.toString(),
                                        style:
                                        const TextStyle(
                                          fontSize:
                                          10.0,
                                          color: Colors
                                              .blue,
                                          // Change to your preferred color
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
                              ),
                            ],
                          ),
                        ),
                      )
                          : const SizedBox();
                    },
                  )
                      : const CircularProgressIndicator()
                      : const SizedBox());
            }),
            SizedBox(height: 20.h),
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
            Provider.of<DownloadProvider>(context, listen: false);
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
      Provider.of<DownloadProvider>(context, listen: false);

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

class DownloadProvider with ChangeNotifier {
  List<bool> downloadingStatus = [];
  List<double?> downloadingProgress = [];

  void initializeDownloads(int count) {
    downloadingStatus = List.generate(count, (_) => false);
    downloadingProgress = List.generate(count, (_) => 0.0);
    notifyListeners();
  }

  void updateDownloadStatus(int index, bool status) {
    downloadingStatus[index] = status;
    notifyListeners();
  }

  void updateDownloadProgress(int index, double progress) {
    downloadingProgress[index] = progress;

    notifyListeners();
  }
}
