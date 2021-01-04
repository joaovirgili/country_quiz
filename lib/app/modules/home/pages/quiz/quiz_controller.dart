import 'package:mobx/mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';

part 'quiz_controller.g.dart';

@Injectable()
class QuizController = _QuizControllerBase with _$QuizController;

abstract class _QuizControllerBase with Store {
  @observable
  int value = 0;

  @action
  void increment() {
    value++;
  }
}
