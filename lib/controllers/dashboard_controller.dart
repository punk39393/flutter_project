import 'dart:convert';

import 'package:get/get.dart';
import 'package:project/localDB/appdatabase.dart';
import 'package:project/models/dashboard_model.dart';
import 'package:project/models/orders_model.dart';

import '../api/api_end_points.dart';
import '../api/api_exceptions.dart';
import '../api/base_api_provider.dart';
import '../global/global.dart';
import '../models/orders_model.dart';
import '../utils/Utils.dart';

class DashBoardController extends GetxController with StateMixin {
  Utils utils = Utils();
  var loading = false.obs;
  OrdersDetails? ordersDetails;
  late DashBoardData dashBoardData;
  var dash = DashBoardData().data.obs;
  ApiProvider _provider = ApiProvider();
  ApiEndPoints _apiEndPoints = ApiEndPoints();
  AppException _appException = AppException();
  var userId = sharedPreferences.getString('user_id');
  AppDatabase? appDatabase;

  // @override
  // void onReady() {
  //   super.onReady();
  //   getOrders();
  //   getDashBoardData();
  // }

  // @override
  // void onInit() {
  //   super.onInit();
  //   getDashBoardData();
  // }

  Future getDashBoardData() async {
    var response = await _provider
        .postRequest(_apiEndPoints.getDashBoardData, {"user_id": userId});
    if (!response.status.hasError) {
      var result = jsonDecode(response.bodyString!);
      dashBoardData = DashBoardData.fromJson(result);
      final dashBoardDao = appDatabase?.dashBoardDao;
      await dashBoardDao?.insertData(dashBoardData.data!);
      dash.value = dashBoardData.data;
      update();
      loading.value = true;
      update(['dashboardDetails']);
    }
  }

  Future<DashBoardDetails?> dashBoardDetails() async {
    return await this.appDatabase?.dashBoardDao.findAllData();
  }

  getOrders() async {
    var response = await _provider
        .postRequest(_apiEndPoints.getOrders, {"user_id": userId});
    if (!response.status.hasError) {
      var result = jsonDecode(response.bodyString!);
      ordersDetails = OrdersDetails.fromJson(result);
      appDatabase?.ordersDao.insertAllData(ordersDetails!.data!);
    }
    loading.value = true;
  }
}
