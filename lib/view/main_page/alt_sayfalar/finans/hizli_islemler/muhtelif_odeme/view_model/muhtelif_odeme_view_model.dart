import "package:mobx/mobx.dart";
import "../../../banka/banka_listesi/model/banka_listesi_model.dart";
import "package:uuid/uuid.dart";


import "../../../../../../../core/base/model/banka_sozlesmesi_model.dart";
import "../../../../../../../core/base/model/base_network_mixin.dart";
import "../../../../../../../core/base/model/base_proje_model.dart";
import "../../../../../../../core/base/model/doviz_kurlari_model.dart";
import "../../../../../../../core/base/model/generic_response_model.dart";
import "../../../../../../../core/base/model/muhasebe_referans_model.dart";
import "../../../../../../../core/base/model/seri_model.dart";
import "../../../../../../../core/base/model/tahsilat_request_model.dart";
import "../../../../../../../core/base/view_model/mobx_network_mixin.dart";
import "../../../../../../../core/constants/extensions/date_time_extensions.dart";
import "../../../../../../../core/constants/extensions/number_extensions.dart";
import "../../../../../../../core/constants/ondalik_utils.dart";
import "../../../../../../../core/init/network/login/api_urls.dart";
import "../../../../../model/param_model.dart";
import "../../../../siparis/base_siparis_edit/model/base_siparis_edit_model.dart";

part "muhtelif_odeme_view_model.g.dart";

class MuhtelifOdemeViewModel = _MuhtelifOdemeViewModelBase with _$MuhtelifOdemeViewModel;

abstract class _MuhtelifOdemeViewModelBase with Store, MobxNetworkMixin {
  @observable
  double? cariBakiye;

  @observable
  String? appBarSubTitle;

  @observable
  KasaList? kasa;

  @observable
  ObservableList<SeriModel>? seriList;

  @observable
  ObservableList<BankaSozlesmesiModel>? bankaSozlesmesiList;

  @observable
  ObservableList<DovizKurlariModel>? dovizKurlariListesi;

  @observable
  ObservableList<BankaListesiModel>? bankaHesaplariList;

  @observable
  ObservableList<MuhasebeReferansModel>? muhaRefList;

  @observable
  TahsilatRequestModel model = TahsilatRequestModel(yeniKayit: true, gc: "C", tag: "TahsilatModel", pickerBelgeTuru: "MUO", hesapTipi: "M");

  @observable
  String? showReferansKodu;

  @computed
  String? get getCariBakiye => cariBakiye?.commaSeparatedWithDecimalDigits(OndalikEnum.oran);

  @action
  void setShowReferansKodu(String? value) => showReferansKodu = value;

  @action
  void setCariBakiye(double? value) => cariBakiye = value;

  @action
  void setAppBarSubTitle(String? value) => appBarSubTitle = value;

  @action
  void setBelgeNo(String? value) => model = model.copyWith(belgeNo: value);

  @action
  void setTarih(DateTime? value) => model = model.copyWith(tarih: value.dateTimeWithoutTime);

  @action
  void setAciklama(String? value) => model = model.copyWith(aciklama: value);

  @action
  void setKasaKodu(KasaList? value) {
    kasa = value;
    model = model.copyWith(kasaKodu: value?.kasaKodu);
  }

  @action
  void setHesapKodu(String? value) => model = model.copyWith(hesapKodu: value);

  @action
  void setTutar(double? value) => model = model.copyWith(tutar: value);

  @action
  void setTahsilatMi(bool? value) => model = model.copyWith(tahsilatmi: value, gc: value == true ? "G" : "C", pickerBelgeTuru: value == true ? "MUT" : "MUO");

  @action
  void setPlasiyerKodu(PlasiyerList? value) => model = model.copyWith(plasiyerKodu: value?.plasiyerKodu);

  @action
  void setProjeKodu(BaseProjeModel? value) => model = model.copyWith(projeKodu: value?.projeKodu);

  @action
  void setDovizTipi(int? value) => model = model.copyWith(dovizTipi: value);

  @action
  void setDovizTutari(double? value) => model = model.copyWith(dovizTutari: value);

  @action
  void setHesapTipi(String? value) => model = model.copyWith(hesapTipi: value);

  @action
  void setReferansKodu(String? value) => model = model.copyWith(refKod: value);

  @action
  void setMuhaRefList(List<MuhasebeReferansModel>? value) => muhaRefList = value?.asObservable();

  @action
  void setDovizKurlariListesi(List<DovizKurlariModel>? value) {
    if (value != null) {
      dovizKurlariListesi = value.asObservable();
    }
  }

  @action
  Future<void> getMuhaRefList() async {
    final result = await networkManager.dioGet<MuhasebeReferansModel>(path: ApiUrls.getMuhaRefList, bodyModel: MuhasebeReferansModel(), showLoading: true);
    if (result.data is List) {
      setMuhaRefList(result.data.cast<MuhasebeReferansModel>());
    }
  }

  @action
  Future<void> getSiradakiKod() async {
    final result = await networkManager.dioGet<BaseSiparisEditModel>(
      path: ApiUrls.getSiradakiBelgeNo,
      bodyModel: BaseSiparisEditModel(),
      showLoading: true,
      queryParameters: {"Seri": model.belgeNo ?? "", "BelgeTipi": "TH", "EIrsaliye": "H"},
    );
    if (result.data is List) {
      setBelgeNo((result.data.first as BaseSiparisEditModel).belgeNo);
    }
  }

  @action
  Future<void> getDovizler() async {
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

  @action
  Future<GenericResponseModel<NetworkManagerMixin>> postData() async =>
      await networkManager.dioPost<DovizKurlariModel>(path: ApiUrls.saveTahsilat, bodyModel: DovizKurlariModel(), showLoading: true, data: (model..guid = const Uuid().v4()).toJson());
}
