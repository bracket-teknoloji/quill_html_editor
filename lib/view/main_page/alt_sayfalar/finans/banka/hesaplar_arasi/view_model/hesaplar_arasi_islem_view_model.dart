import "dart:convert";

import "package:mobx/mobx.dart";

import "../../../../../../../core/base/model/base_network_mixin.dart";
import "../../../../../../../core/base/model/doviz_kurlari_model.dart";
import "../../../../../../../core/base/model/generic_response_model.dart";
import "../../../../../../../core/base/model/tahsilat_request_model.dart";
import "../../../../../../../core/base/view_model/mobx_network_mixin.dart";
import "../../../../../../../core/constants/enum/hesaplar_arasi_enum.dart";
import "../../../../../../../core/constants/extensions/date_time_extensions.dart";
import "../../../../../../../core/init/network/login/api_urls.dart";
import "../../banka_listesi/model/banka_listesi_model.dart";
import "../../banka_listesi/model/banka_listesi_request_model.dart";

part "hesaplar_arasi_islem_view_model.g.dart";

class HesaplarArasiIslemViewModel = _HesaplarArasiIslemViewModelBase with _$HesaplarArasiIslemViewModel;

abstract class _HesaplarArasiIslemViewModelBase with Store, MobxNetworkMixin {
  @observable
  TahsilatRequestModel model = TahsilatRequestModel(tag: "DekontModel", yeniKayit: true, islemModulu: "B");

  @observable
  BankaListesiRequestModel cikisBankaListesiRequestModel = BankaListesiRequestModel(belgeTipi: "DHV", menuKodu: "YONE_BHRE", arrHesapTipi: jsonEncode([0, 7, 14]));

  @observable
  BankaListesiRequestModel girisBankaListesiRequestModel = BankaListesiRequestModel(belgeTipi: "DHV", menuKodu: "YONE_BHRE", arrHesapTipi: jsonEncode([0, 7, 14]));

  @observable
  ObservableList<DovizKurlariModel>? dovizKurlariListesi;

  @observable
  bool bankaDovizliMi = false;

  @action
  void setBankaDovizliMi(bool value) => bankaDovizliMi = value;

  @action
  void changeBelgeTipi(HesaplarArasiEnum value) {
    final String belgeTipi = value.belgeAdi;
    cikisBankaListesiRequestModel = cikisBankaListesiRequestModel.copyWith(belgeTipi: belgeTipi);
    girisBankaListesiRequestModel = girisBankaListesiRequestModel.copyWith(belgeTipi: belgeTipi);
    model = model.copyWith(dekontIslemTuru: belgeTipi);
  }

  @action
  void setTarih(DateTime? tarih) => model = model.copyWith(tarih: tarih.dateTimeWithoutTime);

  @action
  void setDekontNo(String? dekontNo) => model = model.copyWith(belgeNo: dekontNo);

  @action
  void setGuid(String? value) => model = model.copyWith(guid: value);

  @action
  void setCikisHesabi(BankaListesiModel? bankaListesiModel) {
    model = model.copyWith(hesapKodu: bankaListesiModel?.hesapKodu);
    if (model.dekontIslemTuru == "DHV") {
      girisBankaListesiRequestModel = girisBankaListesiRequestModel.copyWith(bankaKodu: bankaListesiModel?.bankaKodu);
    }
    girisBankaListesiRequestModel = girisBankaListesiRequestModel.copyWith(haricHesaplarArray: jsonEncode([bankaListesiModel?.hesapKodu]));
    setBankaDovizliMi(bankaListesiModel?.dovizAdi != null);
  }

  @action
  void setGirisHesabi(BankaListesiModel? bankaListesiModel) => model = model.copyWith(hedefHesapKodu: bankaListesiModel?.hesapKodu);

  @action
  void setDovizTipi(int? dovizTipi) => model = model.copyWith(dovizTipi: dovizTipi != 0 ? dovizTipi : null);

  @action
  void setDovizTutari(double? dovizTutari) => model = model.copyWith(dovizTutari: dovizTutari);

  @action
  void setTutar(double? tutar) => model = model.copyWith(tutar: tutar);

  @action
  void setMasrafCikisHesabindanMi(double? masraf) => model = model.copyWith(masrafTutari: masraf);

  @action
  void setBSMV(double? bsmv) => model = model.copyWith(bsmvTutari: bsmv);

  @action
  void setMasrafMuhKodu(String? masrafMuhKodu) => model = model.copyWith(masrafMuhKodu: masrafMuhKodu);

  @action
  void setPlasiyerKodu(String? plasiyerKodu) => model = model.copyWith(plasiyerKodu: plasiyerKodu);

  @action
  void setProjeKodu(String? projeKodu) => model = model.copyWith(projeKodu: projeKodu);

  @action
  void setAciklama(String? aciklama) => model = model.copyWith(aciklama: aciklama);

  @action
  void setDovizKurlariListesi(List<DovizKurlariModel>? value) => dovizKurlariListesi = value?.asObservable();

  @action
  Future<void> getDovizler() async {
    if (model.dovizTipi == null) {
      return;
    }
    final result = await networkManager.dioGet<DovizKurlariModel>(
      path: ApiUrls.getDovizKurlari,
      bodyModel: DovizKurlariModel(),
      showLoading: true,
      queryParameters: {"EkranTipi": "D", "DovizKodu": model.dovizTipi ?? "", "tarih": model.tarih.toDateString},
    );
    if (result.isSuccess) {
      setDovizKurlariListesi(result.dataList);
    }
  }

  @action
  Future<GenericResponseModel<NetworkManagerMixin>> saveTahsilat() async =>
      await networkManager.dioPost<BankaListesiModel>(path: ApiUrls.saveDekont, bodyModel: BankaListesiModel(), data: model.toJson(), showLoading: true);
}
