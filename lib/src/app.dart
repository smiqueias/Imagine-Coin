import 'package:cryptocurrency_app/src/core/app_theme.dart';
import 'package:cryptocurrency_app/src/core/providers.dart';
import "package:flutter/material.dart";
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'core/app_routers.dart';

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
          initialRoute: AppRouters.initialRoute,
          onGenerateRoute: AppRouters.generateRoutes,
        ),
      ),
    );
  }
}
