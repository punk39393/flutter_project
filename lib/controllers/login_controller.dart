import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:project/api/api_exceptions.dart';

import '../api/api_end_points.dart';
import '../api/base_api_provider.dart';
import '../models/post_model.dart';
import '../utils/Utils.dart';

class LoginController extends GetxController {
  @override
  void onReady() {
    super.onReady();
    getPosts();
  }

  var posts = <PostModel>[].obs;
  var loading = false.obs;
  RxBool success = false.obs;

  ApiProvider _provider = ApiProvider();
  ApiEndPoints _apiEndPoints = ApiEndPoints();
  AppException _appException = AppException();
  Utils utils = Utils();

  getPosts() async {
    loading(true);
    var response = await _provider.getRequest();
    if (!response.status.hasError) {
      posts.value = postModelFromJson(response.bodyString!);
    }
    loading(false);
  }

  loginUsingEmail(String email, String password) async {
    loading(true);
    success.value = false;
    var response = await _provider.postRequest(_apiEndPoints.loginUsingEmail, {
      'email': email,
      'password': password,
      'device_token': 'werfqwefvsdfvsv2135234',
    });
    if (response.statusCode == 200) {
      loading(false);
      success.value = true;
      if (!response.status.hasError) {
        utils.successSnackBar('Success', 'successfully logged in');
      }
    }
  }
}
