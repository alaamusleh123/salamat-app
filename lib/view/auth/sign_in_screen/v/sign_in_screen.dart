import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:salamat_app/shared_pref/shared_pref_controller.dart';
import 'package:salamat_app/widget/my_button.dart';
import 'package:shared_preferences/shared_preferences.dart';


import '../../../../local/locale_controller.dart';
import '../../../../widget/app_text.dart';
import '../../../../widget/app_text_field.dart';
import '../../../home_screen.dart';
import '../../c/auth_controller.dart';

import '../../forget_pass_ screen.dart';
import '../../sign_up_screen/v/sign_up_screen.dart';


class SignINScreen extends StatefulWidget {
   SignINScreen({Key? key}) : super(key: key);

  @override
  State<SignINScreen> createState() => _SignINScreenState();
}

class _SignINScreenState extends State<SignINScreen> {
  bool isSigningIn = false;
  bool obsecureText = true;
  final AuthController controller = Get.put(AuthController(), permanent: true);
  LocaleController controllerLang = Get.find();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        body: Stack(
          children: [
            Image.asset('images/Rectangle 6.png', width: double.infinity,
              height: double.infinity,
              fit: BoxFit.cover,),
            SingleChildScrollView(
              child: Form(
                key: controller.formkey,
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                      vertical: 10, horizontal: 20),
                  child: Column(
                    // crossAxisAlignment: isEnglish ? CrossAxisAlignment.start : CrossAxisAlignment.end,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(height: 90,),
                      Center(
                        child: Image(
                          image: AssetImage('images/p3.png',),
                          fit: BoxFit.cover,
                        ),
                      ),
                      SizedBox(height: 30,),
                      AppText(
                          text: 'email'.tr,
                          fontWeight: FontWeight.w500,
                          size: 14,
                          color: Color(0xFF303030),
                          fontFamily: 'Bahij_TheSansArabic-Black'),
                      Container(
                        height: 64,
                        child: AppTextField(
                          controller: controller.email,
                          validator: (email) {
                            if (email!.isEmpty) {
                              return 'This Field is required';
                            }
                          },
                          hint: "please_enter_your_email".tr,
                          isPasswordfield: false,
                          prefixIcon: Icons.email,
                          color: Colors.grey,
                        ),
                      ),
                      SizedBox(height: 25,),
                      AppText(
                          text: 'password'.tr,
                          fontWeight: FontWeight.w500,
                          size: 14,
                          color: Color(0xFF303030),
                          fontFamily: 'Bahij_TheSansArabic-Black'),
                      Container(
                        height: 64,
                        child: AppTextField(
                          controller: controller.password,
                          validator: (password) {
                            if (password!.isEmpty) {
                              return 'This Field is required';
                            }
                          },
                          hint: "please_enter_your_password".tr,
                          isPasswordfield: true,
                          prefixIcon: Icons.lock,
                          color: Colors.grey,
                        ),
                      ),
                      Align(
                        alignment: AlignmentDirectional.centerEnd,
                        child: TextButton(
                          onPressed: () {
                            // controller.sendPasswordResetEmail();
                            Get.to(() => ForgetPasswordScreen());
                          },
                          child: Text("forgot_password".tr, style: TextStyle(
                            decoration: TextDecoration.underline,
                            fontFamily: 'Bahij_TheSansArabic-Black',
                            fontSize: 12,
                            fontWeight: FontWeight.w500,
                            color: Color(0xFF303030),
                          ),),
                        ),
                      ),
                      SizedBox(height: 30,),
                      Center(
                        child: Container(
                            width: 320,
                            height: 48,
                            child: MyButton(
                              loading: controller.loading.value,
                                onPressed: () {
                                 if (controller.formkey.currentState!.validate()) {
                                   controller.formkey.currentState!.save();
                                  _signIn();
                                 }
                              },
                                // onPressed: () async {
                                //  // _signIn();
                                //     if (controller.formkey.currentState!.validate()) {
                                //       controller.formkey.currentState!.save();
                                //       print('user successfully created');
                                //       _signIn;
                                //       //Get.to(HomeScreen());
                                //     } else {
                                //       print('some error happend');
                                //       Get.snackbar("Error",
                                //         "Something went wrong. Try again",
                                //         snackPosition: SnackPosition.BOTTOM,
                                //         backgroundColor: Colors.redAccent
                                //             .withOpacity(0.1),
                                //         colorText: Colors.red,
                                //       );
                                //     }
                                // },
                                   // () {
                                  // setState(() {
                                  //   if (formKey.currentState!.validate()) {
                                  //     print('user successfully created');
                                  //     _signIn;
                                  //     //Get.to(HomeScreen());
                                  //   } else {
                                  //     print('some error happend');
                                  //     Get.snackbar("Error",
                                  //       "Something went wrong. Try again",
                                  //       snackPosition: SnackPosition.BOTTOM,
                                  //       backgroundColor: Colors.redAccent
                                  //           .withOpacity(0.1),
                                  //       colorText: Colors.red,
                                  //     );
                                  //   }
                                  // });

                               // },
                                text: "login".tr)),
                      ),
                      SizedBox(height: 22,),
                      Row(
                        children: [
                          Expanded(child: Container(color: Color(0xFF000000),
                              height: 1)),
                          Padding(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 5, vertical: 10),
                              child:
                              AppText(text: "or_sign_in_with".tr,
                                fontFamily: 'Bahij_TheSansArabic-Black',
                                color: Color(0xFF303030),
                                size: 14,)
                          ),
                          Expanded(child: Container(color: Color(0xFF000000),
                              height: 1)),
                        ],
                      ),
                      SizedBox(height: 10,),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          SizedBox(width: 50,),
                          InkWell(
                              onTap: () async {

                              },
                              child: Image(image: AssetImage(
                                'images/Ellipse 6.png',)
                              )
                          ),
                          SizedBox(width: 32,),
                          InkWell(
                            onTap: () async {
                              await controller.signInWithGoogle();
                            },
                            child: Image(image: AssetImage(
                              'images/Ellipse 7.png',)
                            ),
                          ),
                          SizedBox(width: 50,)
                        ],
                      ),
                      SizedBox(height: 23,),
                      Center(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            AppText(
                              text: "dont_have_account".tr,
                              fontFamily: 'Bahij_TheSansArabic-Black',
                              fontWeight: FontWeight.w500,
                              size: 14,
                              color: Color(0xFF303030),),
                            SizedBox(width: 12,),
                            GestureDetector(
                              onTap: () {
                                Get.to(() => SignUpScreen());
                              },
                              child: Text("sign_up".tr, style: TextStyle(
                                  fontFamily: 'Bahij_TheSansArabic-Black',
                                  fontSize: 14,
                                  color: Color(0xFF303030),
                                  fontWeight: FontWeight.w500,
                                  decoration: TextDecoration.underline
                              ),),
                            ),

                          ],
                        ),

                      ),
                      SizedBox(height: 10,)
                    ],
                  ),
                ),
              ),
            ),
          ],
        )
    );
  }

  void _signIn() async {
    setState(() {
      isSigningIn = true;
    });

    final email = controller.email.text;
    final password = controller.password.text;

    try {
      User? user = await controller.signInWithEmailAndPassowrd(email, password);
      setState(() {
        isSigningIn = false;
      });
      if (!controller.loading.value && user != null &&
          FirebaseAuth.instance.currentUser!.emailVerified) {
        //////////////////////////
        SharedPreferences prefs = await SharedPreferences.getInstance();
        bool isLoggedIn = prefs.getBool('isLoggedIn') ?? true;
        bool? onBoardingDone = await SharedPrefController.getCurrentStatus();
        bool? logInButtonClicked = await SharedPrefController.getCurrentStatus();

        if (isLoggedIn) {
          await SharedPrefController.setCurrentStatus(true);
          print('user successfully logged in');
          Get.snackbar("Success", "Your account has logged in",
            snackPosition: SnackPosition.BOTTOM,
            backgroundColor: Colors.green.withOpacity(0.1),
            colorText: Colors.green,
          );
          Get.to(() => HomeScreen());
        } else {
          print('Some error occure in log in');
          Get.snackbar("Error", "Something went wrong. Try again",
            snackPosition: SnackPosition.BOTTOM,
            backgroundColor: Colors.redAccent.withOpacity(0.1),
            colorText: Colors.red,
          );
        }
      } else{
      print('user not verified or loading');
      }
  }catch(e){
      print('error during sign in : $e');
      Get.snackbar("Error", "error during sign in : $e",
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.redAccent.withOpacity(0.1),
        colorText: Colors.red,
        );
      setState(() {
        isSigningIn = false;
      });
  }
}

}

