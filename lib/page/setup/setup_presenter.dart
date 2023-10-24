
import 'package:flutter/material.dart';
import 'package:mati_murup/config/variable.dart';
import 'package:mati_murup/layout/default_layout.dart';
import 'package:mati_murup/layout/form_layout.dart';
import 'package:mati_murup/util/custom_dropdown.dart';
import 'package:mati_murup/util/custom_text.dart';
import 'package:mati_murup/util/custom_textfield.dart';

class SetupPagePresenter extends StatelessWidget {
  const SetupPagePresenter({
    super.key,
    required this.firstPlayer,
    required this.secondPlayer,
    required this.totalRound,
    required this.list,
    required this.onSelected,
    required this.onPressed,
  });

  final TextEditingController firstPlayer;
  final TextEditingController secondPlayer;
  final TextEditingController totalRound;
  final List<String> list;
  final Function(String?) onSelected;
  final Function() onPressed;

  @override
  Widget build(BuildContext context) {
    return DefaultLayout(
      children: [

        const CustomText(
          text: 'Setup Permainan', 
          fontWeight: FontWeight.bold
        ),
        
        const SizedBox(height: 20.0),

        FormLayout(
          children: [

            CustomTextfield(
              text: "Pemain #1",
              icon: Icon(
                Icons.person,
                color: Variable.secondaryColor,
              ),
              controller: firstPlayer,
            ),

            const SizedBox(height: 10.0),

            CustomTextfield(
              text: "Pemain #2",
              icon: Icon(
                Icons.person,
                color: Variable.secondaryColor,
              ),
              controller: secondPlayer,
            ),

            const SizedBox(height: 10.0),
            
            CustomTextfield(
              text: "Jumlah Ronde",
              icon: Icon(
                Icons.play_arrow,
                color: Variable.secondaryColor,
              ),
              controller: totalRound,
            ),
          ]
        ),

        CustomDropdown(
          list: list,
          onSelected: onSelected,  
        ),

        const SizedBox(height: 20.0),

        ElevatedButton(
          onPressed: onPressed, 
          child: const Text('Mulai')
        )
      ],
    );
  }
}

