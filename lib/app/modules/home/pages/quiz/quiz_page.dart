import 'package:country_quiz/app/modules/home/models/quiz_type_enum.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
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
  //use 'controller' variable to access controller

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:
            Text(widget.quizType == QuizType.bandeira ? "bandeira" : "capital"),
      ),
      body: Column(
        children: <Widget>[],
      ),
    );
  }
}
