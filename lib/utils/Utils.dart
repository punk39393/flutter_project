import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rounded_loading_button/rounded_loading_button.dart';
import '../res/app_colors/app_colors.dart';

class Utils extends GetxController {
  final RoundedLoadingButtonController _btnController =
      RoundedLoadingButtonController();

   late BuildContext context;

  /** success snackBar this requires title and message in return */
  successSnackBar(String title, String message) {
    Get.snackbar(title, message,
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.green,
        duration: const Duration(seconds: 2),
    
        colorText: Colors.white);
  }

  /** error snackBar this requires title and message in return */
  errorSnackBar(String title, String message) {
    Get.snackbar(
      title,
      message,
      snackPosition: SnackPosition.BOTTOM,
      backgroundColor: Colors.red,
      duration: const Duration(seconds: 2),
      colorText: Colors.white,
    );
  }

  /**  Animated  rounded Button  */
  animatedRoundedButton(String? title, void Function() doSomething,
      RoundedLoadingButtonController roundedLoadingButtonController) {
    return RoundedLoadingButton(
      child: Text(title!,
          style: TextStyle(
            color: Colors.white,
          )),
      color: AppColors.mainColor,
      controller: roundedLoadingButtonController,
      successColor: AppColors.green,
      onPressed: doSomething,
    );
  }

  errorDialog(String? title, void Function() clickListener) {
    return AlertDialog(content: Text(title!), actions: [
      SizedBox(
        width: 100,
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            primary: Colors.pink,
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
          ),
          onPressed: clickListener,
          child: const Center(
            child: Text(
              "Ok",
            ),
          ),
        ),
      ),
    ]);
  }

  static void loadingDialog() {
    closeDialog();
    Get.dialog(
      const Center(
        child: CircularProgressIndicator(),
      ),
      name: 'loadingDialog',
    );
  }

  static void closeDialog() {
    if (Get.isDialogOpen == true) {
     Get.back;
    }
  }

  boxDacoration(){

    return BoxDecoration(
      borderRadius: BorderRadius.circular(5),
      // color: AppColors.mainColorTwo,
      gradient: const LinearGradient(
        begin: FractionalOffset(-2.0, 1.0),
        end: FractionalOffset(1.0, 2.0),
        colors: [
          AppColors.mainColor,
          AppColors.mainColorTwo,
        ],
      ),
      boxShadow: const [
        BoxShadow(
          color: Colors.grey,
          blurRadius: 3,
          offset: Offset(4, 3),
        )
      ],
    );
  }

  baseContainer(IconData iconData,String title,String count){
    return Container (
        decoration:BoxDecoration(
          borderRadius: BorderRadius.circular(100),
          color: AppColors.mainColorTwo,
          gradient: const LinearGradient(
            begin: FractionalOffset(-2.0, 1.0),
            end: FractionalOffset(1.0, 2.0),
            colors: [
              AppColors.mainColor,
              AppColors.mainColorTwo,
            ],
          ),
        ),

        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          verticalDirection: VerticalDirection.down,
          children: [
            const SizedBox(height: 10),
            Center(
              child: Icon(
                iconData,
                size: 40,
                color: AppColors.white,
              ),
            ),
            const SizedBox(height: 20),
            Center(
              child: Text(
                title,
                style: const TextStyle(
                  fontSize: 16,
                  color: AppColors.white,
                ),
              ),
            ),
            const SizedBox(height: 20),
            Center(
              child: Text(
                count,
                style: const TextStyle(
                  fontSize: 16,
                  color: AppColors.white,
                ),
              ),
            )],
        )
    );
  }

  elevatedButton(void Function() clickListener,void Function() longClickListener){
   return  ElevatedButton(
        style: ElevatedButton.styleFrom(
          primary: Colors.blue, //button's fill color
          onPrimary: Colors.red, //specify the color of the button's text and icons as well as the overlay colors used to indicate the hover, focus, and pressed states
          onSurface: Colors.orange, //specify the button's disabled text, icon, and fill color
          shadowColor: Colors.black, //specify the button's elevation color
          elevation: 4.0, //buttons Material shadow
          textStyle: TextStyle(fontFamily: 'roboto'), //specify the button's text TextStyle
          padding: const EdgeInsets.only(top: 4.0, bottom: 4.0, right: 8.0, left: 8.0), //specify the button's Padding
          minimumSize: Size(20, 40), //specify the button's first: width and second: height
          side: BorderSide(color: Colors.yellow, width: 2.0, style: BorderStyle.solid), //set border for the button
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(35.0)), // set the buttons shape. Make its birders rounded etc
          enabledMouseCursor: MouseCursor.defer, //used to construct ButtonStyle.mouseCursor
          disabledMouseCursor: MouseCursor.uncontrolled, //used to construct ButtonStyle.mouseCursor
          visualDensity: VisualDensity(horizontal: 0.0, vertical: 0.0), //set the button's visual density
          tapTargetSize: MaterialTapTargetSize.padded, // set the MaterialTapTarget size. can set to: values, padded and shrinkWrap properties
          animationDuration: Duration(milliseconds: 100), //the buttons animations duration
          enableFeedback: true, //to set the feedback to true or false
          alignment: Alignment.bottomCenter, //set the button's child Alignment
        ),
        onPressed: clickListener, //set both onPressed and onLongPressed to null to see the disabled properties
        onLongPress: longClickListener, //set both onPressed and onLongPressed to null to see the disabled properties
        child: Text('ElevatedButton')
    );
  }
}
