import 'package:flutter/material.dart';

class CustomSlider extends StatefulWidget {
  const CustomSlider({super.key, required this.value, required this.onChanged});
  final double value;
  final Function(double) onChanged;

  @override
  State<CustomSlider> createState() => _CustomSliderState();
}

class _CustomSliderState extends State<CustomSlider> {
  @override
  Widget build(BuildContext context) {
    return SliderTheme(
      data: SliderThemeData(
        trackHeight: 1,

        thumbShape: RoundSliderThumbShape(enabledThumbRadius: 15),
      ),
      child: Slider(
        value: widget.value,
        onChanged: widget.onChanged,
        min: 100,
        max: 200,

        activeColor: Colors.white,
        inactiveColor: Color(0xff8F919E),
        thumbColor: Color(0xffEC0D54),
      ),
    );
  }
}
