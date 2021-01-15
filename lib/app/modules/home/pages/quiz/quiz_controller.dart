import 'package:country_quiz/app/domain/entities/country_entity.dart';
import 'package:country_quiz/app/modules/home/models/question.dart';
import 'package:country_quiz/app/modules/home/models/quiz_type_enum.dart';
import 'package:country_quiz/app/modules/home/stores/quiz_store.dart';
import 'package:rx_notifier/rx_notifier.dart';

import './components/question_widget.dart';

class QuizController {
  final QuizStore quizStore;
  final _selectedAlternative = RxNotifier<QuestionAlternativeModel>(null);
  final alternativeLetters = ["A", "B", "C", "D"];

  List<QuestionAlternativeModel> alternatives;

  bool get canGoNext => _selectedAlternative.value != null;
  int get correctAnswersLength => quizStore.correctAnswersLength;
  QuestionAlternativeModel get selectedAlternative =>
      _selectedAlternative.value;

  QuizController(this.quizStore);

  void setAlternativeModels(List<CountryEntity> countries) {
    alternatives = alternativeLetters
        .map((e) => QuestionAlternativeModel(
              letter: e,
              label: countries[alternativeLetters.indexOf(e)].name,
            ))
        .toList();
  }

  void selectAlertnative(QuestionAlternativeModel alternative) {
    _selectedAlternative.value = alternative;
  }

  void saveAlternative() {
    quizStore.addAlternative(_selectedAlternative.value);
  }

  bool next(int correctAlternativeIndex) {
    if (alternativeLetters[correctAlternativeIndex] ==
        selectedAlternative.letter) {
      saveAlternative();
      return true;
    }
    return false;
  }

  Question buildQuestion(QuizType type) => quizStore.buildQuestion(type);
}
