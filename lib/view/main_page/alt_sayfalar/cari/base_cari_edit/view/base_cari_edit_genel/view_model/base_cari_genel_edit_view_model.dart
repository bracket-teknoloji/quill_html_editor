import "package:mobx/mobx.dart";

import "../../../../../../../../core/base/view_model/mobx_network_mixin.dart";
import "../../../../../../../../core/constants/extensions/number_extensions.dart";
import "../../../../../../../../core/init/network/login/api_urls.dart";
import "../../../../../../model/param_model.dart";
import "../../../../cari_listesi/model/cari_detay_model.dart";
import "../../../../cari_listesi/model/cari_save_request_model.dart";
import "../../../../cari_listesi/model/cari_sehirler_model.dart";
import "../model/ulke_model.dart";

part "base_cari_genel_edit_view_model.g.dart";

class BaseCariGenelEditViewModel = _BaseCariGenelEditViewModelBase with _$BaseCariGenelEditViewModel;

abstract class _BaseCariGenelEditViewModelBase with Store, MobxNetworkMixin {
  final Map<String, String> cariTipiMap = <String, String>{"Alıcı": "A", "Satıcı": "S", "Toptancı": "T", "Kefil": "K", "Müstahsil": "M", "Diğer": "D", "Komisyoncu": "I"};

  @observable
  CariSaveRequestModel? model;
  @observable
  bool isDovizli = false;
  @observable
  bool isSahisFirmasi = false;
  @observable
  List<CariSehirlerModel>? sehirler;
  @observable
  List<UlkeModel>? ulkeler;

  @action
  void changeIslemKodu(int? value) {
    model = model?.copyWith(islemKodu: value);
    CariSaveRequestModel.setInstance(model);
  }

  @action
  void changeIsSahisFirmasi(bool value) {
    isSahisFirmasi = value;
    model = model?.copyWith(sahisFirmasi: value ? true : null);
    CariSaveRequestModel.setInstance(model);
  }

  @action
  void changeIsDovizli(bool value) {
    isDovizli = value;
    model = model?.copyWith(dovizli: value ? "E" : "H");
    CariSaveRequestModel.setInstance(model);
  }

  @action
  void changeKodu(String? value) {
    model = model?.copyWith(kodu: value);
    CariSaveRequestModel.setInstance(model);
  }

  @action
  void setModel(CariSaveRequestModel? value) {
    model = value;
    model?.requestVersion = 6;
    model?.efaturaSenaryo ??= CariDetayModel.instance.cariList?.firstOrNull?.efaturaTipi;
    model?.kilit ??= CariDetayModel.instance.cariList?.firstOrNull?.kilit ?? "H";
    model?.subeKodu ??= CariDetayModel.instance.cariList?.firstOrNull?.subeKodu.toStringIfNotNull ?? "-1";
    CariSaveRequestModel.setInstance(value);
  }

  @action
  void changeCariTipi(String? value) {
    model = model?.copyWith(tipi: value);
    CariSaveRequestModel.setInstance(model);
  }

  @action
  void changeIl(String? value) {
    model = model?.copyWith(sehir: value);
    CariSaveRequestModel.setInstance(model);
  }

  @action
  void changeWeb(String? value) {
    model = model?.copyWith(website: value);
    CariSaveRequestModel.setInstance(model);
  }

  @action
  void changeEposta(String? value) {
    model = model?.copyWith(eposta: value);
    CariSaveRequestModel.setInstance(model);
  }

  @action
  void changeVergiDairesi(String? value) {
    model = model?.copyWith(vergiDairesi: value);
    CariSaveRequestModel.setInstance(model);
  }

  @action
  void changeVergiNo(String? value) {
    model = model?.copyWith(vergiNo: value);
    CariSaveRequestModel.setInstance(model);
  }

  @action
  void changeIlce(String? value) {
    model = model?.copyWith(ilce: value);
    CariSaveRequestModel.setInstance(model);
  }

  @action
  void changePostaKodu(String? value) {
    model = model?.copyWith(postakodu: value);
    CariSaveRequestModel.setInstance(model);
  }

  @action
  void changeAdres(String? value) {
    model = model?.copyWith(adres: value);
    CariSaveRequestModel.setInstance(model);
  }

  @action
  void changeTelefon(String? value) {
    model = model?.copyWith(telefon: value);
    CariSaveRequestModel.setInstance(model);
  }

  @action
  void changeVadeGunu(int? value) {
    model = model?.copyWith(vadeGunu: value.toStringIfNotNull);
    CariSaveRequestModel.setInstance(model);
  }

  @action
  void changeDovizTipi(DovizList? value) {
    model = model?.copyWith(dovizKodu: value?.dovizKodu, dovizKoduAciklama: value?.isim);
    CariSaveRequestModel.setInstance(model);
  }

  @action
  void changePlasiyer(String? value) {
    model = model?.copyWith(plasiyerKodu: value);
    CariSaveRequestModel.setInstance(model);
  }

  @action
  void changeOdemeTipi(String? value) {
    model = model?.copyWith(odemeTipi: value);
    CariSaveRequestModel.setInstance(model);
  }

  @action
  void changeUlke(UlkeModel? value) {
    model = model?.copyWith(ulkeKodu: value?.ulkeKodu, ulkeKoduAciklama: value?.ulkeAdi);
    CariSaveRequestModel.setInstance(model);
  }

  @action
  void changeBagliCari(String? value) {
    model = model?.copyWith(bagliCari: value);
    CariSaveRequestModel.setInstance(model);
  }

  @action
  void changeAdi(String? value) {
    model = model?.copyWith(adi: value);
    CariSaveRequestModel.setInstance(model);
  }

  @action
  void changeBilgi(String? value) {
    model = model?.copyWith(bilgi: value);
    CariSaveRequestModel.setInstance(model);
  }

  @action
  void changeKosul(String? value) {
    model = model?.copyWith(kosulKodu: value);
    CariSaveRequestModel.setInstance(model);
  }

  @action
  Future<void> getFilterData() async {
    final result = await networkManager.dioGet<CariSehirlerModel>(
      path: ApiUrls.getCariKayitliSehirler,
      bodyModel: CariSehirlerModel(),
      addTokenKey: true,
      addSirketBilgileri: true,
      headers: <String, String>{"Modul": "CARI", "GrupNo": "-1", "Kullanimda": "E"},
    );
    if (result.isSuccess) {
      sehirler = result.dataList;
    }
  }

  @action
  Future<void> getUlkeData() async {
    final response = await networkManager.dioGet<UlkeModel>(path: ApiUrls.getUlkeler, bodyModel: UlkeModel(), addCKey: true, addSirketBilgileri: true, addTokenKey: true);
    ulkeler = response.dataList;
  }
}
