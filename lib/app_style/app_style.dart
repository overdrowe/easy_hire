import 'package:flutter/material.dart';

class AppStyle {

  static final AppStyle _singletone = new AppStyle._internal();

  factory AppStyle(){
    return _singletone;
  }

  AppStyle._internal();

  Color mainColor = Color(0xFF0070C2);


}