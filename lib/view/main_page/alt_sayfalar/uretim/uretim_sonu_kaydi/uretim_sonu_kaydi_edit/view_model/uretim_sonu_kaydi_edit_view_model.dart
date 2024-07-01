import "package:mobx/mobx.dart";
import "package:picker/core/base/model/base_edit_siradaki_kod_model.dart";
import "package:picker/core/base/model/base_proje_model.dart";
import "package:picker/core/base/model/base_stok_mixin.dart";
import "package:picker/core/base/model/ek_alanlar_model.dart";
import "package:picker/core/base/view_model/mobx_network_mixin.dart";
import "package:picker/core/init/network/login/api_urls.dart";
import "package:picker/view/main_page/alt_sayfalar/uretim/uretim_sonu_kaydi/uretim_sonu_kaydi_listesi/model/uretim_sonu_kaydi_listesi_model.dart";
import "package:picker/view/main_page/alt_sayfalar/uretim/uretim_sonu_kaydi/uretim_sonu_kaydi_listesi/model/uretim_sonu_kaydi_listesi_request_model.dart";
import "package:picker/view/main_page/model/param_model.dart";

part "uretim_sonu_kaydi_edit_view_model.g.dart";

class UretimSonuKaydiEditViewModel = _UretimSonuKaydiEditViewModelBase with _$UretimSonuKaydiEditViewModel;

abstract class _UretimSonuKaydiEditViewModelBase with Store, MobxNetworkMixin {
  UretimSonuKaydiListesiModel? selectedItem;

  @observable
  UretimSonuKaydiListesiModel? model;

  @observable
  ObservableList<EkAlanlarModel>? ekAlanlarList;

  @computed
  UretimSonuKaydiListesiRequestModel get requestModel => UretimSonuKaydiListesiRequestModel(belgeNo: selectedItem?.belgeNo, ekranTipi: "D");

  @action
  void setSelectedItem(UretimSonuKaydiListesiModel? item) => selectedItem = item;

  @action
  void setBelgeNo(String? belgeNo) => model = model?.copyWith(belgeNo: belgeNo);

  @action
  void setTarih(DateTime? date) => model = model?.copyWith(tarih: date);

  @action
  void setCikisDepo(DepoList? depo) => model = model?.copyWith(cikisdepoKodu: depo?.depoKodu, cikisDepoAdi: depo?.depoTanimi);

  @action
  void setGirisDepo(DepoList? depo) => model = model?.copyWith(girisdepoKodu: depo?.depoKodu, girisDepoAdi: depo?.depoTanimi);

  @action
  //TODO proje ekle
  void setProje(BaseProjeModel? proje) => model = model?.copyWith();

  @action
  void setMamulKodu(BaseStokMixin? stok) => model = model?.copyWith(stokAdi: stok?.stokAdi, stokKodu: stok?.stokKodu);

  @action
  void setModel(UretimSonuKaydiListesiModel? item) => model = item;

  @action
  void setEkAlanlarList(List<EkAlanlarModel>? list) => ekAlanlarList = list?.asObservable();

  @action
  Future<void> getKalemler() async {
    final result = await networkManager.dioGet(path: ApiUrls.getUSKKalemleri, bodyModel: UretimSonuKaydiListesiModel(), showLoading: true, queryParameters: requestModel.toJson());
    if (result.isSuccess) setModel(result.dataList.firstOrNull);
  }

  @action
  Future<void> getEkAlanlar() async {
    final result = await networkManager.dioGet(path: ApiUrls.getEkAlanlar, bodyModel: EkAlanlarModel(), showLoading: true, queryParameters: {"TabloAdi": "TBLSTOKURSEK"});
    if (result.isSuccess) setEkAlanlarList(result.dataList);
  }

  @action
  Future<String?> getSiradakiKod(String? kod) async {
    final result = await networkManager.dioGet<BaseEditSiradakiKodModel>(
      path: ApiUrls.getSiradakiKod,
      bodyModel: BaseEditSiradakiKodModel(),
      addCKey: true,
      addSirketBilgileri: true,
      queryParameters: {
        "SonKoduGetir": "H",
        "Kod": kod != null || kod != "" ? kod : null,
        "Modul": "USK",
      },
    );
    if (result.isSuccess) return result.paramData?["SIRADAKI_NO"];
    return null;
  }
}
