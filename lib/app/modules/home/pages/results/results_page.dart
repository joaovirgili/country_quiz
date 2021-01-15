import 'package:country_quiz/shared/assets.dart';
import 'package:country_quiz/shared/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'components/quiz_result_widget.dart';
import 'results_controller.dart';

class ResultsPage extends StatefulWidget {
  final int correctAnswersLength;

  const ResultsPage({
    Key key,
    @required this.correctAnswersLength,
  }) : super(key: key);

  @override
  _ResultsPageState createState() => _ResultsPageState();
}

class _ResultsPageState extends ModularState<ResultsPage, ResultsController> {
  //use 'controller' variable to access controller

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
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24.0),
            child: Center(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "COUNTRY QUIZ",
                    style: TextStyle(
                      color: AppColors.white,
                      fontWeight: FontWeight.w700,
                      fontSize: 20,
                    ),
                  ),
                  const SizedBox(height: 10),
                  QuizResultWidget(
                    onTapTryAgain: _tryAgain,
                    correctAnswersLength: widget.correctAnswersLength,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  void _tryAgain() {
    controller.clearQuiz();
    Modular.to.pop();
  }
}
