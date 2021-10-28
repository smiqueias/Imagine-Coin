import 'package:cryptocurrency_app/src/features/coin_list/router/coin_list_router.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AppRouters {
  static String get initialRoute => "/";

  static Map<String, Widget Function(BuildContext, dynamic)> routes = {
    "/": (_, args) => const CoinListRouter(),
  };

  static Route? generateRoutes(RouteSettings settings) {
    final routerName = settings.name;
    final routeArgs = settings.arguments;

    final navigateTo = routes[routerName];

    if (navigateTo == null) return null;

    return MaterialPageRoute(
      builder: (context) => navigateTo.call(
        context,
        routeArgs,
      ),
    );
  }
}
