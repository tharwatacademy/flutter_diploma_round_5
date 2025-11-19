import 'package:flutter/material.dart';

import '../models/question_model.dart';
import '../models/quizz_manger.dart';
import 'option_item.dart';

class OptionsList extends StatefulWidget {
  const OptionsList({
    super.key,
    required this.questionModel,
    required this.quizzManger,
  });
  final QuestionModel questionModel;
  final QuizzManger quizzManger;

  @override
  State<OptionsList> createState() => _OptionsListState();
}

class _OptionsListState extends State<OptionsList>
    with AutomaticKeepAliveClientMixin {
  int selectedIndex = -1;
  @override
  Widget build(BuildContext context) {
    super.build(context);
    return Expanded(
      child: ListView.builder(
        itemCount: widget.questionModel.options.length,
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: () {
              selectedIndex = index;
              String selectedAnswer = widget.questionModel.options[index];
              widget.questionModel.updatedSelectedAnswer(selectedAnswer);

              setState(() {});
            },
            child: Padding(
              padding: const EdgeInsets.only(bottom: 16),
              child: OptionItem(
                isSelected: selectedIndex == index,
                option: widget.questionModel.options[index],
              ),
            ),
          );
        },
      ),
    );
  }

  @override
  bool get wantKeepAlive => true;
}
