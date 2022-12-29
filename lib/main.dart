import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:project/bindings/appControllerBinding.dart';
import 'package:project/view/home/RiderDashBoard.dart';
import 'package:project/view/splash_screen/AppIntroScreens.dart';
import 'package:project/view/splash_screen/SelectionScreens.dart';

import 'global/global.dart';
import 'localDB/appdatabase.dart';

Future<void> main() async {
  
  WidgetsFlutterBinding.ensureInitialized();
  sharedPreferences = await SharedPreferences.getInstance();
  final database =
      await $FloorAppDatabase.databaseBuilder('app_database.db').build();
  // final userDao = database.userDao;
  // final orderDao = database.ordersDao;
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      // initialBinding: AppControllersBinding(),
      theme: ThemeData(
        primarySwatch: Colors.blue,
        accentColor: Colors.pink,
      ),
      home: SelectionScreens(
        AppIntroScreens: IntroScreen(),
        RiderDashBoard: RiderDashBoard(),
      ),
    );
  }
}
