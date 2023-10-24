
import 'package:flutter/material.dart';
import 'package:mati_murup/config/variable.dart';

class CustomGameTile extends StatelessWidget {
  final int curr;
  const CustomGameTile({
    super.key,
    required this.curr
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: Variable.defaultPadding,
      child: SizedBox(
        height: 390,
        child: GridView.count(
          crossAxisCount: 3,
          children: List.generate(9, (index) {
            return GestureDetector(
              onTap: () {},
              child: Card(
                color: curr == index ? Variable.activeColor : Variable.deactiveColor,
                child: const SizedBox()
              ),
            );
          }),
        ),
      ),
    );
  }
}