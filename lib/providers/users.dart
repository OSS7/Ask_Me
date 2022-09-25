import 'package:ask_me_app/constant/constant.dart';
import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';

class Users with ChangeNotifier {
  bool isDark = false;
  bool isBlue = true;
  final _storage = GetStorage();

  setDark() async {
    isDark = !isDark;
    isDark ? primaryClr = const Color(0xff000000) : primaryClr = const Color(0xffFFFFFF);
    _storage.write('dark', isDark);
    notifyListeners();

  }

  setColor() async {
    isBlue = !isBlue;
    isBlue ? secondaryClr = const Color(0xff2e7d32) : secondaryClr = const Color(0xff283593);
    _storage.write('color', isBlue);
    notifyListeners();
  }

  Future getColors() async {
    isDark =  _storage.read('dark') ?? false;
    isBlue =  _storage.read('color') ?? false;
    isDark ? primaryClr = const Color(0xff000000) : primaryClr = const Color(0xffFFFFFF);
    isBlue ? secondaryClr = const Color(0xff2e7d32) : secondaryClr = const Color(0xff283593);
    return 'done';
  }

}
