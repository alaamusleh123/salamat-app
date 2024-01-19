import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:salamat_app/view/auth/v/forgot_password/forget_pass_%20screen.dart';
import 'package:salamat_app/view/auth/v/forgot_password/reset_passsword_screen.dart';
import 'package:salamat_app/view/auth/v/sign_up/sign_up_screen.dart';
import 'package:salamat_app/widget/code_number.dart';


import '../../../../widget/app_text.dart';
import '../../../../widget/gradient_text.dart';
import '../../../../widget/my_button.dart';
import '../../c/auth_controller.dart';
class OtpVerificationScreen extends StatefulWidget {
  const OtpVerificationScreen({super.key});

  @override
  State<OtpVerificationScreen> createState() => _OtpVerificationScreenState();
}

class _OtpVerificationScreenState extends State<OtpVerificationScreen> {
  final AuthController controller = Get.put(AuthController(), permanent: true);
  final _formKey =GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        title: AppText(text:"otp_verification".tr,color: Color(0xFF303030),
          fontFamily: 'Bahij_TheSansArabic-Black',
          fontWeight: FontWeight.w500,size: 20,),
        centerTitle: true,
        elevation: 0,
        leading: InkWell(
            onTap: () async{
              Get.to(() =>ForgetPasswordScreen());
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
                padding: const EdgeInsets.symmetric(vertical: 135, horizontal: 20),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    GestureDetector(
                      onTap: (){
                        Get.to(() =>SignUpScreen());
                      },
                      child:GradientText("get_your_code".tr,
                          style:TextStyle(
                            fontFamily: 'Bahij_TheSansArabic-Black',
                            fontSize: 18, color: Color(0xFF303030),fontWeight: FontWeight.w500,
                          ),
                          gradient: LinearGradient(
                              colors: [
                                Color(0xFF5CBA97),
                                Color(0xFF368EC8),
                              ]
                          )),
                    ),
                    SizedBox(height: 20,),
                    AppText(text: "please_enter_the_5digit_code".tr,
                      color: Color(0xFF000000),
                      fontWeight: FontWeight.w500,
                      size: 13,
                      fontFamily: 'Bahij_TheSansArabic-Black',),
                    AppText(text: "sent_to_your_registered_email".tr,
                      color: Color(0xFF000000),
                      fontWeight: FontWeight.w500,
                      size: 13,
                      fontFamily: 'Bahij_TheSansArabic-Black',),
                    SizedBox(height: 30,),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        CodeNumber(
                            textEditingController: controller.firstCodeTextController,
                            focusNode: controller.firstFocusNode,
                            //onChange: onChange
                        ),CodeNumber(
                          textEditingController: controller.secondCodeTextController,
                          focusNode: controller.secondFocusNode,
                          //onChange: onChange
                        ),
                        CodeNumber(
                          textEditingController: controller.thirdCodeTextController,
                          focusNode: controller.thirdFocusNode,
                          //onChange: onChange
                        ),
                        CodeNumber(
                          textEditingController: controller.fourthCodeTextController,
                          focusNode: controller.fourthFocusNode,
                          //onChange: onChange
                        ),
                        CodeNumber(
                          textEditingController: controller.fifthCodeTextController,
                          focusNode: controller.fifthFocusNode,
                          //onChange: onChange
                        ),

                      ],
                    ),
                    SizedBox(height: 8,),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        AppText(text: "didnt_receive_the_code".tr, fontFamily:'Bahij_TheSansArabic-Black', fontWeight: FontWeight.w500,
                          size: 16,color: Color(0xFF303030),),
                        //SizedBox(width: 12,),
                        GestureDetector(
                          onTap: (){
                            Get.to(() =>SignUpScreen());
                          },
                          child:GradientText("resend_in_60sec".tr,
                              style:TextStyle(
                                fontFamily: 'Bahij_TheSansArabic-Black',
                                fontSize: 16, color: Color(0xFF303030),fontWeight: FontWeight.w500,
                                decoration: TextDecoration.underline,
                              ),
                              gradient: LinearGradient(
                                  colors: [
                                    Color(0xFF5CBA97),
                                    Color(0xFF368EC8),
                                  ]
                              )),
                        ),
                      ],
                    ),
                    SizedBox(height: 40,),//_signIn SIGN IN
                    Container(
                        width: 320,
                        height: 48,
                        child: MyButton(onPressed: (){
                          Get.to(()=> ResetPasswordScreen());
                        }, text: "Verify".tr,)),
                    SizedBox(height: 300,)
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


