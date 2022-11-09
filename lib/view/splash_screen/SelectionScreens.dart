import 'package:flutter/material.dart';
import '../../global/global.dart';

class SelectionScreens extends StatelessWidget {
  final Widget RiderDashBoard;
  final Widget AppIntroScreens;

  const SelectionScreens(
      {Key? key, required this.RiderDashBoard, required this.AppIntroScreens})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (sharedPreferences!.getString('email') != null) {
      return RiderDashBoard;
    } else {
       return AppIntroScreens;
    }
  }
}
