import 'package:flutter/material.dart';

class CustomPageChange {
  static void handleChange(BuildContext context, Widget widget){
    Navigator.pushReplacement(
      context,
      PageRouteBuilder(
        transitionDuration: const Duration(milliseconds: 500), 
        pageBuilder: (context, animation, secondaryAnimation) {
          return FadeTransition(
            opacity: animation,
            child: widget
          );
        },
      ),
    );
  }
}