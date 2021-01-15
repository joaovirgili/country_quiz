import 'package:country_quiz/app/modules/home/models/question.dart';
import 'package:country_quiz/app/modules/home/models/quiz_type_enum.dart';
import 'package:country_quiz/shared/assets.dart';
import 'package:country_quiz/shared/colors.dart';
import 'package:country_quiz/shared/routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_svg/svg.dart';
import 'package:rx_notifier/rx_notifier.dart';
import 'components/question_alternative_widget.dart';
import 'components/question_widget.dart';
import 'quiz_controller.dart';

class QuizPage extends StatefulWidget {
  final QuizType quizType;
  final Question question;

  const QuizPage({
    @required this.quizType,
    @required this.question,
    Key key,
  }) : super(key: key);

  @override
  _QuizPageState createState() => _QuizPageState();
}

class _QuizPageState extends ModularState<QuizPage, QuizController> {
  @override
  void initState() {
    super.initState();
    controller.setAlternativeModels(widget.question.countries);
  }

  String get flagUrl => widget.quizType == QuizType.bandeira
      ? widget.question.correctCountryFlag
      : null;

  String get countryName => widget.quizType == QuizType.capital
      ? widget.question.correctCapitalName
      : null;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: <Widget>[
          LayoutBuilder(builder: (context, constraints) {
            return SizedBox(
              height: constraints.maxHeight,
              child: Image.asset(AppAssets.background, fit: BoxFit.cover),
            );
          }),
          Center(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24.0),
              child: Container(
                height: widget.quizType == QuizType.bandeira ? 600 : 550,
                child: Stack(
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(height: 35),
                        Text(
                          "COUNTRY QUIZ",
                          style: TextStyle(
                            color: AppColors.white,
                            fontWeight: FontWeight.w700,
                            fontSize: 20,
                          ),
                        ),
                        SizedBox(height: 5),
                        RxBuilder(builder: (_) {
                          return QuestionWidget(
                            flagUrl: flagUrl,
                            countryName: countryName,
                            onTapNext: controller.canGoNext ? onTapNext : null,
                            alternatives: controller.alternatives
                                .map(_alternativeFromModelToWidget)
                                .toList(),
                          );
                        }),
                      ],
                    ),
                    Align(
                      alignment: Alignment.topRight,
                      child: SvgPicture.asset(AppAssets.question, height: 100),
                    ),
                  ],
                ),
              ),
            ),
          )
        ],
      ),
    );
  }

  void onTapNext() {
    final isCorrect = controller.next(widget.question.correct);
    if (isCorrect) {
      Modular.to.popAndPushNamed(AppRoutes.quiz, arguments: {
        "type": widget.quizType,
        "question": controller.buildQuestion(widget.quizType)
      });
    } else {
      Modular.to.popAndPushNamed(
        AppRoutes.results,
        arguments: controller.correctAnswersLength,
      );
    }
  }

  AlternativeState getAlternativeType(QuestionAlternativeModel e) {
    return controller.selectedAlternative == e
        ? AlternativeState.selected
        : AlternativeState.unselected;
  }

  Widget _alternativeFromModelToWidget(QuestionAlternativeModel e) => Column(
        children: [
          RxBuilder(builder: (_) {
            return QuestionAlternative(
              letter: e.letter,
              label: e.label,
              onTap: () => controller.selectAlertnative(e),
              state: getAlternativeType(e),
            );
          }),
          SizedBox(height: 18),
        ],
      );
}
