import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../controllers/dashboard_controller.dart';
import '../../models/dashboard_model.dart';
import '../../res/app_colors/app_colors.dart';
import '../../utils/Utils.dart';
import '../../utils/appBar_sideDrawer/constants.dart';
import '../widget/simple_app_bar.dart';

class NewOrdersScreen extends StatefulWidget {
  //final riderDashBoardController = Get.put(DashBoardController());
  @override
  State<NewOrdersScreen> createState() => NewOrdersScreenState();

  void setState(bool Function() toggle) {}
}

class NewOrdersScreenState extends State<NewOrdersScreen> {
   final DashBoardController controller = Get.put(DashBoardController());
  Utils utils = Utils();
  late var dashData = DashBoardDetails();

  getData() async {
    await controller.getDashBoardData();
    dashData = controller.dashBoardData.data!;
    controller.loading.value = true;
  }

  @override
  void initState() {
    getData();
    super.initState();
  }

  // Future<void> onPullRefresh() async {
  //   getData();
  //   CircularProgressIndicator();
  // }

  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: AppColors.white,
        appBar: CustomAppBar(appBar_title: 'DashBoard'),
        drawer: myDrawer,
        body: RefreshIndicator(
          onRefresh: () async {
              getData();
            }, 
          child: Stack(
            children: [Obx(() => controller.loading.value == false
                ? Center(child: CircularProgressIndicator())
                : Center(
                    child: GridView.count(
                    shrinkWrap: true,
                    // childAspectRatio:((MediaQuery. of(context). size. width)/150),
                    primary: false,
                    padding: const EdgeInsets.all(20),
                    crossAxisSpacing: 10,
                    mainAxisSpacing: 10,
                    crossAxisCount: 2,
                    children: <Widget>[
                  
                      InkWell(
                        focusColor: AppColors.green,
                        onTap: () {
                          utils.successSnackBar("clicked", "");
                        },
                        child: (utils.baseContainer(
                            Icons.home, "All", dashData.assigned.toString())),
                      ),
                      InkWell(
                        focusColor: AppColors.green,
                        onTap: () {
                          utils.successSnackBar("clicked", "");
                        },
                        child: (utils.baseContainer(Icons.home, "All", "4")),
                      ),
                      InkWell(
                        focusColor: AppColors.green,
                        onTap: () {
                          utils.successSnackBar("clicked", "");
                        },
                        child: (utils.baseContainer(Icons.home, "All", "4")),
                      ),
                      InkWell(
                        focusColor: AppColors.green,
                        onTap: () {
                          utils.successSnackBar("clicked", "");
                        },
                        child: (utils.baseContainer(Icons.home, "All", "4")),
                      ),
                      InkWell(
                        focusColor: AppColors.green,
                        onTap: () {
                          utils.successSnackBar("clicked", "");
                        },
                        child: (utils.baseContainer(Icons.home, "All", "4")),
                      ),
                    ],
                  )
          
                    // MyStatelessWidget(),
                    )),]
          ),
        ));
  }
}