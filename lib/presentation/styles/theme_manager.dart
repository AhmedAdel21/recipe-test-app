part of 'styles.dart';

class ThemeManager {
  static ThemeMode _themeMode = ThemeMode.light;
  static setThemeMode(ThemeMode newThemeMode) => _themeMode = newThemeMode;

  static ThemeMode get getThemeMode => _themeMode;

  // static CupertinoThemeData get getAppCupertinoLightTheme =>
  //     CupertinoThemeData(textTheme: CupertinoTextThemeData(), brightness: Brightness.light);

  // static CupertinoThemeData get getAppCupertinoDarkTheme =>
  //     CupertinoThemeData(textTheme: CupertinoTextThemeData(), brightness: Brightness.dark);

  static ThemeData get getAppTheme {
    return ThemeData(
      useMaterial3: true,
      cupertinoOverrideTheme:
          const NoDefaultCupertinoThemeData(brightness: Brightness.light),
      dialogTheme: DialogTheme(
        elevation: FontSizeConstants.s12,
        backgroundColor: ColorConstants.white,
        surfaceTintColor: ColorConstants.white,
        shadowColor: ColorConstants.black,
        iconColor: ColorConstants.black,
        titleTextStyle:
            TextStylesManager.getBoldStyle(fontSize: FontSizeConstants.s18),
        contentTextStyle:
            TextStylesManager.getRegularStyle(fontSize: FontSizeConstants.s16),
      ),
      textButtonTheme: TextButtonThemeData(
          style: ButtonStyle(
        textStyle: WidgetStateProperty.all(
            TextStylesManager.getMediumStyle(fontSize: FontSizeConstants.s16)),
        backgroundColor: WidgetStateProperty.all(ColorConstants.white),
        foregroundColor: WidgetStateProperty.all(ColorConstants.black),
      )),

      appBarTheme: const AppBarTheme(
        foregroundColor: ColorConstants.white,
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      // text theme
      textTheme: TextTheme(
        // display
        displaySmall: TextStylesManager.getRegularStyle(
            color: ColorConstants.black, fontSize: FontSizeConstants.s14),
        displayMedium: TextStylesManager.getMediumStyle(
            color: ColorConstants.black, fontSize: FontSizeConstants.s18),
        displayLarge: TextStylesManager.getBoldStyle(
            color: ColorConstants.black, fontSize: FontSizeConstants.s22),

        // headline
        headlineSmall: TextStylesManager.getMediumStyle(
            color: ColorConstants.black, fontSize: FontSizeConstants.s14),
        headlineMedium: TextStylesManager.getBoldStyle(
            color: ColorConstants.black, fontSize: FontSizeConstants.s18),
        headlineLarge: TextStylesManager.getBlackStyle(
            color: ColorConstants.black, fontSize: FontSizeConstants.s22),

        // title
        titleSmall: TextStylesManager.getMediumStyle(
            color: ColorConstants.black, fontSize: FontSizeConstants.s14),
        titleMedium: TextStylesManager.getBoldStyle(
            color: ColorConstants.black, fontSize: FontSizeConstants.s18),
        titleLarge: TextStylesManager.getBlackStyle(
            color: ColorConstants.black, fontSize: FontSizeConstants.s22),

        // body
        bodySmall: TextStylesManager.getLightStyle(
            color: ColorConstants.black, fontSize: FontSizeConstants.s12),
        bodyMedium: TextStylesManager.getRegularStyle(
            color: ColorConstants.black, fontSize: FontSizeConstants.s14),
        bodyLarge: TextStylesManager.getRegularStyle(
            color: ColorConstants.black, fontSize: FontSizeConstants.s16),

        // label
        labelSmall: TextStylesManager.getThinStyle(
            color: ColorConstants.black, fontSize: FontSizeConstants.s12),
        labelMedium: TextStylesManager.getLightStyle(
            color: ColorConstants.black, fontSize: FontSizeConstants.s14),
        labelLarge: TextStylesManager.getRegularStyle(
            color: ColorConstants.black, fontSize: FontSizeConstants.s16),
      ),

      scrollbarTheme: ScrollbarThemeData(
        thumbColor: WidgetStateProperty.all<Color>(ColorConstants.black),
        thickness: WidgetStateProperty.all(AppSizeConstants.s2),
      ),
      // // main colors
      // primaryColor: ColorConstants.primary,
      // primaryColorLight: ColorConstants.lightPrimary,
      // primaryColorDark: ColorConstants.darkPrimary,
      // disabledColor: ColorConstants.grey1DisabledColor,
      // splashColor: ColorConstants.lightPrimary,

      // cardView Theme
      // cardTheme: const CardTheme(
      //   color: ColorConstants.white,
      //   shadowColor: ColorConstants.grey,
      //   elevation: AppSizeConstants.s4,
      // ),

      // // button theme
      // buttonTheme: const ButtonThemeData(
      //   shape: StadiumBorder(),
      //   disabledColor: ColorConstants.grey1DisabledColor,
      //   splashColor: ColorConstants.lightPrimary,
      //   buttonColor: ColorConstants.primary,
      // ),

      // elevated button theme
      // elevatedButtonTheme: ElevatedButtonThemeData(
      //   style: ElevatedButton.styleFrom(
      //     textStyle: TextStylesManager.getRegularStyle(
      //       color: ColorConstants.white,
      //       fontSize: FontSizeConstants.s18,
      //     ),
      //     backgroundColor: ColorConstants.primary,
      //     shape: RoundedRectangleBorder(
      //       borderRadius: BorderRadius.circular(
      //         AppSizeConstants.s12,
      //       ),
      //     ),
      //   ),
      // ),

      // // input decoration theme (text form field)
      inputDecorationTheme: InputDecorationTheme(
        // content padding
        contentPadding: const EdgeInsets.all(AppPaddingConstants.p8),
        // counterStyle
        counterStyle: TextStylesManager.getRegularStyle(
            color: ColorConstants.black, fontSize: FontSizeConstants.s12),
        // hint style
        hintStyle: TextStylesManager.getRegularStyle(
            color: ColorConstants.black, fontSize: FontSizeConstants.s12),
        // label style
        labelStyle: TextStylesManager.getRegularStyle(
            color: ColorConstants.white, fontSize: FontSizeConstants.s12),
        // error style
        errorStyle: TextStylesManager.getRegularStyle(
            color: ColorConstants.error, fontSize: FontSizeConstants.s12),

        border: const OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(AppSizeConstants.s20)),
          borderSide: BorderSide(
              color: ColorConstants.white, width: AppSizeConstants.s1),
        ),

        // enabled border style
        enabledBorder: const OutlineInputBorder(
          borderSide: BorderSide(
              color: ColorConstants.black, width: AppSizeConstants.s1),
          borderRadius: BorderRadius.all(Radius.circular(AppSizeConstants.s20)),
        ),

        // focused border style
        focusedBorder: const OutlineInputBorder(
          borderSide: BorderSide(
              color: ColorConstants.green, width: AppSizeConstants.s1),
          borderRadius: BorderRadius.all(Radius.circular(AppSizeConstants.s20)),
        ),

        // error border style
        errorBorder: const OutlineInputBorder(
          borderSide: BorderSide(
              color: ColorConstants.error, width: AppSizeConstants.s1),
          borderRadius: BorderRadius.all(Radius.circular(AppSizeConstants.s20)),
        ),

        // focused border style
        focusedErrorBorder: const OutlineInputBorder(
          borderSide: BorderSide(
              color: ColorConstants.error, width: AppSizeConstants.s1),
          borderRadius: BorderRadius.all(Radius.circular(AppSizeConstants.s20)),
        ),
      ),
    );
  }
}
