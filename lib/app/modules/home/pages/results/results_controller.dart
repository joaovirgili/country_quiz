import 'package:country_quiz/app/modules/home/stores/quiz_store.dart';

class ResultsController {
  final QuizStore quizStore;

  ResultsController(this.quizStore);

  void clearQuiz() => quizStore.clear();
}
