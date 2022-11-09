import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:project/res/app_colors/AppColors.dart';
import '../../utils/appBar_sideDrawer/constants.dart';
import '../../view_items/grid_layout_item.dart';


class RiderDashBoard extends StatefulWidget {
  const RiderDashBoard({Key? key}) : super(key: key);

  @override
  State<RiderDashBoard> createState() => RiderDashBoardState();
}

class RiderDashBoardState extends State<RiderDashBoard> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      appBar: myAppBar,
      drawer: myDrawer,
      body: Center(
        // padding: const EdgeInsets.only(top: 150.0),
        child: GridView.builder(
          shrinkWrap: true,
          itemCount: 4,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
          ),
          itemBuilder: (context, index) => InkWell(
            onTap: () {
             // Get.to(LoginFlutter());
          
            },
            child: GridOptions(
              layout: options[index],
            ),
          ),

          //return const MyBox(providedColor: AppColors.blue,);
        ),
      ),
    );
  }
}
