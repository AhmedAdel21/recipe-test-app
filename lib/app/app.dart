import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter_platform_widgets/flutter_platform_widgets.dart';
import 'package:recipetestapp/app/di.dart';
import 'package:recipetestapp/data/data_source/local_data_source/permanent_data_source/app_cache.dart';
import 'package:recipetestapp/presentation/navigation/app_router.dart';
import 'package:recipetestapp/presentation/styles/styles.dart';

class MyApp extends StatefulWidget {
  const MyApp._internal();

  static const MyApp _instant = MyApp._internal();

  factory MyApp() => _instant;

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final AppSharedPrefs _appCache = DI.getItInstance<AppSharedPrefs>();
  late final _appRouter = AppRouter(_appCache);

  @override
  Widget build(BuildContext context) {
    final router = _appRouter.router;
    return PlatformProvider(
      settings: PlatformSettingsData(),
      builder: (context) {
        return PlatformTheme(
          builder: (context) {
            return PlatformApp.router(
              localizationsDelegates: const <LocalizationsDelegate<dynamic>>[
                DefaultMaterialLocalizations.delegate,
                DefaultWidgetsLocalizations.delegate,
                DefaultCupertinoLocalizations.delegate,
              ],
              supportedLocales: context.supportedLocales,
              locale: context.locale,
              debugShowCheckedModeBanner: false,
              // theme: getApplicationTheme(),
              routerDelegate: router.routerDelegate,
              routeInformationParser: router.routeInformationParser,
              routeInformationProvider: router.routeInformationProvider,
            );
          },
          themeMode: ThemeManager.getThemeMode,
          materialLightTheme: ThemeManager.getAppTheme,
          materialDarkTheme: ThemeManager.getAppTheme,
        );
      },
    );
  }
}
