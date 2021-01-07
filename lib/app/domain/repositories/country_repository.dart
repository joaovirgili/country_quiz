import 'package:country_quiz/app/domain/entities/country_entity.dart';

abstract class ICountryRepository {
  Future<List<CountryEntity>> fetchCountryList();
}
