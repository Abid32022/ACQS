import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:untitled6/utilities/colors.dart';

import '../../provider/forgetpasswordprovider.dart';

class SetPassword extends StatefulWidget {
  const SetPassword({super.key});

  @override
  State<SetPassword> createState() => _SetPasswordState();
}

class _SetPasswordState extends State<SetPassword> {
  bool _obscureTextPass = true;
  final TextEditingController passwordController = TextEditingController();
  final _formKeypassword = GlobalKey<FormState>();
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
                key: _formKeypassword,
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
                              'ضبط كلمة السر',
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
                              '',
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
                            controller: passwordController,
                            decoration: InputDecoration(
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10.0),
                              ),
                              labelText: 'كلمة المرور',
                              labelStyle: TextStyle(
                                  fontFamily: 'gesndbook',
                                  fontSize: 16.sp,
                                  fontWeight: FontWeight.w400,
                                  color: const Color(0xff979797)),
                              hintText: 'كلمة المرور',
                              contentPadding:
                                  EdgeInsets.fromLTRB(32.w, 18.h, 0.0, 18.h),
                              suffixIcon: GestureDetector(
                                onTap: () {
                                  setState(() {
                                    _obscureTextPass = !_obscureTextPass;
                                  });
                                },
                                child: Icon(
                                  _obscureTextPass
                                      ? Icons.visibility
                                      : Icons.visibility_off,
                                ),
                              ),
                            ),
                            style: GoogleFonts.poppins(
                                color: const Color(0xff263238)),
                            obscureText: _obscureTextPass,
                          ),
                          SizedBox(
                            height: 4.h,
                          ),
                          SizedBox(
                            height: 20.h,
                          ),
                          ElevatedButton(
                            onPressed: () {
                              if (_formKeypassword.currentState!.validate()) {
                                _formKeypassword.currentState!.save();
                                forgetpassword.setPassword(
                                  password: passwordController.text,
                                );
                              }
                              passwordController.clear();
                            },
                            style: ElevatedButton.styleFrom(
                              backgroundColor: const Color(0xFF8E1839),
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
                                        fontSize: 16.sp,
                                        color: Colors.white,
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
