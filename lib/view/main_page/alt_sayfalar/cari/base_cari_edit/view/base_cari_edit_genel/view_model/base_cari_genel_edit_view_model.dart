import "package:mobx/mobx.dart";
import "package:picker/core/constants/extensions/number_extensions.dart";
import "package:picker/view/main_page/alt_sayfalar/cari/cari_listesi/model/cari_detay_model.dart";
import "package:picker/view/main_page/alt_sayfalar/cari/cari_listesi/model/cari_save_request_model.dart";

part "base_cari_genel_edit_view_model.g.dart";

class BaseCariGenelEditViewModel = _BaseCariGenelEditViewModelBase with _$BaseCariGenelEditViewModel;

abstract class _BaseCariGenelEditViewModelBase with Store {
  @observable
  CariSaveRequestModel? model;
  @observable
  bool isDovizli = false;
  @observable
  bool isSahisFirmasi = false;

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
    model?.efaturaSenaryo = CariDetayModel.instance.cariList?.first.efaturaTipi;
    model?.kilit ??= CariDetayModel.instance.cariList?.first.kilit ?? "H";
    model?.subeKodu ??= CariDetayModel.instance.cariList?.first.subeKodu.toStringIfNotNull ?? "-1";
    CariSaveRequestModel.setInstance(value);
  }

  @action
  void changeSiradakiKod(String? value) {
    model = model?.copyWith(kodu: value);
    CariSaveRequestModel.setInstance(model);
  }

  @action
  void changeCariTipi(String? value) {
    model = model?.copyWith(tipi: value);
    CariSaveRequestModel.setInstance(model);
  }

  @action
  changeIl(String? value) {
    model = model?.copyWith(sehir: value);
    CariSaveRequestModel.setInstance(model);
  }

  @action
  changeWeb(String? value) {
    model = model?.copyWith(website: value);
    CariSaveRequestModel.setInstance(model);
  }

  @action
  changeEposta(String? value) {
    model = model?.copyWith(eposta: value);
    CariSaveRequestModel.setInstance(model);
  }

  @action
  changeVergiDairesi(String? value) {
    model = model?.copyWith(vergiDairesi: value);
    CariSaveRequestModel.setInstance(model);
  }

  @action
  changeVergiNo(String? value) {
    model = model?.copyWith(vergiNo: value);
    CariSaveRequestModel.setInstance(model);
  }

  @action
  changeIlce(String? value) {
    model = model?.copyWith(ilce: value);
    CariSaveRequestModel.setInstance(model);
  }

  @action
  changePostaKodu(String? value) {
    model = model?.copyWith(postakodu: value);
    CariSaveRequestModel.setInstance(model);
  }

  @action
  changeAdres(String? value) {
    model = model?.copyWith(adres: value);
    CariSaveRequestModel.setInstance(model);
  }

  @action
  changeTelefon(String? value) {
    model = model?.copyWith(telefon: value);
    CariSaveRequestModel.setInstance(model);
  }

  @action
  changeVadeGunu(int? value) {
    model = model?.copyWith(vadeGunu: value.toStringIfNotNull);
    CariSaveRequestModel.setInstance(model);
  }

  @action
  changeDovizTipi(int? value) {
    model = model?.copyWith(dovizKodu: value);
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
  void changeUlke(String? value) {
    model = model?.copyWith(ulkeKodu: value);
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
}
