import 'package:flutter/material.dart';

import 'not_selected_option_item.dart';
import 'selected_option_item.dart';

class OptionItem extends StatelessWidget {
  const OptionItem({super.key, required this.isSelected, required this.option});
  final bool isSelected;
  final String option;
  @override
  Widget build(BuildContext context) {
    return isSelected
        ? SelectedOptionItem(option: option)
        : NotSelectedOptionItem(option: option);
  }
}
