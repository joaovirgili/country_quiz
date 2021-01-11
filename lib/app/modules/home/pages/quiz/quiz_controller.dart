import 'package:country_quiz/app/domain/entities/country_entity.dart';
import 'package:flutter/material.dart';

import './components/question_widget.dart';

class QuizController {
  final selectedAlternative = ValueNotifier<QuestionAlternativeModel>(null);

  final alternativeLetters = ["A", "B", "C", "D"];

  List<QuestionAlternativeModel> alternatives;

  void setAlternativeModels(List<CountryEntity> countries) {
    alternatives = alternativeLetters
        .map((e) => QuestionAlternativeModel(
              letter: e,
              label: countries[alternativeLetters.indexOf(e)].name,
            ))
        .toList();
  }

  void selectAlertnative(QuestionAlternativeModel alternative) {
    selectedAlternative.value = alternative;
  }
}
