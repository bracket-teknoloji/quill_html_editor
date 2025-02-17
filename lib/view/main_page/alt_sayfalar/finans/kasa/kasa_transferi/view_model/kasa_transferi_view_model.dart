import "package:mobx/mobx.dart";
import "package:uuid/uuid.dart";

import "../../../../../../../core/base/model/base_network_mixin.dart";
import "../../../../../../../core/base/model/doviz_kurlari_model.dart";
import "../../../../../../../core/base/model/generic_response_model.dart";
import "../../../../../../../core/base/model/tahsilat_request_model.dart";
import "../../../../../../../core/base/view_model/mobx_network_mixin.dart";
import "../../../../../../../core/constants/extensions/date_time_extensions.dart";
import "../../../../../../../core/init/network/login/api_urls.dart";
import "../../../../../model/param_model.dart";
import "../../../../siparis/base_siparis_edit/model/base_siparis_edit_model.dart";

part "kasa_transferi_view_model.g.dart";

final class KasaTransferiViewModel = _KasaTransferiViewModelBase with _$KasaTransferiViewModel;

abstract class _KasaTransferiViewModelBase with Store, MobxNetworkMixin {
  @observable
  TahsilatRequestModel model = TahsilatRequestModel(
    tahsilatmi: true,
    yeniKayit: true,
    gc: "C",
    tag: "TahsilatModel",
    pickerBelgeTuru: "KAT",
    hesapTipi: "T",
  );

  @observable
  KasaList? girisKasa;

  @observable
  KasaList? cikisKasa;

  @observable
  ObservableList<DovizKurlariModel>? dovizKurlariListesi;

  @computed
  String get aciklamaString => "Transfer ${cikisKasa?.kasaTanimi ?? ""} => ${girisKasa?.kasaTanimi ?? ""}";

  @computed
  TahsilatRequestModel get getStokYeniKayitModel {
    const uuid = Uuid();
    return model.copyWith(guid: uuid.v4());
  }

  @action
  void setDovizKurlariListesi(List<DovizKurlariModel>? value) {
    if (value != null) {
      dovizKurlariListesi = value.asObservable();
    }
  }

  @action
  void setBelgeNo(String? value) => model = model.copyWith(belgeNo: value);

  @action
  void setTarih(DateTime? value) => model = model.copyWith(tarih: value.dateTimeWithoutTime);

  @action
  Future<void> setGirisKasa(KasaList value) async {
    if (value.dovizliMi) {
      girisKasa = await getKasalar(value.kasaKodu);
    } else {
      girisKasa = value;
    }
    model = model.copyWith(hesapKodu: value.kasaKodu, dovizTipi: value.dovizTipi);
  }

  @action
  Future<void> setCikisKasa(KasaList value) async {
    cikisKasa = value;
    model = model.copyWith(kasaKodu: value.kasaKodu);
  }

  @action
  void setAciklama(String? value) => model = model.copyWith(aciklama: value);

  @action
  void setTutar(double? value) => model = model.copyWith(tutar: value);

  @action
  void setDovizTutari(double? value) => model = model.copyWith(dovizTutari: value);

  @action
  void setProjekodu(String? value) => model = model.copyWith(projeKodu: value);

  @action
  void setPlasiyerKodu(PlasiyerList? value) => model = model.copyWith(plasiyerKodu: value?.plasiyerKodu);

  @action
  void setDovizTipi(int? value) => model = model.copyWith(dovizTipi: value);

  @action
  Future<void> getSiradakiKod() async {
    final result = await networkManager.dioGet<BaseSiparisEditModel>(
      path: ApiUrls.getSiradakiBelgeNo,
      bodyModel: BaseSiparisEditModel(),
      showLoading: true,
      queryParameters: {"Seri": model.belgeNo ?? "", "BelgeTipi": "TH", "EIrsaliye": "H"},
    );
    if (result.isSuccess) {
      setBelgeNo((result.dataList.firstOrNull as BaseSiparisEditModel).belgeNo);
    }
  }

  @action
  Future<KasaList?> getKasalar(String? kasaKodu) async {
    final result = await networkManager.dioGet<KasaList>(
      path: ApiUrls.getKasalar,
      bodyModel: KasaList(),
      showLoading: true,
      queryParameters: {"KisitYok": true, "KasaKodu": kasaKodu},
    );
    if (result.isSuccess) {
      return result.dataList.firstOrNull as KasaList;
    }
    return null;
  }

  @action
  Future<void> getDovizler() async {
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

  @action
  Future<GenericResponseModel<NetworkManagerMixin>> postData() async => await networkManager.dioPost<DovizKurlariModel>(
    path: ApiUrls.saveTahsilat,
    bodyModel: DovizKurlariModel(),
    showLoading: true,
    data: getStokYeniKayitModel.toJson(),
  );
}
