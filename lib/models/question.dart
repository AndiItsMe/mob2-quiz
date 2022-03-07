class Question {
  final String caption;
  final List<String> answers;
  final int correctAnswerIndex;
  final String hint;

  Question(this.caption, this.answers, this.correctAnswerIndex, this.hint);

  factory Question.none() {
    return Question("", <String>[], 0, "");
  }
}
