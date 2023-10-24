import 'package:flutter/material.dart';
import 'package:mati_murup/config/variable.dart';
import 'package:mati_murup/layout/default_layout.dart';
import 'package:mati_murup/layout/form_layout.dart';
import 'package:mati_murup/page/game.dart';
import 'package:mati_murup/util/custom_alert_dialog.dart';
import 'package:mati_murup/util/custom_dropdown.dart';
import 'package:mati_murup/util/custom_text.dart';
import 'package:mati_murup/util/custom_textfield.dart';
import 'package:mati_murup/util/custom_validation.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SetupPage extends StatefulWidget {
  const SetupPage({super.key});
  @override
  State<SetupPage> createState() => _SetupPageState();
}

class _SetupPageState extends State<SetupPage> {
  
  final Future<SharedPreferences> sharePref = SharedPreferences.getInstance();
  final List<String> list = <String>['Gampang', 'Sedang', 'Susah'];
  TextEditingController firstPlayer = TextEditingController();
  TextEditingController secondPlayer = TextEditingController();
  TextEditingController totalRound = TextEditingController();
  String difficulty = 'Gampang';

  @override
  void initState() {
    super.initState();
    sharePref.then((SharedPreferences prefs) {
      firstPlayer.text = prefs.getString('firstPlayer') ?? '';
    });
    sharePref.then((SharedPreferences prefs) {
      secondPlayer.text = prefs.getString('secondPlayer') ?? '';
    });
    sharePref.then((SharedPreferences prefs) {
      totalRound.text = prefs.getString('totalRound') ?? '1';
    });
    sharePref.then((SharedPreferences prefs) {
      difficulty = prefs.getString('difficulty') ?? 'Gampang';
    });
  }

  @override
  Widget build(BuildContext context) {

    void handleDropdown(String? t) {
      difficulty = t!;
    }    

    void handleStart() {
      String firstPlayerString = firstPlayer.text;
      String secondPlayerString = secondPlayer.text;
      String totalRoundString = totalRound.text;

      if(firstPlayerString.isEmpty) {
        CustomAlertDialog.showErrorDialog(context, 'nama pemain 1 tidak boleh kosong!');
        return;
      }
      
      if(secondPlayerString.isEmpty) {
        CustomAlertDialog.showErrorDialog(context, 'nama pemain 2 tidak boleh kosong!');
        return;
      }
      
      if(totalRoundString.isEmpty) {
        CustomAlertDialog.showErrorDialog(context, 'jumlah ronde tidak boleh kosong!');
        return;
      }
      
      if(!CustomValidation.isNumeric(totalRoundString)) {
        CustomAlertDialog.showErrorDialog(context, 'jumlah ronde harus berupa angka!');
        return;
      }
      
      if(int.parse(totalRoundString) < 1 || int.parse(totalRoundString) > 10) {
        CustomAlertDialog.showErrorDialog(context, 'jumlah ronde di antara 1-10!');
        return;
      }

      // STORE TO SHAREPREFS
      sharePref.then((value) {
        value.setString('firstPlayer', firstPlayerString);
        value.setString('secondPlayer', secondPlayerString);
        value.setString('totalRound', totalRoundString);
        value.setString('difficulty', difficulty);

        Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => const GamePage(currRound: 1, isFirstPlayer:true)));
      });
    }

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
          onSelected: handleDropdown,  
        ),

        const SizedBox(height: 20.0),

        ElevatedButton(
          onPressed: handleStart, 
          child: const Text('Mulai')
        )
      ],
    );
  }
}

