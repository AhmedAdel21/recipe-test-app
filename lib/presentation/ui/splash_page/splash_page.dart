import 'dart:async';

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:recipetestapp/app/di.dart';
import 'package:recipetestapp/data/data_source/local_data_source/permanent_data_source/app_cache.dart';
import 'package:recipetestapp/presentation/navigation/app_router.dart';
import 'package:recipetestapp/presentation/styles/styles.dart';

class SplashPage extends StatelessWidget {
  const SplashPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const _SplashPageContent();
  }
}

class _SplashPageContent extends StatefulWidget {
  const _SplashPageContent();

  @override
  State<_SplashPageContent> createState() => __SplashPageContentState();
}

class __SplashPageContentState extends State<_SplashPageContent> {
  Timer? _timer;

  void _startDelay() {
    _timer = Timer(const Duration(seconds: AppConstants.splashDelay), _goNext);
  }

  void _goNext() {
    // Navigator.pushReplacementNamed(context, Routes.mainRoute);
    // context.pushReplacementNamed(RoutesName.login);

    bool isUserLoggedIn =
        DI.getItInstance<AppSharedPrefs>().getIsUserLoggedIn();
    if (isUserLoggedIn) {
      // navigate to home page
      context.pushReplacementNamed(RoutesName.home);
    } else {
      // navigate to login page
      context.pushReplacementNamed(RoutesName.login);
    }
  }

  @override
  void initState() {
    super.initState();
    _startDelay();
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: ColorConstants.white,
        body: Container(
          child: _body,
        ),
      ),
    );
  }

  Widget get _body {
    return Center(
        child: SizedBox(
      height: AppSizeConstants.s200,
      width: AppSizeConstants.s200,
      child: Image.asset(GifAssets.appLogo),
    ));
  }
}
