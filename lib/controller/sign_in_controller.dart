// import 'package:flutter/cupertino.dart';
// import 'package:get/get.dart';
//
// class SignInController extends GetxController{
//   final email = TextEditingController();
//   final password = TextEditingController();
//
//   void _signIn() async {
//     final email = controller.email.text;
//     final password = controller.password.text;
//     User? user = await controller.signInWithEmailAndPassowrd(email, password);
//     setState(() async {
//       if (user != null && FirebaseAuth.instance.currentUser != null &&
//           FirebaseAuth.instance.currentUser!.emailVerified) {
//         //////////////////////////
//         SharedPreferences prefs = await SharedPreferences.getInstance();
//         bool isLoggedIn = prefs.getBool('isLoggedIn') ?? false;
//         bool? onBoardingDone = await SharedPrefController.getCurrentStatus();
//         if(isLoggedIn && onBoardingDone!){
//           print('user successfully created');
//           Get.snackbar("Success", "Your account hase logged in",
//             snackPosition: SnackPosition.BOTTOM,
//             backgroundColor: Colors.green.withOpacity(0.1),
//             colorText: Colors.green,);
//           Get.to(() => HomeScreen());
//         } else {
//           print('some error happend');
//           Get.snackbar("Error", "Something went wrong. Try again",
//             snackPosition: SnackPosition.BOTTOM,
//             backgroundColor: Colors.redAccent.withOpacity(0.1),
//             colorText: Colors.red,
//           );
//         }
//       }
//     });
//   }
// }