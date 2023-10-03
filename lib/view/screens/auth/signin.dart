import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:untitled6/provider/signin_provider.dart';
import 'package:untitled6/utilities/colors.dart';
import 'package:untitled6/view/screens/auth/signup.dart';
import 'package:untitled6/view/screens/dashboard/dashboard.dart';
import 'package:untitled6/view/screens/forgetpas_emailScreen.dart';


class Signin extends StatefulWidget {
  const Signin({super.key});

  @override
  State<Signin> createState() => _SigninState();
}

class _SigninState extends State<Signin> {
  bool _obscureTextPass = true;
  // final TextEditingController _textControllerPass = TextEditingController();

  bool _obscureTextConfirmPass = true;
  // final TextEditingController _textControllerConfirmPass =
  // TextEditingController();

  @override
  void dispose() {
    // _textControllerPass.dispose();
    // _textControllerConfirmPass.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Consumer<SignInProvider>(builder: (context,signInProvider,child){
          return Container(
            width: double.infinity.w,
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage("lib/assets/images/shrine_bg.png"),
                fit: BoxFit.cover,
              ),
            ),
            child: SingleChildScrollView(
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
                        Align(
                          alignment: Alignment.centerRight,
                          child: Text(
                            'تسجيل الدخول',
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
                            'مرحبًا بعودتك',
                            style: TextStyle(
                              fontSize: 18.sp,
                              color: Color(0xff979797),
                              fontWeight: FontWeight.w400,
                              fontFamily: 'gesndbook',
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 5.h,
                        ),
                        TextFormField(
                          controller:signInProvider.emailController,
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
                            contentPadding: EdgeInsets.fromLTRB(32.w, 18.h, 0.0,
                                18.h), // 15 units of left padding
                          ),
                          style:
                          GoogleFonts.poppins(color: const Color(0xff263238)),
                        ),
                        SizedBox(
                          height: 16.h,
                        ),
                        TextFormField(
                          controller: signInProvider.passwordController,
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
                          style:
                          GoogleFonts.poppins(color: const Color(0xff263238)),
                          obscureText: _obscureTextPass,
                        ),
                        SizedBox(
                          height: 4.h,
                        ),
                        Align(
                          alignment: Alignment.centerRight,
                          child: GestureDetector(
                            onTap: (){
                              Get.to(()=>FPEmailScreen());
                            },
                            child: Text(
                              'هل نسيت كلمة المرور؟',
                              style: TextStyle(
                                fontSize: 18.sp,
                                color: kPrimaryColor,
                                fontWeight: FontWeight.w400,
                                fontFamily: 'gesndbook',
                              ),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 20.h,
                        ),
                        signInProvider.loading?const Center(child: CircularProgressIndicator()):ElevatedButton(
                          onPressed: () {
                            if (signInProvider.emailController.text.isEmpty) {
                              Fluttertoast.showToast(
                                  msg: "Enter Email",
                                  toastLength: Toast.LENGTH_SHORT,
                                  gravity: ToastGravity.BOTTOM,
                                  timeInSecForIosWeb: 1,
                                  backgroundColor: Colors.red,
                                  textColor: Colors.white,
                                  fontSize: 14.0.sp);
                            } else {
                              if (signInProvider.passwordController.text.isEmpty) {
                                Fluttertoast.showToast(
                                    msg: "Enter Password",
                                    toastLength: Toast.LENGTH_SHORT,
                                    gravity: ToastGravity.BOTTOM,
                                    timeInSecForIosWeb: 1,
                                    backgroundColor: Colors.red,
                                    textColor: Colors.white,
                                    fontSize: 14.0.sp);
                              } else {
                                signInProvider.login();
                              }
                            }
                            // Add your onPressed logic here
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Color(0xFF8E1839),
                            // Replace with your desired hex color code
                            minimumSize: Size(315.w, 52.h),
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
                              'تسجيل الدخول',
                              style: TextStyle(
                                fontFamily: 'gesndbook',
                                fontWeight: FontWeight.w600,
                                fontSize: 16.sp, // Adjust the font size as needed
                                color: Colors.white, // Text color
                              ),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 20.h,
                        ),
                        GestureDetector(
                          onTap: () {
                            Navigator.of(context).push(
                                MaterialPageRoute(builder: (_) => Signup()));
                          },
                          child: Text(
                            'ليس لديك حساب؟اشتراك',
                            style: TextStyle(
                                color: kPrimaryColor,
                                fontSize: 16.sp,
                                fontFamily: 'gesndbook',
                                fontWeight: FontWeight.w600),
                          ),
                        ),
                        SizedBox(
                          height: 20.h,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [

                            Expanded(child: Divider(color: Color(0xff202244),thickness: 1,),),
                            SizedBox(width: 10.w,),
                            Text(
                              'أو الاستمرار مع',
                              style: TextStyle(
                                  color: Color(0xff202244),
                                  fontSize: 16.sp,
                                  fontFamily: 'gesndbook',
                                  fontWeight: FontWeight.w400),
                            ),
                            SizedBox(width: 10.w,),
                            Expanded(child: Divider(color: Color(0xff202244),thickness: 1,),),
                          ],
                        ),
                        SizedBox(
                          height: 14.h,
                        ),
                        ElevatedButton(
                          onPressed: () {
                            // Add your Google login logic here
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Color(0xFFDA0808),
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
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Image.asset(
                                'lib/assets/images/icons_google.png',
                                // Replace with the path to your Google logo image
                                height: 22.h,
                                // Set the desired height for the logo
                                width: 22.w, // Set the desired width for the logo
                              ),
                              SizedBox(
                                width: 15.w,
                              ),
                              // Add some spacing between the logo and text
                              Text(
                                'التسجيل عن طريق جوجل',
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  fontSize: 16.sp,
                                  fontWeight: FontWeight.w400,
                                  fontFamily: 'gesndbook',
                                  // Adjust the font size as needed
                                  color: Colors.white, // Text color
                                ),
                              ),
                              SizedBox(
                                width: 15.w,
                              ),

                              Image.asset(
                                'lib/assets/images/icons_google.png',
                                // Replace with the path to your Google logo image
                                height: 22.h,
                                // Set the desired height for the logo
                                width: 22.w,
                                color: Color(0xFFDA0808),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(
                          height: 8.h,
                        ),
                        ElevatedButton(
                          onPressed: () {
                            // Add your Google login logic here
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Color(0xFF244CB2),
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
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Image.asset(
                                'lib/assets/images/bi_facebook.png',
                                // Replace with the path to your Google logo image
                                height: 22.h,
                                // Set the desired height for the logo
                                width: 22.w, // Set the desired width for the logo
                              ),
                              SizedBox(
                                width: 15.w,
                              ),
                              // Add some spacing between the logo and text
                              Text(
                                'للتسجيل عن طريق فيسبوك',
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  fontSize: 16.sp,
                                  fontWeight: FontWeight.w400,
                                  fontFamily: 'gesndbook',
                                  // Adjust the font size as needed
                                  color: Colors.white, // Text color
                                ),
                              ),
                              SizedBox(
                                width: 15.w,
                              ),

                              Image.asset(
                                'lib/assets/images/bi_facebook.png',
                                // Replace with the path to your Google logo image
                                height: 22.h,
                                // Set the desired height for the logo
                                width: 22.w,
                                color: Color(0xFF244CB2),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
          );
        }),
      ),
    );
  }
}


