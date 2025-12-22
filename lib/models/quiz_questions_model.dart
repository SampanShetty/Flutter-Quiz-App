class QuizQuestions {
  const QuizQuestions(this.text, this.answer);
  final String text;
  final List<String> answer;

  List<String> shuffleTheAnswer() {
    final shuffledList = List.of(answer);
    shuffledList.shuffle();
    return shuffledList;
  }
}
