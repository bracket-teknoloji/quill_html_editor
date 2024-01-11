import "package:mobx/mobx.dart";
import "package:picker/core/init/cache/cache_manager.dart";

import "../../../../../../../core/base/view_model/mobx_network_mixin.dart";
import "../../../../../../../core/constants/enum/edit_tipi_enum.dart";
import "../../../../../../../core/constants/extensions/iterable_extensions.dart";
import "../../../../../../../core/init/network/login/api_urls.dart";
import "../model/finans_ozet_rapor_model.dart";
import "../model/finans_ozet_rapor_request_model.dart";

part "finans_ozet_rapor_view_model.g.dart";

class FinansOzetRaporViewModel = _FinansOzetRaporViewModelBase with _$FinansOzetRaporViewModel;

abstract class _FinansOzetRaporViewModelBase with Store, MobxNetworkMixin {
  final List<String> raporlarList = [
    "Fatura",
    "Sipariş",
    "Müşteri Çeki",
    "Müşteri Senedi",
    "Banka",
    "İrsaliye",
    "Borç Çeki",
    "Borç Senedi",
    "Teklif",
    "Kasa",
  ];
  @observable
  FinansOzetRaporRequestModel requestModel = FinansOzetRaporRequestModel(iadeDurumu: "H", kdvDahil: true);

  @observable
  ObservableList<FinansOzetRaporModel>? gunSonuRaporuList;

  @observable
  ObservableList<FinansOzetRaporModel>? aylikTutarlarList;

  @computed
  double? get toplamSatisFaturasi => aylikTutarlarList?.where((element) => element.belgeTipi == EditTipiEnum.satisFatura.rawValue).map((e) => e.tutar1).sum;

  @computed
  double? get toplamAlisFaturasi => aylikTutarlarList?.where((element) => element.belgeTipi == EditTipiEnum.alisFatura.rawValue).map((e) => e.tutar1).sum;

  @action
  void setBaslangicTarihi(String? value) => requestModel.baslamaTarihi = value;

  @action
  void setBitisTarihi(String? value) => requestModel.bitisTarihi = value;

  @action
  void setPlasiyerKodu(String? value) => requestModel.plasiyerKodu = value;

  @action
  void setCariKodu(String? value) => requestModel.cariKodu = value;

  @action
  void setCariKoduIleBaslar(String? value) => requestModel.cariKoduIleBaslar = value;

  @action
  void setKdvDahil(bool? value) => requestModel.kdvDahil = value;

  @action
  void setIadeDurumu(String? value) => requestModel.iadeDurumu = value;

  @action
  void setTarihTipi(String? value) => requestModel.tarihTipi = value;

  @action
  void setGunSonuRaporuList(List<FinansOzetRaporModel>? value) => gunSonuRaporuList = value?.asObservable();

  @action
  void setAylikTutarlarList(List<FinansOzetRaporModel>? value) => aylikTutarlarList = value?.asObservable();

  @action
  Future<void> getGunSonuRaporu() async {
    setAylikTutarlarList(null);
    final result = await networkManager.dioGet(path: ApiUrls.getGunSonuRaporu, bodyModel: FinansOzetRaporModel(), queryParameters: requestModel.toJson());
    if (result.success ?? false) {
      final List<FinansOzetRaporModel> list = (result.data as List).map((e) => e as FinansOzetRaporModel).toList().cast<FinansOzetRaporModel>();
      setGunSonuRaporuList(list);
    }
    if (CacheManager.getProfilParametre.finansOzelRaporGrafikGoster) {
      final result2 = await networkManager.dioGet(path: ApiUrls.getAylikTutarlar, bodyModel: FinansOzetRaporModel(), queryParameters: requestModel.toJson());
      if (result2.success ?? false) {
        final List<FinansOzetRaporModel> list = (result2.data as List).map((e) => e as FinansOzetRaporModel).toList().cast<FinansOzetRaporModel>();
        setAylikTutarlarList(list);
      }
    }
  }
}
