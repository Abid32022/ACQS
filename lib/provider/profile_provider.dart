import 'dart:convert';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:http/http.dart' as http;
import '../../../../utilities/app_constant.dart';
import '../../../../utilities/app_urls.dart';
import '../Model/profile_model.dart';
import '../view/base/custom_snackbar.dart';
import '../view/screens/Profile.dart';

class UserProfileProvider extends ChangeNotifier {
  bool _loading = false;
  bool get loading => _loading;

  Future<void> updateValue({required bool load}) async {
    _loading = load;
    notifyListeners();
  }

  //image picker
  File? imageFile;
  getFromGallery() async {
    PickedFile? pickedFile = await ImagePicker().getImage(
      source: ImageSource.gallery,
    );
    if (pickedFile != null) {
      imageFile = File(pickedFile.path);
      notifyListeners();
    }
  }

  // Get from Camera
  getFromCamera() async {
    PickedFile? pickedFile = await ImagePicker().getImage(
      source: ImageSource.camera,
    );
    if (pickedFile != null) {
      imageFile = File(pickedFile.path);
      notifyListeners();
    }
  }

  // Get profile api
  final List<UserProfileModel> _userprofileModel = [];
  List<UserProfileModel> get userprofileModel => _userprofileModel;

  Future<void> getUserProfile() async {
    try {
      final response = await http.get(
        Uri.parse(AppUrls.baseUrl + AppUrls.profile),
        headers: {'Authorization': 'Bearer ${AppConstant.getUserToken}'},
      );

      // ignore: avoid_print
      print(
          "*******Responce of prfile ***********${response.statusCode}*******");
      print("*********URL******${AppUrls.baseUrl + AppUrls.profile}*********");
      if (response.statusCode == 200) {
        userprofileModel.clear();
        userprofileModel
            .add(UserProfileModel.fromJson(jsonDecode(response.body)));

        notifyListeners();

        print(response.body.toString());
      } else {
        // ignore: avoid_print
        print("*******Responce ***********${response.statusCode}*************");
        notifyListeners();
      }
    } catch (e) {
      // ignore: avoid_print
      print("error");
      // ignore: avoid_print
      print(e.toString());
      notifyListeners();
      throw Exception('Failed to fetch posts');
    }
  }

//   update profile
  Future<void> updateUserProfile({
    required String firstname,
    required String phone,
    required String email,
    required String dob,
  }) async {
    updateValue(load: true);
    try {
      var request = http.MultipartRequest(
          'POST', Uri.parse(AppUrls.baseUrl + AppUrls.editProfile));

      request.headers['Authorization'] = 'Bearer ${AppConstant.getUserToken}';
      request.headers['Content-Type'] = 'application/json';

      print("*${firstname}****${phone}*****${email}****${dob}*****");

      request.fields.addAll({
        'first_name': firstname,
        'birth_date': dob,
        'phone': phone,
        'email': email,
      });

      if (imageFile != null) {
        request.files
            .add(await http.MultipartFile.fromPath('avatar', imageFile!.path));
      }

      var response = await request.send();

      print("****edit profiel*************${response.statusCode}*************");
      if (response.statusCode == 200) {
        updateValue(load: false);

        showCustomSnackBar("Update Successfully", isError: false);

        Get.to(() => UserProfile());
        print(await response.stream.bytesToString());
      } else {
        updateValue(load: false);

        notifyListeners();
        print('Error: ${response.reasonPhrase}');
      }
    } catch (error) {
      updateValue(load: false);
      // ignore: avoid_print
      print("this is error $error");
    }
  }
}
