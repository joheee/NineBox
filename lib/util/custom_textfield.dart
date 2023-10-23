import 'package:flutter/material.dart';
import 'package:mati_murup/config/variable.dart';

class CustomTextfield extends StatelessWidget {

  final String text;
  final Icon icon;

  const CustomTextfield({
    super.key,
    required this.text,
    required this.icon
  });

  @override
  Widget build(BuildContext context) {
    return TextField(
      decoration: InputDecoration(
        labelText: text, 
        hintText: 'Masukkan $text', 
        prefixIcon: icon, 
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: Variable.secondaryColor
          ), 
        ),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: Variable.secondaryColor
          ), 
        ),
      ),
      keyboardType: TextInputType.text, 
      obscureText: false, 
      maxLines: 1, 
    );
  }
}