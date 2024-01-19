import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import '../../../../widget/app_text.dart';
import '../../../../widget/app_text_field.dart';
import '../../c/auth_controller.dart';
import '../sign_in/sign_in_screen.dart';
class SignUpScreen extends StatefulWidget {
  const SignUpScreen({Key? key}) : super(key: key);

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  bool isSigningUp = false;

  final AuthController controller = Get.put(AuthController(),permanent: true);
  @override
  Widget build(BuildContext context) {

    var formKey =GlobalKey<FormState>();
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        iconTheme: IconThemeData(color: Colors.black),
      ),
        backgroundColor: Colors.white,
        body: SingleChildScrollView(
          child: Form(
            key: formKey,
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 50, horizontal: 20),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Align(
                    alignment: Alignment.center,
                    child: Image(
                      image: AssetImage('images/p3.png'),
                      fit: BoxFit.cover,
                    ),
                  ),
                  SizedBox(height: 10,),
                  AppText(text: 'Sign Up',
                    color: Colors.black,
                    fontWeight: FontWeight.w600,
                    fontFamily: 'Bahij_TheSansArabic-Black',),
                  SizedBox(height: 15,),
                  AppText(text: 'Welcome , Sign Up to your account',
                    color: Colors.black,
                    fontWeight: FontWeight.w400,
                    size: 20,
                    fontFamily: 'Bahij_TheSansArabic-Black',),
                  SizedBox(height: 40,),
                  AppTextField(
                    controller: controller.fullName,
                    hint: 'FullName',
                    isPasswordfield: false,
                    prefixIcon: Icons.person,
                  ),
                  SizedBox(height: 10,),
                  AppTextField(
                    controller: controller.email,
                      validator:  (email)
                      {
                        if(email!.isEmpty)
                        {
                          return 'This Field is required';
                        }else if(email == 'email-already-in-use'){
                          return 'The account already exists for that email.';
                        }
                      },
                    hint: 'Email',
          
                    isPasswordfield: false,
                    prefixIcon: Icons.email,
                  ),
                  SizedBox(height: 10,),
                  AppTextField(
                    controller: controller.password,
                    validator:(password)
                    {
                      if(password!.isEmpty)
                      {
                        return 'This Field is required';
                      }else if (password == 'weak-password') {
                        print('The password provided is too weak.');
                      }
                    },
                    hint: 'Password',
                    isPasswordfield: true,
                    prefixIcon: Icons.lock,
                  ),
                  SizedBox(height: 30,),
                  ElevatedButton(
                     onPressed:_signUp,
                    // () async{
                    //   if(formKey.currentState!.validate()){
                    //     _signUp;
                    //     print('user successfully created');
                    //     Get.to(SignINScreen());
                    //   }else{
                    //     print('some error happend');
                    //     Get.snackbar("Error", "Something went wrong. Try again",
                    //       snackPosition: SnackPosition.BOTTOM,
                    //       backgroundColor: Colors.redAccent.withOpacity(0.1),
                    //       colorText: Colors.red,
                    //     );
                    //   }
                    // },
                    child: isSigningUp ? CircularProgressIndicator(color: Colors.white,) :
                    AppText(text: 'SIGN UP', fontFamily:'Bahij_TheSansArabic-Black', size: 20, color: Colors.white,),
                    style: ElevatedButton.styleFrom(
                        minimumSize: Size(double.infinity, 50)
                    ),
                  ),
                  SizedBox(height: 10,),
                  // ElevatedButton(
                  //   onPressed: (){
                  //     controller.signInWithGoogle();
                  //   },
                  //   child:
                  //   AppText(text: 'Sign up with Google', fontFamily:'Bahij_TheSansArabic-Black', size: 20, color: Colors.white,),
                  //   style: ElevatedButton.styleFrom(
                  //       minimumSize: Size(double.infinity, 50)
                  //   ),
                  // ),
          
          
                ],
              ),
            ),
          ),
        )
    );
  }

  void _signUp() async{
    setState(() {
      isSigningUp=true;
    });
    final email = controller.email.text;
    final password = controller.password.text;
    final fullName = controller.fullName.text;
    User? user= await controller.signUpWithEmailAndPassword(email: email, password: password);
    setState(() {
      isSigningUp=false;
    });
    if(user != null){
      print('user successfully created');
      Get.snackbar("Success", "Your account hase been created.",
              snackPosition: SnackPosition.BOTTOM,
              backgroundColor: Colors.green.withOpacity(0.1),
              colorText: Colors.green,);
      Get.off(() =>SignINScreen());
    }else{
      print('some error happend');
      //FirebaseAuth.instance.currentUser!.sendEmailVerification();
      Get.snackbar("Error", "Something went wrong. Try again",
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.redAccent.withOpacity(0.1),
        colorText: Colors.red,
      );
    }
  }

}
// if(_formKey.currentState!.validate()){
// print('user successfully created');
// AuthController.instance.signUpWithEmailAndPassword(
// controller.email.text.trim(), controller.password.text.trim());
// Get.to(() =>SignINScreen());
// }else{
// print('some error happend');
// }