
import 'package:flutter/material.dart';
import 'package:mati_murup/layout/default_layout.dart';
import 'package:mati_murup/page/bridge.dart';
import 'package:mati_murup/page/game.dart';
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
      CustomPageChange.handleChange(
        context, 
        GamePage(
          currRound: widget.currRound,
          isFirstPlayer: widget.isFirstPlayer,
          game: widget.game,
          winning: widget.winning,
        )
      );
    }

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
        
        
        const Padding(
          padding: EdgeInsets.all(150.0),
          child: CustomText(
            text: 'Seimbang', 
            fontWeight: FontWeight.bold
          ),
        ),
        
        ElevatedButton(
          onPressed: handleClick, 
          child: Text('Lanjut Ronde ${currRound + 1}')
        )
      ]
    );
  }
}