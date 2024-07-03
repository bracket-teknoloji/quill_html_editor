import "package:mobx/mobx.dart";
import "package:picker/core/base/model/base_edit_siradaki_kod_model.dart";
import "package:picker/core/base/model/base_proje_model.dart";
import "package:picker/core/base/model/base_stok_mixin.dart";
import "package:picker/core/base/model/ek_alanlar_model.dart";
import "package:picker/core/base/view_model/mobx_network_mixin.dart";
import "package:picker/core/constants/extensions/date_time_extensions.dart";
import "package:picker/core/init/network/login/api_urls.dart";
import "package:picker/view/main_page/alt_sayfalar/siparis/base_siparis_edit/model/base_siparis_edit_model.dart";
import "package:picker/view/main_page/alt_sayfalar/uretim/uretim_sonu_kaydi/uretim_sonu_kaydi_edit/model/uretim_sonu_kaydi_edit_model.dart";
import "package:picker/view/main_page/alt_sayfalar/uretim/uretim_sonu_kaydi/uretim_sonu_kaydi_listesi/model/uretim_sonu_kaydi_listesi_request_model.dart";
import "package:picker/view/main_page/model/param_model.dart";

part "uretim_sonu_kaydi_edit_view_model.g.dart";

typedef DepoOnceligiRecord = ({String name, String value});

class UretimSonuKaydiEditViewModel = _UretimSonuKaydiEditViewModelBase with _$UretimSonuKaydiEditViewModel;

abstract class _UretimSonuKaydiEditViewModelBase with Store, MobxNetworkMixin {
  final List<DepoOnceligiRecord> depoOnceligiList = [
    (name: "Hiçbiri", value: "H"),
    (name: "Stok Depo Kullan", value: "S"),
    (name: "İş Emri Depo Kullan", value: "I"),
    (name: "Üretim Depo Kullan", value: "U"),
  ];

  @observable
  KalemModel? model;

  @observable
  UretimSonuKaydiEditModel requestModel = UretimSonuKaydiEditModel(kalemList: [KalemModel()]);

  @observable
  ObservableList<EkAlanlarModel>? ekAlanlarList;

  @computed
  UretimSonuKaydiListesiRequestModel get kalemlerRequestModel => UretimSonuKaydiListesiRequestModel(belgeNo: requestModel.belgeNo, ekranTipi: "D");

  @computed
  KalemModel? get kalem => requestModel.kalemList?.firstOrNull;

  @action
  void setBelgeNo(String? belgeNo) => requestModel = requestModel.copyWith(belgeNo: belgeNo);

  @action
  void setTarih(DateTime? date) {
    requestModel = requestModel.copyWith(tarih: date.toDateString);
    setModel(kalem?.copyWith(tarih: date));
  }

  @action
  void setCikisDepo(DepoList? depo) => requestModel = requestModel.copyWith(cikisDepo: depo?.depoKodu);

  @action
  void setGirisDepo(DepoList? depo) => requestModel = requestModel.copyWith(girisDepo: depo?.depoKodu);

  @action
  void setMiktar(double? miktar) => setModel(kalem?.copyWith(miktar: miktar));

  @action
  void setHurdaMiktari(double? miktar) => setModel(kalem?.copyWith(miktar2: miktar));

  @action
  void setAciklama(String? aciklama) => setModel(kalem?.copyWith(aciklama: aciklama));

  @action
  void setProje(BaseProjeModel? proje) {
    requestModel = requestModel.copyWith(projeKodu: proje?.projeKodu);
    setModel(kalem?.copyWith(projeKodu: proje?.projeKodu));
  }

  @action
  void setDepoOnceligi(DepoOnceligiRecord? depoOnceligi) => requestModel = requestModel.copyWith(depoOnceligi: depoOnceligi?.value);

  @action
  void setMamulKodu(BaseStokMixin? stok) => setModel(kalem?.copyWith(stokKodu: stok?.stokKodu, stokAdi: stok?.stokAdi));

  @action
  void setModel(KalemModel? item) {
    model = item;
    if (item != null) {
      requestModel = requestModel.copyWith(kalemList: [item], depoOnceligi: item.depoOnceligi ?? "H", projeKodu: item.projeKodu);
    }
  }

  @action
  void setEkAlanlarList(List<EkAlanlarModel>? list) => ekAlanlarList = list?.asObservable();

  @action
  Future<void> getKalemler() async {
    final result = await networkManager.dioGet(path: ApiUrls.getUSKKalemleri, bodyModel: KalemModel(), showLoading: true, queryParameters: kalemlerRequestModel.toJson());
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
      showLoading: true,
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
