import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:google_sign_in/google_sign_in.dart';
import '../local/locale_controller.dart';
import 'auth/c/auth_controller.dart';
import 'auth/sign_in_screen/v/sign_in_screen.dart';
class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final AuthController controller = Get.put(AuthController());
  LocaleController controllerLang = Get.find();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
       actions: [
         Container(
           margin: EdgeInsets.only(right: 20,top: 7),
           child: IconButton(
             onPressed: () async{
               // GoogleSignIn googleSignIn= GoogleSignIn();
               // googleSignIn.disconnect();
               // await FirebaseAuth.instance.signOut();
               // Get.snackbar("Success", "Your account logout",
               //   snackPosition: SnackPosition.BOTTOM,
               //   backgroundColor: Colors.green.withOpacity(0.1),
               //   colorText: Colors.green,);
               await FirebaseAuth.instance.signOut();
               Get.off(() =>SignINScreen());

             },
             icon:Icon(Icons.logout),),
         ),
       ],
      ),
      body: Center(child:FirebaseAuth.instance.currentUser!.emailVerified ? Text('welcom'.tr) : Text('error')),
    );
  }
}
