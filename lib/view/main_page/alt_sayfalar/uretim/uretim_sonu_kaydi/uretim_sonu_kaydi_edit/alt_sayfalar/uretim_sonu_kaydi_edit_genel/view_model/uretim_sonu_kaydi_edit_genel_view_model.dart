import "package:mobx/mobx.dart";
import "package:picker/core/base/model/base_edit_siradaki_kod_model.dart";
import "package:picker/core/base/model/base_proje_model.dart";
import "package:picker/core/base/model/ek_alanlar_model.dart";
import "package:picker/core/base/view_model/mobx_network_mixin.dart";
import "package:picker/core/constants/extensions/date_time_extensions.dart";
import "package:picker/core/init/network/login/api_urls.dart";
import "package:picker/view/main_page/alt_sayfalar/siparis/base_siparis_edit/model/base_siparis_edit_model.dart";
import "package:picker/view/main_page/alt_sayfalar/stok/base_stok_edit/model/stok_detay_model.dart";
import "package:picker/view/main_page/alt_sayfalar/stok/stok_liste/model/stok_listesi_model.dart";
import "package:picker/view/main_page/alt_sayfalar/uretim/uretim_sonu_kaydi/uretim_sonu_kaydi_edit/model/uretim_sonu_kaydi_edit_model.dart";
import "package:picker/view/main_page/model/param_model.dart";

part "uretim_sonu_kaydi_edit_genel_view_model.g.dart";

typedef DepoOnceligiRecord = ({String name, String value});

class UretimSonuKaydiEditGenelViewModel = _UretimSonuKaydiEditViewModelBase with _$UretimSonuKaydiEditGenelViewModel;

abstract class _UretimSonuKaydiEditViewModelBase with Store, MobxNetworkMixin {
  bool kalemliMi = false;
  final List<DepoOnceligiRecord> depoOnceligiList = [
    (name: "Hiçbiri", value: "H"),
    (name: "Stok Depo Kullan", value: "S"),
    (name: "İş Emri Depo Kullan", value: "I"),
    (name: "Üretim Depo Kullan", value: "U"),
  ];

  // @observable
  // KalemModel? model;

  @observable
  StokListesiModel? stokModel;

  void Function(UretimSonuKaydiEditModel model)? onSave;

  @action
  void setOnSave(void Function(UretimSonuKaydiEditModel model) onSave) => this.onSave = onSave;

  @observable
  UretimSonuKaydiEditModel requestModel = UretimSonuKaydiEditModel(ekAlanlar: EkAlanlar());

  @observable
  ObservableList<EkAlanlarModel>? ekAlanlarList;

  @observable
  KalemModel? kalem = KalemModel();

  @action
  void setBelgeNo(String? belgeNo) => setRequestModel(requestModel.copyWith(belgeNo: belgeNo));

  @action
  void setTarih(DateTime? date) {
    setRequestModel(requestModel.copyWith(tarih: date.toDateString, belgeTarihi: date));
    setModel(kalem?.copyWith(tarih: date));
  }

  @action
  void setCikisDepo(DepoList? depo) => setRequestModel(requestModel.copyWith(cikisDepo: depo?.depoKodu, cikisDepoAdi: depo?.depoTanimi));

  @action
  void setGirisDepo(DepoList? depo) => setRequestModel(requestModel.copyWith(girisDepo: depo?.depoKodu, girisDepoAdi: depo?.depoTanimi));

  @action
  void setRequestModel(UretimSonuKaydiEditModel model) {
    requestModel = model;
    // kalem = requestModel.kalemList?.lastOrNull;
    if (!kalemliMi) requestModel = requestModel.copyWith(kalemList: [kalem ?? KalemModel()]);
    onSave?.call(requestModel);
  }

  @action
  void setMiktar(double? miktar) => setModel(kalem?.copyWith(miktar: miktar));

  @action
  void setHurdaMiktari(double? miktar) => setModel(kalem?.copyWith(miktar2: miktar));

  @action
  void setMaliyetFiyati(double? maliyet) => setModel(kalem?.copyWith(maliyetFiyati: maliyet));

  @action
  void setAciklama(String? aciklama) {
    setModel(kalem?.copyWith(aciklama: aciklama));
    setRequestModel(requestModel.copyWith(aciklama: aciklama));
  }

  @action
  void setEkAlan1(String? aciklama) => setModel(kalem?.copyWith(ekalan1: aciklama));

  @action
  void setSeriList(List<SeriList>? seri) => setModel(kalem?.copyWith(seriList: seri));

  @action
  void setEkAlan2(String? aciklama) => setModel(kalem?.copyWith(ekalan2: aciklama));

  @action
  void setEkAlanlar(int index, String? value) => requestModel.ekAlanlar?[index] = value;

  @action
  void setStokModel(StokListesiModel? stok) => stokModel = stok;

  @action
  void setOlcuBirimi(OlcuBirimiRecord? olcuBirimi) => setModel(kalem?.copyWith(olcuBirimKodu: olcuBirimi?.kodu, olcuBirimAdi: olcuBirimi?.adi));

  @action
  void setProje(BaseProjeModel? proje) {
    setRequestModel(requestModel.copyWith(projeKodu: proje?.projeKodu, projeAdi: proje?.projeAciklama));
    setModel(kalem?.copyWith(projeKodu: proje?.projeKodu));
  }

  @action
  void setDepoOnceligi(DepoOnceligiRecord? depoOnceligi) => setRequestModel(requestModel.copyWith(depoOnceligi: depoOnceligi?.value ?? "H"));

  @action
  void setMamulKodu(StokListesiModel? stok) {
    setModel(
      kalem?.copyWith(
        stokKodu: stok?.stokKodu,
        stokAdi: stok?.stokAdi,
        seriCikislardaAcik: stok?.seriCikislardaAcik,
        seriGirislerdeAcik: stok?.seriGirislerdeAcik,
      ),
    );
    setStokModel(stok);
  }

  @action
  void setModel(KalemModel? item) {
    // model = item;
    kalem = item;
    if (item != null) {
      if (kalemliMi) setRequestModel(requestModel.copyWith(kalemList: requestModel.kalemList?.toList()?..add(item)));
      setRequestModel(requestModel.copyWith(depoOnceligi: item.depoOnceligi ?? "H", projeKodu: item.projeKodu));
      if (item.girisdepoKodu != null) {
        setRequestModel(requestModel.copyWith(girisDepo: item.girisdepoKodu));
        setRequestModel(requestModel.copyWith(cikisDepo: item.cikisdepoKodu));
        setModel(item.copyWith(girisdepoKodu: null, cikisdepoKodu: null, girisDepo: item.girisdepoKodu, cikisDepo: item.cikisdepoKodu));
      }
    }
  }

  @action
  void setEkAlanlarList(List<EkAlanlarModel>? list) => ekAlanlarList = list?.asObservable();

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
    if (result.isSuccess) {
      setRequestModel(requestModel.copyWith(belgeNo: result.paramData?["SIRADAKI_NO"]));
      return result.paramData?["SIRADAKI_NO"];
    }
    return null;
  }

  // @action
  // Future<GenericResponseModel<NetworkManagerMixin>> saveData() async {
  //   final result = await networkManager.dioPost(path: ApiUrls.saveU, bodyModel: bodyModel)
  // }
}
