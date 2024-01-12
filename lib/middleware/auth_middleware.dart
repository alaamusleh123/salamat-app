// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:flutter/cupertino.dart';
// import 'package:get/get.dart';
// import 'package:salamat_app/main.dart';
// import 'package:shared_preferences/shared_preferences.dart';
//
// class AuthMiddleWare extends GetMiddleware{
//
//   @override
//   RouteSettings? redirect(String? route) {
//     final bool isLoggedIn = sharePref!.getBool('isLoggedIn') ?? false;
//     final bool isEmailVerified = sharePref!.getBool('isEmailVerified') ?? false;
//
//     if (FirebaseAuth.instance.currentUser != null && FirebaseAuth.instance.currentUser!.emailVerified
//         && isLoggedIn && isEmailVerified ){
//      return RouteSettings(name: '/home_screen');
//     } else{
//        return RouteSettings(name: '/launch_screen');
//     }
//   }
//
//   Future<void> saveCurrentStatus(String route) async {
//    // SharedPreferences prefs = await SharedPreferences.getInstance();
//     await sharePref!.setString('current_route', route);
//   }
//
//   Future<String?> getCurrentStatus() async {
//     //SharedPreferences prefs = await SharedPreferences.getInstance();
//     return sharePref!.getString('current_route');
//   }
// }