import "package:mobx/mobx.dart";
import "package:picker/core/base/model/base_proje_model.dart";
import "package:picker/core/base/view_model/mobx_network_mixin.dart";
import "package:picker/core/constants/static_variables/singleton_models.dart";
import "package:picker/core/init/cache/cache_manager.dart";
import "package:picker/core/init/network/login/api_urls.dart";
import "package:picker/view/main_page/alt_sayfalar/sayim/sayim_listesi/model/sayim_kalem_request_model.dart";
import "package:picker/view/main_page/alt_sayfalar/sayim/sayim_listesi/model/sayim_listesi_model.dart";
import "package:picker/view/main_page/alt_sayfalar/stok/base_stok_edit/model/stok_detay_model.dart";
import "package:picker/view/main_page/alt_sayfalar/stok/stok_liste/model/stok_listesi_model.dart";

part "sayim_girisi_view_model.g.dart";

class SayimGirisiViewModel = _SayimGirisiViewModelBase with _$SayimGirisiViewModel;

abstract class _SayimGirisiViewModelBase with Store, MobxNetworkMixin {
  @observable
  SayimFiltreModel filtreModel = SingletonModels.sayimListesi?.filtre ?? SayimFiltreModel(islemKodu: 1, belgeNo: SingletonModels.sayimListesi?.fisno, miktar: 1);

  @observable
  StokListesiModel? stokModel = SingletonModels.sayimListesi?.stokModel;

  @observable
  bool hemenKaydetsinMi = CacheManager.getProfilParametre.sayimStokSecildigindeHemenKaydet;

  @observable
  bool otomatikEtiketYazdir = CacheManager.getProfilParametre.sayimOtomatikEtiketYazdir;

  @action
  Future<bool?> deleteItem() async {
    final result = await networkManager.dioPost(
      path: ApiUrls.deleteSayimKalem,
      bodyModel: SayimFiltreModel(),
      showLoading: true,
      queryParameters: SayimKalemRequestModel.fromSayimFiltreModel(filtreModel).toJson(),
    );
    return result.isSuccess;
  }

  @action
  void setHemenKaydet(bool value) {
    hemenKaydetsinMi = value;
    CacheManager.setProfilParametre(CacheManager.getProfilParametre.copyWith(sayimStokSecildigindeHemenKaydet: value));
  }

  @action
  void setOtomatikEtiketYazdir(bool value) {
    otomatikEtiketYazdir = value;
    if (!value) {
      SingletonModels.sayimPrintModel = null;
    }
    CacheManager.setProfilParametre(CacheManager.getProfilParametre.copyWith(sayimOtomatikEtiketYazdir: value));
  }

  @action
  void setStokModel(StokListesiModel? model) {
    stokModel = model;
    filtreModel = filtreModel.copyWith(stokKodu: model?.stokKodu, stokAdi: model?.stokAdi);
    SingletonModels.sayimListesi?.stokModel = model;
    SingletonModels.setFiltreModel = filtreModel;
  }

  @action
  void setProjeKodu(BaseProjeModel? value) {
    filtreModel = filtreModel.copyWith(projeKodu: value?.projeKodu, projeAdi: value?.projeAciklama);
    SingletonModels.setFiltreModel = filtreModel;
  }

  @action
  void setOlcuBirimi(int? value) {
    filtreModel = filtreModel.copyWith(olcuBirimKodu: value);
    SingletonModels.setFiltreModel = filtreModel;
  }

  @action
  void setEkAlan1(String? value) {
    filtreModel = filtreModel.copyWith(kull1s: value);
    SingletonModels.setFiltreModel = filtreModel;
  }

  @action
  void setEkAlan2(String? value) {
    filtreModel = filtreModel.copyWith(kull2s: value);
    SingletonModels.setFiltreModel = filtreModel;
  }

  @action
  void setEkAlan3(String? value) {
    filtreModel = filtreModel.copyWith(kull3s: value);
    SingletonModels.setFiltreModel = filtreModel;
  }

  @action
  void setEkAlan4(String? value) {
    filtreModel = filtreModel.copyWith(kull4s: value);
    SingletonModels.setFiltreModel = filtreModel;
  }

  @action
  void setEkAlan5(String? value) {
    filtreModel = filtreModel.copyWith(kull5s: value);
    SingletonModels.setFiltreModel = filtreModel;
  }

  @action
  void setSeriler(List<SeriList>? list) {
    filtreModel = filtreModel.copyWith(seriList: list);
    SingletonModels.setFiltreModel = filtreModel;
  }

  @action
  void increaseMiktar() {
    filtreModel = filtreModel.copyWith(miktar: (filtreModel.miktar ?? 0) + 1);
    SingletonModels.setFiltreModel = filtreModel;
  }

  @action
  void decreaseMiktar() {
    if (filtreModel.miktar case (0 || null)) {
      filtreModel = filtreModel.copyWith(miktar: 0);
    } else {
      filtreModel = filtreModel.copyWith(miktar: (filtreModel.miktar ?? 0) - 1);
    }
    SingletonModels.setFiltreModel = filtreModel;
  }
}
