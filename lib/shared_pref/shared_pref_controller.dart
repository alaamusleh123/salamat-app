import 'package:flutter/cupertino.dart';
import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:get_storage/get_storage.dart';
import 'package:shared_preferences/shared_preferences.dart';
class SharedPrefController {
  // static final SharedPrefController _instance = SharedPrefController._();
  // SharedPreferences _sharedPreferences;
  //
  // factory SharedPrefController(){
  //   return _instance;
  // }
  // SharedPrefController._();

  Future<void> initpref() async {
    SharedPreferences pref = await SharedPreferences.getInstance();
  }

   static Future<void> setCurrentStatus(bool value) async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    pref.setBool('logInButtonClicked', value);
  }

  static Future<bool?> getCurrentStatus() async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    return pref.getBool('logInButtonClicked');
  }

  static Future<void> setLang(bool value) async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    pref.setBool('langButtonClicked', value);
  }

  static Future<bool?> getLang() async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    return pref.getBool('langButtonClicked');
  }

  static Future<void> setOnBoarding(bool value) async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    pref.setBool('onBoardingButtonClicked', value);
  }

  static Future<bool?> getOnBoarding() async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    return pref.getBool('onBoardingButtonClicked');
  }

  static Future<bool> getSignedInBefore() async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  return prefs.getBool('signed_in_before') ?? false;
  }

  static Future<void> setSignedInBefore(bool value) async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  prefs.setBool('signed_in_before', value);
  }

  // Future<bool> saveLanguage(String? lang) async {
  //   final box = GetStorage();
  //   await box.write('lang', lang);
  //   return true;
  // }
  //
  // String? getLang() {
  //   final box = GetStorage();
  //   return box.read('lang');
  // }

}
// class SharedPreferencesController extends GetxController {
//   RxBool signedInBefore = true.obs; // Default value assumes the user has signed in before
//
//   @override
//   void onInit() {
//     super.onInit();
//     _loadSignedInBefore();
//   }
//
//   Future<void> _loadSignedInBefore() async {
//     SharedPreferences prefs = await SharedPreferences.getInstance();
//     signedInBefore.value = prefs.getBool('signed_in_before') ?? true;
//   }
//
//   Future<void> setSignedInBefore(bool value) async {
//     SharedPreferences prefs = await SharedPreferences.getInstance();
//     await prefs.setBool('signed_in_before', value);
//     signedInBefore.value = value;
//   }
// }
