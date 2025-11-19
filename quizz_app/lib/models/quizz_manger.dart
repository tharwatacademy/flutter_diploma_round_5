import 'package:quizz_app/assets.dart';

import 'question_model.dart';

class QuizzManger {
  final List<QuestionModel> _questions = [
    QuestionModel(
      correctAnswer: 'Paris',
      title: 'What is the capital of France?',
      questionNumber: '1',
      options: [
        'Paris',
        'London',
        'Berlin',
        'Madrid',
        'Dubai',
        'New York',
        'Tokyo',
        'Sydney',
        'Moscow',
        'Beijing',
        'Cairo',
        'Rio de Janeiro',
        'Cape Town',
        'Johannesburg',
        'Abu Dhabi',
        'Dubai',
        'New York',
        'Tokyo',
        'Sydney',
        'Moscow',
        'Beijing',
        'Cairo',
        'Rio de Janeiro',
        'Cape Town',
        'Johannesburg',
        'Abu Dhabi',
        'Dubai',
        'New York',
        'Tokyo',
        'Sydney',
        'Moscow',
        'Beijing',
        'Cairo',
        'Rio de Janeiro',
        'Cape Town',
        'Johannesburg',
        'Abu Dhabi',
        'Dubai',
        'New York',
      ],
      image: Assets.q1,
    ),
    QuestionModel(
      correctAnswer: 'Berlin',
      title: 'What is the capital of Germany?',
      questionNumber: '2',
      options: ['Berlin', 'London', 'Madrid', 'Paris'],
      image: Assets.q2,
    ),
    QuestionModel(
      correctAnswer: 'Rome',
      title: 'What is the capital of Italy?',
      questionNumber: '3',
      options: ['Rome', 'London', 'Madrid', 'Paris'],
      image: Assets.q3,
    ),
    QuestionModel(
      correctAnswer: 'Madrid',
      title: 'What is the capital of Spain?',
      questionNumber: '4',
      options: ['Madrid', 'London', 'Berlin', 'Paris'],
      image: Assets.q4,
    ),
  ];

  List<QuestionModel> get questions => _questions;

  num calculateCorrectAnswers() {
    int correctAnswers = 0;
    for (var question in _questions) {
      if (question.selectedAnswer == question.correctAnswer) {
        correctAnswers++;
      }
    }
    return correctAnswers;
  }

  num calculateTotalScoreScore() {
    return calculateCorrectAnswers() * 10;
  }
}
