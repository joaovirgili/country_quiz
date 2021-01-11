import 'package:country_quiz/app/domain/entities/country_entity.dart';
import 'package:country_quiz/app/modules/home/models/question.dart';
import 'package:country_quiz/app/modules/home/models/quiz_type_enum.dart';
import 'package:country_quiz/app/modules/home/stores/quiz_store.dart';
import 'package:flutter/material.dart';

import './components/question_widget.dart';

class QuizController {
  final QuizStore quizStore;
  final selectedAlternative = ValueNotifier<QuestionAlternativeModel>(null);

  final alternativeLetters = ["A", "B", "C", "D"];

  List<QuestionAlternativeModel> alternatives;

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
    selectedAlternative.value = alternative;
  }

  Question buildQuestion(QuizType type) => quizStore.buildQuestion(type);
}
