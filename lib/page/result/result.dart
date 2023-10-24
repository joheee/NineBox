import 'package:flutter/material.dart';
import 'package:mati_murup/model/game.dart';
import 'package:mati_murup/page/bridge/bridge.dart';
import 'package:mati_murup/page/result/result_presenter.dart';
import 'package:mati_murup/page/setup/setup.dart';
import 'package:mati_murup/util/custom_page_change.dart';
import 'package:shared_preferences/shared_preferences.dart';

// ignore: must_be_immutable
class ResultPage extends StatefulWidget {
  
  BridgePage widget;
  
  ResultPage({
    super.key,
    required this.widget
  });

  @override
  State<ResultPage> createState() => _ResultPageState();
}

class _ResultPageState extends State<ResultPage> {
  Future<SharedPreferences> sharePref = SharedPreferences.getInstance();
  List<String> winningList = [];
  String firstPlayerString = '';
  String secondPlayerString = '';
  String totalRoundString = '';
  String difficulty = '';

  @override
  void initState() {
    super.initState();
    sharePref.then((SharedPreferences prefs) {
      firstPlayerString = prefs.getString('firstPlayer') ?? '';
    });
    sharePref.then((SharedPreferences prefs) {
      secondPlayerString = prefs.getString('secondPlayer') ?? '';
    });
    sharePref.then((SharedPreferences prefs) {
      totalRoundString = prefs.getString('totalRound') ?? '1';
    });
    sharePref.then((SharedPreferences prefs) {
      difficulty = prefs.getString('difficulty') ?? 'Gampang';
    });
  }

  @override
  Widget build(BuildContext context) {

    void handlePlayGame(){
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
    }
    
    void handleMainMenu(){
      CustomPageChange.handleChange(
        context, 
        const SetupPage()
      );
    }

    List<String> generateWinningList(){
      List<String> list = [];
      for(int i=1; i<widget.widget.winning.length; i+=2) {
        String right = widget.widget.winning[i];
        String left = widget.widget.winning[i-1];
        if(right == left) {
          list.add(right);
        } else {
          list.add('Seimbang');
        }
      }      
      return list;
    }

    return ResultPresenter(
      widget: widget,
      winningList: generateWinningList(),
      onMainMenu: handleMainMenu,
      onPlayGame: handlePlayGame,
    );
  }
}