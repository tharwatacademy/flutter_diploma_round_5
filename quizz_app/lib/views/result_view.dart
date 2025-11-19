import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:quizz_app/assets.dart';

import '../models/quizz_manger.dart';
import '../theme/app_colors.dart';
import '../theme/app_decorations.dart';
import '../theme/app_text_styles.dart';
import '../widgets/custom_button.dart';
import 'home_view.dart';
import 'quizz_view.dart';

class ResultView extends StatelessWidget {
  final QuizzManger quizzManger;

  const ResultView({super.key, required this.quizzManger});

  int _calculateScore() {
    return quizzManger.calculateCorrectAnswers().toInt();
  }

  double _calculatePercentage() {
    if (quizzManger.questions.isEmpty) return 0.0;
    final correctAnswers = quizzManger.calculateCorrectAnswers();
    return (correctAnswers / quizzManger.questions.length) * 100;
  }

  String _getResultMessage(double percentage) {
    if (percentage >= 90) {
      return 'Excellent!';
    } else if (percentage >= 70) {
      return 'Great Job!';
    } else if (percentage >= 50) {
      return 'Good Try!';
    } else {
      return 'Keep Practicing!';
    }
  }

  @override
  Widget build(BuildContext context) {
    final score = _calculateScore();
    final totalQuestions = quizzManger.questions.length;
    final percentage = _calculatePercentage();
    final message = _getResultMessage(percentage);

    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: AppDecorations.mainBackgroundDecoration,
        child: Stack(
          children: [
            Positioned.fill(
              child: Image.asset(Assets.gradient, fit: BoxFit.fitHeight),
            ),
            SafeArea(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SizedBox(height: 40),
                    Text('Quiz Results', style: AppTextStyles.medium24()),
                    SizedBox(height: 40),
                    // Score Circle
                    Container(
                      width: 200,
                      height: 200,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        gradient: AppDecorations.buildSecondaryGradient(),
                      ),
                      child: Center(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              '$score',
                              style: AppTextStyles.bold20(
                                color: AppColors.primary,
                              ).copyWith(fontSize: 48),
                            ),
                            Text(
                              '/ $totalQuestions',
                              style: AppTextStyles.regular18(
                                color: AppColors.primary,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(height: 30),
                    // Percentage
                    Text(
                      '${percentage.toStringAsFixed(0)}%',
                      style: AppTextStyles.bold20().copyWith(fontSize: 32),
                    ),
                    SizedBox(height: 12),
                    // Message
                    Text(message, style: AppTextStyles.medium24()),
                    SizedBox(height: 40),
                    // Check Icon
                    SvgPicture.asset(Assets.checkIcon, width: 80, height: 80),
                    Spacer(),
                    // Buttons
                    CustomButton(
                      text: 'Back to Home',
                      onPressed: () {
                        Navigator.pushAndRemoveUntil(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const HomeView(),
                          ),
                          (route) => false,
                        );
                      },
                    ),
                    SizedBox(height: 16),
                    CustomButton(
                      text: 'Restart Quiz',
                      onPressed: () {
                        Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const QuizzView(),
                          ),
                        );
                      },
                    ),
                    SizedBox(height: 60),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
