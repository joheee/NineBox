
import 'package:flutter/material.dart';
import 'package:mati_murup/layout/default_layout.dart';
import 'package:mati_murup/page/bridge/bridge.dart';
import 'package:mati_murup/page/game/game.dart';
import 'package:mati_murup/page/result/result.dart';
import 'package:mati_murup/util/custom_page_change.dart';
import 'package:mati_murup/util/custom_text.dart';

class CustomResultRound extends StatelessWidget {
  const CustomResultRound({
    super.key,
    required this.widget,
  });

  final BridgePage widget;

  @override
  Widget build(BuildContext context) {
    
    int currRound = (widget.currRound / 2).floor();

    void handleClick(){
      if(widget.winning.length < widget.game.totalRound! * 2) {
        CustomPageChange.handleChange(
          context, 
          GamePage(
            currRound: widget.currRound,
            isFirstPlayer: widget.isFirstPlayer,
            game: widget.game,
            winning: widget.winning,
            textRound: widget.textRound + 1,
          )
        );
      } else {
        CustomPageChange.handleChange(
          context, 
          ResultPage(widget: widget,
          )
        );
      }
    }

    int right = widget.currRound - 2;
    int left = right - 1;


    return DefaultLayout(
      children: [

        CustomText(
          text: 'Hasil Ronde $currRound (Level: ${widget.game.difficulty})', 
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
            text: widget.winning[right] == widget.winning[left] ? '${widget.winning[right]} menang' : 'seimbang', 
            fontWeight: FontWeight.bold
          ),
        ),
        
        ElevatedButton(
          onPressed: handleClick, 
          child: const Text('Lanjut Bermain')
        )
      ]
    );
  }
}