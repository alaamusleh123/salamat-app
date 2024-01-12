import 'dart:ui';

import 'package:get/get.dart';

class LocaleController extends GetxController{

  void changeLocale(String codeLange){
    Locale locale = Locale(codeLange);
    Get.updateLocale(locale);
  }
}