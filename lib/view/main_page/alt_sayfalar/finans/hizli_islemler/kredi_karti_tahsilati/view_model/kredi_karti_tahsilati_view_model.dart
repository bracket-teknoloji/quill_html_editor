import "package:mobx/mobx.dart";
import "package:picker/view/main_page/alt_sayfalar/finans/banka/banka_listesi/model/banka_listesi_model.dart";
import "package:uuid/uuid.dart";

import "../../../../../../../core/base/model/banka_sozlesmesi_model.dart";
import "../../../../../../../core/base/model/base_network_mixin.dart";
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

part "kredi_karti_tahsilati_view_model.g.dart";

class KrediKartiTahsilatiViewModel = _KrediKartiTahsilatiViewModelBase with _$KrediKartiTahsilatiViewModel;

abstract class _KrediKartiTahsilatiViewModelBase with Store, MobxNetworkMixin {
  @observable
  double? cariBakiye;

  @observable
  String? appBarSubTitle;

  @observable
  ObservableList<SeriModel>? seriList;

  @observable
  ObservableList<BankaSozlesmesiModel>? bankaSozlesmesiList;

  @observable
  ObservableList<BankaListesiModel>? bankaHesaplariList;

  @observable
  ObservableList<MuhasebeReferansModel>? muhaRefList;

  @observable
  bool? showReferansKodu = false;

  @observable
  TahsilatRequestModel model = TahsilatRequestModel(tahsilatmi: true, yeniKayit: true, gc: "G", tag: "TahsilatModel", pickerBelgeTuru: "KKT", hesapTipi: "T");

  @computed
  String? get getCariBakiye => cariBakiye?.commaSeparatedWithDecimalDigits(OndalikEnum.oran);

  @action
  void setCariBakiye(double? value) => cariBakiye = value;

  @action
  void setShowReferansKodu(bool? value) => showReferansKodu = value;

  @action
  void setAppBarSubTitle(String? value) => appBarSubTitle = value;

  @action
  void setBelgeNo(String? value) => model = model.copyWith(belgeNo: value);

  @action
  void setTarih(DateTime? value) => model = model.copyWith(tarih: value);

  @action
  void setAciklama(String? value) => model = model.copyWith(aciklama: value);

  @action
  void setKasaKodu(String? value) => model = model.copyWith(kasaKodu: value);

  @action
  void setHesapKodu(String? value) => model = model.copyWith(hesapKodu: value);

  @action
  void setHedefAciklama(String? value) => model = model.copyWith(hedefAciklama: value);

  @action
  void setPickerBelgeTuru(String? value) => model = model.copyWith(pickerBelgeTuru: value);

  @action
  void setKrediKartiNo(String? value) => model = model.copyWith(krediKartNo: value);

  @action
  void setTutar(double? value) => model = model.copyWith(tutar: value);

  @action
  void setSeriList(List<SeriModel>? value) {
    if (value != null) {
      seriList = value.asObservable();
    }
  }

  @action
  void setCariKodu(String? value) => model = model.copyWith(cariKodu: value);

  @action
  void setSeri(SeriModel? value) => model = model.copyWith(dekontSeri: value?.seriNo);

  @action
  void setDovizTutari(double? value) => model = model.copyWith(dovizTutari: value);

  @action
  void setProjekodu(String? value) => model = model.copyWith(projeKodu: value);

  @action
  void setBankaSozlesmesiList(List<BankaSozlesmesiModel>? value) => bankaSozlesmesiList = value?.asObservable();

  @action
  void setMuhaRefList(List<MuhasebeReferansModel>? value) => muhaRefList = value?.asObservable();

  @action
  void setBankaHesaplariList(List<BankaListesiModel>? value) => bankaHesaplariList = value?.asObservable();

  @action
  void setPlasiyerKodu(PlasiyerList? value) => model = model.copyWith(plasiyerKodu: value?.plasiyerKodu);

  @action
  void setKktYontemi(String? value) => model = model.copyWith(kktYontemi: value);

  @action
  void setHesapTipi(String? value) => model = model.copyWith(hesapTipi: value);

  @action
  void setSozlesmeKodu(String? value) => model = model.copyWith(sozlesmeKodu: value);

  @action
  void setReferansKodu(String? value) => model = model.copyWith(refKod: value);

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
    if (result.data is List) {
      setBelgeNo((result.data.first as BaseSiparisEditModel).belgeNo);
    }
  }

  @action
  Future<void> getBankaSozlesmesi() async {
    final result = await networkManager
        .dioGet<BankaSozlesmesiModel>(path: ApiUrls.getBankaSozlesmeleri, bodyModel: BankaSozlesmesiModel(), showLoading: true, queryParameters: {"Tarih": model.tarih.toDateString, "EkranTipi": "R"});
    if (result.data is List) {
      setBankaSozlesmesiList(result.data.cast<BankaSozlesmesiModel>());
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
  Future<void> getSeri() async {
    final result = await networkManager.dioGet<SeriModel>(path: ApiUrls.getDekontSeriler, bodyModel: SeriModel());
    if (result.data is List) {
      setSeriList(result.data.cast<SeriModel>());
    }
  }

  @action
  Future<void> getBankaHesaplari() async {
    final result = await networkManager.dioGet<BankaListesiModel>(path: ApiUrls.getBankaHesaplari, bodyModel: BankaListesiModel());
    if (result.data is List) {
      setBankaHesaplariList(result.data.cast<BankaListesiModel>());
    }
  }

  @action
  Future<KasaList?> getKasalar(String? kasaKodu) async {
    final result = await networkManager.dioGet<KasaList>(path: ApiUrls.getKasalar, bodyModel: KasaList(), showLoading: true, queryParameters: {"KisitYok": true, "KasaKodu": kasaKodu});
    if (result.data is List) {
      return result.data.first as KasaList;
    }
    return null;
  }

  @action
  Future<GenericResponseModel<NetworkManagerMixin>> postData() async =>
      await networkManager.dioPost<DovizKurlariModel>(path: ApiUrls.saveTahsilat, bodyModel: DovizKurlariModel(), showLoading: true, data: (model..guid = const Uuid().v4()).toJson());
}
