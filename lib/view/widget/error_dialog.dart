import 'package:flutter/material.dart';

class ErrorDialog extends StatelessWidget {
  final String? message;

  const ErrorDialog({Key? key, this.message}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      key: key,
      content: Text(message!),
      actions: [
        SizedBox(
          width:100,

          child: ElevatedButton(
            style: ElevatedButton.styleFrom(

              primary: Colors.pink,
                shape: RoundedRectangleBorder( //to set border radius to button
                    borderRadius: BorderRadius.circular(30)
                ),

            ),

            onPressed: () {
              Navigator.pop(context);
            },
            child: const Center(

              child: Text(
                "Ok",
              ),
            ),
          ),
        ),
      ],
    );
  }
}
