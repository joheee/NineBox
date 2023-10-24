import 'package:flutter/material.dart';
import 'package:mati_murup/layout/default_layout.dart';
import 'package:mati_murup/page/game/game.dart';
import 'package:mati_murup/util/custom_game_tile.dart';
import 'package:mati_murup/util/custom_text.dart';

class GamePagePresenter extends StatelessWidget {
  const GamePagePresenter({
    super.key,
    required this.currPlayer,
    required this.currBox,
    required this.isFinishPattern,
    required this.widget,
    required this.onTap,
  });

  final String? currPlayer;
  final int currBox;
  final bool isFinishPattern;
  final GamePage widget;
  final Function(int) onTap;

  @override
  Widget build(BuildContext context) {
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
          onTap: onTap,
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
