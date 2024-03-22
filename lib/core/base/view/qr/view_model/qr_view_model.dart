import "package:mobx/mobx.dart";

part "qr_view_model.g.dart";

class QRViewModel = _QRViewModelBase with _$QRViewModel;

abstract class _QRViewModelBase with Store {
  @observable
  bool isFlashOpen = false;

  @observable
  bool isCameraReverse = false;

  @observable
  String? value;

  @computed
  bool get isValueEmpty => value == null;

  @action
  void setValue(String? result) => value = result;

  @action
  void changeFlash() {
    isFlashOpen = !isFlashOpen;
  }

  @action
  void changeCameraReverse() {
    isCameraReverse = !isCameraReverse;
  }
}
