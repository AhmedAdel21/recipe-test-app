import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:recipetestapp/data/data_source/local_data_source/permanent_data_source/app_cache.dart';

class RoutesPath {
  static const splash = "/Splash";
  static const login = "/Login";
  static const home = "/Home";
  static const recipeDetails = "/RecipeDetails";
}

class RoutesName {
  static const splash = "Splash";
  static const login = "Login";
  static const home = "Home";
  static const recipeDetails = "/RecipeDetails";
}

final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

class AppRouter {
  final AppSharedPrefs _appPreferences;
  AppRouter(this._appPreferences);

  late final router = GoRouter(
    navigatorKey: navigatorKey,
    debugLogDiagnostics: false,
    initialLocation: RoutesPath.splash,
    routes: [
      //  Splash Page
      // GoRoute(
      //   name: RoutesName.splash,
      //   path: RoutesPath.splash,
      //   builder: (context, state) => const SplashPage(),
      // ),
      //  Login Page
      // GoRoute(
      //   name: RoutesName.login,
      //   path: RoutesPath.login,
      //   builder: (context, state) => const LoginPage(),
      // ),
      //  Home Page
      // GoRoute(
      //   name: RoutesName.home,
      //   path: RoutesPath.home,
      //   builder: (context, state) => const HomePage(),
      // ),
      //  Add Recipe details page
      // GoRoute(
      //   name: RoutesName.recipeDetails,
      //   path: RoutesPath.recipeDetails,
      //   builder: (context, state) {
      //     return recipeDetailsPage(Input);
      //   },
      // ),
    ],
    errorPageBuilder: (context, state) {
      return MaterialPage(
        key: state.pageKey,
        child: Scaffold(
          body: Center(
            child: Text(
              state.error.toString(),
            ),
          ),
        ),
      );
    },
    redirect: (ctx, goRouterState) async {
      final loggedIn = _appPreferences.getIsUserLoggedIn();

      final loggingIn = goRouterState.location == RoutesPath.login;

      if (!loggedIn) return loggingIn ? null : RoutesPath.login;

      return null;
    },
  );
}
