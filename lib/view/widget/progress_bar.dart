import 'package:flutter/material.dart';
import 'package:project/res/app_colors/app_colors.dart';


circularProgress() {
  return Container(
    alignment: Alignment.center,
    padding: const EdgeInsets.only(top: 12),
    child: const CircularProgressIndicator(
      valueColor: AlwaysStoppedAnimation(
       AppColors.mainColor,
      ),
    ),
  );
}
