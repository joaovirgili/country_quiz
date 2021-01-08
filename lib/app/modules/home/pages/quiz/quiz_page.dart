import 'package:country_quiz/app/modules/home/models/question.dart';
import 'package:country_quiz/app/modules/home/models/quiz_type_enum.dart';
import 'package:country_quiz/shared/assets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_svg/svg.dart';
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
  final alternativeLetters = ["A", "B", "C", "D"];

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
                height: widget.quizType == QuizType.bandeira ? 600 : 500,
                child: Stack(
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(height: 35),
                        Text(
                          "COUNTRY QUIZ",
                          style: TextStyle(
                            color: Color(0xffF2F2F2),
                            fontWeight: FontWeight.w700,
                            fontSize: 20,
                          ),
                        ),
                        SizedBox(height: 5),
                        QuestionWidget(
                          flagUrl: widget.quizType == QuizType.bandeira
                              ? widget.question.correctCountryFlag
                              : null,
                          countryName: widget.quizType == QuizType.capital
                              ? widget.question.correctCapitalName
                              : null,
                          alternatives: alternativeLetters
                              .map((e) => QuestionAlternativeModel(
                                    letter: e,
                                    label: widget
                                        .question
                                        .countries[
                                            alternativeLetters.indexOf(e)]
                                        .name,
                                  ))
                              .toList(),
                        ),
                      ],
                    ),
                    Align(
                      alignment: Alignment.topRight,
                      child: SvgPicture.asset(
                        AppAssets.question,
                        height: 100,
                      ),
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
}
