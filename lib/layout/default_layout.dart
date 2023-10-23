import 'package:flutter/material.dart';
import 'package:mati_murup/config/variable.dart';

class DefaultLayout extends StatelessWidget {
  final List<Widget> children;
  const DefaultLayout({
    super.key, 
    required this.children
  });

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Variable.primaryColor,
        body: Center(
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: children
            ),
          ),
        )
      ),
    );
  }
}