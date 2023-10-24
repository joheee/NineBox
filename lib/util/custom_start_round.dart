
import 'package:flutter/material.dart';
import 'package:mati_murup/layout/default_layout.dart';
import 'package:mati_murup/page/bridge/bridge.dart';
import 'package:mati_murup/page/game/game.dart';
import 'package:mati_murup/util/custom_page_change.dart';
import 'package:mati_murup/util/custom_text.dart';

class CustomStartRound extends StatelessWidget {
  const CustomStartRound({
    super.key,
    required this.widget,
  });

  final BridgePage widget;

  @override
  Widget build(BuildContext context) {

    String currPlayer = (widget.isFirstPlayer ? widget.game.firstPlayer : widget.game.secondPlayer)!;

    void handleClick(){
      CustomPageChange.handleChange(
        context, 
        GamePage(
          currRound: widget.currRound,
          isFirstPlayer: widget.isFirstPlayer,
          game: widget.game,
          winning: widget.winning,
          textRound: widget.textRound,
        )
      );
    }
    return DefaultLayout(
      children: [

        CustomText(
          text: 'Mulai permainan (Level: ${widget.game.difficulty})', 
          fontWeight: FontWeight.normal
        ),

        const SizedBox(height: 10.0),

        CustomText(
          text: '${widget.game.firstPlayer} vs ${widget.game.secondPlayer}', 
          fontWeight: FontWeight.bold
        ),
        
        
        Padding(
          padding: const EdgeInsets.fromLTRB(0,150.0,0,150.0),
          child: CustomText(
            text: 'Sekarang Giliran $currPlayer', 
            fontWeight: FontWeight.bold
          ),
        ),
        
        ElevatedButton(
          onPressed: handleClick, 
          child: const Text('Mulai Bermain')
        )
      ]
    );
  }
}