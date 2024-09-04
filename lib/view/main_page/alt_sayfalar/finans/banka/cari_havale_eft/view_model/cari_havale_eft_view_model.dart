import "dart:convert";

import "package:mobx/mobx.dart";
import "package:picker/view/main_page/alt_sayfalar/cari/cari_listesi/model/cari_listesi_model.dart";

import "../../../../../../../core/base/model/base_network_mixin.dart";
import "../../../../../../../core/base/model/doviz_kurlari_model.dart";
import "../../../../../../../core/base/model/generic_response_model.dart";
import "../../../../../../../core/base/model/tahsilat_request_model.dart";
import "../../../../../../../core/base/view_model/mobx_network_mixin.dart";
import "../../../../../../../core/constants/extensions/date_time_extensions.dart";
import "../../../../../../../core/init/network/login/api_urls.dart";
import "../../banka_listesi/model/banka_listesi_model.dart";
import "../../banka_listesi/model/banka_listesi_request_model.dart";

part "cari_havale_eft_view_model.g.dart";

class CariHavaleEftViewModel = _CariHavaleEftViewModelBase with _$CariHavaleEftViewModel;

abstract class _CariHavaleEftViewModelBase with Store, MobxNetworkMixin {
  @observable
  TahsilatRequestModel model = TahsilatRequestModel(yeniKayit: true, tag: "DekontModel", dekontIslemTuru: "DCE", islemModulu: "B");

  @observable
  ObservableList<DovizKurlariModel>? dovizKurlariListesi;

  @observable
  BankaListesiRequestModel bankaListesiRequestModel = BankaListesiRequestModel(belgeTipi: "DCE", ekranTipi: "R", menuKodu: "YONE_BHRE", arrHesapTipi: jsonEncode([0, 7, 14]));

  @observable
  CariListesiModel? cariModel;

  @observable
  bool bankaDovizliMi = false;

  @action
  void setCariModel(CariListesiModel? model) => cariModel = model;

  @action
  void setBankaDovizliMi(bool value) => bankaDovizliMi = value;

  @action
  void setGc(bool? gc) => model = model.copyWith(cariyiBorclandir: gc);

  @action
  void setBSMV(double? bsmv) => model = model.copyWith(bsmvTutari: bsmv);

  @action
  void setTarih(DateTime? tarih) => model = model.copyWith(tarih: tarih.dateTimeWithoutTime);

  @action
  void setDekontNo(String? dekontNo) => model = model.copyWith(dekontBelgeNo: dekontNo != "" ? dekontNo : null);

  @action
  void setHesapNo(BankaListesiModel? hesapNo) {
    model = model.copyWith(hesapKodu: hesapNo?.hesapKodu != "" ? hesapNo?.hesapKodu : null);
    setBankaDovizliMi(hesapNo?.dovizAdi != null);
    if (!model.dovizliMi) {
      setDovizTipi(hesapNo?.dovizTipi);
    }
  }

  @action
  void setCariKodu(String? cariKodu) => model = model.copyWith(cariKodu: cariKodu != "" ? cariKodu : null);

  @action
  void setDovizTipi(int? dovizTipi) => model = model.copyWith(dovizTipi: dovizTipi != 0 ? dovizTipi : null);

  @action
  void setTutar(double? tutar) => model = model.copyWith(tutar: tutar);

  @action
  void setDovizTutari(double? dovizTutari) => model = model.copyWith(dovizTutari: dovizTutari);

  @action
  void setMasrafTutari(double? masrafTutari) => model = model.copyWith(masrafTutari: masrafTutari);

  @action
  void setMasrafMuhKodu(String? masrafMuhKodu) => model = model.copyWith(masrafMuhKodu: masrafMuhKodu != "" ? masrafMuhKodu : null);

  @action
  void setPlasiyerKodu(String? plasiyerKodu) => model = model.copyWith(plasiyerKodu: plasiyerKodu != "" ? plasiyerKodu : null);

  @action
  void setProjeKodu(String? projeKodu) => model = model.copyWith(projeKodu: projeKodu != "" ? projeKodu : null);

  @action
  void setAciklama(String? aciklama) => model = model.copyWith(aciklama: aciklama != "" ? aciklama : null);

  @action
  void setTCMBBankaKodu(String? tcmbBankaKodu) => model = model.copyWith(tcmbBankaKodu: tcmbBankaKodu != "" ? tcmbBankaKodu : null);

  @action
  void setTCMBSubeKodu(String? tcmbSubeKodu) => model = model.copyWith(tcmbSubeKodu: tcmbSubeKodu != "" ? tcmbSubeKodu : null);

  @action
  void setIBAN(String? iban) => model = model.copyWith(iban: iban != "" ? iban : null);

  @action
  void setBankaHesapNo(String? hesapNo) => model = model.copyWith(hesapNo: hesapNo != "" ? hesapNo : null);

  @action
  void setDovizKurlariListesi(List<DovizKurlariModel>? value) => dovizKurlariListesi = value?.asObservable();

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
    if (result.isSuccess) {
      setDovizKurlariListesi(result.dataList);
    }
  }

  Future<GenericResponseModel<NetworkManagerMixin>> postData() async =>
      await networkManager.dioPost<DovizKurlariModel>(path: ApiUrls.saveDekont, bodyModel: DovizKurlariModel(), showLoading: true, data: model.toJson());
}
