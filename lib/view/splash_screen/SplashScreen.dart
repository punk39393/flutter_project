import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:lottie/lottie.dart';
import 'package:project/global/global.dart';
import 'package:project/utils/Utils.dart';
import 'package:project/view/home/RiderDashBoard.dart';
import 'package:project/view/widget/LoadingWidget.dart';
import 'package:project/view/widget/loading_dialog.dart';
import 'package:rounded_loading_button/rounded_loading_button.dart';

import '../../res/app_colors/app_colors.dart';
import '../../res/strings/Strings.dart';
import '../authentication/login.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

/**Creating Instances of global needed classes  */
final RoundedLoadingButtonController _btnController =
    RoundedLoadingButtonController();
final Utils utils = Utils();

class _SplashScreenState extends State<SplashScreen>
    with TickerProviderStateMixin {
  late AnimationController _coffeeController;
  bool copAnimated = false;
  bool animateCafeText = false;

  selectScreens() async {
    if (sharedPreferences.getString('email') != null) {
      Get.to(RiderDashBoard());
    }
    //if not send to auth screen
    else {
      Get.to(LoginScreen());
    }
  }
  // startTimer() {
  //   Timer(
  //     const Duration(seconds: 6),
  //     () async {
  // if the user is already authenticate send user to home screen

  // },
  //   );
  // }

  @override
  void initState() {
    super.initState();
    _coffeeController = AnimationController(vsync: this);
    _coffeeController.addListener(() {
      if (_coffeeController.value > 0.7) {
        _coffeeController.stop();
        copAnimated = true;
        setState(() {});
        Future.delayed(const Duration(seconds: 1), () {
          animateCafeText = true;
          setState(() {});
        });
      }
    });

    // startTimer();
    selectScreens();
  }

  @override
  void dispose() {
    super.dispose();
    _coffeeController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var screenHeight = MediaQuery.of(context).size.height;
    var appName;
    return Scaffold(
      backgroundColor: AppColors.primaryColor,
      body: Stack(
        children: [
          // White Container top half
          AnimatedContainer(
            duration: const Duration(seconds: 1),
            height: copAnimated ? screenHeight / 1.9 : screenHeight,
            decoration: BoxDecoration(
              gradient: const LinearGradient(
                begin: FractionalOffset(-1.0, 0.0),
                end: FractionalOffset(5.0, -1.0),
                colors: [
                  Color(0xFFFFFFFF),
                  Color.fromARGB(255, 241, 235, 229),
                ],
              ),
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(30),
                bottomRight: Radius.circular(30),
              ),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Visibility(
                  visible: !copAnimated,
                  child: Lottie.asset(
                    'assets/images/rider_anim.json',
                    controller: _coffeeController,
                    onLoaded: (composition) {
                      _coffeeController
                        ..duration = composition.duration
                        ..forward();
                    },
                  ),
                ),
                Visibility(
                  visible: copAnimated,
                  child: Image.asset(
                    'assets/images/logo_coderootz.png',
                    height: 300.0,
                  ),
                ),
                Center(
                  child: AnimatedOpacity(
                    opacity: animateCafeText ? 1 : 0,
                    duration: const Duration(seconds: 1),
                  ),
                ),
              ],
            ),
          ),

          // Text bottom part
          Visibility(visible: copAnimated, child: const _BottomPart()),
        ],
      ),
    );
  }
}

class _BottomPart extends StatelessWidget {
  const _BottomPart({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.bottomCenter,
      child: Padding(
        padding: const EdgeInsets.only(top: 40, left: 10, right: 10),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const SizedBox(height: 30.0),
            Text(
              Strings.about_us,
              style: GoogleFonts.lato(
                fontSize: 15,
                fontWeight: FontWeight.normal,
                color: AppColors.white,
                height: 1.5,
              ),
            ),
            const SizedBox(height: 50.0),
            Align(
              alignment: Alignment.centerRight,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Text(
                    "Get Start ",
                    style: GoogleFonts.lato(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                  // Expanded(
                  //     child: utils.animatedRoundedButton(
                  //         'Get Started', _doSomething, _btnController)),

                  // Expanded(
                  //     child: utils.animatedRoundedButton(
                  //         'button two', _goToNextScreen, _btnController))

                  const SizedBox(width: 25),
                  GestureDetector(
                    onTap: () {
                      LoadingWidget();
                      Get.to(() => LoginScreen());
                    },
                    child: Container(
                      height: 85.0,
                      width: 85.0,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        border: Border.all(color: Colors.white, width: 2.0),
                      ),
                      child: const Icon(
                        Icons.chevron_right,
                        size: 50.0,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 50.0),
          ],
        ),
      ),
    );
  }
}

/** Go to next screen on button animation complete */
// _doSomething() async {
//   Timer(Duration(seconds: 2), () {
//     Get.to(() => LoginScreen());
//     _btnController.success();
//   });
// }

// _goToNextScreen() async {
//   Timer(Duration(seconds: 2), () {
//     utils.successSnackBar("succes", "working ");
//     _btnController.success();
//   });
//}
