import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:salamat_app/services/launch_services.dart';
import 'package:salamat_app/view/language_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LaunchScreen extends StatefulWidget {
  @override
  State<LaunchScreen> createState() => _LaunchScreenState();
}

class _LaunchScreenState extends State<LaunchScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    GetScreen();
   // LaunchServices.chackLogin(context);
  }
  Future<void> GetScreen() async{
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    final bool langDone = prefs.getBool('langDone') ?? false;
    await Future.delayed(const Duration(seconds: 2));
    if(!langDone){
      Get.to(()=> LanguageScreen());
      await prefs.setBool('langDone', true);
    }else{
      await LaunchServices.checkLogin(context);//flutter upgrade
    }

  }
//Future.delayed(const Duration(seconds: 3), () {
//       Navigator.pushReplacementNamed(context, '/language_screen');
//     });
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(child: Image.asset('images/p2.png'),),
    );
  }
}
