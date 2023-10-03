import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pinput/pinput.dart';
import 'package:provider/provider.dart';
import 'package:untitled6/utilities/colors.dart';

import '../../provider/forgetpasswordprovider.dart';

// ignore: must_be_immutable
class OTPScreen extends StatefulWidget {
  String email;
  OTPScreen({
    Key? key,
    required this.email,
  }) : super(key: key);

  @override
  State<OTPScreen> createState() => _OTPScreenState();
}

class _OTPScreenState extends State<OTPScreen> {
  final _formKeyotp = GlobalKey<FormState>();
  final _pinPutController = TextEditingController();
  final _pinPutFocusNode = FocusNode();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Consumer<ForgetPasswordProvider>(
            builder: (context, forgetpassword, child) {
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
                key: _formKeyotp,
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
                              'مكتب المدعي العام',
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
                              'أدخل الرمز المكون من أربعة أرقام هنا',
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
                          Padding(
                            padding: EdgeInsets.symmetric(horizontal: 25.w),
                            child: Pinput(
                                validator: (value) {
                                  if (value!.isEmpty) {
                                    return 'Please enter a PIN';
                                  } else if (value.length < 4) {
                                    return 'PIN must be 5 digits';
                                  }
                                  return null; // input is valid
                                },
                                focusNode: _pinPutFocusNode,
                                controller: _pinPutController,
                                length: 4,
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                crossAxisAlignment: CrossAxisAlignment.stretch,
                                defaultPinTheme: PinTheme(
                                    height: 52.h,
                                    width: 40.w,
                                    textStyle: GoogleFonts.poppins(
                                      fontSize: 20.sp,
                                      fontWeight: FontWeight.w600,
                                      color: Colors.black,
                                    ),
                                    decoration: BoxDecoration(
                                      // color: Colors.white,
                                      borderRadius: BorderRadius.circular(4.r),
                                      border: Border.all(
                                        color: const Color(0xff263238),
                                        width: 1.w,
                                        style: BorderStyle.solid,
                                      ),
                                    ))),
                          ),
                          SizedBox(
                            height: 20.h,
                          ),
                          ElevatedButton(
                            onPressed: () {
                              if (_formKeyotp.currentState!.validate()) {
                                _formKeyotp.currentState!.save();
                                forgetpassword.oTPValidation(
                                    code: _pinPutController.text,
                                    email: widget.email);
                              }

                              _pinPutController.clear();
                            },
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Color(0xFF8E1839),
                              minimumSize: Size(315.w, 52.h),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10.0),
                              ),
                              elevation: 0.0,
                            ),
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
                            ),
                          ),
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
