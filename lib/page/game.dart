import 'dart:async';

import 'package:flutter/material.dart';
import 'package:mati_murup/layout/default_layout.dart';
import 'package:mati_murup/model/game.dart';
import 'package:mati_murup/util/custom_game.dart';
import 'package:mati_murup/util/custom_game_tile.dart';
import 'package:mati_murup/util/custom_text.dart';
import 'package:shared_preferences/shared_preferences.dart';

class GamePage extends StatefulWidget {
  final int currRound;
  final bool isFirstPlayer;
  final Game game;

  const GamePage({
    super.key,
    required this.currRound,
    required this.isFirstPlayer,
    required this.game,
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
    return DefaultLayout(
      children: [

        CustomText(
          text: 'Giliran ${widget.game.firstPlayer}', 
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
          onTap: (int i) {
            print(i);
          },
        ),
        
        CustomText(
          text: 'Ronde ${widget.currRound}', 
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
