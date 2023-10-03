import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:untitled6/provider/signup_provider.dart';
import 'package:untitled6/utilities/colors.dart';
import 'package:untitled6/view/screens/dashboard/dashboard.dart';
import 'package:http/http.dart'as http;
import '../../../utilities/app_constant.dart';
import '../../../utilities/app_urls.dart';


class Signup extends StatefulWidget {
  const Signup({super.key});

  @override
  State<Signup> createState() => _SignupState();
}

class _SignupState extends State<Signup> {
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
        body: Container(
          width: double.infinity,
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage("lib/assets/images/shrine_bg.png"),
              fit: BoxFit.cover,
            ),
          ),
          child: SingleChildScrollView(
            child:Consumer<SignUpProvider>(builder: (context,signUp,child){
              return Column(
                children: [
                  Image.asset(
                    'lib/assets/images/img.png',
                    fit: BoxFit.cover,
                  ),

                  Padding(
                    padding: EdgeInsets.fromLTRB(32.w, 18.h, 32.w, 10.h),
                    child: Column(
                      children: [
                        Align(
                          alignment: Alignment.centerRight,
                          child: Text(
                            'انشاء حساب',
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
                            'قم بإنشاء حساب للمتابعة!',
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
                          controller: signUp.nameController,
                          decoration: InputDecoration(
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(
                                  10.0), // Set the desired border radius
                            ),
                            labelText: 'الاسم الكامل',
                            labelStyle: TextStyle(
                                fontFamily: 'gesndbook',
                                fontSize: 16.sp,
                                fontWeight: FontWeight.w400,
                                color: Color(0xff979797)),
                            hintText: 'الاسم الكامل',
                            hintStyle: TextStyle(
                                fontFamily: 'gesndbook',
                                fontSize: 15.sp,
                                fontWeight: FontWeight.w400,
                                color: Color(0xff263238)),
                            contentPadding: EdgeInsets.fromLTRB(32.w, 18.h, 0.0,
                                18.h), // 15 units of left padding
                          ),
                          style:
                          GoogleFonts.poppins(color: const Color(0xff263238)),
                        ),
                        SizedBox(
                          height: 10.h,
                        ),
                        TextFormField(
                          controller: signUp.emailController,
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
                                color: Color(0xff979797)),
                            hintText: 'K********i.ux@gmail.com',
                            hintStyle: TextStyle(
                                fontFamily: 'gesndbook',
                                fontSize: 15.sp,
                                fontWeight: FontWeight.w400,
                                color: Color(0xff263238)),
                            contentPadding: EdgeInsets.fromLTRB(32.w, 18.h, 0.0,
                                18.h), // 15 units of left padding
                          ),
                          style:
                          GoogleFonts.poppins(color: const Color(0xff263238)),
                        ),
                        SizedBox(
                          height: 10.h,
                        ),
                        TextFormField(
                          controller: signUp.passwordController,
                          decoration: InputDecoration(
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10.0),
                            ),
                            labelText: 'كلمة المرور',
                            labelStyle: TextStyle(
                                fontFamily: 'gesndbook',
                                fontSize: 16.sp,
                                fontWeight: FontWeight.w400,
                                color: Color(0xff979797)),
                            hintText: 'كلمة المرور',
                            hintStyle: TextStyle(
                                fontFamily: 'gesndbook',
                                fontSize: 15.sp,
                                fontWeight: FontWeight.w400,
                                color: Color(0xff263238)),
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
                          height: 10.h,
                        ),
                        TextFormField(
                          controller: signUp.confirmPasswordController,
                          decoration: InputDecoration(
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10.0),
                            ),
                            labelText: 'تأكيد كلمة المرور',
                            labelStyle: TextStyle(
                                fontFamily: 'gesndbook',
                                fontSize: 16.sp,
                                fontWeight: FontWeight.w400,
                                color: Color(0xff979797)),
                            hintText: 'كلمة المرور',
                            hintStyle: TextStyle(
                                fontFamily: 'gesndbook',
                                fontSize: 15.sp,
                                fontWeight: FontWeight.w400,
                                color: Color(0xff263238)),
                            contentPadding:
                            EdgeInsets.fromLTRB(32.w, 18.h, 0.0, 18.h),
                            suffixIcon: GestureDetector(
                              onTap: () {
                                setState(() {
                                  _obscureTextConfirmPass =
                                  !_obscureTextConfirmPass;
                                });
                              },
                              child: Icon(
                                _obscureTextConfirmPass
                                    ? Icons.visibility
                                    : Icons.visibility_off,
                              ),
                            ),
                          ),
                          style:
                          GoogleFonts.poppins(color: const Color(0xff263238)),
                          obscureText: _obscureTextConfirmPass,
                        ),
                        SizedBox(
                          height: 10.h,
                        ),
                        signUp.loading?const Center(child: CircularProgressIndicator()):ElevatedButton(
                          onPressed: () {
                            if (signUp.emailController.text.isEmpty) {
                              Fluttertoast.showToast(
                                  msg: "Enter Email",
                                  toastLength: Toast.LENGTH_SHORT,
                                  gravity: ToastGravity.BOTTOM,
                                  timeInSecForIosWeb: 1,
                                  backgroundColor: Colors.red,
                                  textColor: Colors.white,
                                  fontSize: 14.0.sp);
                            } else {
                              if (signUp.passwordController.text.isEmpty) {
                                Fluttertoast.showToast(
                                    msg: "Enter Password",
                                    toastLength: Toast.LENGTH_SHORT,
                                    gravity: ToastGravity.BOTTOM,
                                    timeInSecForIosWeb: 1,
                                    backgroundColor: Colors.red,
                                    textColor: Colors.white,
                                    fontSize: 14.0.sp);
                              } else {
                                if (signUp.confirmPasswordController.text.isEmpty) {
                                  Fluttertoast.showToast(
                                      msg: "Enter Password",
                                      toastLength: Toast.LENGTH_SHORT,
                                      gravity: ToastGravity.BOTTOM,
                                      timeInSecForIosWeb: 1,
                                      backgroundColor: Colors.red,
                                      textColor: Colors.white,
                                      fontSize: 14.0.sp);
                                } else{
                                  if (signUp.nameController.text.isEmpty) {
                                    Fluttertoast.showToast(
                                        msg: "Enter name",
                                        toastLength: Toast.LENGTH_SHORT,
                                        gravity: ToastGravity.BOTTOM,
                                        timeInSecForIosWeb: 1,
                                        backgroundColor: Colors.red,
                                        textColor: Colors.white,
                                        fontSize: 14.0.sp);
                                  } else{
                                    signUp.signUp();
                                  }
                                }
                              }
                            }
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: const Color(0xFF8E1839),
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
                              'انشيء حساب جديد',
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
                          height: 5.h,
                        ),
                        Text(
                          'هل لديك حساب؟ تسجيل الدخول',
                          style: TextStyle(
                              color: kPrimaryColor,
                              fontSize: 16.sp,
                              fontFamily: 'gesndbook',
                              fontWeight: FontWeight.w600),
                        ),
                        SizedBox(
                          height: 14.h,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const Expanded(
                              child: Divider(
                                color: Color(0xff202244),
                                thickness: 1,
                              ),
                            ),
                            SizedBox(
                              width: 5.w,
                            ),
                            Text(
                              'أو الاستمرار مع',
                              style: TextStyle(
                                  color: Color(0xff202244),
                                  fontSize: 16.sp,
                                  fontFamily: 'gesndbook',
                                  fontWeight: FontWeight.w400),
                            ),
                            SizedBox(
                              width: 10.w,
                            ),
                            const Expanded(
                              child: Divider(
                                color: Color(0xff202244),
                                thickness: 1,
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 5.h,
                        ),
                        ElevatedButton(
                          onPressed: () {
                            signUp.googleLogin();
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
                                'للتسجيل عن طريق جوجل',
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  fontSize: 16.sp,
                                  fontWeight: FontWeight.w600,
                                  fontFamily: 'gesndbook',
                                  // Adjust the font size as needed
                                  color: Colors.white, // Text color
                                ),
                              ),
                              SizedBox(
                                width: 5.w,
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
                                  fontWeight: FontWeight.w600,
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
              );
            }),
          ),
        ),
      ),
    );
  }

}


// class SignUpProvider extends ChangeNotifier{
//   bool loading = false;
//   // get bool loading => _loading;
//
//
//   Future<void> updateValue({required bool load})async{
//     loading = load;
//     notifyListeners();
//   }
//
//   googleLogin() async {
//     print("googleLogin method Called");
//     GoogleSignIn _googleSignIn = GoogleSignIn();
//     try {
//       var reslut = await _googleSignIn.signIn();
//       if (reslut == null) {
//
//         return;
//       }
//
//       final userData = await reslut.authentication;
//       final credential = GoogleAuthProvider.credential(
//           accessToken: userData.accessToken, idToken: userData.idToken);
//       var finalResult =
//       await FirebaseAuth.instance.signInWithCredential(credential);
//       print('**** API DATA *****');
//       googleSignUp(
//           google_id: reslut.id,
//           email: reslut.email,
//           name: reslut.displayName.toString(),
//           fcm_token: AppConstant.fcmDeviceToken.toString());
//
//       print("Result $reslut");
//       print(reslut.displayName);
//       print(reslut.id);
//       print(reslut.email);
//       print(reslut.photoUrl);
//
//     } catch (error) {
//       print(error);
//     }
//   }
//
//   void signOut() async {
//     FirebaseAuth auth = FirebaseAuth.instance;
//     try {
//       await auth.signOut();
//       // Successful sign-out
//       print("User signed out");
//     } catch (e) {
//       // Handle sign-out errors
//       print("Error signing out: $e");
//     }
//   }
//
//
//
//
//   //todo: Sign up
//   Future<void> signUp({required String firstName, required String lastName, required String email, required String password, required String registerVia, })
//   async {
//     updateValue(load: true);
//     var headers = {
//       'Authorization': 'Bearer 116|eYJ9W8wuOapE48F0QwNL8b3zbl7QPXeoyblBC6Jb',
//       'Cookie': 'XSRF-TOKEN=eyJpdiI6IkpqUlpPL2tld1VBM3pmTTAwZXQyWVE9PSIsInZhbHVlIjoiWWI5V0t5MTVod3lGK1hFYmNienFjVUZRVExoL2IvZ2RpUng1WWhvalh3dE5HOUg3aHRQQzZTU3UwbWVyMlVheUJHZGZQbHB1QVdkeXFnZEI3R3dSMTFid1ZmaEc1M3dtZVdQTU5KUDc1bVpHNjBOaEp3Y0swbkxWYjkzckM3YU4iLCJtYWMiOiI4MWFiMGQ0ODNmOWVhMzYwNjI0ZTI0YWM3NDk4ZGJmZjU4M2RlZWU2ZTk2ZGYxOGJiMjAyOGI1NGY2MzQzOGRmIiwidGFnIjoiIn0%3D; laravel_session=eyJpdiI6IjlKcDVOZE55S2dXeXhIcUorZHlwdWc9PSIsInZhbHVlIjoieW1yNEI3dmRiNGFmcExLM2Zyb3NQRVNRNFBDTS96eUxodG1TcVFxVGtvVW5aTENXU1pFaDh4VVI2eGxYaHY5bEs0Q3JWaGxmdVpxS0JlSTE0UEdiWkZCZjNDakhacVd5Ty91QmhYYldtaDErU3QxN1UvNUJoNGU1RW1sdUh3emsiLCJtYWMiOiI1MmM0ZDcyYTViNzllY2UwMTFkM2VlODhlYjdiY2MzZDdhYjMyN2QwNGZlZGYyZjNjYjNhZDY0YzA0NWI2MGRhIiwidGFnIjoiIn0%3D'
//     };
//     try{
//       http.Response response = await http.post(Uri.parse('${AppUrls.baseUrl}${AppUrls.signup}'),headers: headers, body: {
//         'first_name': firstName,
//         'last_name': lastName,
//         'email': email,
//         'password': password,
//         'register_via' : "Mobile"
//       });
//       print('before if Sign up ==');
//       if (response.statusCode == 200) {
//         Map<String , dynamic> map = jsonDecode(response.body.toString());
//         updateValue(load: false);
//         List<LogInModel> data = [];
//         data.add(LogInModel.fromJson(map));
//         SharedPreferences prefs = await SharedPreferences.getInstance();
//         print('SignUp API response if == ${response.statusCode.toString()}');
//         print("this is our response from SignUp api ${response.body}");
//         updateValue(load: false);
//         //TODO: Congratulation Sign up Successfully message
//         Get.snackbar(
//           "Congratulation",
//           "you are Successfully Registered into fitness app",
//           dismissDirection: DismissDirection.horizontal,
//           isDismissible: true,
//           backgroundColor: MyAppColors.orangcolors,
//           duration: Duration(seconds: 1),
//         );
//         Get.offAll(()=>SignInScreen());
//
//
//       }
//       else {
//         updateValue(load: false);
//         Map<String , dynamic> map = jsonDecode(response.body.toString());
//         Get.snackbar(
//           "Error",
//           "${map['error']}",
//           dismissDirection: DismissDirection.horizontal,
//           isDismissible: true,
//           backgroundColor: MyAppColors.orangcolors,
//           duration: Duration(seconds: 1),
//         );
//         print('Sign up API else response === ${response.statusCode.toString()}');
//         print(response.reasonPhrase);
//       }
//     }catch(error){
//       updateValue(load: false);
//       print("error ${error.toString()}");
//     }
//
//   }
//
//   //todo: Google Sign up
//   Future<void> googleSignUp({required String google_id,required String email,required String name,required String fcm_token,  }) async {
//     updateValue(load: true);
//     var headers = {
//       'Accept': 'application/json',
//       'Authorization': 'Bearer 479|l34XqOOEszK7aGXqLaPSCdeNAmVLPeXgdnDzuLXR'};
//     try{
//       http.Response response = await
//       http.post(Uri.parse('${AppUrls.baseUrl}${AppUrls.googleSignUp}'), headers: headers,
//           body: {
//             'google_id': google_id,
//             'email': email,
//             'name': name,
//             'last_name': "",
//             'fcm_token': fcm_token,
//
//           });
//       print('before if google Sign Up ==');
//       if (response.statusCode == 200) {
//         Map<String , dynamic> map = jsonDecode(response.body.toString());
//         updateValue(load: false);
//         List<GoogleSignInModel> data = [];
//         data.add(GoogleSignInModel.fromJson(map));
//         SharedPreferences prefs = await SharedPreferences.getInstance();
//
//         // print('login token ===${AppConstant.getUserToken = (await prefs.getString(AppConstant.saveUserToken.toString()))!}');
//         print('google Sign ip API response === ${response.statusCode.toString()}');
//         print('google Sign ip API response === ${response.body.toString()}');
//
//         // data.add(LogInModel.fromJson(map));
//         updateValue(load: false);
//         //TODO: Congratulation Login Successfully message
//         Get.snackbar(
//           "Congratulation",
//           "you are Successfully Login into fitness app",
//           dismissDirection: DismissDirection.horizontal,
//           isDismissible: true,
//           backgroundColor: MyAppColors.orangcolors,
//           duration: Duration(seconds: 1),
//         );
//         print('google Sign user response ${response.body.toString()}');
//         if(map["isProfile_created"] == true){
//           print('null check here if');
//           await prefs.setString(AppConstant.saveUserToken, map["token"].toString());
// // AppConstant.getUserToken = map["token"].toString();
//           String? userTokenFromPrefs = await prefs.getString(AppConstant.saveUserToken);
//           AppConstant.getUserToken = userTokenFromPrefs != null ? userTokenFromPrefs : '';
//
//
//
//           /// storing user if
//           await prefs.setString(AppConstant.saveUserId, map['user']["id"].toString());
//           AppConstant.getUserId = (await prefs.getString(AppConstant.saveUserId.toString()))!;
//           Get.offAll(()=>HomePage1());
//         }
//         else{
//           print('null check here else');
//           await prefs.setString(AppConstant.saveUserToken, map["token"].toString());
//           // AppConstant.getUserToken = map["token"].toString();
//           AppConstant.getUserToken = (await prefs.getString(AppConstant.saveUserToken.toString())) ?? "";
//
//           /// storing user if
//           await prefs.setString(AppConstant.saveUserId, map['user']["id"].toString());
//           AppConstant.getUserId = (await prefs.getString(AppConstant.saveUserId.toString()))!;
//           Get.offAll(()=>Gender());
//         }
//       }
//       else {
//         updateValue(load: false);
//         Map<String , dynamic> map = jsonDecode(response.body.toString());
//         Get.snackbar(
//           "Error",
//           "${map['error']}",
//           dismissDirection: DismissDirection.horizontal,
//           isDismissible: true,
//           backgroundColor: MyAppColors.orangcolors,
//           duration: Duration(seconds: 1),
//         );
//         print('google Sign API else response === ${response.statusCode.toString()}');
//         print(response.reasonPhrase);
//       }
//     }catch(error){
//       updateValue(load: false);
//       print("error ${error.toString()}");
//     }
//
//   }
//
// }