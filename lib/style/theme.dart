import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:news_app/style/App_colors.dart';

class AppTheme {
  static ThemeData LightTheme = ThemeData(

      scaffoldBackgroundColor: Colors.transparent,
      appBarTheme: AppBarTheme(
          backgroundColor: AppColors.PrimaryLightColor,
          centerTitle: true,
          toolbarHeight: 80,
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(50),
                  bottomRight: Radius.circular(50)
              )
          ),
          titleTextStyle: TextStyle(
            fontSize: 22,
            fontWeight: FontWeight.w400,
            color: Colors.white,
          ),
        iconTheme: IconThemeData(color: Colors.white ,  size: 30)
      ),
    textTheme: TextTheme(
      titleLarge: TextStyle(
        color: Colors.white,
        fontSize: 24,
         fontWeight: FontWeight.w600
      ),
      labelLarge: TextStyle(
          color:AppColors.TextDawerColor,
          fontSize: 24,
          fontWeight: FontWeight.w600
      ),

    ),
     colorSchemeSeed: AppColors.PrimaryLightColor
      

  );
}
