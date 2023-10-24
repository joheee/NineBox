import 'package:flutter/material.dart';
import 'package:mati_murup/layout/default_layout.dart';
import 'package:mati_murup/model/game.dart';
import 'package:mati_murup/util/custom_result_round.dart';
import 'package:mati_murup/util/custom_start_round.dart';
import 'package:mati_murup/util/custom_text.dart';

// ignore: must_be_immutable
class BridgePage extends StatefulWidget {
  int currRound;
  bool isFirstPlayer;
  Game game;
  List<String> winning;
  BridgePage({
    super.key,
    required this.currRound,
    required this.isFirstPlayer,
    required this.game,
    required this.winning,
  });

  @override
  State<BridgePage> createState() => _BridgePageState();
}

class _BridgePageState extends State<BridgePage> {
  @override
  Widget build(BuildContext context) {
    if(widget.currRound % 3 != 0) {
      return CustomStartRound(widget: widget);
    } else {
      return CustomResultRound(widget: widget);
    }
  }
}
