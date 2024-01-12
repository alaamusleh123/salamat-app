import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:salamat_app/controller/language_controller.dart';
import 'package:salamat_app/local/locale_controller.dart';
import 'package:salamat_app/shared_pref/shared_pref_controller.dart';
import 'package:salamat_app/view/page_view_screen.dart';
import 'package:salamat_app/view/test_screen.dart';
import 'package:salamat_app/widget/app_text.dart';
import 'package:salamat_app/widget/my_button.dart';
import 'package:shared_preferences/shared_preferences.dart';
class LanguageScreen extends StatelessWidget {
   LanguageScreen({super.key});

   LocaleController controllerLang = Get.find();
  // LanguageController languageController = Get.find();

  final List locale=[
    {'name':'English' , 'locale' : "en"},
    {'name':'العربية' , 'locale' : "ar"},
  ];

   upDateLanguage(Locale locale){
     Get.back();
     Get.updateLocale(locale);
   }

   builddaialog(BuildContext context){
     showDialog(
         context: context,
         builder: (builder){
           return AlertDialog(
             title: AppText(text: 'Change a Language', fontFamily:'Bahij_TheSansArabic-Black'),
             content: Container(
               width: double.maxFinite,
               child: ListView.separated(
                 shrinkWrap: true,
                   itemBuilder: (context, index){
                     return Padding(
                       padding: const EdgeInsets.all(8.0),
                       child: GestureDetector(
                         onTap: () async{
                           SharedPreferences prefs = await SharedPreferences.getInstance();
                           bool langDone = prefs.getBool('langDone') ?? false;
                           bool? langButtonClicked = await SharedPrefController.getLang();
                           String selectedLocale= locale[index]['locale'];
                           if(langDone){
                             await SharedPrefController.setLang(true);
                            // Get.to(()=>PageViewScreen());
                             if(selectedLocale == 'en'){
                               controllerLang.changeLocale('en');
                               _saveLanguage('en');
                               SharedPrefController.setLang(true);
                               print(locale[index]['name']);
                              Get.to(()=> PageViewScreen());
                             }else if(selectedLocale == 'ar'){
                               controllerLang.changeLocale('ar');
                               _saveLanguage('ar');
                               SharedPrefController.setLang(true);
                               print(locale[index]['name']);
                               Get.to(()=>PageViewScreen());
                             }
                             print(locale[index]['name']);
                             Get.back();
                             Get.to(PageViewScreen());
                           }

                         },
                           child: Text(locale[index]['name'])),
                     );
                   },
                   separatorBuilder: (context, index){
                     return Divider(
                       color: Colors.blue,
                     );
                   },
                   itemCount: locale.length),
             ),
           );
         });
   }
  @override
  Widget build(BuildContext context) {
    // LocaleController controllerLang = Get.find();
    return Scaffold(
      body: Center(
        child: MyButton(
          onPressed: () async{
            // bool? langDone = await SharedPrefController.getCurrentStatus();
           //  if(langDone == null || !langDone){
           //    await SharedPrefController.setCurrentStatus(true);
           //  }
            // SharedPrefController().changeLanguage(locale.toString());
             builddaialog(context);
          },
          text: 'Change Language',),
      ),
    );
  }
  void _saveLanguage(String language) async{
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString('appLanguage', language);

  }
}
