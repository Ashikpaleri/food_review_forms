import 'package:flutter/material.dart';

class Style {
  static const heading = TextStyle(
      color: CommonColors.colorWhite,
      letterSpacing: 0.07,
      fontWeight: FontWeight.w700,
      fontSize: 24,
      // fontFamily: 'Sora'
  );
  static const subheading = TextStyle(
      color: CommonColors.darkBlack,
      letterSpacing: 0.07,
      fontWeight: FontWeight.w600,
      fontSize: 16,
      // fontFamily: 'Sora'
  );
  static const darkColorText = TextStyle(
      color: CommonColors.darkBlack,
      letterSpacing: 0.07,
      fontWeight: FontWeight.w600,
      fontSize: 14,
      // fontFamily: 'Sora'
  );
  static const subheadingTwo = TextStyle(
      color: CommonColors.darkBlack,
      letterSpacing: 0.07,
      fontWeight: FontWeight.w400,
      fontSize: 16,
      // fontFamily: 'Sora'
  );
  static const thanks = TextStyle(
      color: CommonColors.colorGreenDark,
      letterSpacing: 0.07,
      fontWeight: FontWeight.w400,
      fontSize: 16,
      // fontFamily: 'Sora'
  );
  static const hey = TextStyle(
      color: CommonColors.colorGreenDark,
      letterSpacing: 0.07,
      fontWeight: FontWeight.w600,
      fontSize: 22,
      // fontFamily: 'Sora'
  );

  static const survey = TextStyle(
    color: CommonColors.colorBlackLight,
    letterSpacing: 0.07,
    fontWeight: FontWeight.w400,
    fontSize: 12,
    // fontFamily: 'Sora'
  );


}

class CommonColors {
  static const colorWhite = Color(0xFFFFFFFF);
  static const colorGreen = Color(0xFF44EC9F);
  static const darkBlack = Color(0xFF001E30);
  static const colorBlackLight = Color(0xFF1C1B1F);
  static const scaffoloBgColor = Color(0xFFDFD5EC);
  static const colorBlackView = Color(0xff222222);
  static const colorGreenDark = Color(0xFF07D275);
}
