import "package:mobx/mobx.dart";
import "package:picker/core/base/model/base_network_mixin.dart";
import "package:picker/core/base/model/generic_response_model.dart";
import "package:picker/core/base/model/kullanicilar_model.dart";
import "package:picker/core/base/view_model/mobx_network_mixin.dart";
import "package:picker/core/constants/enum/base_edit_enum.dart";
import "package:picker/core/init/network/login/api_urls.dart";
import "package:picker/view/main_page/alt_sayfalar/cari/cari_aktivite_kayitlari/model/cari_aktivite_listesi_model.dart";
import "package:picker/view/main_page/alt_sayfalar/cari/cari_listesi/model/cari_listesi_model.dart";
import "package:picker/view/main_page/model/param_model.dart";

part "cari_aktivite_genel_view_model.g.dart";

class CariAktiviteGenelViewModel = CariAktiviteGenelViewModelBase with _$CariAktiviteGenelViewModel;

abstract class CariAktiviteGenelViewModelBase with Store, MobxNetworkMixin {
  @observable
  CariAktiviteListesiModel model = CariAktiviteListesiModel();

  @observable
  BaseEditEnum? baseEditEnum;

  @observable
  bool aktiviteBitirilsinMi = false;

  @action
  void setBaseEditEnum(BaseEditEnum? value) => baseEditEnum = value;

  @action
  void setAktiviteBitirilsinMi(bool value) => aktiviteBitirilsinMi = value;

  @action
  void setModel(CariAktiviteListesiModel value) => model = value;

  @action
  void setBaslangicTarihi(DateTime? value) => model = model.copyWith(bastar: value);

  @action
  void setSaat(DateTime? value) => model = model.copyWith(bastar: DateTime(model.bastar!.year, model.bastar!.month, model.bastar!.day, value!.hour, value.minute, value.second));

  @action
  void setCari(CariListesiModel? value) => model = model.copyWith(cariKodu: value?.cariKodu, cariAdi: value?.cariAdi);

  @action
  void setBolum(String? value) => model = model.copyWith(bolum: value);

  @action
  void setIlgiliKisi(String? value) => model = model.copyWith(ilgiliKisi: value);

  @action
  void setKullanici(KullanicilarModel? value) => model = model.copyWith(kullaniciAdi: value?.kodu, kullaniciTitle: value?.adi);

  @action
  void setAktiviteTipi(CariAktiviteTipleri? value) => model = model.copyWith(aktiviteTipi: value?.aktiviteTipi, aktiviteAdi: value?.aktiviteAdi);

  @action
  void setAciklama(String? value) => model = model.copyWith(aciklama: value);

  @action
  Future<GenericResponseModel<NetworkManagerMixin>> saveCariAktivite() async {
    model = model.copyWith(islemKodu: baseEditEnum.islemKodu);
    if (aktiviteBitirilsinMi) {
      model = model.copyWith(bittar: DateTime.now());
    }
    return networkManager.dioPost(path: ApiUrls.saveAktivite, bodyModel: CariAktiviteListesiModel(), data: model.toJson(), showLoading: true);
  }
}
