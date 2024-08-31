class QuizQuestion {
  final String text;
  final List<String> answers;

  const QuizQuestion(this.text, this.answers);

  List<String> getShuffledAnswers() {
    List<String> shuffledList = List.of(answers);
    shuffledList.shuffle();
    return shuffledList;
  }
}
