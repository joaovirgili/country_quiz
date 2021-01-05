import 'package:country_quiz/app/modules/home/models/quiz_type_enum.dart';
import 'package:country_quiz/shared/assets.dart';
import 'package:country_quiz/shared/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
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
              child: Image.asset(
                AppAssets.background,
                fit: BoxFit.cover,
              ),
            );
          }),
          Center(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24.0),
              child: QuestionWidget(),
            ),
          )
        ],
      ),
    );
  }
}
