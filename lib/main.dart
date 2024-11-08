import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_phoenix/flutter_phoenix.dart';
import 'package:recipetestapp/app/app.dart';
import 'package:recipetestapp/app/di.dart';
import 'package:recipetestapp/presentation/styles/styles.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();
  await DI.initAppModule();
  runApp(EasyLocalization(
    supportedLocales: const [LanguageLocaleConstant.englishLocale],
    path: assetsPathLocalization,
    child: Phoenix(child: MyApp()),
  ));
}
