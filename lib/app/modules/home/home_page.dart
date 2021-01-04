import 'package:country_quiz/shared/assets.dart';
import 'package:country_quiz/shared/routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'home_controller.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends ModularState<HomePage, HomeController> {
  //use 'controller' variable to access controller

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
              child: Image.asset(
                AppAssets.background,
                fit: BoxFit.cover,
              ),
            );
          }),
          Center(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                RaisedButton(
                  onPressed: () {
                    Modular.to.pushNamed(
                      AppRoutes.quiz,
                      arguments: "capital",
                    );
                  },
                  child: Text("Capital"),
                ),
                RaisedButton(
                  onPressed: () {
                    Modular.to.pushNamed(AppRoutes.quiz, arguments: "bandeira");
                  },
                  child: Text("Bandeira"),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
