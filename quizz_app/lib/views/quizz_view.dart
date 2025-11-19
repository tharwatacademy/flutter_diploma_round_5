import 'package:flutter/material.dart';

import '../models/quizz_manger.dart';
import '../theme/app_decorations.dart';
import '../widgets/custom_back_button.dart';
import '../widgets/custom_next_button.dart';
import '../widgets/question_item.dart';
import 'result_view.dart';

class QuizzView extends StatefulWidget {
  const QuizzView({super.key});

  @override
  State<QuizzView> createState() => _QuizzViewState();
}

class _QuizzViewState extends State<QuizzView> {
  QuizzManger quizzManger = QuizzManger();
  PageController pageController = PageController();
  int pageIndex = 0;
  @override
  void dispose() {
    pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: AppDecorations.mainBackgroundDecoration,
        child: SafeArea(
          child: Column(
            children: [
              Expanded(
                child: PageView.builder(
                  onPageChanged: (index) {
                    pageIndex = index;
                    setState(() {});
                  },
                  controller: pageController,
                  itemCount: quizzManger.questions.length,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10),
                      child: QuestionItem(
                        quizzMAnger: quizzManger,
                        questionModel: quizzManger.questions[index],
                      ),
                    );
                  },
                ),
              ),
              SizedBox(height: 24),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: Row(
                  children: [
                    Visibility(
                      visible: pageIndex != 0,
                      child: CustomBackButton(pageController: pageController),
                    ),
                    Spacer(),
                    CustomNextButton(
                      pageController: pageController,
                      pageCount: quizzManger.questions.length,
                      onComplete: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) =>
                                ResultView(quizzManger: quizzManger),
                          ),
                        );
                      },
                    ),
                  ],
                ),
              ),
              SizedBox(height: 55),
            ],
          ),
        ),
      ),
    );
  }
}
