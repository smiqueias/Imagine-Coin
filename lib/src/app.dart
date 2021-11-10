import 'package:cryptocurrency_app/src/core/app_theme.dart';
import 'package:cryptocurrency_app/src/core/providers.dart';
import 'package:cryptocurrency_app/src/features/home/router/home_router.dart';
import "package:flutter/material.dart";
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'features/coin-detail/router/coin_detail_router.dart';
import 'features/coin-list/router/coin_list_router.dart';
import 'features/favorites/router/favorites_router.dart';

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(428, 926),
      builder: () => MultiProvider(
        providers: AppProviders.providers,
        child: MaterialApp(
          debugShowCheckedModeBanner: false,
          title: "Imagine Coin",
          theme: AppTheme.appTheme,
          initialRoute: "/",
          routes: {
            "/": (_) => const HomeRouter(),
            "/coin-list": (_) => const CoinListRouter(),
            "/coin-detail": (_) => const CoinDetailRouter(),
            "/favorites": (_) => const FavoritesRouter(),
          },
        ),
      ),
    );
  }
}
