import 'dart:math';

import 'package:country_quiz/app/domain/entities/country_entity.dart';
import 'package:country_quiz/app/domain/repositories/country_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

@Injectable()
class HomeController {
  final ICountryRepository countryRepository;

  final isLoading = ValueNotifier<bool>(true);
  List<CountryEntity> countryList;

  HomeController(this.countryRepository) {
    _fetchCountries();
  }

  Future<void> _fetchCountries() async {
    isLoading.value = true;
    countryList = await this.countryRepository.fetchCountryList();
    isLoading.value = false;
  }

  buildBandeiraQuestions() {
    var randomCountryList = <CountryEntity>[];
    for (var i = 0; i < 4; i++) {
      var randomCountry = _randomCountry();
      while (randomCountryList.contains(randomCountry)) {
        randomCountry = _randomCountry();
      }
      randomCountryList.add(randomCountry);
    }
    print(randomCountryList);
  }

  CountryEntity _randomCountry() => countryList[_randomNumber()];

  _randomNumber() => Random().nextInt(countryList.length - 1);
}
