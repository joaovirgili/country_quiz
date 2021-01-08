import 'package:country_quiz/app/domain/entities/country_entity.dart';
import 'package:meta/meta.dart';

class Question {
  final List<CountryEntity> countries;
  final int correct;

  String get correctCountryFlag => countries[correct].flag;
  String get correctCapitalName => countries[correct].capital;

  Question({@required this.countries, @required this.correct});
}
