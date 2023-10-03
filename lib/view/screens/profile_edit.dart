import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:untitled6/provider/profile_provider.dart';
import 'package:untitled6/utilities/colors.dart';

// ignore: must_be_immutable
class EditProfile extends StatefulWidget {
  String name, email, phone, dob, image, createdat;
  EditProfile(
      {Key? key,
        required this.image,
        required this.name,
        required this.phone,
        required this.email,
        required this.dob,
        required this.createdat})
      : super(key: key);

  @override
  State<EditProfile> createState() => _EditProfileState();
}

class _EditProfileState extends State<EditProfile> {
  late TextEditingController nameController;
  late TextEditingController emailController;
  late TextEditingController dobController;
  late TextEditingController phonenoController;

  @override
  void initState() {
    super.initState();

    nameController = TextEditingController(text: widget.name ?? "");
    emailController = TextEditingController(text: widget.email ?? "");
    dobController = TextEditingController(text: widget.dob ?? "");
    phonenoController = TextEditingController(text: widget.phone ?? "");
  }

  @override
  Widget build(BuildContext context) {
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
                  GestureDetector(
                    onTap: () {
                      showOptionsDialog(context);
                    },
                    child: Stack(
                      children: [
                        CircleAvatar(
                          radius: 48.w,
                          backgroundColor: Colors.white,
                          backgroundImage: userprofile
                              .userprofileModel[0].user!.avatar !=
                              null
                              ? NetworkImage(
                              "${userprofile.userprofileModel[0].user!.avatar}")
                              : const AssetImage(
                              "lib/assets/images/bottom4_ic.png")
                          as ImageProvider<Object>,
                          child: userprofile.imageFile != null
                              ? ClipOval(
                            child: Image.file(
                              userprofile.imageFile!,
                              fit: BoxFit.cover,
                              // width: 130.w,
                              // height: 130.h,
                            ),
                          )
                              : const Center(
                            child: Text(''),
                          ),
                        ),
                        Positioned(
                          top: 50.h,
                          right: 0,
                          child: GestureDetector(
                            onTap: () {
                              showOptionsDialog(context);
                            },
                            child: Container(
                              padding: EdgeInsets.all(8.0),
                              decoration: BoxDecoration(
                                color: Colors.grey.withOpacity(0.6),
                                shape: BoxShape.circle,
                              ),
                              child: Icon(
                                Icons.edit,
                                color: Colors.black,
                                size: 20.sp,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 40.h),
                  TextFormField(
                    controller: nameController,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      hintText: widget.name,
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
                    controller: emailController,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      hintText: widget.email,
                      hintStyle: TextStyle(
                          fontFamily: 'gesndbook',
                          fontSize: 15.sp,
                          fontWeight: FontWeight.w400,
                          color: Color(0xff263238)),
                      contentPadding:
                      EdgeInsets.fromLTRB(32.w, 18.h, 0.0, 18.h),
                    ),
                    style: GoogleFonts.poppins(
                        color: const Color(0xff263238)),
                  ),
                  SizedBox(height: 20.h),
                  TextFormField(
                    controller: phonenoController,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      hintText: widget.phone,
                      hintStyle: TextStyle(
                          fontFamily: 'gesndbook',
                          fontSize: 15.sp,
                          fontWeight: FontWeight.w400,
                          color: Color(0xff263238)),
                      contentPadding:
                      EdgeInsets.fromLTRB(32.w, 18.h, 0.0, 18.h),
                    ),
                    style: GoogleFonts.poppins(
                        color: const Color(0xff263238)),
                  ),
                  SizedBox(height: 20.h),
                  TextFormField(
                    controller: dobController,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      hintText: widget.dob,
                      hintStyle: TextStyle(
                          fontFamily: 'gesndbook',
                          fontSize: 15.sp,
                          fontWeight: FontWeight.w400,
                          color: Color(0xff263238)),
                      contentPadding:
                      EdgeInsets.fromLTRB(32.w, 18.h, 0.0, 18.h),
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
                          color: Color(0xff979797),
                          fontFamily: 'gesndbook',
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 30),
                  Consumer<UserProfileProvider>(
                    builder: (context, value, child) {
                      return Padding(
                        padding:
                        const EdgeInsets.symmetric(horizontal: 10),
                        child: ElevatedButton(
                          onPressed: () {
                            value.updateUserProfile(
                                firstname: nameController.text,
                                email: emailController.text,
                                phone: phonenoController.text,
                                dob: dobController.text);
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: kPrimaryColor,
                            minimumSize: Size(328.w, 48.h),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10.0),
                            ),
                            elevation: 0.0,
                          ),
                          child: Center(
                            child: value.loading == true
                                ? CircularProgressIndicator()
                                : Text(
                              " تاكيد التعديل",
                              // 'تعديل الملف الشخصي',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                fontSize: 16.sp,
                                fontWeight: FontWeight.w600,
                                fontFamily: 'gesndbook',
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ),
                      );
                    },
                  )
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
