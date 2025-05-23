import "package:mobx/mobx.dart";

import "../../../../../../../../../core/base/model/generic_response_model.dart";
import "../../../../../../../../../core/base/model/kullanicilar_model.dart";
import "../../../../../../../../../core/base/view_model/mobx_network_mixin.dart";
import "../../../../../../../../../core/constants/enum/base_edit_enum.dart";
import "../../../../../../../../../core/constants/static_variables/singleton_models.dart";
import "../../../../../../../../../core/init/network/login/api_urls.dart";
import "../../../../../../../model/param_model.dart";
import "../../../../../cari_listesi/model/cari_listesi_model.dart";
import "../../../../model/cari_aktivite_listesi_model.dart";

part "cari_aktivite_genel_view_model.g.dart";

final class CariAktiviteGenelViewModel = CariAktiviteGenelViewModelBase with _$CariAktiviteGenelViewModel;

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
  void setAktiviteBitirilsinMi(bool value) {
    aktiviteBitirilsinMi = value;
    model = model.copyWith(aktiviteBitirilsin: value);
    SingletonModels.setCariAktiviteListesi = model;
  }

  @action
  void setModel(CariAktiviteListesiModel value) {
    model = value;
    SingletonModels.setCariAktiviteListesi = model;
    setAktiviteBitirilsinMi(model.aktiviteBitirilsin == true);
  }

  @action
  void setBaslangicTarihi(DateTime? value) {
    model = model.copyWith(bastar: value);
    SingletonModels.setCariAktiviteListesi = model;
  }

  @action
  void setSaat(DateTime? value) {
    model = model.copyWith(
      bastar: DateTime(
        model.bastar!.year,
        model.bastar!.month,
        model.bastar!.day,
        value!.hour,
        value.minute,
        value.second,
      ),
    );
    SingletonModels.setCariAktiviteListesi = model;
  }

  @action
  void setCari(CariListesiModel? value) {
    model = model.copyWith(cariKodu: value?.cariKodu, cariAdi: value?.cariAdi);
    SingletonModels.setCariAktiviteListesi = model;
  }

  @action
  void setBolum(String? value) {
    model = model.copyWith(bolum: value);
    SingletonModels.setCariAktiviteListesi = model;
  }

  @action
  void setIlgiliKisi(String? value) {
    model = model.copyWith(ilgiliKisi: value);
    SingletonModels.setCariAktiviteListesi = model;
  }

  @action
  void setKullanici(KullanicilarModel? value) {
    model = model.copyWith(kullaniciAdi: value?.kodu, kullaniciTitle: value?.adi);
    SingletonModels.setCariAktiviteListesi = model;
  }

  @action
  void setAktiviteTipi(CariAktiviteTipleri? value) {
    model = model.copyWith(aktiviteTipi: value?.aktiviteTipi, aktiviteAdi: value?.aktiviteAdi);
    SingletonModels.setCariAktiviteListesi = model;
  }

  @action
  void setAciklama(String? value) {
    model = model.copyWith(aciklama: value);
    SingletonModels.setCariAktiviteListesi = model;
  }

  @action
  void setSonucAciklama(String? value) {
    model = model.copyWith(sonucAciklama: value);
    SingletonModels.setCariAktiviteListesi = model;
  }

  @action
  void setSure(double? value) {
    model = model.copyWith(
      sure: value,
      bittar: model.bastar?.add(Duration(seconds: (value ?? 0).toInt() * 360)),
    );
    SingletonModels.setCariAktiviteListesi = model;
  }

  @action
  Future<GenericResponseModel<CariAktiviteListesiModel>> saveCariAktivite() async {
    model = model.copyWith(islemKodu: baseEditEnum.islemKodu);
    if (aktiviteBitirilsinMi) {
      model = model.copyWith(bittar: DateTime.now());
    }
    return networkManager.dioPost(
      path: ApiUrls.saveAktivite,
      bodyModel: CariAktiviteListesiModel(),
      data: model.toJson(),
      showLoading: true,
    );
  }
}
