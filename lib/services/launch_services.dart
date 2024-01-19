// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:flutter/cupertino.dart';
// import 'package:get/get.dart';
// import 'package:salamat_app/view/auth/sign_in_screen/v/sign_in_screen.dart';
// import 'package:salamat_app/view/home_screen.dart';
// import 'package:salamat_app/view/language_screen.dart';
// import 'package:salamat_app/view/page_view_screen.dart';
// import 'package:shared_preferences/shared_preferences.dart';
//
// class LaunchServices{
//   static Future<void> chackLogin(BuildContext context) async{
//     SharedPreferences prefs = await SharedPreferences.getInstance();
//     bool isLoggedIn = prefs.getBool('isLoggedIn') ?? false;
//    // bool isEmailVerified = prefs.getBool('isEmailVerified') ?? false;
//     bool langDone= prefs.getBool('langDone') ?? false;
//     bool onBoardingDone = prefs.getBool('onBoardingDone') ?? false;
//     bool? onBoardingButtonClicked = prefs.getBool('onBoardingButtonClicked') ?? true;
//
//
//     await Future.delayed(const Duration(seconds: 3));
//
//     if(!isLoggedIn && !langDone && !onBoardingDone){
//       Get.to(()=> LanguageScreen());
//     }else if(!isLoggedIn && langDone){
//       Get.to(()=> PageViewScreen());
//     }else {
//       if(!isLoggedIn && onBoardingDone && onBoardingButtonClicked){
//         Get.to(()=> SignINScreen());
//       }else {
//         Get.to(()=> HomeScreen());
//       }
//     }
//   }
//   // @override
//   // Future<GetNavConfig?> redirectDelegate(GetNavConfig route) async {
//   //   final SharedPreferences prefs = await SharedPreferences.getInstance();
//   //   final bool isLoggedIn = prefs.getBool('isLoggedIn') ?? false;
//   //   final bool isEmailVerified = prefs.getBool('isEmailVerified') ?? false;
//   //   if (FirebaseAuth.instance.currentUser != null && FirebaseAuth.instance.currentUser!.emailVerified) {
//   //     return GetNavConfig('/newLaunch');
//   //   } else if (isLoggedIn) {
//   //     return GetNavConfig('/language');
//   //   } else { return GetNavConfig('/launch');
//   //   } }
//
//   }
//
// // if (FirebaseAuth.instance.currentUser != null && FirebaseAuth.instance.currentUser!.emailVerified
// //         && isLoggedIn && isEmailVerified ){
// //      return RouteSettings(name: '/home_screen');
// //     } else{
// //        return RouteSettings(name: '/launch_screen');
// //     }
// //   }
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:salamat_app/view/page_view_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../view/auth/v/sign_in/sign_in_screen.dart';
import '../view/home_screen.dart';
import '../view/language_screen.dart';

class LaunchServices {
  static Future<void> checkLogin(BuildContext context) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    bool isLoggedIn = prefs.getBool('isLoggedIn') ?? false;
    bool langDone = prefs.getBool('langDone') ?? false;
    bool onBoardingDone = prefs.getBool('onBoardingDone') ?? false;
    bool onBoardingButtonClicked = prefs.getBool('onBoardingButtonClicked') ?? false;

    await Future.delayed(const Duration(seconds: 3));

    if (!isLoggedIn) {
      if (!langDone) {
        Get.off(() => LanguageScreen());
      } else if (onBoardingDone && !onBoardingButtonClicked) {
        Get.off(() => SignINScreen());
      } else {
        Get.off(() => SignINScreen());
      }
    } else {
      Get.off(() => HomeScreen());
    }
  }
}