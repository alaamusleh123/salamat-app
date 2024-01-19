import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:salamat_app/view/auth/v/sign_in/sign_in_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../local/locale_controller.dart';
import '../shared_pref/shared_pref_controller.dart';
import '../widget/app_text.dart';
import '../widget/indicator.dart';
import '../widget/my_button.dart';
import '../widget/out_boarding_contant.dart';
class PageViewScreen extends StatefulWidget {
  const PageViewScreen({Key? key}) : super(key: key);

  @override
  State<PageViewScreen> createState() => _PageViewScreenState();
}

class _PageViewScreenState extends State<PageViewScreen> {
  late PageController _pageController;
  int _currentPage=0;
  LocaleController controllerLang = Get.find();
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _pageController= PageController();
  }
  @override
  void dispose() {
    // TODO: implement dispose
    _pageController.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 24,horizontal: 29),
        child: Column(
          children: [
            SizedBox(height: 15,),
            Align(
          alignment: AlignmentDirectional.topEnd,
          child: Visibility(
            visible:  _currentPage < 2,
            child: TextButton(
                onPressed: (){
                  _pageController.animateToPage(2, duration: const Duration(seconds: 1), curve: Curves.easeInCirc,);
                },
                child: AppText(text: "skip".tr, fontFamily: 'Bahij_TheSansArabic-Black',color: const Color(0xFF9C9C9C),size: 16,fontWeight: FontWeight.w500,)),
            ),),
            Expanded(
              child: PageView(
                controller: _pageController,
                scrollDirection: Axis.horizontal,
                onPageChanged: (int page){
                  setState(() {
                    _currentPage=page;
                  });
                },
                children: [
                   OutBoardingContent(
                      imageUrl:('images/p1.png'),
                      title: "find_your_doctor".tr,
                      subTitle:"contant".tr,
                  ),
                   OutBoardingContent(
                    imageUrl:('images/p5.png'),
                    title: "find_your_doctor".tr,
                    subTitle: "contant".tr,
                  ),
                   OutBoardingContent(
                    imageUrl:('images/p6.png'),
                    title: "find_your_doctor".tr,
                    subTitle: "contant".tr,)
                ],
              ),
            ),
            Visibility(
              visible: _currentPage==2,
              maintainAnimation: true,
              maintainSize: true,
              maintainState: true,
              child:MyButton(
                // onPressed: () async{
                //   SharedPreferences prefs = await SharedPreferences.getInstance();
                //   bool onBoardingDone = prefs.getBool('onBoardingDone') ?? false;
                //  // bool? onBoardingButtonClickedDone = prefs.getBool('onBoardingButtonClickedDone') ?? false;
                //   bool? onBoardingButtonClicked = await SharedPrefController.getOnBoarding();
                //   if(onBoardingDone && !onBoardingButtonClicked!){
                //     await SharedPrefController.setOnBoarding(true);
                //   }
                //   Get.to(()=> SignINScreen());
                //   },
                onPressed: () async {
                  SharedPreferences prefs = await SharedPreferences.getInstance();
                  bool onBoardingDone = prefs.getBool('onBoardingDone') ?? false;
                 // bool? onBoardingButtonClicked = await SharedPrefController.getOnBoarding();
                  bool onBoardingButtonClicked = (await SharedPrefController.getOnBoarding()) ?? false;
                  if (onBoardingDone && !onBoardingButtonClicked) {
                    await SharedPrefController.setOnBoarding(true);
                    Get.off(() => SignINScreen());
                  }
                  Get.off(() => SignINScreen());
                },
                text: "start".tr,),
            ),
            Visibility(
              visible: _currentPage!=2,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Indicator(selected: _currentPage == 0,marginEnd: 2,),
                Indicator(selected: _currentPage == 1,marginEnd: 2,),
                Indicator(selected: _currentPage == 2,),
              ],
            ),
          ),
            SizedBox(height: 20,)
          ],
        ),
      ),
    );
  }
  // void _saveOnBoarding(String onBoarding) async{
  //   final SharedPreferences prefs = await SharedPreferences.getInstance();
  //   prefs.setString('onBoarding', onBoarding);
  // }
}


