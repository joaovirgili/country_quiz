import 'package:country_quiz/app/domain/repositories/country_repository.dart';
import 'package:country_quiz/app/modules/home/stores/quiz_store.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

import 'models/question.dart';
import 'models/quiz_type_enum.dart';

@Injectable()
class HomeController {
  final ICountryRepository countryRepository;
  final QuizStore quizStore;

  final isLoading = ValueNotifier<bool>(true);

  HomeController(this.countryRepository, this.quizStore) {
    _fetchCountries();
  }

  Future<void> _fetchCountries() async {
    isLoading.value = true;
    quizStore.countryList = await this.countryRepository.fetchCountryList();
    isLoading.value = false;
  }

  Question buildQuestion(QuizType type) => quizStore.buildQuestion(type);
}
