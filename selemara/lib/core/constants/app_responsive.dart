import 'package:flutter/material.dart';

class AppResponsive {
  static final AppResponsive _instance = AppResponsive._internal();

  late double screenWidth;
  late double screenHeight;
  late double _designWidth;
  late double _designHeight;

  factory AppResponsive() => _instance;

  AppResponsive._internal();

  void init(
    BuildContext context, {
    double designWidth = 375,
    double designHeight = 812,
  }) {
    final size = MediaQuery.of(context).size;
    screenWidth = size.width;
    screenHeight = size.height;
    _designWidth = designWidth;
    _designHeight = designHeight;
  }

  double wp(double designWidthValue) =>
      (designWidthValue / _designWidth) * screenWidth;

  double hp(double designHeightValue) =>
      (designHeightValue / _designHeight) * screenHeight;

  double sp(double fontSize) => wp(fontSize);

  bool get isTablet => screenWidth >= 600;
}
