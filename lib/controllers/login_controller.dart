import 'dart:convert';

import 'package:get/get.dart';
import 'package:project/api/api_exceptions.dart';
import 'package:project/localDB/appdatabase.dart';

import '../api/api_end_points.dart';
import '../api/base_api_provider.dart';
import '../global/global.dart';
import '../models/login_model.dart';
import '../models/post_model.dart';
import '../utils/Utils.dart';

class LoginController extends GetxController {
  var userResultData;
  LoginResponse? loginResponse;
  var posts = <PostModel>[].obs;
  // var userData = User;
  var loading = false.obs;
  RxBool success = false.obs;
  AppDatabase? appDatabase;

  ApiProvider _provider = ApiProvider();
  ApiEndPoints _apiEndPoints = ApiEndPoints();
  AppException _appException = AppException();
  Utils utils = Utils();



  loginUsingEmail(String email, String password) async {
    loading(true);
    var response = await _provider.postRequest(_apiEndPoints.loginUsingEmail, {
      'email': email,
      'password': password,
      'device_token': 'werfqwefvsdfvsv2135234',
    });

    if (response.statusCode == 200) {
      try {
        // Map<String, dynamic> userMap = jsonDecode(response.body);
        // var user = User.fromJson(userMap);
        var result = jsonDecode(response.bodyString!);
        loginResponse = LoginResponse.fromJson(result);

        if (loginResponse!.isSuccessful == true) {
          loading(true);
          success.value = true;
          sharedPreferences.setString('user_id', loginResponse!.user!.id!);
          // adding data model to localDB(This is )
          final userDao = appDatabase?.userDao;
          await userDao?.insertUser(loginResponse!.user!);
          utils.successSnackBar('Success', 'successfully logged in');
        } else {
          utils.errorSnackBar("Failure", loginResponse!.message.toString());
          loading(false);
          success.value = false;
        }

        // var loginDataAsMap = LoginResponse(Map);
        // String jsonString = jsonEncode(loginDataAsMap);
        // await userDetails.write('userDetails', jsonString);
      } on Exception catch (e) {
        utils.errorSnackBar("Error", e.toString());
      }

      // // fetching  data from  model to localDB
      // userResultData = userDetails.read('userDetails');
      // dynamic jsonData = jsonDecode(userResultData);
      // userData = jsonData.map((login_data) => User.fromJson(login_data)).obs;
    }
  }
}
