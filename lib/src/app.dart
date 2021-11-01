import 'package:cryptocurrency_app/src/core/app_colors.dart';
import "package:flutter/material.dart";
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'core/app_routers.dart';

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(428, 926),
      builder: () => MaterialApp(
        debugShowCheckedModeBanner: false,
        title: "Imagine Coin",
        theme: ThemeData(
          primaryColor: AppColors.grey2,
          primarySwatch: Colors.grey,
          scaffoldBackgroundColor: AppColors.grey2,
          visualDensity: VisualDensity.adaptivePlatformDensity,
        ),
        initialRoute: AppRouters.initialRoute,
        onGenerateRoute: AppRouters.generateRoutes,
      ),
    );
  }
}
