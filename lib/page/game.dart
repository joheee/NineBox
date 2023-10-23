import 'package:flutter/material.dart';
import 'package:mati_murup/config/variable.dart';
import 'package:mati_murup/layout/default_layout.dart';

class GamePage extends StatefulWidget {
  const GamePage({super.key});

  @override
  State<GamePage> createState() => _GamePageState();
}

class _GamePageState extends State<GamePage> {
  @override
  Widget build(BuildContext context) {
    return DefaultLayout(
      children: [

        const Text(
          'Giliran bambang',
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.normal,
          ),
        ),

        const SizedBox(height: 20.0),

        const Text(
          'Hapalkan Polanya',
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),

        Padding(
          padding: Variable.defaultPadding,
          child: SizedBox(
            height: 390,
            child: GridView.count(
              crossAxisCount: 3,
              children: List.generate(9, (index) {
                return Card(
                  color: Variable.deactiveColor,
                  child: const SizedBox()
                );
              }),
            ),
          ),
        ),
        
        const Text(
          'Ronde 1',
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.normal,
          ),
        ),

        const SizedBox(height: 20.0),

        const Text(
          'Level: Gampang',
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.normal,
          ),
        ),

      ]
    );
  }
}