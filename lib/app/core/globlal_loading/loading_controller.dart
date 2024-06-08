import 'package:mobx/mobx.dart';
part 'loading_controller.g.dart';

class LoadingController = LoadingControllerBase with _$LoadingController;

abstract class LoadingControllerBase with Store {
  @observable
  bool isLoading = false;

  @action
  startLoading() {
    isLoading = true;
  }

  @action
  stopLoading() {
    isLoading = false;
  }
}
