import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart'as http;
import 'package:shared_preferences/shared_preferences.dart';
import 'package:untitled6/utilities/app_constant.dart';
import 'package:untitled6/utilities/app_urls.dart';
import 'package:untitled6/view/base/custom_snackbar.dart';
import 'package:untitled6/view/screens/auth/signin.dart';
import 'package:untitled6/view/screens/dashboard/dashboard.dart';
import 'package:untitled6/view/screens/home/home.dart';

class SignInProvider extends ChangeNotifier {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  SharedPreferences? sharedPreferences;


  bool _loading = false;
  bool get loading =>_loading;
  String deviceToken = '';

  void setLoading(bool value) {
    _loading = value;
    notifyListeners();
  }
  Future<void> sendPushMessage(String token) async {
    try {
      await http.post(
        Uri.parse('https://fcm.googleapis.com/fcm/send'),
        headers: <String, String>{
          'Content-Type': 'application/json',
          'Authorization': 'key=AAAAc7UzPY4:APA91bE4fXUvINkQa2VAB4qSpXI5wF8ouCMV-tzAhFLMjQ1_sYVhWHlAmM6D7oA6zb3NyIJpOgjr4f3h2ULC9QAA0WOH3mp0D1PtwKMBAchqfJBTAZsvLb-vmRhbqVDuu56B78Z5bmW7'
        },
        body: jsonEncode(
          <String, dynamic>{
            'priority': 'high',
            'data': <String, dynamic>{
              'click_action': 'FLUTTER_NOTIFICATION_CLICK',
              'status': 'done',
            },
            'notification': <String, dynamic>{
              'android_channel_id': 'channelId',
            },
            'token': token,
          },
        ),
      );
    } catch (e) {
      if (kDebugMode) {
        print(e);
        print("error push notification");
      }
    }
  }

  void login() async {
    setLoading(true);
    final url = AppUrls.baseUrl + AppUrls.login;
    print("my url is ${AppUrls.baseUrl + AppUrls.login}");
    print("my url is 2 ${emailController.text + passwordController.text}");
    try{
      final response = await http.post(
        Uri.parse(url),
        headers: {'Content-Type': 'application/json'},
        body: jsonEncode(
            {'email': emailController.text, 'password': passwordController.text}),
      );

      if (response.statusCode == 200) {
        deviceToken = '';
        setLoading(false);
        final accessToken = jsonDecode(response.body)['access_token'];
        // final userName = jsonDecode(response.body)['data']['first_name'];
        // final userEmail = jsonDecode(response.body)['data']['email'];

        sharedPreferences = await SharedPreferences.getInstance();
        await sharedPreferences!.setString(AppConstant.saveUserToken, accessToken);
        sharedPreferences = await SharedPreferences.getInstance();
        saveToken(accessToken);
        AppConstant.getUserToken= sharedPreferences!.getString(AppConstant.saveUserToken).toString();
        notifyListeners();
        emailController.clear();
        passwordController.clear();
        showCustomSnackBar("Login Successfully",isError: false);

        Get.to(()=>const DashboardScreen());
        // AppConstant.userName=userName;
        // AppConstant.userEmail=userEmail;
      } else {
        final error = jsonDecode(response.body)['message'];
        showCustomSnackBar("${error}",isError: true);
        setLoading(false);
        print(response.statusCode);
      }
    }catch(error){
      print("helelfk");
      setLoading(false);
      print(error);
    }
    notifyListeners();
  }

  Future<void> saveToken(String accessToken) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString('access_token', accessToken);
  }
  Future<void> saveUserRole(String role) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString('role', role);
  }
  Future<void> checkUser() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    if (prefs.getString('access_token') != null) {
      AppConstant.getUserToken = prefs.getString(AppConstant.saveUserToken).toString();
      notifyListeners();
      Get.offAll(() => const DashboardScreen());
    } else {
      AppConstant.getUserToken = prefs.getString(AppConstant.saveUserToken).toString();
      notifyListeners();
      Get.offAll(() => const Signin());
    }
  }
}
// void logOut() async {
//   final url = AppUrls.baseUrl + AppUrls.logOut;
//   try{
//     final response = await http.post(
//       Uri.parse(url),
//       headers: {
//         "Authorization": "Bearer ${AppConstant.getUserToken}",
//         "Content-Type": "application/json",
//       },
//     );
//     if (response.statusCode == 200) {
//       print('user token get null by logout${response.body}');
//       notifyListeners();
//       Get.offAll(()=>LoginAsScreen());
//     } else {
//       print(response.statusCode);
//     }
//   }catch(error){
//     print(error);
//   }
//   notifyListeners();
// }

// Future<String> getDeviceTokem()async{
//
//   String? token =await FirebaseMessaging.instance.getToken();
//   deviceToken =(await FirebaseMessaging.instance.getToken())!;
//   print("this is fcm token : ${token}");
//   notifyListeners();
//   return token!;
// }
// void isTokenRefresh(){
//   FirebaseMessaging.instance.onTokenRefresh.listen((event) {
//     event.toString();
//   });
// }
//}