import 'package:flutter/material.dart';
import 'package:spekta_store/utils/theme/custom_themes/appbar_theme.dart';
import 'package:spekta_store/utils/theme/custom_themes/bottom_sheet_theme.dart';
import 'package:spekta_store/utils/theme/custom_themes/checkbox_heme.dart';
import 'package:spekta_store/utils/theme/custom_themes/chip_theme.dart';
import 'package:spekta_store/utils/theme/custom_themes/elevated_button_theme.dart';
import 'package:spekta_store/utils/theme/custom_themes/outlined_button_theme.dart';
import 'package:spekta_store/utils/theme/custom_themes/text_field_theme.dart';
import 'package:spekta_store/utils/theme/custom_themes/text_theme.dart';

class EAppTheme {
  EAppTheme._();

  static ThemeData lightTheme = ThemeData(
    useMaterial3: true,
    fontFamily: "Poppins",
    brightness: Brightness.light,
    primaryColor: Colors.blue,
    scaffoldBackgroundColor: Colors.white,
    textTheme: ETextTheme.lightTextTheme,
    elevatedButtonTheme: EElevatedButtonTheme.LightElevatedButtonTheme,
    appBarTheme: EAppBarTheme.lightAppBarTheme,
    bottomSheetTheme: EBottomSheetTheme.lightBottomSheetTheme,
    checkboxTheme: ECheckBoxTheme.lightCheckBoxTheme,
    chipTheme: EChipTheme.lightChipTheme,
    outlinedButtonTheme: EOutlinedButtonTheme.lightOutlinedButtonTheme,
    inputDecorationTheme: ETextFormFieldTheme.lightInputDecorationTheme,
  );
  static ThemeData darkTheme = ThemeData(
    useMaterial3: true,
    fontFamily: "Poppins",
    brightness: Brightness.dark,
    primaryColor: Colors.blue,
    scaffoldBackgroundColor: Colors.black,
    textTheme: ETextTheme.darkTextTheme,
    elevatedButtonTheme: EElevatedButtonTheme.darkElevatedButtonTheme,
    appBarTheme: EAppBarTheme.darkAppBarTheme,
    bottomSheetTheme: EBottomSheetTheme.darkBottomSheetTheme,
    checkboxTheme: ECheckBoxTheme.darkCheckBoxTheme,
    chipTheme: EChipTheme.darkChipTheme,
    outlinedButtonTheme: EOutlinedButtonTheme.darkOutlinedButtonTheme,
    inputDecorationTheme: ETextFormFieldTheme.darkInputDecorationTheme,
  );

}