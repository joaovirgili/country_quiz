import 'package:country_quiz/shared/assets.dart';
import 'package:country_quiz/shared/routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'home_controller.dart';
import 'models/quiz_type_enum.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends ModularState<HomePage, HomeController> {
  //use 'controller' variable to access controller

  void _onPressedCapital() {
    Modular.to.pushNamed(
      AppRoutes.quiz,
      arguments: {
        "type": QuizType.capital,
        "question": controller.buildQuestion(QuizType.capital),
      },
    );
  }

  void _onPressedBandeira() {
    Modular.to.pushNamed(
      AppRoutes.quiz,
      arguments: {
        "type": QuizType.bandeira,
        "question": controller.buildQuestion(QuizType.bandeira),
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Países Quiz App"),
      ),
      body: Stack(
        children: [
          LayoutBuilder(builder: (context, constraints) {
            return SizedBox(
              height: constraints.maxHeight,
              width: constraints.maxWidth,
              child: Image.asset(
                AppAssets.background,
                fit: BoxFit.cover,
              ),
            );
          }),
          Center(
            child: ValueListenableBuilder<bool>(
                valueListenable: controller.isLoading,
                builder: (context, value, _) {
                  return Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      RaisedButton(
                        onPressed: value ? null : _onPressedCapital,
                        child: Text("Capital"),
                      ),
                      RaisedButton(
                        onPressed: value ? null : _onPressedBandeira,
                        child: Text("Bandeira"),
                      ),
                    ],
                  );
                }),
          ),
        ],
      ),
    );
  }
}
