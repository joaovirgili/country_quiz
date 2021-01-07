import 'package:country_quiz/app/data/repositories/country_repository.dart';
import 'package:country_quiz/app/domain/repositories/country_repository.dart';
import 'package:country_quiz/shared/urls.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:dio/dio.dart';

class DioMock extends Mock implements Dio {}

void main() {
  ICountryRepository sut;
  DioMock dioMock;

  setUp(() {
    dioMock = DioMock();
    sut = CountryRepository(dioMock);
  });

  test('Should call Dio with correct values', () async {
    await sut.fetchCountryList();

    verify(dioMock.get(AppUrls.country));
  });
}
