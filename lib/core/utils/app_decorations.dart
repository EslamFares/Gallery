import 'package:flutter/material.dart';

abstract class AppDecorations {
  static BoxDecoration loginPinkContainerBoxDecoration = const BoxDecoration(
      gradient: LinearGradient(
    begin: Alignment.topRight,
    end: Alignment.topLeft,
    colors: [
      Color(0xffDDCDFF),
      Color(0xffEA94D7),
    ],
  ));
  static BoxDecoration loginWhiteContainerBoxDecoration = const BoxDecoration(
      gradient: LinearGradient(
    begin: Alignment.bottomCenter,
    end: Alignment.center,
    colors: [
      Colors.white,
      Colors.white10,
      Colors.transparent,
    ],
  ));
}
