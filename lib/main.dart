import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:get/get_navigation/src/routes/get_route.dart';
import 'package:get_storage/get_storage.dart';
import 'package:salamat_app/controller/language_controller.dart';
import 'package:salamat_app/local/my_local.dart';
import 'package:salamat_app/middleware/auth_middleware.dart';
import 'package:salamat_app/shared_pref/shared_pref_controller.dart';
import 'package:salamat_app/view/auth/v/forgot_password/forget_pass_%20screen.dart';
import 'package:salamat_app/view/auth/v/forgot_password/otp_verification_screen.dart';
import 'package:salamat_app/view/auth/v/forgot_password/reset_passsword_screen.dart';
import 'package:salamat_app/view/auth/v/sign_in/sign_in_screen.dart';
import 'package:salamat_app/view/auth/v/sign_up/sign_up_screen.dart';
import 'package:salamat_app/view/home_screen.dart';
import 'package:salamat_app/view/language_screen.dart';
import 'package:salamat_app/view/launch_screen.dart';
import 'package:salamat_app/view/page_view_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'firebase_options.dart';
import 'local/locale_controller.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  //await _loadLanguage();
 // SharedPreferences prefs = await SharedPreferences.getInstance();
 // String? currentRoute = prefs.getString('current_route');
  await SharedPrefController().initpref();
  await GetStorage.init();
  //await Get.putAsync(() => StorageService().init());
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp( MyApp());
}
// Future<void> _loadLanguage() async{
//   String? savedLanguage= sharePref!.getString('appLanguage');
//   if(savedLanguage != null){
//     Get.updateLocale(Locale(savedLanguage));
//   }
// }
class MyApp extends StatelessWidget {
  String? initialRoute;

  MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    Get.put(LocaleController());
   // Get.put(LanguageController());
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
     locale:Locale('en', 'US') ,
     fallbackLocale: Locale('ar' , 'SA'),
     translations: MyLocal(),
     initialRoute: initialRoute ?? '/launch_screen',
     home: LaunchScreen(),
    //   home: FutureBuilder<bool>(
    //     future: SharedPrefController().getLoggedInStatus(),
    //     builder: (context, snapshot) {
    //       if (snapshot.connectionState == ConnectionState.waiting) {
    //         return CircularProgressIndicator();
    //       } else {
    //         return snapshot.data == true ? HomeScreen() : LaunchScreen();
    //       }
    //     },
    //   ),
     // routes: {
     //    '/launch_screen': (context) => LaunchScreen(),
     //    '/language_screen': (context) => LanguageScreen(),
     //    '/page_view_screen': (context) => PageViewScreen(),
     //    '/sign_in_screen': (context) =>SignINScreen(),
     //    '/sign_up_screen': (context) => SignUpScreen(),
     //   '/home_screen': (context) => HomeScreen(),
     //   '/forget_screen': (context) => ForgetPasswordScreen(),
     //   '/otp_verification_screen': (context) => OtpVerificationScreen(),
     //   '/reset_pass_screen': (context) => ResetPasswordScreen(),
     //
     // }

       getPages: [
        GetPage(name: '/launch_screen', page: ()=>LaunchScreen(),
            //middlewares: [AuthMiddleWare()]
        ),
         GetPage(name: '/page_view_screen', page: ()=>PageViewScreen()),
         GetPage(name: '/sign_in_screen', page: ()=>SignINScreen()),
         GetPage(name: '/sign_up_screen', page: ()=>SignUpScreen()),
         GetPage(name: '/home_screen', page: ()=>HomeScreen()),
        GetPage(name: '/forget_screen', page: ()=>ForgetPasswordScreen()),
        GetPage(name: '/otp_verification_screen', page: ()=>OtpVerificationScreen()),
        GetPage(name: '/reset_pass_screen', page: ()=>ResetPasswordScreen()),
        GetPage(name: '/language_screen', page: ()=>LanguageScreen()),
       // GetPage(name: '/new_launch_screen', page: ()=>NewLauanchScreen()),
     ],
    );


  }
}

