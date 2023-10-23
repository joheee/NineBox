import 'package:flutter/material.dart';
import 'package:mati_murup/config/variable.dart';
import 'package:mati_murup/layout/default_layout.dart';
import 'package:mati_murup/layout/form_layout.dart';
import 'package:mati_murup/util/custom_textfield.dart';

class SetupPage extends StatelessWidget {
  const SetupPage({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultLayout(
      children: [

        const Text(
          'Setup Permainan',
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),

        FormLayout(
          children: [
            CustomTextfield(
              text: "Pemain #1",
              icon: Icon(
                Icons.person,
                color: Variable.secondaryColor,
              ),
            ),
            const SizedBox(height: 10.0),
            CustomTextfield(
              text: "Pemain #2",
              icon: Icon(
                Icons.person,
                color: Variable.secondaryColor,
              ),
            ),
            const SizedBox(height: 10.0),
            CustomTextfield(
              text: "Jumlah Ronde",
              icon: Icon(
                Icons.person,
                color: Variable.secondaryColor,
              ),
            ),
          ]
        ),

      ],
    );
  }
}

