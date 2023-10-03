import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:untitled6/provider/profile_provider.dart';
import 'package:untitled6/utilities/colors.dart';
import 'package:untitled6/view/screens/profile_edit.dart';


class UserProfile extends StatefulWidget {
  const UserProfile({super.key});

  @override
  State<UserProfile> createState() => _UserProfileState();
}

class _UserProfileState extends State<UserProfile> {
  bool isEdit = false;

  @override
  void initState() {
    Provider.of<UserProfileProvider>(context, listen: false).getUserProfile();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Provider.of<UserProfileProvider>(context, listen: false).getUserProfile();
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: kPrimaryColor,
        title: const Text(
          'الملف الشخصي للمستخدم',
          style: TextStyle(
            fontSize: 20,
            fontFamily: 'gesndbook',
            color: Color(0xffFFFFFF),
          ),
        ),
      ),
      body: SingleChildScrollView(child: Consumer<UserProfileProvider>(
        builder: (context, userprofile, child) {
          return userprofile.userprofileModel.isEmpty
              ? SizedBox(
              height: 400.h,
              child: const Center(child: CircularProgressIndicator()))
              : Container(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Form(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  SizedBox(
                    height: 60.h,
                  ),
                  CircleAvatar(
                    backgroundColor: Colors.white,
                    radius: 55.r,
                    backgroundImage:
                    userprofile.userprofileModel[0].user!.avatar !=
                        null
                        ? NetworkImage(
                      "${userprofile.userprofileModel[0].user!.avatar}",
                    )
                        : const AssetImage(
                        "lib/assets/images/bottom4_ic.png")
                    as ImageProvider<Object>,
                  ),
                  SizedBox(height: 40.h),
                  TextFormField(
                    enabled: isEdit,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      labelText:
                      "${userprofile.userprofileModel[0].user!.firstName ?? "اسم"}",
                      labelStyle: TextStyle(
                          fontFamily: 'gesndbook',
                          fontSize: 16.sp,
                          fontWeight: FontWeight.w400,
                          color: const Color(0xff979797)),
                      hintText:
                      "${userprofile.userprofileModel[0].user!.firstName ?? "${userprofile.userprofileModel[0].user!.firstName}"}",
                      hintStyle: TextStyle(
                          fontFamily: 'gesndbook',
                          fontSize: 15.sp,
                          fontWeight: FontWeight.w400,
                          color: const Color(0xff263238)),
                      contentPadding:
                      EdgeInsets.fromLTRB(32.w, 18.h, 0.0, 18.h),
                    ),
                    style: GoogleFonts.poppins(
                        color: const Color(0xff263238)),
                  ),
                  SizedBox(height: 20.h),
                  TextFormField(
                    enabled: isEdit,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      labelText:
                      userprofile.userprofileModel[0].user!.email ??
                          "بريد إلكتروني",
                      labelStyle: TextStyle(
                          fontFamily: 'gesndbook',
                          fontSize: 16.sp,
                          fontWeight: FontWeight.w400,
                          color: const Color(0xff979797)),
                      hintText:
                      userprofile.userprofileModel[0].user!.email ??
                          "بريد إلكتروني",
                      hintStyle: TextStyle(
                          fontFamily: 'gesndbook',
                          fontSize: 15.sp,
                          fontWeight: FontWeight.w400,
                          color: const Color(0xff263238)),
                      contentPadding:
                      EdgeInsets.fromLTRB(32.w, 18.h, 0.0, 18.h),
                    ),
                    style: GoogleFonts.poppins(
                        color: const Color(0xff263238)),
                  ),
                  SizedBox(height: 20.h),
                  TextFormField(
                    enabled: isEdit,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      labelText:
                      "${userprofile.userprofileModel[0].user!.phone ?? "رقم الهاتف المحمول"}",
                      labelStyle: TextStyle(
                          fontFamily: 'gesndbook',
                          fontSize: 16.sp,
                          fontWeight: FontWeight.w400,
                          color: const Color(0xff979797)),
                      hintText:
                      "${userprofile.userprofileModel[0].user!.phone == null ? "رقم الهاتف المحمول" : userprofile.userprofileModel[0].user!.phone}",
                      hintStyle: TextStyle(
                          fontFamily: 'gesndbook',
                          fontSize: 15.sp,
                          fontWeight: FontWeight.w400,
                          color: const Color(0xff263238)),
                      contentPadding:
                      EdgeInsets.fromLTRB(32.w, 18.h, 0.0, 18.h),
                    ),
                    style: GoogleFonts.poppins(
                        color: const Color(0xff263238)),
                  ),
                  SizedBox(height: 20.h),
                  TextFormField(
                    enabled: isEdit,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      labelText:
                      "${userprofile.userprofileModel[0].user!.birthDate ?? "تاريخ الميلاد"}",
                      labelStyle: TextStyle(
                          fontFamily: 'gesndbook',
                          fontSize: 16.sp,
                          fontWeight: FontWeight.w400,
                          color: const Color(0xff979797)),
                      hintText:
                      "${userprofile.userprofileModel[0].user!.birthDate == null ? "تاريخ الميلاد" : userprofile.userprofileModel[0].user!.birthDate}",
                      hintStyle: TextStyle(
                          fontFamily: 'gesndbook',
                          fontSize: 15.sp,
                          fontWeight: FontWeight.w400,
                          color: const Color(0xff263238)),
                      contentPadding: EdgeInsets.fromLTRB(32.w, 18.h, 0.0,
                          18.h), // 15 units of left padding
                    ),
                    style: GoogleFonts.poppins(
                        color: const Color(0xff263238)),
                  ),
                  SizedBox(height: 20.h),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "${userprofile.userprofileModel[0].user!.createdAt}",
                        style: TextStyle(
                          fontSize: 18.sp,
                          color: const Color(0xff979797),
                          fontFamily: 'gesndbook',
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 30),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    child: ElevatedButton(
                      onPressed: () {
                        String? createdAtString = userprofile.userprofileModel[0].user!.createdAt;
                        DateTime createdAt = DateTime.parse(createdAtString!);
                        String formattedDate = "${createdAt.day}-${createdAt.month}-${createdAt.year}";

                        Get.to(() => EditProfile(
                          name:
                          userprofile.userprofileModel[0].user!.firstName ?? "${userprofile.userprofileModel[0].user!.firstName}",
                          email: userprofile
                              .userprofileModel[0].user!.email ??
                              "بريد إلكتروني",
                          image:
                          "${userprofile.userprofileModel[0].user!.avatar}",
                          phone:
                          userprofile.userprofileModel[0].user!.phone ?? "رقم الهاتف المحمول",
                          dob:
                          userprofile.userprofileModel[0].user!.birthDate ?? "تاريخ الميلاد",
                          createdat:
                          "${userprofile.userprofileModel[0].user!.createdAt}",
                        ));
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: kPrimaryColor,
                        // Google's brand color
                        minimumSize: Size(328.w, 48.h),
                        // Set the desired width and height
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(
                              10.0), // Set the desired border radius
                        ),
                        elevation:
                        0.0, // Set elevation to 0 to remove the shadow
                      ),
                      child: Center(
                        child: Text(
                          isEdit
                              ? " تاكيد التعديل"
                              : 'تعديل الملف الشخصي',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: 16.sp,
                            fontWeight: FontWeight.w600,
                            fontFamily: 'gesndbook',
                            // Adjust the font size as needed
                            color: Colors.white, // Text color
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      )),
    );
  }
}

Future<void> showOptionsDialog(BuildContext context) {
  return showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          content: SingleChildScrollView(child: Consumer<UserProfileProvider>(
            builder: (context, value, child) {
              return ListBody(
                children: [
                  GestureDetector(
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.camera,
                          size: 20.sp,
                          color: Colors.black,
                        ),
                        SizedBox(width: 10.w),
                        Text(
                          "From Camera",
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: 18.sp,
                              fontWeight: FontWeight.w600),
                        ),
                      ],
                    ),
                    onTap: () {
                      value.getFromCamera();
                      Navigator.pop(context);
                    },
                  ),
                  Padding(padding: EdgeInsets.all(10.h)),
                  GestureDetector(
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.image,
                          size: 20.sp,
                          color: Colors.black,
                        ),
                        SizedBox(width: 10.w),
                        Text(
                          "From Gallery",
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: 18.sp,
                              fontWeight: FontWeight.w600),
                        ),
                      ],
                    ),
                    onTap: () {
                      value.getFromGallery();
                      Navigator.pop(context);
                    },
                  ),
                ],
              );
            },
          )),
        );
      });
}
