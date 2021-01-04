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
            print(constraints.maxHeight);
            return SizedBox(
              height: 591,
              child: Image.asset(
                "assets/img/background.png",
                fit: BoxFit.cover,
              ),
            );
          }),
          Center(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                RaisedButton(
                  onPressed: () {},
                  child: Text("Capital"),
                ),
                RaisedButton(
                  onPressed: () {},
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
