import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:recipetestapp/domain/model/models.dart';
import 'package:recipetestapp/presentation/ui/home_page/view/home_page.dart';
import 'package:recipetestapp/presentation/ui/login_page/view/login_page.dart';
import 'package:recipetestapp/presentation/ui/recipe_details_page/view/recipe_details_page.dart';
import 'package:recipetestapp/presentation/ui/splash_page/splash_page.dart';

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
  AppRouter();

  late final router = GoRouter(
    navigatorKey: navigatorKey,
    debugLogDiagnostics: false,
    initialLocation: RoutesPath.splash,
    routes: [
      //  Splash Page
      GoRoute(
        name: RoutesName.splash,
        path: RoutesPath.splash,
        builder: (context, state) => const SplashPage(),
      ),
      //  Login Page
      GoRoute(
        name: RoutesName.login,
        path: RoutesPath.login,
        builder: (context, state) => const LoginPage(),
      ),
      //  Home Page
      GoRoute(
        name: RoutesName.home,
        path: RoutesPath.home,
        builder: (context, state) => const HomePage(),
      ),
      //  Recipe details page
      GoRoute(
        name: RoutesName.recipeDetails,
        path: RoutesPath.recipeDetails,
        builder: (context, state) {
          final recipe = state.extra as Recipe;
          return RecipeDetailsPage(recipe);
        },
      ),
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
      // final loggedIn = _appPreferences.getIsUserLoggedIn();

      // final loggingIn = goRouterState.location == RoutesPath.login;

      // if (!loggedIn) return loggingIn ? null : RoutesPath.login;

      // return null;
    },
  );
}
