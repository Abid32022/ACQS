import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import 'package:untitled6/utilities/app_constant.dart';
import 'package:untitled6/utilities/app_urls.dart';
import 'package:untitled6/view/base/custom_snackbar.dart';
import 'package:untitled6/view/screens/auth/signin.dart';

import '../view/screens/forgetpass_otp.dart';
import '../view/screens/set_password.dart';

class ForgetPasswordProvider extends ChangeNotifier {
  final TextEditingController phoneController = TextEditingController();
  final TextEditingController pinputController = TextEditingController();

  bool _loading = false;
  bool get loading => _loading;
  Future<void> updateValue({required bool load}) async {
    _loading = load;
    notifyListeners();
  }

  Future<void> sendMobileCode({
    required String email,
  }) async {
    updateValue(load: true);
    try {
      final response = await http.post(
        Uri.parse(AppUrls.baseUrl + AppUrls.sendMobileCode),
        headers: {
          'Accept': 'application/json',
        },
        body: {'email': email},
      );
      print("$email");
      print(response.statusCode);
      print("****Body**********${response.body}****");
      if (response.statusCode == 200) {
        updateValue(load: false);
        Get.to(() => OTPScreen(email: email));
        showCustomSnackBar(
            "كلمة المرور المكونة من أربعة أرقام ترسل على ${'\n$email'}",
            isError: false);
        notifyListeners();
      } else {
        updateValue(load: false);
        print(response.statusCode);

        notifyListeners();
      }
    } catch (e) {
      updateValue(load: false);
      print(e.toString());
    }
  }
  Future<void> oTPValidation(
      {required String code, required String email}) async {
    updateValue(load: true);

    try {
      final response = await http.post(
        Uri.parse(AppUrls.baseUrl + AppUrls.verifycode),
        headers: {'Accept': 'application/json'},
        body: {'code': code, 'email': email},
      );
      print(response.body);
      print(response.statusCode);

      if (response.statusCode == 200) {
        Get.to(() => const SetPassword());
        final prefs = await SharedPreferences.getInstance();
        prefs.clear();
        updateValue(load: false);
        final Map<String, dynamic> map = json.decode(response.body);

        print("this is  response ${map.toString()}");

        prefs.setString(AppConstant.saveUserToken, map['token'].toString());
        AppConstant.getUserToken =
            prefs.getString(AppConstant.saveUserToken).toString();

        print(
            "**AppConstant.saveUserToken*******${AppConstant.getUserToken}**********");
        showCustomSnackBar('تم التحقق من OTP', isError: false);

        notifyListeners();
      } else {
        updateValue(load: false);
        showCustomSnackBar('فشل التحقق من OTP', isError: false);
        print(response.statusCode);

        notifyListeners();
      }
    } catch (e) {
      updateValue(load: false);
      print(e.toString());
    }
  }

  //**********Set Password********************* */

  Future<void> setPassword({
    required String password,
  }) async {
    updateValue(load: true);
    try {
      final response = await http.post(
        Uri.parse(AppUrls.baseUrl + AppUrls.resetPassword),
        headers: {
          'Accept': 'application/json',
        },
        body: {'token': AppConstant.getUserToken, 'password': password},
      );
      print("$password");
      print(response.statusCode);
      print("****Body**********${response.body}****");
      if (response.statusCode == 200) {
        updateValue(load: false);
        showCustomSnackBar('تم تعيين كلمة المرور بنجاح', isError: false);
        Get.to(() => const Signin());

        notifyListeners();
      } else {
        updateValue(load: false);
        print(response.statusCode);
        notifyListeners();
      }
    } catch (e) {
      updateValue(load: false);
      print(e.toString());
    }
  }
}
