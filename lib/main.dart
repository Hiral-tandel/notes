import 'package:crud/routes/app_route.dart';
import 'package:crud/routes/route_name.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp();
  @override
  Widget build(BuildContext context) {
    // TODO: implement build

    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        scaffoldBackgroundColor: Colors.white,
        appBarTheme: const AppBarTheme(backgroundColor: Colors.white),
      ),
     initialRoute: RouteName.HOME,
     getPages: AppRoute.appRoutes(),
    );
  }
}
