import 'package:country_quiz/app/domain/entities/country_entity.dart';
import 'package:country_quiz/app/domain/repositories/country_repository.dart';
import 'package:country_quiz/shared/urls.dart';
import 'package:dio/dio.dart';

class CountryRepository implements ICountryRepository {
  final Dio dio;

  CountryRepository(this.dio);

  @override
  Future<List<CountryEntity>> fetchCountryList() {
    dio.get(AppUrls.country);
    return null;
  }
}
