import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:recipetestapp/presentation/navigation/app_router.dart';

abstract class AppNavigationManager {
  void setCurrentRoutePath(String newPath);
  void goToHomePage();
  void navigateToPageAsFirstRoute(
    String routeName, {
    Map<String, String> pathParameters = const <String, String>{},
    Map<String, dynamic> queryParameters = const <String, dynamic>{},
    Object? extra,
  });
  void replacePage(
    String routeName, {
    Map<String, String> pathParameters = const <String, String>{},
    Map<String, dynamic> queryParameters = const <String, dynamic>{},
    Object? extra,
  });
  Future<T?> navigateToPage<T extends Object?>(
    String routeName, {
    Map<String, String> pathParameters = const <String, String>{},
    Map<String, dynamic> queryParameters = const <String, dynamic>{},
    Object? extra,
  });

  bool get isAppActive;
  String get getCurrentRoutePath;
}

class AppNavigationManagerImpl extends ChangeNotifier
    implements AppNavigationManager {
  final GlobalKey<NavigatorState> _navigatorKey = navigatorKey;
  String _currentRoutePath = "";

  @override
  bool get isAppActive => _navigatorKey.currentContext != null;

  @override
  String get getCurrentRoutePath => _currentRoutePath;
  @override
  void setCurrentRoutePath(String newPath) => _currentRoutePath = newPath;

  @override
  void goToHomePage() {
    if (_navigatorKey.currentContext != null) {
      Navigator.of(_navigatorKey.currentContext!)
          .popUntil((route) => route.isFirst);
      _navigatorKey.currentContext!.pushReplacementNamed(RoutesName.home);
    }
  }

  @override
  Future<T?> navigateToPage<T extends Object?>(
    String routeName, {
    Map<String, String> pathParameters = const <String, String>{},
    Map<String, dynamic> queryParameters = const <String, dynamic>{},
    Object? extra,
  }) async {
    T? result;
    if (_navigatorKey.currentContext != null) {
      result = await _navigatorKey.currentContext!.pushNamed(
        routeName,
        pathParameters: pathParameters,
        queryParameters: queryParameters,
        extra: extra,
      );
    }
    return result;
  }

  @override
  void replacePage(
    String routeName, {
    Map<String, String> pathParameters = const <String, String>{},
    Map<String, dynamic> queryParameters = const <String, dynamic>{},
    Object? extra,
  }) {
    if (_navigatorKey.currentContext != null) {
      _navigatorKey.currentContext!.pushReplacementNamed(
        routeName,
        pathParameters: pathParameters,
        queryParameters: queryParameters,
        extra: extra,
      );
    }
  }

  @override
  void navigateToPageAsFirstRoute(
    String routeName, {
    Map<String, String> pathParameters = const <String, String>{},
    Map<String, dynamic> queryParameters = const <String, dynamic>{},
    Object? extra,
  }) {
    if (_navigatorKey.currentContext != null) {
      Navigator.of(_navigatorKey.currentContext!)
          .popUntil((route) => route.isFirst);
      _navigatorKey.currentContext!.pushReplacementNamed(
        routeName,
        pathParameters: pathParameters,
        queryParameters: queryParameters,
        extra: extra,
      );
    }
  }
}
