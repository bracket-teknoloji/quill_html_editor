import "package:mobx/mobx.dart";
import "package:picker/core/base/model/banka_hesaplari_model.dart";
import "package:picker/core/base/model/banka_sozlesmesi_model.dart";
import "package:picker/core/base/model/base_network_mixin.dart";
import "package:picker/core/base/model/doviz_kurlari_model.dart";
import "package:picker/core/base/model/generic_response_model.dart";
import "package:picker/core/base/model/muhasebe_referans_model.dart";
import "package:picker/core/base/model/seri_model.dart";
import "package:picker/core/base/model/tahsilat_request_model.dart";
import "package:picker/core/base/view_model/mobx_network_mixin.dart";
import "package:picker/core/constants/extensions/number_extensions.dart";
import "package:picker/core/constants/ondalik_utils.dart";
import "package:picker/core/init/network/login/api_urls.dart";
import "package:picker/view/main_page/alt_sayfalar/siparis/base_siparis_edit/model/base_siparis_edit_model.dart";
import "package:picker/view/main_page/model/param_model.dart";
import "package:uuid/uuid.dart";

part "muhtelif_odeme_view_model.g.dart";

class MuhtelifOdemeViewModel = _MuhtelifOdemeViewModelBase with _$MuhtelifOdemeViewModel;

abstract class _MuhtelifOdemeViewModelBase with Store, MobxNetworkMixin {
  @observable
  double? cariBakiye;

  @observable
  String? appBarSubTitle;

  @observable
  ObservableList<SeriModel>? seriList;

  @observable
  ObservableList<BankaSozlesmesiModel>? bankaSozlesmesiList;

  @observable
  ObservableList<BankaHesaplariModel>? bankaHesaplariList;

  @observable
  ObservableList<MuhasebeReferansModel>? muhaRefList;

  @observable
  TahsilatRequestModel model = TahsilatRequestModel(yeniKayit: true, gc: "C", tag: "TahsilatModel", pickerBelgeTuru: "MUO", hesapTipi: "M");

  @computed
  String? get getCariBakiye => cariBakiye?.commaSeparatedWithDecimalDigits(OndalikEnum.oran);

  @action
  void setCariBakiye(double? value) => cariBakiye = value;

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
  void setTutar(double? value) => model = model.copyWith(tutar: value);

  @action
  void setTahsilatMi(bool? value) => model = model.copyWith(tahsilatmi: value, gc: value == true ? "G" : "C");
  @action
  void setPlasiyerKodu(PlasiyerList? value) => model = model.copyWith(plasiyerKodu: value?.plasiyerKodu);

  @action
  void setHesapTipi(String? value) => model = model.copyWith(hesapTipi: value);

  @action
  void setReferansKodu(String? value) => model = model.copyWith(refKod: value);

  @action
  void setMuhaRefList(List<MuhasebeReferansModel>? value) => muhaRefList = value?.asObservable();

  @action
  Future<void> getMuhaRefList() async {
    var result = await networkManager.dioGet<MuhasebeReferansModel>(path: ApiUrls.getMuhaRefList, bodyModel: MuhasebeReferansModel(), showLoading: true);
    if (result.data is List) {
      setMuhaRefList(result.data.cast<MuhasebeReferansModel>());
    }
  }

  @action
  Future<void> getSiradakiKod() async {
    var result = await networkManager.dioGet<BaseSiparisEditModel>(
        path: ApiUrls.getSiradakiBelgeNo, bodyModel: BaseSiparisEditModel(), showLoading: true, queryParameters: {"Seri": model.belgeNo ?? "", "BelgeTipi": "TH", "EIrsaliye": "H"});
    if (result.data is List) {
      setBelgeNo((result.data.first as BaseSiparisEditModel).belgeNo);
    }
  }

  @action
  Future<GenericResponseModel<NetworkManagerMixin>> postData() async =>
      await networkManager.dioPost<DovizKurlariModel>(path: ApiUrls.saveTahsilat, bodyModel: DovizKurlariModel(), showLoading: true, data: (model..guid = const Uuid().v4()).toJson());
}
