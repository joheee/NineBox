import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:mati_murup/layout/default_layout.dart';
import 'package:mati_murup/model/game.dart';
import 'package:mati_murup/page/bridge.dart';
import 'package:mati_murup/util/custom_alert_dialog.dart';
import 'package:mati_murup/util/custom_game.dart';
import 'package:mati_murup/util/custom_game_tile.dart';
import 'package:mati_murup/util/custom_page_change.dart';
import 'package:mati_murup/util/custom_text.dart';
import 'package:shared_preferences/shared_preferences.dart';

// ignore: must_be_immutable
class GamePage extends StatefulWidget {
  int currRound,textRound;
  bool isFirstPlayer;
  Game game;
  List<String> winning;

  GamePage({
    super.key,
    required this.textRound,
    required this.currRound,
    required this.isFirstPlayer,
    required this.game,
    required this.winning,
  });

  @override
  State<GamePage> createState() => _GamePageState();
}
class _GamePageState extends State<GamePage> {

  final Future<SharedPreferences> sharePref = SharedPreferences.getInstance();
  final Map<String, int> difficultyMap = {
    "Gampang":5,
    "Sedang":8,
    "Susah":12,
  };

  List<int> patterns = [];
  bool isFinishPattern = false;
  int currBox = 3;

  @override
  void initState() {
    super.initState();
    patterns = CustomGame.generateRandomNumber(difficultyMap[widget.game.difficulty]!);
    tileDemo();
  } 

  Future<void> tileDemo() async {
    for(int i=0; i<patterns.length;i++){
      setState(() {
        currBox = patterns[i];
      });
      await Future.delayed(const Duration(milliseconds: 500));
      setState(() {
        currBox = 9;
      });
      await Future.delayed(const Duration(milliseconds: 300));

      if(i == patterns.length - 1) {
        setState(() {
          isFinishPattern = true;
        });
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    
    String? currPlayer = widget.isFirstPlayer ? widget.game.firstPlayer : widget.game.secondPlayer;
    String? otherPlayer = !widget.isFirstPlayer ? widget.game.firstPlayer : widget.game.secondPlayer;

    void handleOnTap(int i) {
      if(i == patterns[0]) {
        patterns.removeAt(0);
        if (patterns.isEmpty) {
          widget.winning.add(currPlayer!);
          CustomPageChange.handleChange(
            context, 
            BridgePage(
              currRound: widget.currRound + 1,
              isFirstPlayer: !widget.isFirstPlayer,
              game: widget.game,
              winning: widget.winning,
              textRound: widget.textRound,
            )
          );
        }
      } else {
        CustomAlertDialog.showErrorDialog(context, 'Sayang sekali $currPlayer, kamu menekan urutan yang salah', 'ok',()  {
          Navigator.pop(context);
          widget.winning.add(otherPlayer!);
          CustomPageChange.handleChange(
            context, 
            BridgePage(
              currRound: widget.currRound + 1,
              isFirstPlayer: !widget.isFirstPlayer,
              game: widget.game,
              winning: widget.winning,
              textRound: widget.textRound,
            )
          );
        });
      }
    }


    return DefaultLayout(
      children: [

        CustomText(
          text: 'Giliran $currPlayer', 
          fontWeight: FontWeight.normal
        ),

        const SizedBox(height: 20.0),

        const CustomText(
          text: 'Hapalkan Polanya', 
          fontWeight: FontWeight.bold
        ),

        CustomGameTile(
          curr: currBox,
          isFinishPattern:isFinishPattern,
          onTap: handleOnTap,
        ),
        
        CustomText(
          text: 'Ronde ${widget.textRound}', 
          fontWeight: FontWeight.normal
        ),
        
        const SizedBox(height: 20.0),

        CustomText(
          text: 'Level: ${widget.game.difficulty}', 
          fontWeight: FontWeight.normal
        ),
      ]
    );
  }
}
