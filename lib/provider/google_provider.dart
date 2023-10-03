// import 'dart:convert';
//
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:http/http.dart' as http;
//
// class GoogleLoginProvider extends ChangeNotifier {
//   //loader
//   bool _loading = false;
//   bool get loading => _loading;
//   Future<void> updateValue({required bool load}) async {
//     _loading = load;
//     notifyListeners();
//   }
//
// //*****************************************************************************
// //                           Google Login
// //*****************************************************************************
//   // List<GoogleLoginModel> googleloginModel = [];
//   void googleLogin() async {
//     updateValue(load: true);
//     GoogleSignIn _googleSignIn = GoogleSignIn(scopes: ['email']);
//
//     try {
//       await _googleSignIn.signIn();
//       GoogleSignInAuthentication googleAuth =
//       await _googleSignIn.currentUser!.authentication;
//
//       UserCredential userCredential =
//       await FirebaseAuth.instance.signInWithCredential(
//         GoogleAuthProvider.credential(
//           accessToken: googleAuth.accessToken,
//           idToken: googleAuth.idToken,
//         ),
//       );
//
//       // Request FCM token
//       FirebaseMessaging messaging = FirebaseMessaging.instance;
//       String? fcmToken = await messaging.getToken();
//       print('FCM Token: $fcmToken');
//
//       googleSignUp(
//         google_id: userCredential.user!.uid,
//         email: userCredential.user!.email!,
//         name: userCredential.user!.displayName!,
//         fcm_token: fcmToken ?? "",
//       );
//     } catch (error) {
//       print(error);
//     }
//   }
//
//   Future<void> googleSignUp({
//     required String google_id,
//     required String email,
//     required String name,
//     required String fcm_token,
//   }) async {
//     updateValue(load: true);
//
//     final String apiUrl = 'https://acqsqatar.uaedubaivisa.com/api/socialLogin';
//
//     try {
//       http.Response response = await http.post(
//         Uri.parse(apiUrl),
//         headers: {
//           "Content-Type": "application/json",
//         },
//         body: jsonEncode({
//           'provider_id': google_id,
//           'email': email,
//           'name': name,
//           'last_name': "",
//           'fcm_token': fcm_token,
//         }),
//       );
//
//       print(response.statusCode);
//       print(response.body);
//
//       if (response.statusCode == 200) {
//         updateValue(load: false);
//         // Get.to(() => const BottomNavigation(page: 0));
//         Get.snackbar("Hello Again!", "Great to see you!",
//             colorText: Colors.black,
//             dismissDirection: DismissDirection.horizontal,
//             isDismissible: true,
//             backgroundColor: Colors.white,
//             duration: const Duration(seconds: 4),
//             icon: Icon(Icons.check_circle_outline,
//                 size: 35, color: Colors.green));
//
//         Map<String, dynamic> map = jsonDecode(response.body.toString());
//
//         print("this is our response ${map.toString()}");
//
//         // final prefs = await SharedPreferences.getInstance();
//         // prefs.clear();
//
//         // googleloginModel.clear();
//         // print("user id ******************${map['user_data']['id']}");
//         // prefs.setString(
//         //     AppConstant.saveUserID, map['user_data']['id'].toString());
//
//         // print("Saved User ID: ${map['user_data']['id'].toString()}");
//
//         // AppConstant.userID = prefs.getString(AppConstant.saveUserID)!;
//         // print("Retrieved User ID: ${AppConstant.userID}");
//         // googleloginModel.add(GoogleLoginModel.fromJson(map));
//         // print("user id ******************${map['user_data']['id']}");
//         // prefs.setString(
//         //     AppConstant.saveUserID, map['user_data']['id'].toString());
//
//         // print("Saved User ID: ${map['user_data']['id'].toString()}");
//
//         // AppConstant.userID = prefs.getString(AppConstant.saveUserID)!;
//         // print("Retrieved User ID: ${AppConstant.userID}");
//
//         // prefs.setString(AppConstant.saveUserToken, map['access_token']);
//         // AppConstant.userToken = googleloginModel[0].accessToken!.toString();
//         // AppConstant.userToken =
//         //     prefs.getString(AppConstant.saveUserLoginToken)!;
//
//         // print("this is google login token  ${AppConstant.userToken} in here ");
//         // print(
//         //     "***************************/n********************************this is google login id  ${AppConstant.userID} in here ");
//
//         notifyListeners();
//       } else {
//         updateValue(load: false);
//         print(response.statusCode);
//         Get.snackbar("Invalid email or password!", "Please try again!",
//             colorText: Colors.red,
//             dismissDirection: DismissDirection.horizontal,
//             isDismissible: true,
//             backgroundColor: Colors.white,
//             duration: const Duration(seconds: 4),
//             icon: Icon(Icons.error, size: 35, color: Colors.red));
//         notifyListeners();
//       }
//     } catch (e) {
//       updateValue(load: false);
//       print('API exception');
//       print(e.toString());
//     }
//   }
// }