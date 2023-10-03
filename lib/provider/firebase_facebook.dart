// import 'dart:convert';
//
// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
// import 'package:get/get.dart';
// import 'package:get/get_core/src/get_main.dart';
// import 'package:http/http.dart' as http;
//
// import '../../AppLayer/Streaming/Overseer.dart';
// class FacebookAuthHelper {
//   static Future<Map<String, dynamic>?> loginWithFacebook() async {
//     final LoginResult result = await FacebookAuth.instance.login();
//
//     if (result.status == LoginStatus.success) {
//       final AccessToken accessToken = result.accessToken!;
//       final userData = await FacebookAuth.instance.getUserData();
//
//
//
//       print("---FACEBOOK LOGIN FUNCTION-------------------------------${userData.values}------------------------------------------------------------------");
//
//
//      // var res=await Postlogin('Google',userData.,userCredential.user?.displayName,userCredential.user?.email,);
//
//       return userData;
//     } else {
//       return null;
//     }
//   }
//
//
//
//
//
//
//
//   static Future<bool> Postlogin(  provider,provider_id, name, email,
//       ) async {
//     var headers = {
//       'Accept': 'application/json',};
//     var request = http.MultipartRequest('POST', Uri.parse('https://www.learnunstoppable.com/tryb/api/socialLogin'));
//     request.fields.addAll({
//       'provider': provider,
//       'provider_id': provider_id,
//       'name': name,
//       'email': email
//
//     });
//
//     request.headers.addAll(Overseer.header_app);
//
//     http.StreamedResponse response = await request.send();
//
//     if (response.statusCode == 200) {
//       var geer = await http.Response.fromStream(response);
//       Map<String, dynamic> map = jsonDecode(geer.body);
//       List<dynamic> list = [];
//       list.add(map);
//       print("==============${geer.body}");
//       return true;//AddInventoryModel.fromJson(jsonDecode(geer.body));
//
//     } else {
//       //Overseer.loading=false;
//       //Overseer.errorMessage='';
//       //Overseer.errorMessage = 'ERROR';
//       Get.snackbar(
//         "Network Error",
//         "{Overseer.errorMessage}",
//         dismissDirection: DismissDirection.horizontal,
//         isDismissible: true,
//         backgroundColor: Colors.lightGreenAccent,
//         duration: Duration(seconds: 2),
//       );
//       //throw Exception('Failed to create album.');
//       return false;
//     }
//   }
//
//
//
//
//
//
// }
