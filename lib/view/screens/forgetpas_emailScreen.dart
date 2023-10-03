import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:untitled6/provider/signin_provider.dart';
import 'package:untitled6/utilities/colors.dart';

import '../../provider/forgetpasswordprovider.dart';

class FPEmailScreen extends StatefulWidget {
  const FPEmailScreen({super.key});

  @override
  State<FPEmailScreen> createState() => _FPEmailScreenState();
}

var emailController = TextEditingController();
final forgetemailkey = GlobalKey<FormState>();

class _FPEmailScreenState extends State<FPEmailScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body:
            Consumer<SignInProvider>(builder: (context, signInProvider, child) {
          return Container(
            width: double.infinity.w,
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage("lib/assets/images/shrine_bg.png"),
                fit: BoxFit.cover,
              ),
            ),
            child: SingleChildScrollView(
              child: Form(
                key: forgetemailkey,
                child: Column(
                  children: [
                    Container(
                      height: 190.h,
                      width: double.infinity.w,
                      decoration: const BoxDecoration(
                          image: DecorationImage(
                              fit: BoxFit.cover,
                              image: AssetImage(
                                "lib/assets/images/img.png",
                              ))),
                    ),
                    Padding(
                      padding: EdgeInsets.fromLTRB(32.w, 18.h, 32.w, 10.h),
                      child: Column(
                        children: [
                          SizedBox(height: 50.h),
                          Align(
                            alignment: Alignment.centerRight,
                            child: Text(
                              "نسيت كلمة المرور",
                              style: TextStyle(
                                fontSize: 24.sp,
                                color: kPrimaryColor,
                                fontWeight: FontWeight.w400,
                                fontFamily: 'gesndbook',
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 5.h,
                          ),
                          Align(
                            alignment: Alignment.centerRight,
                            child: Text(
                              "أدخل بريدك الإلكتروني",
                              style: TextStyle(
                                fontSize: 18.sp,
                                color: Color(0xff979797),
                                fontWeight: FontWeight.w400,
                                fontFamily: 'gesndbook',
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 30.h,
                          ),
                          TextFormField(
                            controller: emailController,
                            decoration: InputDecoration(
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(
                                    10.0), // Set the desired border radius
                              ),
                              labelText: 'الايميل',
                              labelStyle: TextStyle(
                                  fontFamily: 'gesndbook',
                                  fontSize: 16.sp,
                                  fontWeight: FontWeight.w400,
                                  color: const Color(0xff979797)),
                              hintText: 'K********i.ux@gmail.com',
                              contentPadding: EdgeInsets.fromLTRB(32.w, 18.h,
                                  0.0, 18.h), // 15 units of left padding
                            ),
                            style: GoogleFonts.poppins(
                                color: const Color(0xff263238)),
                            validator: (value) {
                              RegExp regex = RegExp(
                                  r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$');

                              if (value!.isEmpty) {
                                return 'رجاءا أدخل بريدك الإلكتروني';
                              } else if (!regex.hasMatch(value)) {
                                return 'الرجاء إدخال بريد إلكتروني صحيح';
                              }
                              return null;
                            },
                          ),
                          SizedBox(
                            height: 20.h,
                          ),
                          Consumer<ForgetPasswordProvider>(
                              builder: (context, forgetpassword, child) {
                            return ElevatedButton(
                                onPressed: () {
                                  if (forgetemailkey.currentState!.validate()) {
                                    forgetemailkey.currentState!.save();

                                    forgetpassword.sendMobileCode(
                                      email: emailController.text,
                                    );
                                  }
                                  emailController.clear();
                                },
                                child: Center(
                                  child: forgetpassword.loading == true
                                      ? const CircularProgressIndicator(
                                          color: Colors.white)
                                      : Text(
                                          'التالي',
                                          style: TextStyle(
                                            fontFamily: 'gesndbook',
                                            fontWeight: FontWeight.w600,
                                            fontSize: 16
                                                .sp, // Adjust the font size as needed
                                            color: Colors.white, // Text color
                                          ),
                                        ),
                                ));
                          })
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
    );
  }
}
