// import 'dart:convert';
//
// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:firebase_core/firebase_core.dart';
// import 'package:firebase_messaging/firebase_messaging.dart';
// import 'package:flutter/cupertino.dart';
// import 'package:flutter/foundation.dart';
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:get/get_core/src/get_main.dart';
// import 'package:google_sign_in/google_sign_in.dart';
//
// import 'package:http/http.dart' as http;
// import 'package:shared_preferences/shared_preferences.dart';
//
// import '../../AppLayer/Streaming/Overseer.dart';
// import '../mainscreen.dart';
//
//
//
// class Authentication {
//  /* static Future<FirebaseApp> initializeFirebase({required BuildContext context}) async {
//     FirebaseApp firebaseApp = await Firebase.initializeApp();
//
//     // TODO: Add auto login logic
//
//     return firebaseApp;
//   }
//   */
//
//
//   static Future<User?> signInWithGoogle({required BuildContext context}) async {
//     FirebaseAuth auth = FirebaseAuth.instance;
//     User? user;
//
//     final GoogleSignIn googleSignIn = GoogleSignIn();
//
//     final GoogleSignInAccount? googleSignInAccount =
//     await googleSignIn.signIn();
//
//     if (googleSignInAccount != null) {
//       final GoogleSignInAuthentication googleSignInAuthentication =
//       await googleSignInAccount.authentication;
//
//       final AuthCredential credential = GoogleAuthProvider.credential(
//         accessToken: googleSignInAuthentication.accessToken,
//         idToken: googleSignInAuthentication.idToken,
//       );
//
//       try {
//         final UserCredential userCredential =
//         await auth.signInWithCredential(credential);
//
//         user = userCredential.user;
//         print(".................login..google responce......................${userCredential?.user?.email}............................................");
//
//        var res=await Postlogin('Google',userCredential.user?.uid,userCredential.user?.displayName,userCredential.user?.email,);
//    } on FirebaseAuthException catch (e) {
//         if (e.code == 'account-exists-with-different-credential') {
//           ScaffoldMessenger.of(context).showSnackBar(
//             Authentication.customSnackBar(
//               content:
//               'The account already exists with a different credential.',
//             ),
//           );
//         } else if (e.code == 'invalid-credential') {
//           ScaffoldMessenger.of(context).showSnackBar(
//             Authentication.customSnackBar(
//               content:
//               'Error occurred while accessing credentials. Try again.',
//             ),
//           );
//         }
//       } catch (e) {
//         ScaffoldMessenger.of(context).showSnackBar(
//           Authentication.customSnackBar(
//             content: 'Error occurred using Google Sign-In. Try again.',
//           ),
//         );
//       }
//     }
//
//     return user;
//   }
//
//
//
//   static SnackBar customSnackBar({required String content}) {
//     return SnackBar(
//       backgroundColor: Colors.black,
//       content: Text(
//         content,
//         style: TextStyle(color: Colors.redAccent, letterSpacing: 0.5),
//       ),
//     );
//   }
//
//
//   static Future<void> signOut({required BuildContext context}) async {
//     final GoogleSignIn googleSignIn = GoogleSignIn();
//
//     try {
//       if (!kIsWeb) {
//         await googleSignIn.signOut();
//       }
//       await FirebaseAuth.instance.signOut();
//     } catch (e) {
//       ScaffoldMessenger.of(context).showSnackBar(
//         Authentication.customSnackBar(
//           content: 'Error signing out. Try again.',
//         ),
//       );
//     }
//   }
//
//
//
//
//
//  static Future<bool> Postlogin(  provider,provider_id, name, email,
//       ) async {
//     var headers = {
//       'Accept': 'application/json',};
//  var request = http.MultipartRequest('POST', Uri.parse('${Overseer.baseURL}socialLogin'));
//     request.fields.addAll({
//       'provider': provider,
//       'provider_id': provider_id,
//       'name': name,
//       'email': email,
//       //'fcm_token':Overseer.Fcm_token
//
//
//     });
//
//     request.headers.addAll(Overseer.header_app);
//
//     http.StreamedResponse response = await request.send();
//     var geer = await http.Response.fromStream(response);
//     print("==============================================================${geer.body}");
//     if (response.statusCode == 200) {
//
//       Map<String, dynamic> map = jsonDecode(geer.body);
//       List<dynamic> list = [];
//       list.add(map);
//
//
//       Overseer. Setstorage(usertoken: map['access_token'].toString(), username: map['data']['first_name'].toString(), id: map['data']['id'].toString(), email: map['data']['email'].toString());
//
//       Get.offAll(Mainscreen());
// /*
//       if(map['user']['user_info']==null)
//       {   final prefs = await SharedPreferences.getInstance();
//       prefs.setInt("profile",1);
//
//
//        }
// else{ Get.offAll(Bottom_navagitation(selectedIndex: 0,));}
// */
//
//
//       Overseer.Localstorage();
//
//       print("-map token  ${map['token'].toString()}--                  ------header_app---------------------------------------------${Overseer.header_app}");
//
//
//
//
//
//
//      return true;//AddInventoryModel.fromJson(jsonDecode(geer.body));
//
//     } else {
//
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
//
//
//
//
//
//
//
//
//
//
//
//
// }
//
//
//
//
//
//
//
//
//
//
//
//
//
