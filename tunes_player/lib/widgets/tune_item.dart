import 'package:flutter/material.dart';
import 'package:tunes_player/models/tune_model.dart';

class ExpandedTuneItem extends StatelessWidget {
  const ExpandedTuneItem({super.key, required this.tune});
  final TuneModel tune;
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: GestureDetector(
        onTap: () {
          tune.playSound();
        },
        child: Container(color: tune.color, width: double.infinity),
      ),
    );
  }
}
