import 'package:flutter/material.dart';
import 'package:mati_murup/config/variable.dart';

class FormLayout extends StatelessWidget {
  
  final List<Widget> children;
  
  const FormLayout({
    super.key,
    required this.children
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
          padding: Variable.defaultPadding,
          child: Column(
            children: children
          ),
        );
  }
}