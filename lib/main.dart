import 'dart:async';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';
import 'package:untitled6/provider/about_us_provider.dart';
import 'package:untitled6/provider/books_provider.dart';
import 'package:untitled6/provider/contact_us_provider.dart';
import 'package:untitled6/provider/courses_provider.dart';
import 'package:untitled6/provider/faq_provider.dart';
import 'package:untitled6/provider/forgetpasswordprovider.dart';
import 'package:untitled6/provider/policy_provider.dart';
import 'package:untitled6/provider/quiz_provider.dart';
import 'package:untitled6/provider/signin_provider.dart';
import 'package:untitled6/provider/signup_provider.dart';
import 'package:untitled6/provider/video_provider.dart';
import 'package:untitled6/utilities/colors.dart';
import 'package:untitled6/view/screens/books.dart';
import 'package:untitled6/view/screens/splash.dart';
import 'provider/profile_provider.dart';

Future main() async {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(393, 852),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (_, child) {
        return MultiProvider(
          providers: [
            ChangeNotifierProvider(create: (context) => SignInProvider()),
            ChangeNotifierProvider(create: (context) => AllBooksProvider()),
            ChangeNotifierProvider(create: (context) => SignUpProvider()),
            ChangeNotifierProvider(create: (context) => AllCoursedProvider()),
            ChangeNotifierProvider(create: (context) => AboutUsProvider()),
            ChangeNotifierProvider(create: (context) => ContactUsProvider()),
            ChangeNotifierProvider(create: (context) => PrivacyProvider()),
            ChangeNotifierProvider(create: (context) => FaqProvider()),
            ChangeNotifierProvider(create: (context) => UserProfileProvider()),
            ChangeNotifierProvider(create: (context) => QuizProvider()),
            ChangeNotifierProvider(create: (context) => DownloadProvider()),
            ChangeNotifierProvider(create: (context) => ForgetPasswordProvider()),
            ChangeNotifierProvider(create: (context) => DownloadProvider()),
            ChangeNotifierProvider(create: (context) => VideoProvider([])),
          ],
          child: GetMaterialApp(
            debugShowCheckedModeBanner: false,
            title: 'ACQS',
            theme: ThemeData(
              primarySwatch: kPrimaryColor,
              fontFamily: 'Acqs',
              textTheme: Typography.englishLike2018.apply(fontSizeFactor: 1.sp),
            ),
            home: child,
          ),
        );
      },
      child: const SplashScreen(),
    );
  }
}

