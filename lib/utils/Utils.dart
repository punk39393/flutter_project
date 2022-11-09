import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rounded_loading_button/rounded_loading_button.dart';
import '../res/app_colors/AppColors.dart';

class Utils extends GetxController {
 

  final RoundedLoadingButtonController _btnController =
      RoundedLoadingButtonController();

      

  /** success snackBar this requires title and message in return */
  successSnackBar(String title, String message) {
    Get.snackbar(title, message,
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.green,
        colorText: Colors.white);
  }

  /** error snackBar this requires title and message in return */
  errorSnackBar(String title, String message) {
    Get.snackbar(title, message,
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.red,
        colorText: Colors.white);
  }

  /** Global Animated  rounded Button  */
  animatedRoundedButton(
    String? title, void Function() doSomething,  RoundedLoadingButtonController roundedLoadingButtonController
    
  ){
    return RoundedLoadingButton(
        child: Text(title!,
            style: TextStyle(
              color: Colors.white,
            )),
        color: AppColors.mainColor,
        controller: roundedLoadingButtonController,
        successColor: AppColors.green,
        onPressed:  doSomething,
       );
  }

  

}
