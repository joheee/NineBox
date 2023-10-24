
import 'package:flutter/material.dart';
import 'package:mati_murup/config/variable.dart';

// ignore: must_be_immutable
class CustomGameTile extends StatefulWidget {
  int curr;
  Function(int) onTap;
  bool isFinishPattern;

  CustomGameTile({
    super.key,
    required this.curr,
    required this.onTap,
    required this.isFinishPattern,
  });

  @override
  State<CustomGameTile> createState() => _CustomGameTileState();
}

class _CustomGameTileState extends State<CustomGameTile> {
  @override
  Widget build(BuildContext context) {

    Future<void> handleClick(int index) async {
      setState(() {
        widget.curr = index;
      });
      await Future.delayed(const Duration(milliseconds: 300));
      setState(() {
        widget.curr = 9;
      });
      await Future.delayed(const Duration(milliseconds: 100));
    }

    return Padding(
      padding: Variable.defaultPadding,
      child: SizedBox(
        height: 390,
        child: GridView.count(
          crossAxisCount: 3,
          children: List.generate(9, (index) {
            return GestureDetector(
              onTap: () {
                if(widget.isFinishPattern) {
                  widget.onTap(index);
                  handleClick(index);
                }
              },
              child: Card(
                color: widget.curr == index ? Variable.activeColor : Variable.deactiveColor,
                child: const SizedBox()
              ),
            );
          }),
        ),
      ),
    );
  }
}