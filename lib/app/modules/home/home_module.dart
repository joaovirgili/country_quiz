import 'package:country_quiz/app/data/repositories/country_repository.dart';
import 'package:country_quiz/app/domain/repositories/country_repository.dart';
import 'package:country_quiz/app/modules/home/models/quiz_type_enum.dart';
import 'package:country_quiz/app/modules/home/pages/quiz/quiz_page.dart';
import 'package:country_quiz/app/modules/home/stores/quiz_store.dart';
import 'package:country_quiz/shared/routes.dart';

import 'models/question.dart';
import 'pages/quiz/quiz_controller.dart';
import 'home_controller.dart';
import 'package:flutter_modular/flutter_modular.dart';

import 'home_page.dart';

class HomeModule extends ChildModule {
  @override
  List<Bind> get binds => [
        BindInject<ICountryRepository>(
          (i) => CountryRepository(i.get()),
        ),
        BindInject<QuizStore>((i) => QuizStore()),
        BindInject<QuizController>(
          (i) => QuizController(i.get()),
          singleton: false,
        ),
        BindInject<HomeController>(
          (i) => HomeController(i.get(), i.get()),
        ),
      ];

  @override
  List<ModularRouter> get routers => [
        ModularRouter(Modular.initialRoute, child: (_, args) => HomePage()),
        ModularRouter(AppRoutes.quiz,
            child: (_, args) => QuizPage(
                  quizType: args.data["type"] as QuizType,
                  question: args.data["question"] as Question,
                )),
      ];

  static Inject get to => Inject<HomeModule>.of();
}
