import 'dart:ui';

import 'package:get/get.dart';
import 'package:get/get_state_manager/get_state_manager.dart';

class TranslationController extends GetxController {
  //save the preferences of the user
  //call this function
//supply the parameters from the preferences
  changeLanguage(lang, country) {
    var locale = Locale(lang, country);
    Get.updateLocale(locale);
  }
}
