import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../assets.dart';
import '../theme/app_colors.dart';
import '../theme/app_decorations.dart';
import '../theme/app_text_styles.dart';

class SelectedOptionItem extends StatelessWidget {
  const SelectedOptionItem({super.key, required this.option});
  final String option;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(15),
      decoration: AppDecorations.selectedAnswerBackgroundDecoration,
      child: Row(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        spacing: 16,
        children: [
          CircleAvatar(
            radius: 12,
            backgroundColor: AppColors.primary,
            child: SvgPicture.asset(Assets.checkIcon),
          ),
          Text(option, style: AppTextStyles.medium16(color: AppColors.primary)),
        ],
      ),
    );
  }
}
