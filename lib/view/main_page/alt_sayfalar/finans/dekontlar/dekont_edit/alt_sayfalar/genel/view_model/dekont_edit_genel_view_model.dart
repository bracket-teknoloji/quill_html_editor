import "package:mobx/mobx.dart";
import "package:picker/core/base/model/seri_model.dart";
import "package:picker/core/constants/extensions/date_time_extensions.dart";
import "package:picker/view/main_page/alt_sayfalar/finans/dekontlar/dekont_edit/model/dekont_islemler_request_model.dart";
import "package:picker/view/main_page/model/param_model.dart";

part "dekont_edit_genel_view_model.g.dart";

class DekontEditGenelViewModel = _DekontEditGenelViewModelBase with _$DekontEditGenelViewModel;

abstract class _DekontEditGenelViewModelBase with Store {
  @observable
  DekontIslemlerRequestModel dekontIslemlerRequestModel = SingletonDekontIslemlerRequestModel.instance;

  @action
  void setSingleton() => SingletonDekontIslemlerRequestModel.setInstance(dekontIslemlerRequestModel);

  @action
  void setTarih(DateTime? value) {
    dekontIslemlerRequestModel = dekontIslemlerRequestModel.copyWith(tarih: value.dateTimeWithoutTime);
    setSingleton();
  }

  @action
  void setSeri(SeriModel? value) {
    dekontIslemlerRequestModel = dekontIslemlerRequestModel.copyWith(dekontSeri: value?.seriNo, seriAdi: value?.aciklama);
    setSingleton();
  }

  @action
  void setPlasiyerKodu(PlasiyerList? value) {
    dekontIslemlerRequestModel = dekontIslemlerRequestModel.copyWith(plasiyerKodu: value?.plasiyerKodu, plasiyerAdi: value?.plasiyerAciklama);
    setSingleton();
  }
}
