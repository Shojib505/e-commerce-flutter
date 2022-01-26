import 'package:flutter/cupertino.dart';

class ScreenSize {
  static MediaQueryData _mediaQueryData = const MediaQueryData();
  static double screenHeight = 0;
  static double screenWidth = 0;
  //static double blockSizeHorzontal = 0;
  //static double blockSizeVertical =0;

  // ignore: unused_field
  static double safeAreaHorizontal = 0;
  static double _safeAreaVertical = 0;
  //static double _safeBlockHorizontal =0;
  // static double _safeBlockVertical = 0;

  void init(BuildContext context) {
    _mediaQueryData = MediaQuery.of(context);
    screenHeight = _mediaQueryData.size.height;
    screenWidth = _mediaQueryData.size.width;
    //blockSizeHorzontal = screenWidth/100;
    // blockSizeVertical = screenHeight/100;

    double _safeBlockHorizontal =
        _mediaQueryData.padding.left + _mediaQueryData.padding.right;
    double _safeBlockVertical =
        _mediaQueryData.padding.top + _mediaQueryData.padding.bottom;

    safeAreaHorizontal = (screenHeight - _safeBlockHorizontal) / 100;
    _safeAreaVertical = (screenWidth - _safeBlockVertical) / 100;
  }
}
