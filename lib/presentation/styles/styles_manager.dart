part of 'styles.dart';

class TextStylesManager {
  /// Thin TextStyle
  ///
  ///  Default values if not givin
  ///  ```dart
  /// fontSize = FontSizeConstants.s14
  /// color = ColorConstants.black
  /// ```
  ///
  static TextStyle getThinStyle({double? fontSize, Color? color}) =>
      _getTextStyle(fontSize ?? FontSizeConstants.s14,
          FontWeightConstants.thin, color ?? ColorConstants.black);

  /// light TextStyle
  ///
  ///  Default values if not givin
  ///  ```dart
  /// fontSize = FontSizeConstants.s14
  /// color = ColorConstants.black
  /// ```
  ///
  static TextStyle getLightStyle({double? fontSize, Color? color}) =>
      _getTextStyle(fontSize ?? FontSizeConstants.s14,
          FontWeightConstants.light, color ?? ColorConstants.black);

  /// regular TextStyle
  ///
  ///  Default values if not givin
  ///  ```dart
  /// fontSize = FontSizeConstants.s14
  /// color = ColorConstants.black
  /// ```
  ///
  static TextStyle getRegularStyle({double? fontSize, Color? color}) =>
      _getTextStyle(fontSize ?? FontSizeConstants.s14,
          FontWeightConstants.regular, color ?? ColorConstants.black);

  /// Medium TextStyle
  ///
  ///  Default values if not givin
  ///  ```dart
  /// fontSize = FontSizeConstants.s14
  /// color = ColorConstants.black
  /// ```
  ///
  static TextStyle getMediumStyle({double? fontSize, Color? color}) =>
      _getTextStyle(fontSize ?? FontSizeConstants.s14,
          FontWeightConstants.medium, color ?? ColorConstants.black);

  /// bold TextStyle
  ///
  ///  Default values if not givin
  ///  ```dart
  /// fontSize = FontSizeConstants.s14
  /// color = ColorConstants.black
  /// ```
  ///
  static TextStyle getBoldStyle({double? fontSize, Color? color}) =>
      _getTextStyle(fontSize ?? FontSizeConstants.s14,
          FontWeightConstants.bold, color ?? ColorConstants.black);

  /// black TextStyle
  ///
  ///  Default values if not givin
  ///  ```dart
  /// fontSize = FontSizeConstants.s14
  /// color = ColorConstants.black
  /// ```
  ///
  static TextStyle getBlackStyle({double? fontSize, Color? color}) =>
      _getTextStyle(fontSize ?? FontSizeConstants.s14,
          FontWeightConstants.black, color ?? ColorConstants.black);

  static TextStyle _getTextStyle(
          double fontSize, FontWeight fontWeight, Color color) =>
      TextStyle(
          fontSize: fontSize,
          fontFamily: FontConstants.fontFamilyLato,
          color: color,
          fontWeight: fontWeight);
}
