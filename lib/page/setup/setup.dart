import 'package:flutter/material.dart';
import 'package:mati_murup/model/game.dart';
import 'package:mati_murup/page/bridge/bridge.dart';
import 'package:mati_murup/page/setup/setup_presenter.dart';
import 'package:mati_murup/util/custom_alert_dialog.dart';
import 'package:mati_murup/util/custom_page_change.dart';
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
  final List<String> winningList = [];

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
        CustomAlertDialog.showErrorDialog(context, 'nama pemain 1 tidak boleh kosong!','tutup',() => Navigator.pop(context));
        return;
      }
      
      if(secondPlayerString.isEmpty) {
        CustomAlertDialog.showErrorDialog(context, 'nama pemain 2 tidak boleh kosong!','tutup',() => Navigator.pop(context));
        return;
      }
      
      if(totalRoundString.isEmpty) {
        CustomAlertDialog.showErrorDialog(context, 'jumlah ronde tidak boleh kosong!','tutup',() => Navigator.pop(context));
        return;
      }
      
      if(!CustomValidation.isNumeric(totalRoundString)) {
        CustomAlertDialog.showErrorDialog(context, 'jumlah ronde harus berupa angka!','tutup',() => Navigator.pop(context));
        return;
      }
      
      if(int.parse(totalRoundString) < 1 || int.parse(totalRoundString) > 10) {
        CustomAlertDialog.showErrorDialog(context, 'jumlah ronde di antara 1-10!','tutup',() => Navigator.pop(context));
        return;
      }

      sharePref.then((value) {
        value.setString('firstPlayer', firstPlayerString);
        value.setString('secondPlayer', secondPlayerString);
        value.setString('totalRound', totalRoundString);
        value.setString('difficulty', difficulty);

        CustomPageChange.handleChange(
          context, 
          BridgePage(
            currRound: 1, 
            isFirstPlayer:true,
            winning: winningList,
            textRound: 1,
            game: Game(
              difficulty: difficulty,
              firstPlayer: firstPlayerString,
              secondPlayer: secondPlayerString,
              totalRound: int.parse(totalRoundString)
            ),
          )
        );
      });
    }

    return SetupPagePresenter(
      firstPlayer: firstPlayer, 
      secondPlayer: secondPlayer, 
      totalRound: totalRound, 
      onPressed: handleStart,
      onSelected: handleDropdown,
      list: list,
    );
  }
}
