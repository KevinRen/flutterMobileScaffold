import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

ThemeData appThemeData = ThemeData(
  platform: TargetPlatform.iOS,
  highlightColor: Colors.transparent,
  splashColor: Colors.transparent,
  primaryColor: Colors.white,
  backgroundColor: Colors.white,
  textTheme: TextTheme(subhead: TextStyle(textBaseline: TextBaseline.alphabetic)),
);