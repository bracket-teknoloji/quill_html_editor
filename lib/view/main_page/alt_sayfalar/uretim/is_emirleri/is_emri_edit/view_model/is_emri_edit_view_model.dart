import "package:mobx/mobx.dart";
import "package:picker/core/base/model/base_network_mixin.dart";
import "package:picker/core/base/model/base_proje_model.dart";
import "package:picker/core/base/model/generic_response_model.dart";
import "package:picker/core/base/view_model/mobx_network_mixin.dart";
import "package:picker/core/init/network/login/api_urls.dart";
import "package:picker/view/main_page/alt_sayfalar/siparis/base_siparis_edit/model/base_siparis_edit_model.dart";
import "package:picker/view/main_page/alt_sayfalar/stok/stok_liste/model/stok_listesi_model.dart";
import "package:picker/view/main_page/alt_sayfalar/uretim/is_emirleri/is_emri_rehberi/model/is_emirleri_model.dart";
import "package:picker/view/main_page/model/param_model.dart";

part "is_emri_edit_view_model.g.dart";

class IsEmriEditViewModel = _IsEmriEditViewModelBase with _$IsEmriEditViewModel;

abstract class _IsEmriEditViewModelBase with Store, MobxNetworkMixin {
  @observable
  IsEmirleriModel? model;

  @action
  void setModel(IsEmirleriModel? isEmri) => model = isEmri?.copyWith(requestVersion: 1);

  @action
  void setIslemKodu(int? islemKodu) => model = model?.copyWith(islemKodu: islemKodu);

  @action
  void setTarih(DateTime date) => model = model?.copyWith(tarih: date);

  @action
  void setTeslimTarihi(DateTime date) => model = model?.copyWith(teslimTarihi: date);

  @action
  void setKapaliMi(bool kapaliMi) => model = model?.copyWith(kapali: kapaliMi ? "E" : "H");

  @action
  void setBelgeNo(String belgeNo) => model = model?.copyWith(isemriNo: belgeNo);

  @action
  void setStok(StokListesiModel? stok) => model = model?.copyWith(stokKodu: stok?.stokKodu, stokAdi: stok?.stokAdi, stokOlcuBirimi: stok?.olcuBirimi);

  @action
  void setReferansIsEmri(IsEmirleriModel? isEmri) => model = model?.copyWith(refIsemrino: isEmri?.isemriNo);

  @action
  void setReworkMu(bool reworkMu) => model = model?.copyWith(rework: reworkMu ? "E" : "H");

  @action
  void setProje(BaseProjeModel? proje) => model = model?.copyWith(projeKodu: proje?.projeKodu);

  @action
  void setGirisDepo(DepoList? depo) => model = model?.copyWith(girisDepo: depo?.depoKodu, girisDepoAdi: depo?.depoTanimi);

  @action
  void setCikisDepo(DepoList? depo) => model = model?.copyWith(cikisDepo: depo?.depoKodu, cikisDepoAdi: depo?.depoTanimi);

  @action
  void setAciklama(String? aciklama) => model = model?.copyWith(aciklama: aciklama);

  @action
  Future<void> getBelgeNo() async {
    final result = await networkManager.dioGet<BaseSiparisEditModel>(
      path: ApiUrls.getSiradakiBelgeNo,
      bodyModel: BaseSiparisEditModel(),
      showLoading: true,
      queryParameters: {"Seri": model?.isemriNo ?? "", "BelgeTipi": "IE", "EIrsaliye": "H"},
    );
    if (result.data is List) {
      setBelgeNo((result.dataList.firstOrNull as BaseSiparisEditModel).belgeNo ?? "");
    }
  }

  @action
  Future<GenericResponseModel<NetworkManagerMixin>> sendData() async => await networkManager.dioPost(path: ApiUrls.saveIsEmri, showLoading: true, bodyModel: IsEmirleriModel(), data: model?.toJson());
}
