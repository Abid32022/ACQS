import 'dart:convert';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:http/http.dart'as http;
import 'package:shared_preferences/shared_preferences.dart';
import 'package:untitled6/utilities/app_urls.dart';
import 'package:untitled6/view/base/custom_snackbar.dart';
import 'package:untitled6/view/screens/auth/signin.dart';
import 'package:untitled6/view/screens/home/home.dart';

import '../utilities/app_constant.dart';

class SignUpProvider extends ChangeNotifier{
  TextEditingController emailController  = TextEditingController();
  TextEditingController nameController  = TextEditingController();
  TextEditingController passwordController  = TextEditingController();
  TextEditingController confirmPasswordController  = TextEditingController();

  bool _loading = false;
  bool get loading =>_loading;


  void setLoading(bool value) {
    _loading = value;
    notifyListeners();
  }

  void clearData(){
    emailController.clear();
    confirmPasswordController.clear();
    passwordController.clear();
  }

  void signUp() async {
    setLoading(true);
    final url = AppUrls.baseUrl + AppUrls.signUp;
    try {
      final response = await http.post(
        Uri.parse(url),
        headers: {'Content-Type': 'application/json'},
        body: jsonEncode({
          'email': emailController.text,
          'password': passwordController.text,
          'name': nameController.text,
          'password_confirmation': confirmPasswordController.text,
        }),
      );
      if (response.statusCode == 200) {
        setLoading(false);
        clearData();
        showCustomSnackBar('Registration Successful', isError: false);
        Get.off(() => const Signin());
        notifyListeners();
      } else {
        var decodedResponse = jsonDecode(response.body);
        if (decodedResponse.containsKey('password')) {
          List<String> passwordMessages = List<String>.from(decodedResponse["password"]);
          String combinedMessage = passwordMessages.join(", ");
          print(combinedMessage);

          showCustomSnackBar(combinedMessage, isError: true);
        } else {
          print("Unknown error format: $decodedResponse");
          showCustomSnackBar('The email has already been taken.', isError: true);
        }

        setLoading(false);
        notifyListeners();
      }
    } catch (error) {
      setLoading(false);
      print(error.toString());
      notifyListeners();
    }
  }

  googleLogin() async {
    GoogleSignIn _googleSignIn = GoogleSignIn();
    try {
      var reslut = await _googleSignIn.signIn();
      if (reslut == null) {

        return;
      }

      final userData = await reslut.authentication;
      final credential = GoogleAuthProvider.credential(
          accessToken: userData.accessToken, idToken: userData.idToken);
      var finalResult =
      await FirebaseAuth.instance.signInWithCredential(credential);
      print('**** API DATA *****');
      // googleSignUp(
      //     google_id: reslut.id,
      //     email: reslut.email,
      //     name: reslut.displayName.toString(),
      //     fcm_token: AppConstant.fcmDeviceToken.toString());

      print("Result $reslut");
      print(reslut.displayName);
      print(reslut.id);
      print(reslut.email);
      print(reslut.photoUrl);

    } catch (error) {
      print(error);
    }
  }

  Future<void> googleSignUp({required String google_id,required String email,required String name,required String fcm_token,  }) async {
    setLoading( true);
    var headers = {
      'Accept': 'application/json',
      'Authorization': 'Bearer 479|l34XqOOEszK7aGXqLaPSCdeNAmVLPeXgdnDzuLXR'};
    try{
      http.Response response = await
      http.post(Uri.parse('${AppUrls.baseUrl}${AppUrls.socialLogin}'), headers: headers,
          body: {

            'email': "email3@gmail.com",
            'name': "name",
            'provider': "2",
            'provider_id': '8',

          });
      print('before if google Sign Up ==');
      if (response.statusCode == 200) {
        Map<String , dynamic> map = jsonDecode(response.body.toString());
        setLoading( false);
        // List<GoogleSignInModel> data = [];
        // data.add(GoogleSignInModel.fromJson(map));
        SharedPreferences prefs = await SharedPreferences.getInstance();

        // print('login token ===${AppConstant.getUserToken = (await prefs.getString(AppConstant.saveUserToken.toString()))!}');
        print('google Sign ip API response === ${response.statusCode.toString()}');
        print('google Sign ip API response === ${response.body.toString()}');

        // data.add(LogInModel.fromJson(map));
        setLoading( false);
        //TODO: Congratulation Login Successfully message
        Get.snackbar(
          "Congratulation",
          "you are Successfully Login into fitness app",
          dismissDirection: DismissDirection.horizontal,
          isDismissible: true,
          backgroundColor: Colors.brown,
          duration: Duration(seconds: 1),
        );
        print('google Sign user response ${response.body.toString()}');
        if(map["isProfile_created"] == true){
          print('null check here if');
          await prefs.setString(AppConstant.saveUserToken, map["token"].toString());
// AppConstant.getUserToken = map["token"].toString();
          String? userTokenFromPrefs = await prefs.getString(AppConstant.saveUserToken);
          AppConstant.getUserToken = userTokenFromPrefs != null ? userTokenFromPrefs : '';



          /// storing user if
          // await prefs.setString(AppConstant.saveUserId, map['user']["id"].toString());
          // AppConstant.getUserId = (await prefs.getString(AppConstant.saveUserId.toString()))!;
          Get.offAll(()=>HomeScreen());
        }
        else{
          print('null check here else');
          await prefs.setString(AppConstant.saveUserToken, map["token"].toString());
          // AppConstant.getUserToken = map["token"].toString();
          AppConstant.getUserToken = (await prefs.getString(AppConstant.saveUserToken.toString())) ?? "";

          /// storing user if
          // await prefs.setString(AppConstant.saveUserId, map['user']["id"].toString());
          // AppConstant.getUserId = (await prefs.getString(AppConstant.saveUserId.toString()))!;
          // Get.offAll(()=>Gender());
        }
      }
      else {
        setLoading( false);
        Map<String , dynamic> map = jsonDecode(response.body.toString());
        Get.snackbar(
          "Error",
          "${map['error']}",
          dismissDirection: DismissDirection.horizontal,
          isDismissible: true,
          backgroundColor: Colors.blue,
          duration: Duration(seconds: 1),
        );
        print('google Sign API else response === ${response.statusCode.toString()}');
        print(response.reasonPhrase);
      }
    }catch(error){
      setLoading(false);
      print("error ${error.toString()}");
    }

  }
}