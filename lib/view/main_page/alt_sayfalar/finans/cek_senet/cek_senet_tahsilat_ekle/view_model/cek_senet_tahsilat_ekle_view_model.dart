import "package:mobx/mobx.dart";
import "package:picker/core/base/model/doviz_kurlari_model.dart";
import "package:picker/core/base/model/muhasebe_referans_model.dart";
import "package:picker/core/base/view_model/mobx_network_mixin.dart";
import "package:picker/core/init/network/login/api_urls.dart";

import "../../../../../../../core/constants/extensions/date_time_extensions.dart";
import "../../cek_senet_tahsilati/model/save_cek_senet_model.dart";

part "cek_senet_tahsilat_ekle_view_model.g.dart";

class CekSenetTahsilatEkleViewModel = _CekSenetTahsilatEkleViewModelBase with _$CekSenetTahsilatEkleViewModel;

abstract class _CekSenetTahsilatEkleViewModelBase with Store, MobxNetworkMixin {
  @observable
  CekSenetKalemlerModel model = CekSenetKalemlerModel(ciroTipi: "A", tag: "CekSenetModel");

  @observable
  ObservableList<DovizKurlariModel>? dovizKurlariListesi;
  @observable
  ObservableList<MuhasebeReferansModel>? muhaRefList;

  @action
  void setModel(CekSenetKalemlerModel value) => model = value;

  @action
  void setBankaHesapKodu(String? value) => model = model.copyWith(verenKodu: value);

  @action
  void setAsilCari(String? value) => model = model.copyWith(asilCari: value);

  @action
  void setDuzenlendigiYer(String? value) => model = model.copyWith(duzenlendigiYer: value);

  @action
  void setCiroTipi(String? value) => model = model.copyWith(ciroTipi: value);

  @action
  void setVadeTarihi(DateTime? value) => model = model.copyWith(vadeTarihi: value.dateTimeWithoutTime);

  @action
  void setDovizTipi(int? value) => model = model.copyWith(dovizTipi: (value ?? 0) > 0 ? value : 0);

  @action
  void setDovizAdi(String? value) => model = model.copyWith(dovizAdi: value);

  @action
  void setDovizTutari(double? value) => model = model.copyWith(dovizTutari: value);

  @action
  void setTutar(double? value) => model = model.copyWith(tutar: value);

  @action
  void setSeriNo(String? value) => model = model.copyWith(seriNo: value);

  @action
  void setBanka(String? value) => model = model.copyWith(cekBanka: value);

  @action
  void setSube(String? value) => model = model.copyWith(cekSube: value);

  @action
  void setHesapNo(String? value) => model = model.copyWith(hesapNo: value);

  @action
  void setIBAN(String? value) => model = model.copyWith(ibanNo: value);

  @action
  void setIl(String? value) => model = model.copyWith(sehir: value);

  @action
  void setIlce(String? value) => model = model.copyWith(ilce: value);

  @action
  void setRaporKodu(String? value) => model = model.copyWith(raporKodu: value);

  @action
  void setCariRaporKodu(String? value) => model = model.copyWith(cariRaporKodu: value);

  @action
  void setDovizKurlariListesi(List<DovizKurlariModel>? value) => dovizKurlariListesi = value?.asObservable();

  @action
  void setAciklama1(String? value) => model = model.copyWith(aciklama1: value);

  @action
  void setAciklama2(String? value) => model = model.copyWith(aciklama2: value);

  @action
  void setAciklama3(String? value) => model = model.copyWith(aciklama3: value);

  @action
  void setReferans(MuhasebeReferansModel? value) => model = model.copyWith(refKod: value?.kodu, refTanimi: value?.tanimi);

  @action
  void setMuhaRefList(List<MuhasebeReferansModel>? value) => muhaRefList = value?.asObservable();

  @action
  Future<void> getMuhaRefList() async {
    final result = await networkManager.dioGet<MuhasebeReferansModel>(path: ApiUrls.getMuhaRefList, bodyModel: MuhasebeReferansModel(), showLoading: true);
    if (result.data is List) {
      setMuhaRefList(result.data.cast<MuhasebeReferansModel>());
    }
  }

  @action
  Future<void> getDovizler() async {
    if (model.dovizTipi == 0) {
      setDovizKurlariListesi(null);
      return;
    }
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
}
