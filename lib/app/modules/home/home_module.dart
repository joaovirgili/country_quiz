import 'package:country_quiz/app/modules/home/models/quiz_type_enum.dart';
import 'package:country_quiz/app/modules/home/pages/quiz/quiz_page.dart';
import 'package:country_quiz/shared/routes.dart';

import 'pages/quiz/quiz_controller.dart';
import 'home_controller.dart';
import 'package:flutter_modular/flutter_modular.dart';

import 'home_page.dart';

class HomeModule extends ChildModule {
  @override
  List<Bind> get binds => [
        $QuizController,
        $HomeController,
      ];

  @override
  List<ModularRouter> get routers => [
        ModularRouter(Modular.initialRoute, child: (_, args) => HomePage()),
        ModularRouter(AppRoutes.quiz,
            child: (_, args) => QuizPage(
                  quizType: args.data as QuizType,
                )),
      ];

  static Inject get to => Inject<HomeModule>.of();
}
