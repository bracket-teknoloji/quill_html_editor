import "package:mobx/mobx.dart";

import "../../../../../../../../../core/base/model/base_proje_model.dart";
import "../../../../../../../../../core/base/model/seri_model.dart";
import "../../../../../../../../../core/constants/extensions/date_time_extensions.dart";
import "../../../../../../../model/param_model.dart";
import "../../../model/dekont_islemler_request_model.dart";

part "dekont_edit_genel_view_model.g.dart";

final class DekontEditGenelViewModel = _DekontEditGenelViewModelBase with _$DekontEditGenelViewModel;

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
    dekontIslemlerRequestModel = dekontIslemlerRequestModel.copyWith(
      dekontSeri: value?.seriNo,
      seriAdi: value?.aciklama,
    );
    setSingleton();
  }

  @action
  void setPlasiyerKodu(PlasiyerList? value) {
    dekontIslemlerRequestModel = dekontIslemlerRequestModel.copyWith(
      plasiyerKodu: value?.plasiyerKodu,
      plasiyerAdi: value?.plasiyerAciklama,
      kalemler: dekontIslemlerRequestModel.kalemler
          ?.map((e) => e.copyWith(plasiyerKodu: value?.plasiyerKodu, plasiyerAdi: value?.plasiyerAciklama))
          .toList(),
    );
    setSingleton();
  }

  @action
  void setProjeKodu(BaseProjeModel? value) {
    dekontIslemlerRequestModel = dekontIslemlerRequestModel.copyWith(
      projeKodu: value?.projeKodu,
      projeAdi: value?.projeAciklama,
      kalemler: dekontIslemlerRequestModel.kalemler
          ?.map((e) => e.copyWith(projeKodu: value?.projeKodu, projeAdi: value?.projeAciklama))
          .toList(),
    );
    setSingleton();
  }
}
