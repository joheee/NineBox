
import 'package:flutter/material.dart';
import 'package:mati_murup/layout/button_layout.dart';
import 'package:mati_murup/layout/default_layout.dart';
import 'package:mati_murup/page/result/result.dart';
import 'package:mati_murup/util/custom_table_result.dart';
import 'package:mati_murup/util/custom_text.dart';

class ResultPresenter extends StatelessWidget {
  const ResultPresenter({
    super.key,
    required this.widget,
    required this.winningList,
    required this.onPlayGame,
    required this.onMainMenu,
  });

  final ResultPage widget;
  final List<String> winningList; 
  final Function() onPlayGame;
  final Function() onMainMenu;

  @override
  Widget build(BuildContext context) {
    return DefaultLayout(
      children: [

        const CustomText(
          text: 'Hasil Ronde',
          fontWeight: FontWeight.normal
        ),

        const SizedBox(height: 10.0),

        CustomText(
          text: '${widget.widget.game.firstPlayer} vs ${widget.widget.game.secondPlayer}', 
          fontWeight: FontWeight.bold
        ),

        const SizedBox(height: 30.0),
        
        CustomTableResult(
          winningList:winningList
        ),

        ButtonLayout(
          children: [
            ElevatedButton(
              onPressed: onPlayGame,
              child: const Text('main lagi'),
            ),
            ElevatedButton(
              onPressed: onMainMenu,
              child: const Text('menu utama'),
            ),
          ],
        ),
      ]
    );
  }
}
