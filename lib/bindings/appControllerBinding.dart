import 'package:get/get.dart';
import 'package:project/controllers/dashboard_controller.dart';

class AppControllersBinding implements Bindings {
// default dependency
 @override
 void dependencies() {
   Get.lazyPut(() => DashBoardController());
 }
}