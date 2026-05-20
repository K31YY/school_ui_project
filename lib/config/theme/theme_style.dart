import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AppTheme {
  AppTheme._();

  static const MaterialColor primarySwatch =
      MaterialColor(_primarySwatchPrimaryValue, <int, Color>{
        50: Color(0xFFE7EAF4),
        100: Color(0xFFC2CAE5),
        200: Color(0xFF9AA9D3),
        300: Color(0xFF7287C1),
        400: Color(0xFF526DB5),
        500: Color(_primarySwatchPrimaryValue),
        600: Color(0xFF284CA0),
        700: Color(0xFF1E4394),
        800: Color(0xFF153988),
        900: Color(0xFF032872),
      });
  static const int _primarySwatchPrimaryValue = 0xFF2F54A9;

  static const MaterialColor secondarySwatch =
      MaterialColor(_secondarySwatchPrimaryValue, <int, Color>{
        50: Color(0xFFE4E7EE),
        100: Color(0xFFBBC2D6),
        200: Color(0xFF909BB9),
        300: Color(0xFF67759E),
        400: Color(0xFF485A8C),
        500: Color(_secondarySwatchPrimaryValue),
        600: Color(0xFF213973),
        700: Color(0xFF183068),
        800: Color(0xFF11275C),
        900: Color(0xFF061845),
      });
  static const int _secondarySwatchPrimaryValue = 0xFF273F7B;

  static ThemeData lightTheme = ThemeData(
    scaffoldBackgroundColor: AppColors.background,
    brightness: Brightness.light,
    appBarTheme: AppBarTheme(
      elevation: 0,
      centerTitle: true,
      foregroundColor: Colors.black,
      backgroundColor: Colors.white,
      titleTextStyle: AppTextStyle.bold24(
        fontFamily: 'SourceSansPro-Bold',
        color: Colors.black,
      ),
      iconTheme: IconThemeData(color: AppColors.splash, size: 2),
    ),
    primarySwatch: primarySwatch,
    fontFamily: 'SourceSansPro-Regular',
    textTheme: TextTheme(
      bodySmall: AppTextStyle.regular16(color: Colors.black),
    ),
  );

  static ThemeData darkTheme = ThemeData(
    scaffoldBackgroundColor: AppColors.darkColor,
    brightness: Brightness.dark,
    appBarTheme: AppBarTheme(
      elevation: 0,
      centerTitle: false,
      backgroundColor: AppColors.darkColor,
      titleTextStyle: AppTextStyle.bold26(
        fontFamily: 'SourceSansPro-Bold',
        color: Colors.white,
      ),
      iconTheme: const IconThemeData(color: AppTheme.primarySwatch),
    ),
    bottomNavigationBarTheme: const BottomNavigationBarThemeData(
      backgroundColor: Colors.white,
      elevation: 0,
    ),
    fontFamily: 'SourceSansPro-Regular',
    textTheme: TextTheme(
      bodySmall: AppTextStyle.regular16(color: Colors.black),
    ),
    iconTheme: const IconThemeData(size: 33, color: Colors.white),
    useMaterial3: false,
  );
}

const kCanvasColor = Color(0xffffffff);

class AppColors {
  AppColors._();

  static const background = Color(0xFFF5F7FA);
  // static const background = Color.fromARGB(255, 239, 245, 255);
  static const blur = Color(0xFFe1ecff);
  static var splash = const Color(0xFF063455);
  static var redColor = const Color.fromARGB(255, 175, 12, 0);
  static var green = Colors.green.shade800;
  static const white = Colors.white;
  static const darkColor = Color.fromRGBO(35, 52, 95, 1);
  static const darkColorLight = Color.fromRGBO(57, 77, 127, 1);
  static const darkIconColor = Color.fromRGBO(72, 113, 196, 1);
  static const greyBlue = Color(0xFF677A8A);
  static const grey = Color(0xFFCDCDCD);
  static const blackGrey = Color(0xFF323738);
}

class AppTextStyle {
  AppTextStyle._();

  static TextStyle battamBong16({Color? color}) {
    return TextStyle(
      fontWeight: FontWeight.normal,
      fontSize: 16,
      fontFamily: 'Battambang',
      color: color ?? AppColors.white,
    );
  }

  static TextStyle battamBongBold18({Color? color}) {
    return TextStyle(
      fontWeight: FontWeight.normal,
      fontSize: 18,
      fontFamily: 'Battambang-Bold',
      color: color ?? AppColors.white,
    );
  }

  static TextStyle regular10({
    Color? color,
    double? height,
    String? fontFamily,
    bool? underline,
    FontStyle? fontStyle,
  }) {
    return TextStyle(
      decoration: underline == true ? TextDecoration.underline : null,
      fontWeight: FontWeight.normal,
      fontStyle: fontStyle ?? FontStyle.normal,
      fontSize: 10,
      fontFamily:
          fontFamily ??
          (Get.locale == const Locale('en', 'US')
              ? 'SourceSansPro-Regular'
              : 'Battambang'),
      color: color ?? Colors.black,
      height: height,
    );
  }

  static TextStyle regular12({
    Color? color,
    double? height,
    String? fontFamily,
    bool? underline,
    FontStyle? fontStyle,
  }) {
    return TextStyle(
      decoration: underline == true ? TextDecoration.underline : null,
      fontWeight: FontWeight.normal,
      fontStyle: fontStyle ?? FontStyle.normal,
      fontSize: 12,
      fontFamily:
          fontFamily ??
          (Get.locale == const Locale('en', 'US')
              ? 'SourceSansPro-Regular'
              : 'Battambang'),
      color: color ?? Colors.black,
      height: height,
    );
  }

  static TextStyle regular14({
    Color? color,
    double? height,
    String? fontFamily,
    bool? underline,
    FontStyle? fontStyle,
  }) {
    return TextStyle(
      decoration: underline == true ? TextDecoration.underline : null,
      fontWeight: FontWeight.normal,
      fontStyle: fontStyle ?? FontStyle.normal,
      fontSize: 14,
      fontFamily:
          fontFamily ??
          (Get.locale == const Locale('en', 'US')
              ? 'SourceSansPro-Regular'
              : 'Battambang'),
      color: color ?? Colors.black,
      height: height,
    );
  }

  static TextStyle regular15({
    Color? color,
    double? height,
    String? fontFamily,
    bool? underline,
    FontStyle? fontStyle,
  }) {
    return TextStyle(
      decoration: underline == true ? TextDecoration.underline : null,
      fontWeight: FontWeight.normal,
      fontStyle: fontStyle ?? FontStyle.normal,
      fontSize: 15,
      fontFamily:
          fontFamily ??
          (Get.locale == const Locale('en', 'US')
              ? 'SourceSansPro-Regular'
              : 'Battambang'),
      color: color ?? Colors.black,
      height: height,
    );
  }

  static TextStyle regular16({
    Color? color,
    double? height,
    String? fontFamily,
    bool? underline,
    FontStyle? fontStyle,
  }) {
    return TextStyle(
      decoration: underline == true ? TextDecoration.underline : null,
      fontWeight: FontWeight.normal,
      fontStyle: fontStyle ?? FontStyle.normal,
      fontSize: 16,
      fontFamily:
          fontFamily ??
          (Get.locale == const Locale('en', 'US')
              ? 'SourceSansPro-Regular'
              : 'Battambang'),
      color: color ?? Colors.black,
      height: height,
    );
  }

  static TextStyle regular18({
    Color? color,
    double? height,
    String? fontFamily,
    bool? underline,
    FontStyle? fontStyle,
  }) {
    return TextStyle(
      decoration: underline == true ? TextDecoration.underline : null,
      fontWeight: FontWeight.normal,
      fontStyle: fontStyle ?? FontStyle.normal,
      fontSize: 18,
      fontFamily:
          fontFamily ??
          (Get.locale == const Locale('en', 'US')
              ? 'SourceSansPro-Regular'
              : 'Battambang'),
      color: color ?? Colors.black,
      height: height,
    );
  }

  static TextStyle medium14({
    Color? color,
    double? height,
    String? fontFamily,
    bool? underline,
    FontStyle? fontStyle,
  }) {
    return TextStyle(
      decoration: underline == true ? TextDecoration.underline : null,
      fontWeight: FontWeight.w500,
      fontStyle: fontStyle ?? FontStyle.normal,
      fontSize: 14,
      fontFamily:
          fontFamily ??
          (Get.locale == const Locale('en', 'US')
              ? 'SourceSansPro-Regular'
              : 'Battambang'),
      color: color ?? Colors.black,
      height: height,
    );
  }

  static TextStyle bold14({
    Color? color,
    double? height,
    String? fontFamily,
    bool? underline,
    FontStyle? fontStyle,
  }) {
    return TextStyle(
      decoration: underline == true ? TextDecoration.underline : null,
      fontWeight: FontWeight.bold,
      fontStyle: fontStyle ?? FontStyle.normal,
      fontSize: 14,
      fontFamily:
          fontFamily ??
          (Get.locale == const Locale('en', 'US')
              ? 'SourceSansPro-Bold'
              : 'Battambang-Bold'),
      color: color ?? Colors.black,
      height: height,
    );
  }

  static TextStyle bold22({
    Color? color,
    double? height,
    String? fontFamily,
    bool? underline,
    FontStyle? fontStyle,
  }) {
    return TextStyle(
      decoration: underline == true ? TextDecoration.underline : null,
      fontWeight: FontWeight.bold,
      fontStyle: fontStyle ?? FontStyle.normal,
      fontSize: 22,
      fontFamily:
          fontFamily ??
          (Get.locale == const Locale('en', 'US')
              ? 'SourceSansPro-Bold'
              : 'Battambang-Bold'),
      color: color ?? Colors.black,
      height: height,
    );
  }

  static TextStyle bold24({
    Color? color,
    double? height,
    String? fontFamily,
    bool? underline,
    FontStyle? fontStyle,
  }) {
    return TextStyle(
      decoration: underline == true ? TextDecoration.underline : null,
      fontWeight: FontWeight.bold,
      fontStyle: fontStyle ?? FontStyle.normal,
      fontSize: 24,
      fontFamily:
          fontFamily ??
          (Get.locale == const Locale('en', 'US')
              ? 'SourceSansPro-Bold'
              : 'Battambang-Bold'),
      color: color ?? Colors.black,
      height: height,
    );
  }

  static TextStyle bold16({
    Color? color,
    double? height,
    String? fontFamily,
    bool? underline,
    FontStyle? fontStyle,
  }) {
    return TextStyle(
      decoration: underline == true ? TextDecoration.underline : null,
      fontWeight: FontWeight.bold,
      fontStyle: fontStyle ?? FontStyle.normal,
      fontSize: 16,
      fontFamily:
          fontFamily ??
          (Get.locale == const Locale('en', 'US')
              ? 'SourceSansPro-Bold'
              : 'Battambang-Bold'),
      color: color ?? Colors.black,
      height: height,
    );
  }

  static TextStyle bold17({
    Color? color,
    double? height,
    String? fontFamily,
    bool? underline,
    FontStyle? fontStyle,
  }) {
    return TextStyle(
      decoration: underline == true ? TextDecoration.underline : null,
      fontWeight: FontWeight.bold,
      fontStyle: fontStyle ?? FontStyle.normal,
      fontSize: 16,
      fontFamily:
          fontFamily ??
          (Get.locale == const Locale('en', 'US')
              ? 'SourceSansPro-Bold'
              : 'Battambang-Bold'),
      color: color ?? Colors.black,
      height: height,
    );
  }

  static TextStyle bold18({
    Color? color,
    double? height,
    String? fontFamily,
    bool? underline,
    FontStyle? fontStyle,
  }) {
    return TextStyle(
      decoration: underline == true ? TextDecoration.underline : null,
      fontWeight: FontWeight.bold,
      fontStyle: fontStyle ?? FontStyle.normal,
      fontSize: 18,
      fontFamily:
          fontFamily ??
          (Get.locale == const Locale('en', 'US')
              ? 'SourceSansPro-Bold'
              : 'Battambang-Bold'),
      color: color ?? Colors.black,
      height: height,
    );
  }

  static TextStyle bold20({
    Color? color,
    double? height,
    String? fontFamily,
    bool? underline,
    FontStyle? fontStyle,
  }) {
    return TextStyle(
      decoration: underline == true ? TextDecoration.underline : null,
      fontWeight: FontWeight.bold,
      fontStyle: fontStyle ?? FontStyle.normal,
      fontSize: 20,
      fontFamily:
          fontFamily ??
          (Get.locale == const Locale('en', 'US')
              ? 'SourceSansPro-Bold'
              : 'Battambang-Bold'),
      color: color ?? Colors.black,
      height: height,
    );
  }

  static TextStyle bold26({
    Color? color,
    double? height,
    String? fontFamily,
    bool? underline,
    FontStyle? fontStyle,
  }) {
    return TextStyle(
      decoration: underline == true ? TextDecoration.underline : null,
      fontWeight: FontWeight.bold,
      fontStyle: fontStyle ?? FontStyle.normal,
      fontSize: 26,
      fontFamily:
          fontFamily ??
          (Get.locale == const Locale('en', 'US')
              ? 'SourceSansPro-Bold'
              : 'Battambang-Bold'),
      color: color ?? Colors.black,
      height: height,
    );
  }

  static TextStyle bold28({
    Color? color,
    double? height,
    String? fontFamily,
    bool? underline,
    FontStyle? fontStyle,
  }) {
    return TextStyle(
      decoration: underline == true ? TextDecoration.underline : null,
      fontWeight: FontWeight.bold,
      fontStyle: fontStyle ?? FontStyle.normal,
      fontSize: 28,
      fontFamily:
          fontFamily ??
          (Get.locale == const Locale('en', 'US')
              ? 'SourceSansPro-Bold'
              : 'Battambang-Bold'),
      color: color ?? Colors.black,
      height: height,
    );
  }

  static TextStyle bold30({
    Color? color,
    double? height,
    String? fontFamily,
    bool? underline,
    FontStyle? fontStyle,
  }) {
    return TextStyle(
      decoration: underline == true ? TextDecoration.underline : null,
      fontWeight: FontWeight.bold,
      fontStyle: fontStyle ?? FontStyle.normal,
      fontSize: 30,
      fontFamily:
          fontFamily ??
          (Get.locale == const Locale('en', 'US')
              ? 'SourceSansPro-Bold'
              : 'Battambang-Bold'),
      color: color ?? Colors.black,
      height: height,
    );
  }
}
