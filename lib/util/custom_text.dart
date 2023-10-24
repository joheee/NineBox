import 'package:flutter/material.dart';

class CustomText extends StatelessWidget {
  final String text;
  final FontWeight fontWeight;
  const CustomText({
    super.key,
    required this.text,
    required this.fontWeight
  });

  @override
  Widget build(BuildContext context) {
    return  Text(
      text,
      style: TextStyle(
        fontSize: 20,
        fontWeight: fontWeight,
      ),
    );
  }
}