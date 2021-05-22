import 'package:mobx/mobx.dart';
part 'home_controller.g.dart';

class HomeController = _HomeControllerBase with _$HomeController;

abstract class _HomeControllerBase with Store {
  ////// INICIO - Observables //////
  @observable
  int index = 0;
  ////// FIM - Observables //////

  ////// INICIO - Actions //////
  @action
  setIndex(int value) {
    index = value;
  }
  ////// FIM - Observables //////
}
