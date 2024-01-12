import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../home_screen.dart';

class AuthController extends GetxController{
  static AuthController get instance => Get.find();
  final email = TextEditingController();
  final password = TextEditingController();
  final fullName = TextEditingController();
  final newPassword = TextEditingController();
  final confirmpPssword = TextEditingController();

  final firstCodeTextController= TextEditingController() ;
  final secondCodeTextController= TextEditingController();
  final thirdCodeTextController= TextEditingController() ;
  final fourthCodeTextController= TextEditingController() ;
  final fifthCodeTextController= TextEditingController() ;

  final  firstFocusNode= FocusNode();
  final   secondFocusNode=FocusNode() ;
  final thirdFocusNode=FocusNode();
  final fourthFocusNode= FocusNode();
  final fifthFocusNode= FocusNode();

  RxBool loading = false.obs;
  void setLoading(bool value){
    loading.value = value;
  }

  FirebaseAuth _auth = FirebaseAuth.instance;

  check() async{
    User? user = _auth.currentUser;
    // if (user != null) {
    //   // User is signed in
    //  var userDoc = await _firestore.collection('users').doc(user.uid).get();
    //
    //   if (userDoc.exists) {
    //     // User has a saved email
    //     print('Welcome back, ${user.email}!');
    //   } else {
    //     // First-time user
    //     print('Welcome, new user!');
    //     // Save user's email to the database
    //     await _firestore.collection('users').doc(user.uid).set({
    //       'email': user.email,
    //     });
    //   }
    // } else {
    //   // User is not signed in
    //   print('User is not signed in.');
    // }
  }

  late GlobalKey<FormState> formkey;
  @override
  void onInit() {
    formkey = GlobalKey<FormState>();
    super.onInit();
  }

    Future<User?> signUpWithEmailAndPassword(String email , String password) async{
    try{
      UserCredential credential =await _auth.createUserWithEmailAndPassword(email: email, password: password);
      FirebaseAuth.instance.currentUser!.sendEmailVerification();
      return credential.user;
    }  catch (e){
      print('some error occured');
    }
    return null;
  }


  Future<User?> signInWithEmailAndPassowrd(String email , String password) async{
    try{
      UserCredential credential =await _auth.signInWithEmailAndPassword(email: email, password: password);
      // final SharedPreferences prefs = await SharedPreferences.getInstance();
      // prefs.setBool('isLoggedIn', true);
      if(credential.user!.emailVerified){
        print('suc =====================================');
        return credential.user;
      }else{
        Get.snackbar("Error", "Please go to your email and click on the email verification link",
          snackPosition: SnackPosition.BOTTOM,
          backgroundColor: Colors.redAccent.withOpacity(0.1),
          colorText: Colors.red,
        );}
    }catch(e){
      print('some error occured');
    }
    return null;
  }

  signInWithGoogle() async{
    final GoogleSignIn _googleSignIn = GoogleSignIn();
    try{
      final GoogleSignInAccount? googleSignInAccount = await _googleSignIn.signIn();
      if(googleSignInAccount != null){
        final GoogleSignInAuthentication googleSignInAuthentication= await googleSignInAccount.authentication;
        final AuthCredential credential= GoogleAuthProvider.credential(
            idToken: googleSignInAuthentication.idToken,
            accessToken: googleSignInAuthentication.accessToken
        );
        await _auth.signInWithCredential(credential);
        Get.offAll(() =>HomeScreen());
      }
    }catch(e){
      print('Some error occured $e');
      Get.snackbar('Error', 'Some error occured $e');
    }
  }

  sendPasswordResetEmail()async{
    if(email.text == ""){
      Get.snackbar("Error", "Please enter your email",
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.redAccent.withOpacity(0.1),
        colorText: Colors.red,
      );
    }
    try{
      await FirebaseAuth.instance.sendPasswordResetEmail(email: email.text);
      Get.snackbar("Error", "A link to reset your password has been sent to your email. Please check the link",
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.redAccent.withOpacity(0.1),
        colorText: Colors.red,
      );
    }catch(e){
      print(e);
      Get.snackbar("Error", "Please make sure you enter the correct email",
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.redAccent.withOpacity(0.1),
        colorText: Colors.red,
      );
    }
  }

  // Future<UserCredential> signInWithGoogle() async {
  //   // Trigger the authentication flow
  //   final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();
  //
  //   // Obtain the auth details from the request
  //   final GoogleSignInAuthentication? googleAuth = await googleUser?.authentication;
  //
  //   // Create a new credential
  //   final credential = GoogleAuthProvider.credential(
  //     accessToken: googleAuth?.accessToken,
  //     idToken: googleAuth?.idToken,
  //   );
  //
  //   // Once signed in, return the UserCredential
  //   return await FirebaseAuth.instance.signInWithCredential(credential);
  // }
  // Future<UserCredential> signInWithGoogle() async {
  //   await FirebaseAuth.instance.signOut().then((value) {
  //     //Logout();
  //   });
  //   final googleProvider = GoogleAuthProvider();
  //   if (kIsWeb) {
  //     return await FirebaseAuth.instance.signInWithPopup(googleProvider);
  //   } else {
  //     return await FirebaseAuth.instance.signInWithProvider(googleProvider);
  //   }
  // }

  Future<UserCredential> signInWithApple() async {
    final appleProvider = AppleAuthProvider();
    if (kIsWeb) {
      return await FirebaseAuth.instance.signInWithPopup(appleProvider);
    } else {
      return await FirebaseAuth.instance.signInWithProvider(appleProvider);
    }
  }


  // Future<UserCredential> signInWithGoogle() async {
  //   final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();
  //   final GoogleSignInAuthentication? googleAuth = await googleUser?.authentication;
  //   final credential = GoogleAuthProvider.credential(
  //     accessToken: googleAuth?.accessToken,
  //     idToken: googleAuth?.idToken,
  //   );
  //   return await FirebaseAuth.instance.signInWithCredential(credential);
  // }

  // Future<UserCredential> signInWithGoogle() async {
  //   // Trigger the authentication flow
  //   final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();
  //
  //   // Obtain the auth details from the request
  //   final GoogleSignInAuthentication? googleAuth = await googleUser?.authentication;
  //
  //   // Create a new credential
  //   final credential = GoogleAuthProvider.credential(
  //     accessToken: googleAuth?.accessToken,
  //     idToken: googleAuth?.idToken,
  //   );
  //
  //   // Once signed in, return the UserCredential
  //   return await FirebaseAuth.instance.signInWithCredential(credential);
  // }
}