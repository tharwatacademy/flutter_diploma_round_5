class QuestionModel {
  final String title;
  final String questionNumber;
  final List<String> options;
  final String image;
  String selectedAnswer = '';
  final String correctAnswer;
  QuestionModel({
    required this.title,
    required this.correctAnswer,
    required this.questionNumber,
    required this.options,
    required this.image,
  });

  bool isCorrectAnswer() {
    return selectedAnswer == correctAnswer;
  }

  void updatedSelectedAnswer(String answer) {
    selectedAnswer = answer;
  }
}
