import "package:mobx/mobx.dart";
import "package:picker/core/base/model/base_network_mixin.dart";
import "package:picker/core/base/model/generic_response_model.dart";
import "package:picker/core/base/view_model/mobx_network_mixin.dart";
import "package:picker/core/constants/extensions/date_time_extensions.dart";
import "package:picker/core/constants/static_variables/singleton_models.dart";
import "package:picker/core/init/cache/cache_manager.dart";
import "package:picker/core/init/network/login/api_urls.dart";
import "package:picker/view/main_page/alt_sayfalar/cari/cari_aktivite_kayitlari/model/cari_aktivite_listesi_model.dart";
import "package:picker/view/main_page/model/param_model.dart";

part "cari_aktivite_detayi_view_model.g.dart";

class CariAktiviteDetayiViewModel = _CariAktiviteDetayiViewModelBase with _$CariAktiviteDetayiViewModel;

abstract class _CariAktiviteDetayiViewModelBase with Store, MobxNetworkMixin {
  @observable
  CariAktiviteListesiModel model = CariAktiviteListesiModel(kayityapankul: CacheManager.getAnaVeri?.userModel?.kuladi, aktiviteId: SingletonModels.cariAktiviteListesi?.id);

  @action
  void setModel(CariAktiviteListesiModel value) => model = value;

  @action
  void setTarih(DateTime? value) => model = model.copyWith(tarih: value?.dateTimeWithoutTime);

  @action
  void setAktiviteTipi(CariAktiviteTipleri? value) => model = model.copyWith(aktiviteAdi: value?.aktiviteAdi, aktiviteTipi: value?.aktiviteTipi);

  @action
  void setBolum(String? value) => model = model.copyWith(bolum: value);

  @action
  void setIlgiliKisi(String? value) => model = model.copyWith(ilgiliKisi: value);

  @action
  void setAciklama(String? value) => model = model.copyWith(aciklama: value);

  @action
  Future<GenericResponseModel<NetworkManagerMixin>> getData() async =>
      networkManager.dioPost(path: ApiUrls.saveAktivite, bodyModel: CariAktiviteListesiModel(), data: {"DETAY_MODEL": model.toJson(), "ISLEM_KODU": 4}, showLoading: true);
}
