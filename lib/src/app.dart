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
        initialRoute: AppRouters.initialRoute,
        onGenerateRoute: AppRouters.generateRoutes,
      ),
    );
  }
}
