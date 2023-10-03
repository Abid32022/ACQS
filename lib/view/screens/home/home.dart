import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:untitled6/provider/courses_provider.dart';
import 'package:untitled6/utilities/app_constant.dart';
import 'package:untitled6/utilities/colors.dart';
import 'package:untitled6/view/base/rating_bar.dart';
import 'package:untitled6/view/screens/about_us.dart';
import 'package:untitled6/view/screens/alim_data.dart';
import 'package:untitled6/view/screens/almahazaroon.dart';
import 'package:untitled6/view/screens/auth/signin.dart';
import 'package:untitled6/view/screens/books.dart';
import 'package:untitled6/view/screens/contact_us.dart';
import 'package:untitled6/view/screens/drawer1.dart';
import 'package:untitled6/view/screens/drawer2.dart';
import 'package:untitled6/view/screens/faqs.dart';
import 'package:untitled6/view/screens/lecture.dart';
import 'package:untitled6/view/screens/privacy_policy.dart';
import '../video.dart';
import '../video/video_screen.dart';


class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  TextEditingController searchController = TextEditingController();
  @override
  void initState() {
    super.initState();
    AllCoursedProvider allCoursedProvider = Provider.of<AllCoursedProvider>(context, listen: false);
    Future.microtask(() {
      allCoursedProvider.getCoursesBooks();
    });
  }
  @override
  Widget build(BuildContext context) {
    const drawerHeader = UserAccountsDrawerHeader(

      accountName: Text(
        'محمد',
        style: TextStyle(fontSize: 20, color: Color(0xff979797),fontFamily: 'gesndbook'),
      ),
      accountEmail: Text(
        'abc@gmail.com',
        style: TextStyle(fontSize: 20, color: Color(0xff979797),fontFamily: 'gesndbook'),
      ),
      currentAccountPicture: CircleAvatar(
          child: Icon(Icons.person,size: 80,)
      ),
    );
    final drawerItems = ListView(
      children: [
        drawerHeader,
        ListTile(
          title: const Text(
            'الاسئلة الشائعة',
            style: TextStyle(
              fontSize: 20,
              fontFamily: 'gesndbook',
              color: Color(0xff979797),
            ),
          ),
          leading: const Icon(Icons.arrow_forward),
          onTap: () {
            // When the user taps on this item, close the drawer.
            Navigator.push(context, MaterialPageRoute(builder: (context) => Faqs(),));
          },
        ),
        ListTile(
          title: const Text(
            'عن التطبيق',
            style: TextStyle(
              fontSize: 20,
              fontFamily: 'gesndbook',
              color: Color(0xff979797),
            ),
          ),
          leading: const Icon(Icons.arrow_forward),
          onTap: () {
            // When the user taps on this item, close the drawer.
            Navigator.push(context, MaterialPageRoute(builder: (context) => AboutUs(),));
          },
        ),
        ListTile(
          title: const Text(
            'سياسة المنصة التعليمية',
            style: TextStyle(
              fontSize: 20,
              fontFamily: 'gesndbook',
              color: Color(0xff979797),
            ),
          ),
          leading: const Icon(Icons.arrow_forward),
          onTap: () {
            Navigator.push(context, MaterialPageRoute(builder: (context) => Drawer1(),));

            // When the user taps on this item, close the drawer.
          },
        ),
        ListTile(
          title: const Text(
            'سياسة الخُصوصيَّة',
            style: TextStyle(
              fontSize: 20,
              fontFamily: 'gesndbook',
              color: Color(0xff979797),
            ),
          ),
          leading: const Icon(Icons.arrow_forward),
          onTap: () {
            Navigator.push(context, MaterialPageRoute(builder: (context) => PrivacyPolicyPage(),));

            // When the user taps on this item, close the drawer.
          },
        ),
        ListTile(
          title: const Text(
            'أهداف المنصَّة',
            style: TextStyle(
              fontSize: 20,
              fontFamily: 'gesndbook',
              color: Color(0xff979797),
            ),
          ),
          leading: const Icon(Icons.arrow_forward),
          onTap: () {
            // When the user taps on this item, close the drawer.
            Navigator.push(context, MaterialPageRoute(builder: (context) => Drawer2(),));
          },
        ),
        ListTile(
          title: const Text(
            'اتصل بنا',
            style: TextStyle(
              fontSize: 20,
              fontFamily: 'gesndbook',
              color: Color(0xff979797),
            ),
          ),
          leading: const Icon(Icons.arrow_forward),
          onTap: () {
            // When the user taps on this item, close the drawer.
            Navigator.push(context, MaterialPageRoute(builder: (context) => ContactUs(),));
          },
        ),
        ListTile(
          title: const Text(
            'تسجيل خروج',
            style: TextStyle(
              fontSize: 20,
              fontFamily: 'gesndbook',
              color: Color(0xff979797),
            ),
          ),
          leading: const Icon(Icons.arrow_forward),
          onTap: () {
            clearUserToken();
            Get.offAll(()=>Signin());
            // When the user taps on this item, close the drawer.

          },
        ),
      ],
    );

    return Scaffold(
        appBar: AppBar(
          toolbarHeight: 143.h,
          elevation: 0,
          title: const Align(
            alignment: Alignment.bottomRight,
            child: Text(
              'تعلم من الأفضل',
              style: TextStyle(
                fontSize: 28,
                fontFamily: 'gesndbook',
              ),
            ),
          ),
          bottom: PreferredSize(
              preferredSize: Size.fromHeight(80.h),
              child: Container(
                color: kPrimaryColor,
                padding: EdgeInsets.only(bottom: 20.h),
                // height: 120.h,
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 16.w),
                  child: Column(
                    children: [
                      SizedBox(
                        height: 2.h,
                      ),
                      const Align(
                        alignment: Alignment.centerRight,
                        child: Text(
                          'اختر من بين العديد من الدورات',
                          style: TextStyle(
                              fontSize: 24,
                              fontWeight: FontWeight.w400,
                              fontFamily: 'gesndbook',
                              color: Color(0xffFFFFFF)
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 12.h,
                      ),
                      Container(
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
                          border: Border.all(
                              color: const Color(0x1a000000), width: 1.r),
                        ),
                        width: 366.w,
                        height: 52.h,
                        child: Padding(
                          padding: EdgeInsets.symmetric(horizontal: 16.w),
                          child: Row(
                            children: [
                              Icon(CupertinoIcons.search,
                                  color: kPrimaryColor, size: 18),
                              Container(
                                height: 52.h,
                                width: 290.w,
                                // padding: EdgeInsets.only(top: 10.h),
                                child: TextField(
                                  controller: searchController,

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
                      )
                    ],
                  ),
                ),
              )),
        ),
        drawer: Drawer(
          child: drawerItems,
        ),
        body: SingleChildScrollView(
          child: Consumer<AllCoursedProvider>(builder: (context,allCoursedProvider,child){
            return allCoursedProvider.loading?allCoursedProvider.coursesModel.isEmpty?const Text("No Data found"): const Padding(
              padding: EdgeInsets.only(top: 80.0),
              child: Center(child: CircularProgressIndicator(),),
            ):Column(
              children: [
                ///mostCourses!
                allCoursedProvider.coursesModel != null
                    ? allCoursedProvider.coursesModel.isNotEmpty
                    ? searchController.text.toString().isEmpty
                    ?Container(
                  width: 393.w,
                  // height: 366.h,
                  color: Colors.white,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(height: 25.h),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 21),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            GestureDetector(
                              onTap: (){
                                Navigator.push(context, MaterialPageRoute(builder: (context) => Lecture(title: "االمحاضرات",),));
                              },
                              child: Padding(
                                padding: const EdgeInsets.only(top: 4,left: 0),
                                child: Text(
                                  'شاهد المزيد',
                                  style: TextStyle(
                                    fontSize: 16.sp,
                                    color: const Color(0xff70747E),
                                    fontWeight: FontWeight.w400,
                                    fontFamily: 'gesndbook',
                                  ),
                                ),
                              ),
                            ),
                            Text(
                              'الدورات الأكثر متابعة',
                              style: TextStyle(
                                fontSize: 24.sp,
                                color: kPrimaryColor,
                                fontWeight: FontWeight.w400,
                                fontFamily: 'gesndbook',
                              ),
                            ),
                            // SizedBox(width: 10.w,),

                          ],
                        ),
                      ),

                      SizedBox(height: 12.h),
                      SizedBox(
                        height: 265.h,
                        child: ListView.builder(
                            padding: const EdgeInsets.symmetric(vertical: 0),
                            itemCount: allCoursedProvider.coursesModel[0].mostCourses!.length,
                            scrollDirection: Axis.horizontal,
                            shrinkWrap: true,
                            reverse: true,
                            physics: const AlwaysScrollableScrollPhysics(),
                            itemBuilder: (context,index){
                              return  GestureDetector(
                                onTap: (){
                                  AppConstant.courseID=allCoursedProvider.coursesModel[0].mostCourses![index].id.toString();
                                  Get.to(()=>Video(courses: allCoursedProvider.coursesModel[0].mostCourses![index]));
                                },
                                child: Padding(
                                  padding: const EdgeInsets.symmetric(horizontal: 10,vertical: 4),
                                  child: Container(
                                    // height: 300.h,
                                    width: 171.w,
                                    decoration: BoxDecoration(
                                      boxShadow: [
                                        BoxShadow(
                                          color: Colors.black.withOpacity(0.20),
                                          spreadRadius: 2,
                                          blurRadius: 4,
                                          offset: const Offset(
                                              4, 4), // Offset of the shadow
                                        ),
                                      ],
                                      borderRadius: BorderRadius.circular(8.r),
                                      color: Colors.white,
                                    ),
                                    child: Column(
                                      children: [
                                        ClipRRect(
                                          borderRadius: BorderRadius.circular(8),
                                          child: Image.network(
                                            allCoursedProvider.coursesModel[0].mostCourses![index].imgTemp!,
                                            width: 171.w,
                                            height: 140.h,
                                            fit: BoxFit.cover,
                                          ),
                                        ),
                                        Padding(
                                          padding: EdgeInsets.symmetric(
                                              horizontal: 5.w, vertical: 5.w),
                                          child: Column(
                                            children: [
                                              Align(
                                                alignment: Alignment.centerRight,
                                                child: Text(
                                                  allCoursedProvider.coursesModel[0].mostCourses![index].title!,
                                                  style: const TextStyle(
                                                    fontSize: 10,
                                                    color: kPrimaryColor,
                                                    fontWeight: FontWeight.w700,
                                                    fontFamily: 'gesndbook',
                                                  ),
                                                ),
                                              ),
                                              SizedBox(
                                                height: 4.h,
                                              ),
                                              Align(
                                                alignment: Alignment.centerRight,
                                                child: Text(
                                                  ' ${allCoursedProvider.coursesModel[0].mostCourses![index].videoCount.toString()}:ساعة',
                                                  style: TextStyle(
                                                    fontSize: 14.sp,
                                                    color: const Color(0xff666666),
                                                    fontWeight: FontWeight.w400,
                                                    fontFamily: 'gesndbook',
                                                  ),
                                                ),
                                              ),
                                              SizedBox(
                                                height: 3.h,
                                              ),
                                              Align(
                                                alignment: Alignment.centerRight,
                                                child: Text(
                                                  allCoursedProvider.coursesModel[0].mostCourses![index].lecturers![0].name.toString(),
                                                  style: TextStyle(
                                                    fontSize: 12.sp,
                                                    color: const Color(0xff666666),
                                                    fontWeight: FontWeight.w400,
                                                    fontFamily: 'gesndbook',
                                                  ),
                                                  textAlign: TextAlign.right,
                                                ),
                                              ),
                                              SizedBox(
                                                height: 8.h,
                                              ),
                                              Row(
                                                mainAxisAlignment:
                                                MainAxisAlignment.spaceEvenly,
                                                children: [
                                                  Align(
                                                    alignment: Alignment.centerRight,
                                                    child: RatingBar(
                                                      rating: allCoursedProvider.coursesModel[0].mostCourses![index].rating!.toDouble(),
                                                      size: 15,
                                                      ratingCount:allCoursedProvider.coursesModel[0].mostCourses![index].ratingCount!.toInt(),
                                                    ),
                                                  ),
                                                  SizedBox(
                                                    width: 29.w,
                                                  ),
                                                  Align(
                                                    alignment: Alignment.centerRight,
                                                    child: Text(
                                                      '(${allCoursedProvider.coursesModel[0].mostCourses![index].ratingCount!.toInt()})',
                                                      style: const TextStyle(
                                                        fontSize: 11,
                                                        color: Color(0xff888C94),
                                                        fontWeight: FontWeight.w400,
                                                        fontFamily: 'gesndbook',
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
                                  ),
                                ),
                              );
                            }),
                      ),

                    ],
                  ),
                ):Container(
                  width: 393.w,
                  // height: 366.h,
                  color: Colors.white,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(height: 25.h),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 21),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            GestureDetector(
                              onTap: (){
                                Navigator.push(context, MaterialPageRoute(builder: (context) => Lecture(title: "االمحاضرات",),));
                              },
                              child: Padding(
                                padding: const EdgeInsets.only(top: 4,left: 0),
                                child: Text(
                                  'شاهد المزيد',
                                  style: TextStyle(
                                    fontSize: 16.sp,
                                    color: Color(0xff70747E),
                                    fontWeight: FontWeight.w400,
                                    fontFamily: 'gesndbook',
                                  ),
                                ),
                              ),
                            ),
                            Text(
                              'الدورات الأكثر متابعة',
                              style: TextStyle(
                                fontSize: 24.sp,
                                color: kPrimaryColor,
                                fontWeight: FontWeight.w400,
                                fontFamily: 'gesndbook',
                              ),
                            ),
                            // SizedBox(width: 10.w,),

                          ],
                        ),
                      ),

                      SizedBox(height: 12.h),
                      Container(
                        height: 265.h,
                        child: ListView.builder(
                            padding: EdgeInsets.symmetric(vertical: 0),
                            itemCount: allCoursedProvider.coursesModel[0].mostCourses!.length,
                            scrollDirection: Axis.horizontal,
                            shrinkWrap: true,
                            reverse: true,
                            physics: AlwaysScrollableScrollPhysics(),
                            itemBuilder: (context,index){
                              return  allCoursedProvider.coursesModel[0].mostCourses![index].title
                                  .toString()
                                  .toLowerCase()
                                  .contains(searchController
                                  .text
                                  .toString()
                                  .toLowerCase())?GestureDetector(
                                onTap: (){
                                  AppConstant.courseID=allCoursedProvider.coursesModel[0].mostCourses![index].id.toString();
                                  print("this is id 1 ${allCoursedProvider.coursesModel[0].mostCourses![index].id}");
                                  Get.to(()=>Video(courses: allCoursedProvider.coursesModel[0].mostCourses![index]));

                                },
                                child: Padding(
                                  padding: const EdgeInsets.symmetric(horizontal: 10,vertical: 4),
                                  child: Container(
                                    // height: 300.h,
                                    width: 171.w,
                                    decoration: BoxDecoration(
                                      boxShadow: [
                                        BoxShadow(
                                          color: Colors.black.withOpacity(0.20),
                                          // Shadow color
                                          spreadRadius: 2,
                                          // Spread radius
                                          blurRadius: 4,
                                          // Blur radius
                                          offset: const Offset(
                                              4, 4), // Offset of the shadow
                                        ),
                                      ],
                                      borderRadius: BorderRadius.circular(8.r),
                                      color: Colors.white,
                                    ),
                                    child: Column(
                                      children: [ ClipRRect(
                                        borderRadius: BorderRadius.circular(8),
                                        child: Image.network(
                                          allCoursedProvider.coursesModel[0].mostCourses![index].imgTemp!,
                                          width: 171.w,
                                          height: 140.h,
                                          fit: BoxFit.cover,
                                        ),
                                      ),
                                        Padding(
                                          padding: EdgeInsets.symmetric(
                                              horizontal: 5.w, vertical: 5.w),
                                          child: Column(
                                            children: [
                                              Align(
                                                alignment: Alignment.centerRight,
                                                child: Text(
                                                  allCoursedProvider.coursesModel[0].mostCourses![index].title!,
                                                  style: const TextStyle(
                                                    fontSize: 10,
                                                    color: kPrimaryColor,
                                                    fontWeight: FontWeight.w700,
                                                    fontFamily: 'gesndbook',
                                                  ),
                                                ),
                                              ),
                                              SizedBox(
                                                height: 4.h,
                                              ),
                                              Align(
                                                alignment: Alignment.centerRight,
                                                child: Text(
                                                  '4 ساعة',
                                                  style: TextStyle(
                                                    fontSize: 14.sp,
                                                    color: Color(0xff666666),
                                                    fontWeight: FontWeight.w400,
                                                    fontFamily: 'gesndbook',
                                                  ),
                                                ),
                                              ),
                                              SizedBox(
                                                height: 3.h,
                                              ),
                                              Align(
                                                alignment: Alignment.centerRight,
                                                child: Text(
                                                  'الدكتور محمد إقبال أحمد فرحات',
                                                  style: TextStyle(

                                                    fontSize: 12.sp,
                                                    color: Color(0xff666666),
                                                    fontWeight: FontWeight.w400,
                                                    fontFamily: 'gesndbook',
                                                  ),
                                                  textAlign: TextAlign.right,
                                                ),
                                              ),
                                              SizedBox(
                                                height: 8.h,
                                              ),
                                              Container(
                                                child: Row(
                                                  mainAxisAlignment:
                                                  MainAxisAlignment.spaceEvenly,
                                                  children: [
                                                    Align(
                                                      alignment: Alignment.centerRight,
                                                      child: RatingBar(
                                                        rating: allCoursedProvider.coursesModel[0].mostCourses![index].rating!.toDouble(),
                                                        size: 15,
                                                        ratingCount:allCoursedProvider.coursesModel[0].mostCourses![index].ratingCount!.toInt(),
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
                                                        '(${allCoursedProvider.coursesModel[0].mostCourses![index].ratingCount!.toInt()})',
                                                        style: const TextStyle(
                                                          fontSize: 11,
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
                                        )
                                      ],
                                    ),
                                  ),
                                ),
                              ):Container();
                            }),
                      ),

                    ],
                  ),
                ):const CircularProgressIndicator(color: Colors.red,):SizedBox(),
                SizedBox(height: 31.h,),
                ///Courses
                Container(
                  padding: EdgeInsets.only(
                      bottom: 32.h

                  ),
                  width: 393.w,
                  // height: 360.h,
                  color: kPrimaryColor,
                  child: Column(
                    children: [

                      SizedBox(height: 25.h),
                      Padding(
                        padding:  EdgeInsets.symmetric(horizontal: 23.w),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            GestureDetector(
                              onTap: (){
                                Navigator.push(context, MaterialPageRoute(builder: (context) => Lecture(title: "مركز الدراسات الإسلامية",),));

                              },
                              child: Padding(
                                padding: const EdgeInsets.only(top: 6),
                                child: Text(
                                  'شاهد المزيد',
                                  style: TextStyle(
                                    fontSize: 16.sp,
                                    color: Colors.white,
                                    fontWeight: FontWeight.w400,
                                    fontFamily: 'gesndbook',
                                  ),
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(top: 4,left: 8),
                              child: Text(
                                'مركز الدراسات الإسلامية',
                                style: TextStyle(
                                  fontSize: 24.sp,
                                  color: Colors.white,
                                  fontWeight: FontWeight.w400,
                                  fontFamily: 'gesndbook',
                                ),
                              ),
                            ),

                          ],
                        ),
                      ),
                      SizedBox(height: 12.h),
                      SizedBox(
                        height: 270.h,
                        child: ListView.builder(
                            padding: const EdgeInsets.symmetric(vertical: 0),
                            itemCount: allCoursedProvider.coursesModel[0].courses!.length,
                            scrollDirection: Axis.horizontal,
                            reverse: true,
                            shrinkWrap: true,
                            physics: const AlwaysScrollableScrollPhysics(),
                            itemBuilder: (context,index){
                              return  GestureDetector(
                                onTap: (){
                                  // Get.to(()=>Video(courses: allCoursedProvider.coursesModel[0].mostCourses![index]));
                                },
                                child: Padding(
                                  padding: const EdgeInsets.symmetric(horizontal: 10),
                                  child: Container(
                                    width: 171.w,
                                    decoration: BoxDecoration(
                                      boxShadow: [
                                        BoxShadow(
                                          color: Colors.black.withOpacity(0.25),
                                          spreadRadius: 0,
                                          blurRadius: 4,
                                          offset: const Offset(
                                              2, 2), // Offset of the shadow
                                        ),
                                      ],
                                      borderRadius: BorderRadius.circular(11.r),
                                      color: Colors.white,
                                    ),
                                    child: Column(
                                      children: [
                                        ClipRRect(
                                          borderRadius: BorderRadius.circular(8),
                                          child: Image.network(
                                            allCoursedProvider.coursesModel[0].courses![index].imgTemp!,
                                            width: 171.w,
                                            height: 140.h,
                                            fit: BoxFit.cover,
                                          ),
                                        ),
                                        Padding(
                                          padding: EdgeInsets.symmetric(
                                              horizontal: 5.w, vertical: 5.w),
                                          child: Column(
                                            children: [
                                              Align(
                                                alignment: Alignment.centerRight,
                                                child: Text(
                                                  allCoursedProvider.coursesModel[0].courses![index].title!,
                                                  style: const TextStyle(
                                                    fontSize: 10,
                                                    color: kPrimaryColor,
                                                    fontWeight: FontWeight.w700,
                                                    fontFamily: 'gesndbook',
                                                  ),
                                                ),
                                              ),
                                              SizedBox(
                                                height: 4.h,
                                              ),
                                              Align(
                                                alignment: Alignment.centerRight,
                                                child: Text(
                                                  '${allCoursedProvider.coursesModel[0].courses![index].videoCount.toString()} ساعة',
                                                  style: TextStyle(
                                                    fontSize: 14.sp,
                                                    color: const Color(0xff666666),
                                                    fontWeight: FontWeight.w400,
                                                    fontFamily: 'gesndbook',
                                                  ),
                                                ),
                                              ),
                                              SizedBox(
                                                height: 3.h,
                                              ),
                                              Align(
                                                alignment: Alignment.centerRight,
                                                child: Text(
                                                  allCoursedProvider.coursesModel[0].courses![index].lecturers![0].name.toString() ,                                               style: TextStyle(
                                                  fontSize: 12.sp,
                                                  color: const Color(0xff666666),
                                                  fontWeight: FontWeight.w400,
                                                  fontFamily: 'gesndbook',
                                                ),
                                                  textAlign: TextAlign.right,
                                                ),
                                              ),
                                              SizedBox(
                                                height: 8.h,
                                              ),
                                              Row(
                                                mainAxisAlignment:
                                                MainAxisAlignment.spaceEvenly,
                                                children: [
                                                  Align(
                                                    alignment: Alignment.centerRight,
                                                    child: RatingBar(
                                                      rating: allCoursedProvider.coursesModel[0].courses![index].rating!.toDouble(),
                                                      size: 15,
                                                      ratingCount:allCoursedProvider.coursesModel[0].courses![index].ratingCount!.toInt(),
                                                    ),
                                                  ),
                                                  SizedBox(
                                                    width: 29.w,
                                                  ),
                                                  Align(
                                                    alignment: Alignment.centerRight,
                                                    child: Text(
                                                      '(${allCoursedProvider.coursesModel[0].courses![index].ratingCount!.toInt()})',
                                                      style: const TextStyle(
                                                        fontSize: 11,
                                                        color: Color(0xff888C94),
                                                        fontWeight: FontWeight.w400,
                                                        fontFamily: 'gesndbook',
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
                                  ),
                                ),
                              );
                            }),
                      ),

                    ],
                  ),
                ),
                ///books
                Container(
                  width: 393.w,
                  // height: 423.h,
                  color: Colors.white,
                  child: Column(
                    children: [
                      SizedBox(height: 25.h),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 22),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [

                            GestureDetector(
                              onTap: (){
                                Navigator.push(context, MaterialPageRoute(builder: (context) => BooksScreen(),));
                              },
                              child: Padding(
                                padding: const EdgeInsets.only(top: 8,left: 4),
                                child: Text(
                                  'شاهد المزيد',
                                  style: TextStyle(
                                    fontSize: 16.sp,
                                    color: Color(0xff70747E),
                                    fontWeight: FontWeight.w400,
                                    fontFamily: 'gesndbook',
                                  ),
                                ),
                              ),
                            ),
                            Text(
                              'الكتب',
                              style: TextStyle(
                                fontSize: 24.sp,
                                color: kPrimaryColor,
                                fontWeight: FontWeight.w400,
                                fontFamily: 'gesndbook',
                              ),
                            ),

                          ],
                        ),
                      ),
                      SizedBox(height: 12.h),
                      Container(
                        height: 320.h,
                        child: ListView.builder(
                            padding: EdgeInsets.symmetric(vertical: 0),
                            itemCount: allCoursedProvider.coursesModel[0].books?.length,
                            scrollDirection: Axis.horizontal,
                            reverse: true,
                            shrinkWrap: true,
                            physics: const AlwaysScrollableScrollPhysics(),
                            itemBuilder: (context,index){
                              return  GestureDetector(
                                onTap: (){
                                  Get.to(()=>  OpenBookScreen(allcourse:allCoursedProvider.coursesModel[0].books![index],));
                                },
                                child: Padding(
                                  padding: const EdgeInsets.symmetric(vertical: 4,horizontal: 10),
                                  child: Container(
                                    // height: 298.h,
                                    width: 171.w,
                                    decoration: BoxDecoration(
                                      boxShadow: [
                                        BoxShadow(
                                          color: Colors.black.withOpacity(0.25),
                                          // Shadow color
                                          spreadRadius: 0,
                                          // Spread radius
                                          blurRadius: 4,
                                          // Blur radius
                                          offset: const Offset(
                                              2, 2), // Offset of the shadow
                                        ),
                                      ],
                                      borderRadius: BorderRadius.circular(11.r),
                                      color: Colors.white,
                                    ),
                                    child: Column(
                                      children: [
                                        Container(
                                          child: ClipRRect(
                                            borderRadius: BorderRadius.circular(8),
                                            child: Image.network(
                                              allCoursedProvider.coursesModel[0].books![index].imgTemp!,
                                              width: 171.w,
                                              height: 225.h,
                                              fit: BoxFit.cover,
                                            ),
                                          ),
                                        ),
                                        SizedBox(height: 10,),
                                        Padding(
                                          padding: EdgeInsets.symmetric(
                                              horizontal: 5.w, vertical: 3.w),
                                          child: Column(
                                            children: [
                                              Align(
                                                alignment: Alignment.centerRight,
                                                child: Text(
                                                  allCoursedProvider.coursesModel[0].books![index].title!,
                                                  style: const TextStyle(
                                                    fontSize: 10,
                                                    color: kPrimaryColor,
                                                    fontWeight: FontWeight.w700,
                                                    fontFamily: 'gesndbook',
                                                  ),
                                                ),
                                              ),
                                              SizedBox(
                                                height: 4.h,
                                              ),
                                              Container(
                                                child: Row(
                                                  mainAxisAlignment:
                                                  MainAxisAlignment.spaceEvenly,
                                                  children: [
                                                    Align(
                                                      alignment: Alignment.centerRight,
                                                      child: RatingBar(
                                                        rating: 0,
                                                        size: 15,
                                                        ratingCount:0,
                                                      ),
                                                    ),
                                                    SizedBox(
                                                      width: 29.w,
                                                    ),
                                                    Align(
                                                      alignment: Alignment.centerRight,
                                                      child: Text(
                                                        '(0)',
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
                                        )
                                      ],
                                    ),
                                  ),
                                ),
                              );
                            }),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 27.h),
                ///lecturer
                Container(
                  width: 393.w,
                  padding: EdgeInsets.only(bottom: 30.h),
                  color: kPrimaryColor,
                  child: Column(
                    children: [
                      SizedBox(height: 25.h),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          GestureDetector(
                            onTap: (){
                              Navigator.push(context, MaterialPageRoute(builder: (context) => AlmahazaratScreen()));
                            },
                            child: Padding(
                              padding: const EdgeInsets.only(top: 4,left: 14),
                              child: Text(
                                'شاهد المزيد',
                                style: TextStyle(
                                  fontSize: 16.sp,
                                  color: Colors.white,
                                  fontWeight: FontWeight.w400,
                                  fontFamily: 'gesndbook',
                                ),
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(right: 17),
                            child: Text(
                              'المحاضرون',
                              style: TextStyle(
                                fontSize: 24.sp,
                                color: Colors.white,
                                fontWeight: FontWeight.w400,
                                fontFamily: 'gesndbook',
                              ),
                            ),
                          ),

                        ],
                      ),
                      SizedBox(height: 12.h),

                      Container(
                        height: 260.h,
                        child: ListView.builder(
                            padding: EdgeInsets.symmetric(vertical: 0),
                            itemCount: allCoursedProvider.coursesModel[0].tutors!.length,
                            scrollDirection: Axis.horizontal,
                            reverse: true,
                            shrinkWrap: true,
                            physics: AlwaysScrollableScrollPhysics(),
                            itemBuilder: (context,index){
                              print("this fsdf ${allCoursedProvider.coursesModel[0].tutors![index].currentJob}");

                              return GestureDetector(
                                onTap: (){
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) =>

                                            DataScreen(index:index,id:allCoursedProvider.coursesModel[0].tutors![index].id!,lecturers: allCoursedProvider.coursesModel[0].tutors!),

                                      ));
                                },
                                child: Padding(
                                  padding: const EdgeInsets.symmetric(horizontal: 10),
                                  child: Container(
                                    height: 240,
                                    width: 171.w,
                                    decoration: BoxDecoration(
                                      boxShadow: [
                                        BoxShadow(
                                          color: Colors.black.withOpacity(0.25),
                                          // Shadow color
                                          spreadRadius: 0,
                                          // Spread radius
                                          blurRadius: 4,
                                          // Blur radius
                                          offset: const Offset(
                                              2, 2), // Offset of the shadow
                                        ),
                                      ],
                                      borderRadius: BorderRadius.circular(11.r),
                                      color: Colors.white,
                                    ),
                                    child: Column(
                                      children: [
                                        ClipRRect(
                                          borderRadius: BorderRadius.only(topLeft: Radius.circular(8),topRight: Radius.circular(8)),
                                          child: Image.network(
                                            allCoursedProvider.coursesModel[0].tutors![index].imgTemp!,
                                            width: 171.w,
                                            height: 180.h,
                                            fit: BoxFit.cover,
                                          ),
                                        ),
                                        // Container(
                                        //   height: 208.h,
                                        //   decoration: BoxDecoration(
                                        //     borderRadius: BorderRadius.circular(8),
                                        //     image: DecorationImage(
                                        //       image: AssetImage(allCoursedProvider.coursesModel[0].tutors![index].imgTemp),
                                        //       fit: BoxFit.fill,
                                        //     ),
                                        //   ),
                                        // ),
                                        Padding(
                                          padding: EdgeInsets.symmetric(
                                              horizontal: 5.w, vertical: 3.w),
                                          child: Column(
                                            children: [
                                              Align(
                                                alignment: Alignment.centerRight,
                                                child: Text(
                                                  allCoursedProvider.coursesModel[0].tutors![index].name!,
                                                  style: const TextStyle(
                                                    fontSize: 10,
                                                    color: kPrimaryColor,
                                                    fontWeight: FontWeight.w700,
                                                    fontFamily: 'gesndbook',
                                                  ),
                                                ),
                                              ),
                                              SizedBox(
                                                height: 20.h,
                                              ),
                                              Row(
                                                mainAxisAlignment:
                                                MainAxisAlignment.spaceEvenly,
                                                children: [
                                                  Align(
                                                    alignment: Alignment.centerRight,
                                                    child: RatingBar(
                                                      rating: 0,
                                                      size: 15,
                                                      ratingCount:0,
                                                    ),
                                                  ),
                                                  SizedBox(
                                                    width: 29.w,
                                                  ),
                                                  Align(
                                                    alignment: Alignment.centerRight,
                                                    child: Text(
                                                      '(0)',
                                                      style: TextStyle(
                                                        fontSize: 11.sp,
                                                        color: const Color(0xff888C94),
                                                        fontWeight: FontWeight.w400,
                                                        fontFamily: 'gesndbook',
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
                                  ),
                                ),
                              );
                            }),
                      ),
                      // Row(
                      //   children: [
                      //
                      //     // Container(
                      //     //   width: 171.w,
                      //     //   decoration: BoxDecoration(
                      //     //     boxShadow: [
                      //     //       BoxShadow(
                      //     //         color: Colors.black.withOpacity(0.25),
                      //     //         // Shadow color
                      //     //         spreadRadius: 0,
                      //     //         // Spread radius
                      //     //         blurRadius: 4,
                      //     //         // Blur radius
                      //     //         offset: const Offset(
                      //     //             2, 2), // Offset of the shadow
                      //     //       ),
                      //     //     ],
                      //     //     borderRadius: BorderRadius.circular(11.r),
                      //     //     color: Colors.white,
                      //     //   ),
                      //     //   child: Column(
                      //     //     children: [
                      //     //       ClipRRect(
                      //     //         child: Image.asset(
                      //     //           'lib/assets/images/man420.png',
                      //     //           //width: 171.w,
                      //     //           height: 235,
                      //     //           fit: BoxFit.fitHeight,
                      //     //         ),
                      //     //         borderRadius: BorderRadius.circular(10),
                      //     //       ),
                      //     //       Padding(
                      //     //         padding: EdgeInsets.symmetric(
                      //     //             horizontal: 5.w, vertical: 3.w),
                      //     //         child: Column(
                      //     //           children: [
                      //     //             Align(
                      //     //               alignment: Alignment.centerRight,
                      //     //               child: Text(
                      //     //                 'نزهة النظر في توضيح نخبة الفكر',
                      //     //                 style: TextStyle(
                      //     //                   fontSize: 10.sp,
                      //     //                   color: kPrimaryColor,
                      //     //                   fontWeight: FontWeight.w400,
                      //     //                   fontFamily: 'gesndbook',
                      //     //                 ),
                      //     //               ),
                      //     //             ),
                      //     //             SizedBox(
                      //     //               height: 4.h,
                      //     //             ),
                      //     //             Container(
                      //     //               child: Row(
                      //     //                 mainAxisAlignment:
                      //     //                 MainAxisAlignment.spaceEvenly,
                      //     //                 children: [
                      //     //                   Align(
                      //     //                     alignment: Alignment.centerRight,
                      //     //                     child: Text(
                      //     //                       '4.0',
                      //     //                       style: TextStyle(
                      //     //                         fontSize: 11.sp,
                      //     //                         color: Color(0xff888C94),
                      //     //                         fontWeight: FontWeight.w400,
                      //     //                         fontFamily: 'gesndbook',
                      //     //                       ),
                      //     //                     ),
                      //     //                   ),
                      //     //                   Image.asset(
                      //     //                     'lib/assets/images/stars.jpg',
                      //     //                     height: 13.13.h,
                      //     //                     width: 71.w,
                      //     //                   ),
                      //     //                   SizedBox(
                      //     //                     width: 29.w,
                      //     //                   ),
                      //     //                   Align(
                      //     //                     alignment: Alignment.centerRight,
                      //     //                     child: Text(
                      //     //                       '(4051)',
                      //     //                       style: TextStyle(
                      //     //                         fontSize: 11.sp,
                      //     //                         color: Color(0xff888C94),
                      //     //                         fontWeight: FontWeight.w400,
                      //     //                         fontFamily: 'gesndbook',
                      //     //                       ),
                      //     //                     ),
                      //     //                   ),
                      //     //                 ],
                      //     //               ),
                      //     //             )
                      //     //           ],
                      //     //         ),
                      //     //       )
                      //     //     ],
                      //     //   ),
                      //     // ),
                      //     SizedBox(width: 12.w),
                      //     Container(
                      //       height: 240,
                      //       width: 171.w,
                      //       decoration: BoxDecoration(
                      //         boxShadow: [
                      //           BoxShadow(
                      //             color: Colors.black.withOpacity(0.25),
                      //             // Shadow color
                      //             spreadRadius: 0,
                      //             // Spread radius
                      //             blurRadius: 4,
                      //             // Blur radius
                      //             offset: const Offset(
                      //                 2, 2), // Offset of the shadow
                      //           ),
                      //         ],
                      //         borderRadius: BorderRadius.circular(11.r),
                      //         color: Colors.white,
                      //       ),
                      //       child: Column(
                      //         children: [
                      //           ClipRRect(
                      //             borderRadius: BorderRadius.circular(11),
                      //             child: Image.asset(
                      //               'lib/assets/images/man421.png',
                      //               height:200.h,
                      //               width: 171.w,
                      //               fit: BoxFit.cover,
                      //             ),
                      //           ),
                      //           Padding(
                      //             padding: EdgeInsets.symmetric(
                      //                 horizontal: 5.w, vertical: 3.w),
                      //             child: Column(
                      //               children: [
                      //                 Align(
                      //                   alignment: Alignment.centerRight,
                      //                   child: Text(
                      //                     'نزهة النظر في توضيح نخبة الفكر',
                      //                     style: TextStyle(
                      //                       fontSize: 10.sp,
                      //                       color: kPrimaryColor,
                      //                       fontWeight: FontWeight.w400,
                      //                       fontFamily: 'gesndbook',
                      //                     ),
                      //                   ),
                      //                 ),
                      //                 SizedBox(
                      //                   height: 4.h,
                      //                 ),
                      //                 Container(
                      //                   child: Row(
                      //                     mainAxisAlignment:
                      //                     MainAxisAlignment.spaceEvenly,
                      //                     children: [
                      //                       Align(
                      //                         alignment: Alignment.centerRight,
                      //                         child: Text(
                      //                           '4.0',
                      //                           style: TextStyle(
                      //                             fontSize: 11.sp,
                      //                             color: Color(0xff888C94),
                      //                             fontWeight: FontWeight.w400,
                      //                             fontFamily: 'gesndbook',
                      //                           ),
                      //                         ),
                      //                       ),
                      //                       Image.asset(
                      //                         'lib/assets/images/stars.jpg',
                      //                         height: 13.13.h,
                      //                         width: 71.w,
                      //                       ),
                      //                       SizedBox(
                      //                         width: 29.w,
                      //                       ),
                      //                       Align(
                      //                         alignment: Alignment.centerRight,
                      //                         child: Text(
                      //                           '(4051)',
                      //                           style: TextStyle(
                      //                             fontSize: 11.sp,
                      //                             color: Color(0xff888C94),
                      //                             fontWeight: FontWeight.w400,
                      //                             fontFamily: 'gesndbook',
                      //                           ),
                      //                         ),
                      //                       ),
                      //                     ],
                      //                   ),
                      //                 )
                      //               ],
                      //             ),
                      //           )
                      //         ],
                      //       ),
                      //     ),
                      //     // Container(
                      //     //   width: 171.w,
                      //     //   decoration: BoxDecoration(
                      //     //     boxShadow: [
                      //     //       BoxShadow(
                      //     //         color: Colors.black.withOpacity(0.25),
                      //     //         // Shadow color
                      //     //         spreadRadius: 0,
                      //     //         // Spread radius
                      //     //         blurRadius: 4,
                      //     //         // Blur radius
                      //     //         offset: const Offset(
                      //     //             2, 2), // Offset of the shadow
                      //     //       ),
                      //     //     ],
                      //     //     borderRadius: BorderRadius.circular(11.r),
                      //     //     color: Colors.white,
                      //     //   ),
                      //     //   child: Column(
                      //     //     children: [
                      //     //       Image.asset(
                      //     //         'lib/assets/images/man421.png',
                      //     //         width: 171.w,
                      //     //         fit: BoxFit.cover,
                      //     //       ),
                      //     //       Padding(
                      //     //         padding: EdgeInsets.symmetric(
                      //     //             horizontal: 5.w, vertical: 3.w),
                      //     //         child: Column(
                      //     //           children: [
                      //     //             Align(
                      //     //               alignment: Alignment.centerRight,
                      //     //               child: Text(
                      //     //                 'نزهة النظر في توضيح نخبة الفكر',
                      //     //                 style: TextStyle(
                      //     //                   fontSize: 10.sp,
                      //     //                   color: kPrimaryColor,
                      //     //                   fontWeight: FontWeight.w400,
                      //     //                   fontFamily: 'gesndbook',
                      //     //                 ),
                      //     //               ),
                      //     //             ),
                      //     //             SizedBox(
                      //     //               height: 4.h,
                      //     //             ),
                      //     //             Container(
                      //     //               child: Row(
                      //     //                 mainAxisAlignment:
                      //     //                 MainAxisAlignment.spaceEvenly,
                      //     //                 children: [
                      //     //                   Align(
                      //     //                     alignment: Alignment.centerRight,
                      //     //                     child: Text(
                      //     //                       '4.0',
                      //     //                       style: TextStyle(
                      //     //                         fontSize: 11.sp,
                      //     //                         color: Color(0xff888C94),
                      //     //                         fontWeight: FontWeight.w400,
                      //     //                         fontFamily: 'gesndbook',
                      //     //                       ),
                      //     //                     ),
                      //     //                   ),
                      //     //                   Image.asset(
                      //     //                     'lib/assets/images/stars.jpg',
                      //     //                     height: 13.13.h,
                      //     //                     width: 71.w,
                      //     //                   ),
                      //     //                   SizedBox(
                      //     //                     width: 29.w,
                      //     //                   ),
                      //     //                   Align(
                      //     //                     alignment: Alignment.centerRight,
                      //     //                     child: Text(
                      //     //                       '(4051)',
                      //     //                       style: TextStyle(
                      //     //                         fontSize: 11.sp,
                      //     //                         color: Color(0xff888C94),
                      //     //                         fontWeight: FontWeight.w400,
                      //     //                         fontFamily: 'gesndbook',
                      //     //                       ),
                      //     //                     ),
                      //     //                   ),
                      //     //                 ],
                      //     //               ),
                      //     //             )
                      //     //           ],
                      //     //         ),
                      //     //       )
                      //     //     ],
                      //     //   ),
                      //     // ),
                      //   ],
                      // ),
                    ],
                  ),
                ),
                SizedBox(height: 10.h,),

              ],
            );
          }),
        ));

  }
  void clearUserToken() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.remove('access_token');
  }
}

