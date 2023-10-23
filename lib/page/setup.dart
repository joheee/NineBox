import 'package:flutter/material.dart';
import 'package:mati_murup/config/variable.dart';

class SetupPage extends StatelessWidget {
  const SetupPage({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Variable.primaryColor,
        body: const SizedBox(),
      ),
    );
  }
}