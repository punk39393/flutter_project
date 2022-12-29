// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:project/res/app_colors/app_colors.dart';

class CustomAppBar extends StatefulWidget implements PreferredSizeWidget {
   String? appBar_title;

   CustomAppBar({
    Key? key,
    this.appBar_title,
  }) : super(key: key);

   @override
  Size preferredSize = Size.fromHeight(kToolbarHeight);

  // @override
  // final Size preferredSize; // default is 56.0

  @override
  _CustomAppBarState createState() => _CustomAppBarState();
}

class _CustomAppBarState extends State<CustomAppBar> {
  bool _isOn = true;
  
  
  void toggle() {
    setState(() => _isOn = !_isOn);
  }

  @override
  Widget build(BuildContext context) {
    return AppBar(
        elevation: 0,
        flexibleSpace: Container(
          decoration: const BoxDecoration(
            color: AppColors.mainColorTwo
            // gradient: LinearGradient(
            //   begin: FractionalOffset(-1.0, 3.0),
            //   end: FractionalOffset(1.0, -1.0),
            //   colors: [
            //     AppColors.mainColor,
            //     AppColors.mainColorTwo,
            //   ],
            // ),
          ),
        ),
        title: Text(
          widget.appBar_title!,
          style: GoogleFonts.lato(
            textStyle: const TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
        ),
        centerTitle: true,
        automaticallyImplyLeading: true,
        iconTheme: const IconThemeData(
          color: Colors.white,
        ),
        
        actions: [
          
          Switch(
            value: _isOn,
            activeColor: AppColors.green,
            onChanged: (bool value) {
              toggle();
            },
          ),
        ]);
  }
}
