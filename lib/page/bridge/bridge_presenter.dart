import 'package:flutter/material.dart';
import 'package:mati_murup/page/bridge/bridge.dart';
import 'package:mati_murup/util/custom_result_round.dart';
import 'package:mati_murup/util/custom_start_round.dart';

// ignore: must_be_immutable
class BridgePagePresenter extends StatelessWidget {
  BridgePage widget;
  
  BridgePagePresenter({
    super.key,
    required this.widget
  });

  @override
  Widget build(BuildContext context) {
    if(widget.currRound == 1 || widget.currRound % 2 == 0) {
      return CustomStartRound(widget: widget);
    }
    else {
      return CustomResultRound(widget: widget);
    }
  }
}