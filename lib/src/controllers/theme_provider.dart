import 'package:calculadora/src/controllers/theme.dart';
import 'package:flutter/material.dart';

final ThemeData test = darkTheme;

class ThemeProvider with ChangeNotifier{
  var _themeData = darkTheme;

  get themeData => _themeData;

  set themeData(themeData){
    _themeData = themeData;
    notifyListeners();
  }

  void toggleTheme(){
    if (_themeData == lightTheme){
      themeData = darkTheme;

    }else{
      themeData = lightTheme;
    }

  }

}