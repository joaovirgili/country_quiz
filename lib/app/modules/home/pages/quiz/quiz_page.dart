import 'package:country_quiz/app/modules/home/models/quiz_type_enum.dart';
import 'package:country_quiz/shared/assets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_svg/svg.dart';
import 'components/question_widget.dart';
import 'quiz_controller.dart';

class QuizPage extends StatefulWidget {
  final QuizType quizType;

  const QuizPage({
    @required this.quizType,
    Key key,
  }) : super(key: key);

  @override
  _QuizPageState createState() => _QuizPageState();
}

class _QuizPageState extends ModularState<QuizPage, QuizController> {
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
                              ? "https://restcountries.eu/data/alb.svg"
                              : null,
                          statement: "Kuala Lumpur is the capital of",
                          alternatives: [
                            QuestionAlternativeModel(
                              label: "Vietnam",
                              type: false,
                              letter: "A",
                            ),
                            QuestionAlternativeModel(
                              label: "Malaysia",
                              type: true,
                              letter: "B",
                            ),
                            QuestionAlternativeModel(
                              label: "Sweden",
                              type: null,
                              letter: "C",
                            ),
                            QuestionAlternativeModel(
                              label: "Austria",
                              type: null,
                              letter: "D",
                            ),
                          ],
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
