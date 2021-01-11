import 'dart:math';

import 'package:country_quiz/app/domain/entities/country_entity.dart';
import 'package:country_quiz/app/modules/home/models/question.dart';
import 'package:country_quiz/app/modules/home/models/quiz_type_enum.dart';

class QuizStore {
  List<CountryEntity> countryList;

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

    return Question(correct: Random().nextInt(3), countries: randomCountryList);
  }

  CountryEntity _randomCountry() => countryList[_randomNumber()];

  _randomNumber() => Random().nextInt(countryList.length - 1);
}
