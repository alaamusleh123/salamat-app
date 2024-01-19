import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:salamat_app/view/auth/v/forgot_password/otp_verification_screen.dart';
import 'package:salamat_app/view/auth/v/sign_in/sign_in_screen.dart';


import '../../../../local/locale_controller.dart';
import '../../../../widget/app_text.dart';
import '../../../../widget/app_text_field.dart';
import '../../../../widget/my_button.dart';
import '../../c/auth_controller.dart';
class ForgetPasswordScreen extends StatefulWidget {
  const ForgetPasswordScreen({Key? key}) : super(key: key);

  @override
  State<ForgetPasswordScreen> createState() => _ForgetPasswordScreenState();
}

class _ForgetPasswordScreenState extends State<ForgetPasswordScreen> {
  final AuthController controller = Get.put(AuthController(), permanent: true);
  final _formKey =GlobalKey<FormState>();
  LocaleController controllerLang = Get.find();
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        title: AppText(text: "forgotten_password".tr,color: Color(0xFF303030),
          fontFamily: 'Bahij_TheSansArabic-Black',
          fontWeight: FontWeight.w500,size: 20,),
       // centerTitle: true,
        elevation: 0,
       leading: InkWell(
           onTap: () async{
             Get.to(() => SignINScreen());
           },
           child: Image(image: AssetImage('images/Ellipse 11.png',),
           )
       ),
      ),
      body:  Stack(
        children:[
          Image.asset('images/Rectangle 6.png',width: double.infinity,height: double.infinity,fit: BoxFit.fill,),
          SingleChildScrollView(
            child: Form(
              key: _formKey,
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                child: Column(
                  //crossAxisAlignment: isEnglish ? CrossAxisAlignment.end : CrossAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height: 125,),
                    Center(
                      child: AppText(text: "please_enter_your_email_address".tr,
                        color: Color(0xFF000000),
                        fontWeight: FontWeight.w500,
                        size: 13,
                        fontFamily: 'Bahij_TheSansArabic-Black',),
                    ),
                    Center(
                      child: AppText(text: "and_we_will_send_you_an_otpcode".tr,
                        color: Color(0xFF000000),
                        fontWeight: FontWeight.w500,
                        size: 13,
                        fontFamily: 'Bahij_TheSansArabic-Black',),
                    ),
                    SizedBox(height: 15,),
                    Align(
                      alignment: Alignment.center,
                      child: Image(
                        image: AssetImage('images/message.png',),
                        fit: BoxFit.cover,
                      ),
                    ),
                    SizedBox(height: 30,),
                    AppText(text: "email".tr,
                      color: Color(0xFF303030),
                      fontWeight: FontWeight.w500,
                      size: 14,
                      fontFamily: 'Bahij_TheSansArabic-Black',),
                    AppTextField(
                      controller: controller.email,
                      hint: "please_enter_your_email".tr,
                      isPasswordfield: false,
                      prefixIcon: Icons.email,
                      color: Colors.grey,
                    ),
                    SizedBox(height: 30,),//_signIn SIGN IN
                    Center(
                      child: Container(
                          width: 320,
                          height: 48,
                          child: MyButton(onPressed: (){
                           // controller.sendPasswordResetEmail();
                            Get.to(() => OtpVerificationScreen());
                          }, text: "reset_your_password".tr,)),
                    ),
                  
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
