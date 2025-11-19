import 'package:bmi_application/models/bmi_input_model.dart';
import 'package:bmi_application/widgets/custom_container.dart';
import 'package:bmi_application/widgets/section_title.dart';
import 'package:flutter/material.dart';

import 'custom_slider.dart';
import 'value_text.dart';

class HeightSelectionItem extends StatefulWidget {
  const HeightSelectionItem({super.key, required this.bmiInputModel});
  final BmiInputModel bmiInputModel;
  @override
  State<HeightSelectionItem> createState() => _HeightSelectionItemState();
}

class _HeightSelectionItemState extends State<HeightSelectionItem> {
  double height = 174;
  @override
  Widget build(BuildContext context) {
    return CustomContainer(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SectionTitle(text: 'HEIGHT'),

          Row(
            crossAxisAlignment: CrossAxisAlignment.baseline,
            textBaseline: TextBaseline.alphabetic,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ValueText(text: height.round().toString()),
              Text('cm', style: TextStyle(color: Colors.grey, fontSize: 18)),
            ],
          ),
          CustomSlider(
            value: height,
            onChanged: (value) {
              height = value;
              widget.bmiInputModel.height = value / 100;
              setState(() {});
            },
          ),
        ],
      ),
    );
  }
}
