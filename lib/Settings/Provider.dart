import 'package:flutter/material.dart';

class Settingprovider extends ChangeNotifier {
  String curentlang = 'en';

  void changeLanguage(String newLang) {
    if (curentlang == newLang) {
      return;
    }
    curentlang = newLang;
    notifyListeners();
  }

  bool isenglish() {
    return curentlang == 'en';
  }
}
