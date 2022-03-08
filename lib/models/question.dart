class Question {
  final String caption;
  final List<String> answers;
  final int _correctAnswerIndex;
  final String hint;

  Question(this.caption, this.answers, this._correctAnswerIndex, this.hint);

  factory Question.none() {
    return Question("", <String>[], 0, "");
  }

  bool isCorrectAnswer(String answer) {
    return answers[_correctAnswerIndex] == answer;
  }
}
