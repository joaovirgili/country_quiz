import 'dart:math';

import 'package:country_quiz/app/domain/entities/country_entity.dart';
import 'package:country_quiz/app/modules/home/models/question.dart';
import 'package:country_quiz/app/modules/home/models/quiz_type_enum.dart';
import 'package:country_quiz/app/modules/home/pages/quiz/components/question_widget.dart';
import 'package:rx_notifier/rx_notifier.dart';

class QuizStore {
  final _questionsCount = RxNotifier<int>(0);
  final _selectedAlternatives =
      RxList<QuestionAlternativeModel>(<QuestionAlternativeModel>[]);

  List<CountryEntity> countryList;

  int get questionsCount => _questionsCount.value;

  List<QuestionAlternativeModel> get selectedAlternatives =>
      _selectedAlternatives;

  addAlternative(QuestionAlternativeModel e) => _selectedAlternatives.add(e);

  Question buildQuestion(QuizType type) {
    var randomCountryList = <CountryEntity>[];
    bool _hasCapital(CountryEntity country) =>
        type == QuizType.capital ? country.capital != "" : true;

    bool _isAlreadyInList(CountryEntity country) =>
        randomCountryList.contains(country);

    for (var i = 0; i < 4; i++) {
      var randomCountry = _randomCountry();
      while (!_hasCapital(randomCountry) || _isAlreadyInList(randomCountry)) {
        randomCountry = _randomCountry();
      }
      randomCountryList.add(randomCountry);
    }

    _incrementQuestionsCount();
    return Question(correct: Random().nextInt(3), countries: randomCountryList);
  }

  CountryEntity _randomCountry() => countryList[_randomNumber()];

  _randomNumber() => Random().nextInt(countryList.length - 1);

  _incrementQuestionsCount() => _questionsCount.value++;
}
