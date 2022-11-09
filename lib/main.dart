import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';
import 'package:project/res/AppContextExtension.dart';
import 'package:project/res/app_colors/AppColors.dart';
import 'package:project/view/home/RiderDashBoard.dart';
import 'package:project/view/splash_screen/AppIntroScreens.dart';
import 'package:project/view/splash_screen/SelectionScreens.dart';
import 'package:project/view/splash_screen/SplashScreen.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'global/global.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  sharedPreferences = await SharedPreferences.getInstance();
  runApp(MyApp());
}



class MyApp extends StatelessWidget {
  
   
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
        accentColor: Colors.pink,
      ),

      home: SelectionScreens(
        AppIntroScreens: IntroScreen(), 
        RiderDashBoard: RiderDashBoard(),
        
      ),);
    
  }
}
