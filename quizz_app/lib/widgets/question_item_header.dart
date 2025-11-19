import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:quizz_app/models/question_model.dart';

import '../theme/app_text_styles.dart';

class QuestionItemHeader extends StatelessWidget {
  const QuestionItemHeader({super.key, required this.questionModel});
  final QuestionModel questionModel;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(12),
      decoration: ShapeDecoration(
        color: const Color(0xFF8D83FF) /* SECONDARY-VIOLET */,
        shape: RoundedRectangleBorder(
          side: BorderSide(
            width: 1,
            color: const Color(0xFFB8B2FF) /* OUTLINE-VIOLET */,
          ),
          borderRadius: BorderRadius.circular(100),
        ),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        spacing: 8,
        children: [
          SvgPicture.asset(questionModel.image),
          Text(
            'Question ${questionModel.questionNumber}',
            style: AppTextStyles.regular12(),
          ),
        ],
      ),
    );
  }
}
