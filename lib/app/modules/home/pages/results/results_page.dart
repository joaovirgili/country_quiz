import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'results_controller.dart';

class ResultsPage extends StatefulWidget {
  final String title;
  const ResultsPage({Key key, this.title = "Results"}) : super(key: key);

  @override
  _ResultsPageState createState() => _ResultsPageState();
}

class _ResultsPageState extends ModularState<ResultsPage, ResultsController> {
  //use 'controller' variable to access controller

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Column(
        children: <Widget>[],
      ),
    );
  }
}
