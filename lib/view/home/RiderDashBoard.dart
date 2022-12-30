import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:project/models/dashboard_model.dart';
import 'package:project/res/app_colors/app_colors.dart';
import 'package:project/utils/Utils.dart';
import 'package:project/view/orders_screen/new_orders_screen.dart';
import '../../controllers/dashboard_controller.dart';
import '../../utils/appBar_sideDrawer/constants.dart';
import '../widget/simple_app_bar.dart';

class RiderDashBoard extends StatefulWidget {
  //final riderDashBoardController = Get.put(DashBoardController());
  @override
  State<RiderDashBoard> createState() => RiderDashBoardState();

  void setState(bool Function() toggle) {}
}

class RiderDashBoardState extends State<RiderDashBoard> {
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
          child: Stack(children: [
            Obx(() => controller.loading.value == false
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
                          Get.to(() => NewOrdersScreen());
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

                      // InkWell(
                      //   focusColor: AppColors.green,
                      //       onTap: () {
                      //         utils.successSnackBar("clicked", "");
                      //       },
                      //   child: Container (
                      //     decoration: utils.boxDacoration()
                      //   ),
                      // ),
                    ],
                  )

                    // MyStatelessWidget(),
                    )),
          ]),
        ));
  }
}

// ignore: must_be_immutable
// class MyStatelessWidget extends StatelessWidget {
//     final Utils utils = Utils();
//     DashBoardController controller = Get.find();

//     Card makeDashboardItem(
//       String title, IconData iconData, String count, int index) {
//       return Card(
//       elevation: 5,
//       margin: const EdgeInsets.all(8),
//       child: Container(
//         decoration: index == 0 || index == 3 || index == 4
//             ? BoxDecoration(
//                 borderRadius: BorderRadius.circular(5),
//                 color: AppColors.mainColorTwo,
//                 // gradient: const LinearGradient(
//                 //   begin: FractionalOffset(-2.0, 1.0),
//                 //   end: FractionalOffset(1.0, 2.0),
//                 //   colors: [
//                 //     AppColors.mainColor,
//                 //     AppColors.mainColorTwo,
//                 //   ],
//                 // ),
//                 boxShadow: const [
//                   BoxShadow(
//                     color: Colors.grey,
//                     blurRadius: 3,
//                     offset: Offset(4, 3),
//                   )
//                 ],
//               )
//             : BoxDecoration(
//                 borderRadius: BorderRadius.circular(5),
//                 color: AppColors.mainColor,
//                 // gradient: const LinearGradient(
//                 //   begin: FractionalOffset(5.0, -1.0),
//                 //   end: FractionalOffset(1.0,-2.0),
//                 //   colors: [
//                 //     AppColors.mainColorTwo,
//                 //     AppColors.mainColor,
//                 //   ],
//                 // ),
//                 boxShadow: const [
//                   BoxShadow(
//                     color: Colors.grey,
//                     blurRadius: 3,
//                     offset: Offset(4, 3),
//                   )
//                 ],
//               ),
//         child: InkWell(
//           focusColor: AppColors.green,
//           onTap: () {
//             if (index == 0) {
//               //new orders

//             }
//             if (index == 1) {
//               //Parcels in progress

//             }
//             if (index == 2) {
//               //not yet delivered

//             }
//             if (index == 3) {
//               //history

//             }
//             if (index == 4) {
//               //total earnings

//             }
//             if (index == 5) {
//               //logout

//             }
//           },
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.stretch,
//             mainAxisSize: MainAxisSize.min,
//             verticalDirection: VerticalDirection.down,
//             children: [
//               const SizedBox(height: 30),
//               Center(
//                 child: Icon(
//                   iconData,
//                   size: 40,
//                   color: AppColors.white,
//                 ),
//               ),
//               const SizedBox(height: 20),
//               Center(
//                 child: Text(
//                   title,
//                   style: const TextStyle(
//                     fontSize: 16,
//                     color: AppColors.white,
//                   ),
//                 ),
//               ),
//               const SizedBox(height: 20),
//               Center(
//                 child: Text(
//                   count,
//                   style: const TextStyle(
//                     fontSize: 16,
//                     color: AppColors.white,
//                   ),
//                 ),
//               )
//             ],
//           ),
//         ),
//       ),
//     );
//   }

//   @override
//   Widget build(BuildContext context) {
//     controller.getDashBoardData();
//     var dashData = controller.dash;
//     // Timer.periodic(Duration(microseconds: 3000), (_){
//     //   circularProgress();
//     // });
//     return Scaffold(
//         body: Obx(() => controller.loading.isTrue
//             ? Center(child: CircularProgressIndicator())
//             : GetBuilder<DashBoardController>(
//                 id: 'dashboardDetails',
//                 builder: (DashBoardDetails) {
//                   return Container(
//                       padding: const EdgeInsets.symmetric(
//                           vertical: 5, horizontal: 1),
//                       child: Obx(() => dashData.value != null
//                           ?GridView.count(
//                               crossAxisCount: 2,
//                               padding: const EdgeInsets.all(2),
//                               children: [
//                                 makeDashboardItem(
//                                     "New Available",
//                                     Icons.assignment,
//                                       dashData.value!.assigned
//                                         .toString(),
//                                     0),
//                                 makeDashboardItem(
//                                     "Parcels in Progress",
//                                     Icons.airport_shuttle,
//                                     dashData.value!.inProgress
//                                         .toString(),
//                                     1),
//                                 makeDashboardItem(
//                                     "Not Yet Delivered",
//                                     Icons.location_history,
//                                     dashData.value!.total
//                                         .toString(),
//                                     2),
//                                 makeDashboardItem(
//                                     "History",
//                                     Icons.done_all,
//                                     dashData.value!.cancelled
//                                         .toString(),
//                                     3),
//                                 makeDashboardItem(
//                                     "Total Earnings",
//                                     Icons.monetization_on,
//                                    dashData.value!.assigned
//                                         .toString(),
//                                     4),
//                                 makeDashboardItem(
//                                     "Logout", Icons.logout, "", 5),
//                               ],
//                             ): 
//                                Center(child: CircularProgressIndicator())
//                            ));
//                 },
//               )));
//   }
// }

// GridView.builder(
//           shrinkWrap: true,
//           itemCount: 4,
//           gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
//             crossAxisCount: 2,
//           ),
//           itemBuilder: (context, index) => InkWell(
//             onTap: () {
//               switch (index) {
//                 case 0:
//                   Get.to(()=> HomeScreen());
//                   break;
//                 case 1:
//                   utils.successSnackBar("dashBoard Tap two", index.toString());
//                   break;
//                 case 2:
//                   utils.successSnackBar(
//                       "dashBoard Tap three", index.toString());
//                   break;
//                 case 3:
//                   utils.successSnackBar("dashBoard Tap four", index.toString());
//                   break;
//               }
//             },
//             child: GridOptions(
//               layout: options[index],
//             ),
//           ),

//           //return const MyBox(providedColor: AppColors.blue,);
//         ),

//     body: FutureBuilder<DashBoardData>(
//   builder: (ctx, snapshot) {
//     // Checking if future is resolved or not
//     if (snapshot.connectionState == ConnectionState.done) {
//       // If we got an error
//       if (snapshot.hasError) {
//         return Center(
//           child: Text(
//             '${snapshot.error} occured',
//             style: TextStyle(fontSize: 18),
//           ),
//         );

//         // if we got our data
//       } else if (snapshot.hasData) {
//         // Extracting data from snapshot object
//         final data = snapshot.data as DashBoardDetails;
//         return Container(
//             padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 1),
//             child: GridView.count(
//               crossAxisCount: 2,
//               padding: const EdgeInsets.all(2),
//               children: [
//                 makeDashboardItem("New Available", Icons.assignment,
//                     data.assigned.toString(), 0),
//                 makeDashboardItem("Parcels in Progress",
//                     Icons.airport_shuttle, data.inProgress.toString(), 1),
//                 makeDashboardItem("Not Yet Delivered",
//                     Icons.location_history, data.total.toString(), 2),
//                 makeDashboardItem("History", Icons.done_all,
//                     data.cancelled.toString(), 3),
//                 makeDashboardItem(
//                     "Total Earnings", Icons.monetization_on, "4", 4),
//                 makeDashboardItem("Logout", Icons.logout, "", 5),
//               ],
//             ));
//       }
//     }
//     // Displaying LoadingSpinner to indicate waiting state
//     return Center(
//       child: CircularProgressIndicator(),
//     );
//   },
//   // Future that needs to be resolved
//   // inorder to display something on the Canvas
//   future: getData(),
// ));

