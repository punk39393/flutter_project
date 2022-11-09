
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intro_slider/intro_slider.dart';
import 'package:intro_slider/slide_object.dart';
import 'package:intro_slider/scrollbar_behavior_enum.dart';

import '../../res/app_colors/AppColors.dart';
import '../../res/strings/Strings.dart';
import '../authentication/login.dart';


class IntroScreen extends StatefulWidget {
  @override
  _IntroScreenState createState() => _IntroScreenState();
}
 
class _IntroScreenState extends State<IntroScreen> {
   
  // creating List of Slide objects
  // to store data of all intro slides
  List<Slide> slides = [];
 
  @override
  void initState() {
    super.initState();
     
    // initializing slides at
    // the runtime of app
    slides.add(
      new Slide(
        title:  Strings.appName,
        maxLineTitle: 2,
        styleTitle: TextStyle(
          color: AppColors.white,
          fontSize: 30.0,
          fontWeight: FontWeight.bold,
        ),
        description:
           Strings.about_us,
        styleDescription: TextStyle(
          color: AppColors.white,
          fontSize: 20.0,
        ),
        marginDescription:
            EdgeInsets.only(left: 20.0,
                            right: 20.0,
                            top: 20.0,
                            bottom: 70.0),
        backgroundColor: AppColors.mainColor,
        // backgroundImage: "assets/images/confirm_pick.png",
        // backgroundImageFit: BoxFit.fill,
        directionColorBegin: Alignment.topLeft,
        directionColorEnd: Alignment.bottomRight,
        onCenterItemPress: () {},
        pathImage: "assets/images/confirm_pick.png"
       
      ),
    );
    slides.add(
      new Slide(
        title: "Second Slide",
        styleTitle: TextStyle(
          color: Colors.white,
          fontSize: 30.0,
          fontWeight: FontWeight.bold,
        ),
        description: "Do video call anywhere anytime with this app.",
        styleDescription: TextStyle(
          color: Colors.white,
          fontSize: 20.0,
        ),
        
        backgroundColor: AppColors.mainColorTwo,
        pathImage: "assets/images/confirm_pick1.png",
        directionColorBegin: Alignment.topRight,
        directionColorEnd: Alignment.bottomLeft,
      ),
    );
    slides.add(
      new Slide(
        title: "Third Slide",
        styleTitle: TextStyle(
          color: Colors.white,
          fontSize: 30.0,
          fontWeight: FontWeight.bold,
        ),
        description: "Now track the location with this app easily.",
        styleDescription: TextStyle(
          color: Colors.white,
          fontSize: 20.0,
        ),
        pathImage: "assets/images/confirm2.png",
        backgroundColor: AppColors.mainColor,
        directionColorBegin: Alignment.topCenter,
        directionColorEnd: Alignment.bottomCenter,
        maxLineTextDescription: 3,
      ),
    );
  }
 
  @override
  Widget build(BuildContext context) {
    return new IntroSlider(
       
      // List slides
      slides: this.slides,
 
      // Skip button
      renderSkipBtn: TextButton(
          onPressed: () {},
          child: Text(
            "Skip",
            style: TextStyle(fontSize: 20,color:AppColors.white),
          )),
 
      // Next button
      renderNextBtn: Icon(
        Icons.navigate_next,
        color: AppColors.white,
        size: 40.0,
      ),
      // Done button
      renderDoneBtn: ElevatedButton(
          onPressed: () {
            Get.to(LoginScreen());
          },
          child: Text("Done",
                      style: TextStyle(fontSize: 15,
                      )
                      )),
 
      // Dot indicator
      colorDot: AppColors.grey,
      colorActiveDot: AppColors.white,
      sizeDot: 8.0,
 
      // Show or hide status bar
      hideStatusBar: true,
      backgroundColorAllSlides: AppColors.white,
 
      // Scrollbar
      verticalScrollbarBehavior: scrollbarBehavior.SHOW_ALWAYS,
    );
  }
}