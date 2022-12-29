import 'package:flutter/material.dart';

import 'progress_bar.dart';

class LoadingDialog extends StatelessWidget {
  final String? message;
   final Function() clickListener;

  const LoadingDialog( {Key? key, this.message, required this.clickListener}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      key: key,
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          circularProgress(),
          const SizedBox(height: 10),
          Text(message! + ',\nPlease wait...'),
        ],
        
      ),
       actions: [
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              primary: Colors.pink,
              shape: RoundedRectangleBorder(
                  //to set border radius to button
                  borderRadius: BorderRadius.circular(30)),
            ),
            onPressed:clickListener,
            child: const Center(
              child: Text(
                "Ok",
              ),
            ),
          ),
            ],
        
    );
  }
}
