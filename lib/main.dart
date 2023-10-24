import 'package:flutter/material.dart';
import 'package:mati_murup/page/setup/setup.dart';

void main() {
  runApp(const MaterialApp(
    home: MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const SetupPage();
  }
}
