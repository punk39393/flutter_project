import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:project/utils/Utils.dart';
import 'package:project/view/authentication/login.dart';
import 'package:project/view/home/RiderDashBoard.dart';
import '../../res/app_colors/app_colors.dart';
import 'package:project/global/global.dart';

import '../../view/widget/simple_app_bar.dart';

final Utils utils = Utils();
final RiderDashBoard riderDashBoard = RiderDashBoard();
var defaultBackgroundColor = Colors.grey[300];
var appBarColor = AppColors.primaryColor;

//var myAppBar = CustomAppBar;
// AppBar(
//     backgroundColor: appBarColor,
//     title: Text("DashBoard"),
//     centerTitle: true,
//     actions: [
//       Switch(
//         value: riderDashBoard.isOn ,
//         activeColor: AppColors.green,
//         onChanged: (bool value) {
//           riderDashBoard.toggle();
//         },
//       ),
//     ]);

var drawerTextColor = const TextStyle(
  color: AppColors.black,
);
var button = ButtonStyle(
    backgroundColor: MaterialStateProperty.all(AppColors.mainColorTwo));

var tilePadding = const EdgeInsets.only(left: 8.0, right: 8, top: 8);
var myDrawer = Drawer(
  width: 250,
  backgroundColor: Colors.grey[300],
  elevation: 0,
  child: Column(
    children: [
      DrawerHeader(
      child: Column(
        children: [
          Expanded(
                child: Column(
                      children: 
                        [Image(
                          image: AssetImage('assets/images/logo_coderootz.png'),
                          width: 100,
                          height: 10,
                        ),
                        Text("pankaj.choudhary@coderootz.com"),
                      ],
                ),
            ),
        ],
      ),
      ),
      Padding(
        padding: tilePadding,
        child: ListTile(
          leading: const Icon(Icons.home),
          title: Text(
            'D A S H B O A R D',
            style: drawerTextColor,
          ),
        ),
      ),
      Padding(
        padding: tilePadding,
        child: ListTile(
          leading: const Icon(Icons.settings),
          title: Text(
            'S E T T I N G S',
            style: drawerTextColor,
          ),
        ),
      ),
      Padding(
        padding: tilePadding,
        child: ListTile(
          leading: const Icon(Icons.info),
          title: Text(
            'A B O U T',
            style: drawerTextColor,
          ),
        ),
      ),
      ElevatedButton(
        style: ButtonStyle(
          backgroundColor: MaterialStateProperty.resolveWith<Color>(
            (Set<MaterialState> states) {
              if (states.contains(MaterialState.pressed))
                return AppColors.mainColorTwo;
              return AppColors.mainColor; // Use the component's default.
            },
          ),
        ),
        child: Text(
          'L O G O U T',
        ),
        onPressed: () {
          Get.defaultDialog(
              title: "Need Your Action",
              middleText: "Do You Want To Logout ?",
              onConfirm: () =>
                  {sharedPreferences.clear(), Get.offAll(()=>LoginScreen())});
        },
      )
    ],
  ),
);
