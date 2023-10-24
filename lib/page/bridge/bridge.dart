import 'package:flutter/material.dart';
import 'package:mati_murup/model/game.dart';
import 'package:mati_murup/page/bridge/bridge_presenter.dart';

// ignore: must_be_immutable
class BridgePage extends StatefulWidget {
  int currRound,textRound;
  bool isFirstPlayer;
  Game game;
  List<String> winning;

  BridgePage({
    super.key,
    required this.textRound,
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
    return BridgePagePresenter(
      widget:widget
    );
  }
}
