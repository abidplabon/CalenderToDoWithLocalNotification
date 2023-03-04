import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class ThemeServices{
  final _box = GetStorage();      //initialize storage package
  final _key = 'isDarkMode';
  _saveThemeToBox(bool isDarkMode)=>_box.write(_key, isDarkMode);

  bool _loadThemeFromBox()=>_box.read(_key)??false;  //==output==false and it will pass below //reads what is in the getstorage and if that is true(_key="isDark") return true else false
  ThemeMode get theme=> _loadThemeFromBox()?ThemeMode.dark:ThemeMode.light;   // as false so it will get light theme from second half//Above condition true then return light theme else dark theme

  void switchTheme(){     //ontap changeable function
    Get.changeThemeMode(_loadThemeFromBox()?ThemeMode.light:ThemeMode.dark); //as return false from the _loadThemeFromBox so we are toggling here
      _saveThemeToBox(!_loadThemeFromBox()); //not true false but opposite of the above condition with "!"
  }
}