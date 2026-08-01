import 'package:flutter/material.dart';

class AppLocale {
  static const fr = Locale('fr');
  static const ar = Locale('ar');
  static const en = Locale('en');
  static const zgh = Locale('zgh');

  static const supported = [fr, ar, en, zgh];
  static const fallback = fr;
  static const materialSupported = [fr, ar, en];
}
