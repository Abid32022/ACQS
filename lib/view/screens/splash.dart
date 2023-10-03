import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';
import 'package:untitled6/utilities/colors.dart';
import 'package:untitled6/view/base/custom_text.dart';
import 'package:untitled6/view/screens/auth/signin.dart';

import '../../provider/signin_provider.dart';
import 'auth/signup.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});


  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

    @override
  void initState() {
    Timer(const Duration(seconds: 3), () {
      Get.to(()=> Signup());
       Provider.of<SignInProvider>(context, listen: false).checkUser();
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage("lib/assets/images/shrine_bg.png",),
              fit: BoxFit.cover,
            )),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(height: 200.h,),
              Container(
                // color: Colors.red,
                height: 400.h,
                child: Image.asset(
                  "lib/assets/vectors/Ansari.gif",
                  width: 236.w,
                  height: 371.h,
                  fit: BoxFit.cover,
                ),
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar:   CustomText(text:
      "\"Copyright © [2023]\nApp Implemented by Offermedia Company Ltd. All Rights Reserved.\"",
        color: kPrimaryColor,
        fontSize: 10,
        fontWeight: FontWeight.w400,
        textAlign: TextAlign.center,
      ),
    );
  }
}

// import 'dart:async';
//
// import 'package:flutter/material.dart';
// import 'package:provider/provider.dart';
//
// import '../../provider/signin_provider.dart';
// class SplashScreen extends StatefulWidget {
//   const SplashScreen({super.key});
//
//   @override
//   State<SplashScreen> createState() => _SplashScreenState();
// }
//
// class _SplashScreenState extends State<SplashScreen> {
//   @override
//   void initState() {
//     Timer(const Duration(seconds: 3), () {
//       // Provider.of<SignInProvider>(context, listen: false).checkUser();
//     });
//     super.initState();
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Colors.white,
//       body: Column(
//         // crossAxisAlignment: CrossAxisAlignment.center,
//         // mainAxisAlignment: MainAxisAlignment.center,
//         children: [
//           Expanded(child: Image.asset('lib/assets/images/shrine_bg.png')),
//           // SizedBox(height: 73.h),
//           // BigText(
//           //   text: 'میری قربانی',
//           //   color: Colors.black54,
//           //   size: 22,
//           // ),
//         ],
//       ),
//     );
//   }
// }