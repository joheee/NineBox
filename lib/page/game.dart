import 'package:flutter/material.dart';
import 'package:mati_murup/layout/default_layout.dart';
import 'package:mati_murup/util/custom_game_tile.dart';
import 'package:mati_murup/util/custom_text.dart';
import 'package:shared_preferences/shared_preferences.dart';

class GamePage extends StatefulWidget {
  final int currRound;
  final bool isFirstPlayer;

  const GamePage({
    super.key,
    required this.currRound,
    required this.isFirstPlayer,
  });

  @override
  State<GamePage> createState() => _GamePageState();
}
class _GamePageState extends State<GamePage> {

  final Future<SharedPreferences> sharePref = SharedPreferences.getInstance();
  
  int currBox = 3;
  String firstPlayer = '';
  String secondPlayer = '';
  int totalRound = 1;
  String difficulty = '';

  @override
  void initState() {
    super.initState();
    sharePref.then((SharedPreferences prefs) {
      setState(() {
        firstPlayer = prefs.getString('firstPlayer') ?? '';
      });
    });
    sharePref.then((SharedPreferences prefs) {
      setState(() {
        secondPlayer = prefs.getString('secondPlayer') ?? '';
      });
    });
    sharePref.then((SharedPreferences prefs) {
      setState(() {
        totalRound = prefs.getInt('totalRound') ?? 1;
      });
    });
    sharePref.then((SharedPreferences prefs) {
      setState(() {
        difficulty = prefs.getString('difficulty') ?? 'Gampang';
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return DefaultLayout(
      children: [

        CustomText(
          text: 'Giliran $firstPlayer', 
          fontWeight: FontWeight.normal
        ),

        const SizedBox(height: 20.0),

        const CustomText(
          text: 'Hapalkan Polanya', 
          fontWeight: FontWeight.bold
        ),

        CustomGameTile(
          curr: currBox,
        ),
        
        CustomText(
          text: 'Ronde ${widget.currRound}', 
          fontWeight: FontWeight.normal
        ),
        const SizedBox(height: 20.0),

        CustomText(
          text: 'Level: $difficulty', 
          fontWeight: FontWeight.normal
        ),
      ]
    );
  }
}
