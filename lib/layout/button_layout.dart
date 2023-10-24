import 'package:flutter/material.dart';
import 'package:mati_murup/config/variable.dart';

class ButtonLayout extends StatelessWidget {
  final List<Widget> children;
  const ButtonLayout({
    super.key,
    required this.children
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: Variable.defaultPadding,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween, // Adjust the alignment as needed
        children: children
      ),
    );
  }
}