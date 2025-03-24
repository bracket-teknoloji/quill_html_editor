import "package:mobx/mobx.dart";
import "package:picker/core/base/model/yazici_model.dart";

part "yazici_edit_view_model.g.dart";

class YaziciEditViewModel = _YaziciEditViewModelBase with _$YaziciEditViewModel;

abstract class _YaziciEditViewModelBase with Store {
  @observable
  YaziciModel yaziciModel = YaziciModel();

  @action
  void setYaziciModel(YaziciModel value) => yaziciModel = value;

  @action
  void setYaziciAdi(String? value) => yaziciModel = yaziciModel.copyWith(yaziciAdi: value);

  @action
  void setMACAdresi(String value) => yaziciModel = yaziciModel.copyWith(macAdresi: value);

  @action
  void setAciklama(String? value) => yaziciModel = yaziciModel.copyWith(aciklama: value);

  @action
  void setYaziciTipi(YaziciTipi value) => yaziciModel = yaziciModel.copyWith(yaziciTipi: value);
}
