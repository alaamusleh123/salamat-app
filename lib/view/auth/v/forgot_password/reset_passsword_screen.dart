import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:salamat_app/view/auth/v/forgot_password/otp_verification_screen.dart';
import 'package:salamat_app/view/auth/v/sign_in/sign_in_screen.dart';


import '../../../../widget/app_text.dart';
import '../../../../widget/app_text_field.dart';
import '../../../../widget/my_button.dart';
import '../../c/auth_controller.dart';
class ResetPasswordScreen extends StatefulWidget {
  const ResetPasswordScreen({super.key});

  @override
  State<ResetPasswordScreen> createState() => _ResetPasswordScreenState();
}

class _ResetPasswordScreenState extends State<ResetPasswordScreen> {
  bool obsecureText= true;
  FirebaseAuth _firebaseAuth =FirebaseAuth.instance;
  final AuthController controller = Get.put(AuthController(), permanent: true);
  @override
  Widget build(BuildContext context) {
    var formKey =GlobalKey<FormState>();
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        title: AppText(text: "reset_your_password".tr,color: Color(0xFF303030),
          fontFamily: 'Bahij_TheSansArabic-Black',
          fontWeight: FontWeight.w500,size: 20,),
        centerTitle: true,
        elevation: 0,
        leading: InkWell(
            onTap: () async{
              Get.to(() =>OtpVerificationScreen());
            },
            child: Image(image: AssetImage('images/Ellipse 11.png',),
            )
        ),
      ),
        body: Stack(
          children:[
            Image.asset('images/Rectangle 6.png',width: double.infinity,height: double.infinity,fit: BoxFit.cover,),
            SingleChildScrollView(
              child: Form(
                key: formKey,
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                   // crossAxisAlignment: isEnglish ? CrossAxisAlignment.end : CrossAxisAlignment.start,
                    children: [
                      SizedBox(height: 125,),
                      AppText(text: "please_enter_new_password_redirect_you".tr,
                        color: Color(0xFF000000),
                        fontWeight: FontWeight.w500,
                        size: 13,
                        fontFamily: 'Bahij_TheSansArabic-Black',),
                      AppText(text: "to_the_login_page_after_updating_your_password".tr,
                        color: Color(0xFF000000),
                        fontWeight: FontWeight.w500,
                        size: 13,
                        fontFamily: 'Bahij_TheSansArabic-Black',),
                      SizedBox(height: 30,),
                      AppText(text: "new_password".tr,
                        color: Colors.grey,
                        fontWeight: FontWeight.w500,
                        size: 14,
                        fontFamily: 'Bahij_TheSansArabic-Black',),
                      AppTextField(
                        controller: controller.newPassword,
                        validator:  (password)
                        {
                          if(password!.isEmpty)
                          {
                            return 'This Field is required';
                          }
                        },
                        hint: "please_enter_your_new_password".tr,
                        isPasswordfield: true,
                        prefixIcon: Icons.lock,
                        color: Colors.blue,
                      ),
                      SizedBox(height: 25,),
                      AppText(text: "confirm_password".tr,
                        color: Colors.grey,
                        fontWeight: FontWeight.w500,
                        size: 14,
                        fontFamily: 'Bahij_TheSansArabic-Black',),
                      AppTextField(
                        controller: controller.confirmpPssword,
                        validator:(password)
                        {
                          if(password!.isEmpty)
                          {
                            return 'This Field is required';
                          }
                        },
                        hint: "please_confirm_your_new_password".tr,
                        isPasswordfield: true,
                        prefixIcon: Icons.lock,
                        color: Colors.grey.shade200,
                      ),
                      SizedBox(height: 30,),
                      Center(
                        child: Container(
                            width: 320,
                            height: 48,
                            child: MyButton(
                                onPressed: () async{
                                  if(formKey.currentState!.validate()){
                                    print('user successfully created');
                                    //_signIn;
                                    Get.to(SignINScreen());
                                  }else{
                                    print('some error happend');
                                    Get.snackbar("Error", "Something went wrong. Try again",
                                      snackPosition: SnackPosition.BOTTOM,
                                      backgroundColor: Colors.redAccent.withOpacity(0.1),
                                      colorText: Colors.red,
                                    );
                                  }
                                },
                                text: "update_password".tr)),
                      ),
                      SizedBox(height: 22,)
                    ],
                  ),
                ),
              ),
            ),
          ],
        )
    );
  }
}
