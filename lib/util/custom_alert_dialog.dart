import 'package:flutter/material.dart';
import 'package:mati_murup/config/variable.dart';

class CustomAlertDialog{
  static void showErrorDialog(BuildContext context, String errorMessage, String closeMessage, Function() onPressed) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return Dialog(
          child: Padding(
            padding: Variable.defaultPadding,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(errorMessage),
                const SizedBox(height: 10.0,),
                ElevatedButton(
                  onPressed: onPressed, 
                  child: Text(closeMessage)
                )
              ],
            )
          )
        );
      },
    );
  }
  
}