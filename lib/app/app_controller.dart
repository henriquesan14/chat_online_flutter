import 'package:mobx/mobx.dart';

part 'app_controller.g.dart';

class AppController = _AppControllerBase with _$AppController;

abstract class _AppControllerBase with Store {
  @observable
  bool isDark = true;

  @action
  void setTheme() {
    isDark = !isDark;
  }
}
