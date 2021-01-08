import 'package:country_quiz/app/data/repositories/country_repository.dart';
import 'package:country_quiz/app/domain/entities/country_entity.dart';
import 'package:country_quiz/app/domain/repositories/country_repository.dart';
import 'package:country_quiz/shared/urls.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:dio/dio.dart';

class DioMock extends Mock implements Dio {}

void main() {
  ICountryRepository sut;
  DioMock dioMock;

  final dynamic responseMock = [
    {
      "flag": "https://restcountries.eu/data/afg.svg",
      "name": "Afghanistan",
      "capital": "Kabul"
    },
    {
      "flag": "https://restcountries.eu/data/ala.svg",
      "name": "Åland Islands",
      "capital": "Mariehamn"
    },
  ];

  setUp(() {
    dioMock = DioMock();
    sut = CountryRepository(dioMock);
  });

  void mockSuccess() => when(dioMock.get(AppUrls.country)).thenAnswer(
        (realInvocation) async => Response(data: responseMock),
      );

  test('Should call Dio with correct values', () async {
    mockSuccess();

    await sut.fetchCountryList();

    verify(dioMock.get(AppUrls.country));
  });

  test('Should return a list of CountryEntity if Dio returns 200', () async {
    mockSuccess();

    final res = await sut.fetchCountryList();

    expect(res, isA<List<CountryEntity>>());
    expect(res, isNotEmpty);
  });
}
