import "dart:convert";

import "package:mobx/mobx.dart";
import "package:picker/core/base/model/base_network_mixin.dart";
import "package:picker/core/base/model/doviz_kurlari_model.dart";
import "package:picker/core/base/model/generic_response_model.dart";
import "package:picker/core/base/model/seri_model.dart";
import "package:picker/core/base/model/tahsilat_request_model.dart";
import "package:picker/core/base/view_model/mobx_network_mixin.dart";
import "package:picker/core/constants/extensions/date_time_extensions.dart";
import "package:picker/core/init/network/login/api_urls.dart";
import "package:picker/view/main_page/alt_sayfalar/finans/banka/banka_listesi/model/banka_listesi_request_model.dart";

part "banka_muhtelif_islemler_view_model.g.dart";

class BankaMuhtelifIslemlerViewModel = _BankaMuhtelifIslemlerViewModelBase with _$BankaMuhtelifIslemlerViewModel;

abstract class _BankaMuhtelifIslemlerViewModelBase with Store, MobxNetworkMixin {
  @observable
  ObservableList<DovizKurlariModel>? dovizKurlariListesi;

  @observable
  TahsilatRequestModel model = TahsilatRequestModel(yeniKayit: true, tag: "DekontModel", islemModulu: "B");

  @observable
  BankaListesiRequestModel bankaListesiRequestModel = BankaListesiRequestModel(ekranTipi: "R", menuKodu: "YONE_BHRE", arrHesapTipi: jsonEncode([0, 7, 14]));

  @observable
  ObservableList<SeriModel>? seriList;

  @action
  void setBelgeTuru(String? belgeTuru) {
    model = model.copyWith(dekontIslemTuru: belgeTuru);
    bankaListesiRequestModel = bankaListesiRequestModel.copyWith(belgeTipi: belgeTuru);
  }

  @action
  void setTarih(DateTime? tarih) => model = model.copyWith(tarih: tarih?.dateTimeWithoutTime);

  @action
  void setSeriNo(String? seriNo) => model = model.copyWith(dekontSeri: seriNo);

  @action
  void setHesapNo(String? hesapNo) => model = model.copyWith(hesapKodu: hesapNo);

  @action
  void setMuhasebeKodu(String? muhasebeKodu) => model = model.copyWith(hedefHesapKodu: muhasebeKodu);

  @action
  void setDovizTipi(int? dovizTipi) => model = model.copyWith(dovizTipi: dovizTipi);

  @action
  void setTutar(double? tutar) => model = model.copyWith(tutar: tutar);

  @action
  void setDovizTutari(double? dovizTutari) => model = model.copyWith(dovizTutari: dovizTutari);

  @action
  void setPlasiyerKodu(String? plasiyerKodu) => model = model.copyWith(plasiyerKodu: plasiyerKodu);

  @action
  void setProjeKodu(String? projeKodu) => model = model.copyWith(projeKodu: projeKodu);

  @action
  void setAciklama(String? aciklama) => model = model.copyWith(aciklama: aciklama);
  @action
  void setDovizKurlariListesi(List<DovizKurlariModel>? value) => dovizKurlariListesi = value?.asObservable();
  @action
  void setSeriList(List<SeriModel>? value) {
    if (value != null) {
      seriList = value.asObservable();
    }
  }

  @action
  Future<void> getSeri() async {
    final result = await networkManager.dioGet<SeriModel>(path: ApiUrls.getDekontSeriler, bodyModel: SeriModel());
    if (result.data is List) {
      setSeriList(result.data.cast<SeriModel>());
    }
  }

  @action
  Future<void> getDovizler() async {
    if (model.dovizTipi == 0) {
      setDovizKurlariListesi(null);
      return;
    }
    final result = await networkManager.dioGet<DovizKurlariModel>(
      path: ApiUrls.getDovizKurlari,
      bodyModel: DovizKurlariModel(),
      showLoading: true,
      queryParameters: {"EkranTipi": "D", "DovizKodu": model.dovizTipi, "tarih": model.tarih.toDateString},
    );
    if (result.data is List) {
      setDovizKurlariListesi(result.data.cast<DovizKurlariModel>());
    }
  }

  Future<GenericResponseModel<NetworkManagerMixin>> postData() async =>
      await networkManager.dioPost<DovizKurlariModel>(path: ApiUrls.saveDekont, bodyModel: DovizKurlariModel(), showLoading: true, data: model.toJson());
}
