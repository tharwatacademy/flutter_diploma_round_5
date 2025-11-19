import 'package:flutter/material.dart';
import 'package:quizz_app/models/question_model.dart';
import 'package:quizz_app/theme/app_text_styles.dart';

import '../models/quizz_manger.dart';
import 'options_list.dart';
import 'question_item_header.dart';

class QuestionItem extends StatelessWidget {
  const QuestionItem({
    super.key,
    required this.questionModel,
    required this.quizzMAnger,
  });
  final QuestionModel questionModel;
  final QuizzManger quizzMAnger;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,

      children: [
        QuestionItemHeader(questionModel: questionModel),
        SizedBox(height: 16),
        Text(questionModel.title, style: AppTextStyles.medium24()),
        SizedBox(height: 32),
        OptionsList(questionModel: questionModel, quizzManger: quizzMAnger),
      ],
    );
  }
}

//[]
