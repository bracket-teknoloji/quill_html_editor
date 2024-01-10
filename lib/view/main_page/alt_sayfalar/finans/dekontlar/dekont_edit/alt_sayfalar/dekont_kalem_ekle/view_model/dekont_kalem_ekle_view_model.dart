import "package:mobx/mobx.dart";

import "../../../../../../../../../core/base/model/doviz_kurlari_model.dart";
import "../../../../../../../../../core/base/model/tahsilat_request_model.dart";
import "../../../../../../../../../core/base/view_model/mobx_network_mixin.dart";
import "../../../../../../../../../core/constants/extensions/date_time_extensions.dart";
import "../../../../../../../../../core/init/network/login/api_urls.dart";
import "../../../../../../../model/param_model.dart";

part "dekont_kalem_ekle_view_model.g.dart";

class DekontKalemEkleViewModel = _DekontKalemEkleViewModelBase with _$DekontKalemEkleViewModel;

abstract class _DekontKalemEkleViewModelBase with Store, MobxNetworkMixin {
  _DekontKalemEkleViewModelBase({required this.model});

  final Map<String, String> hesapTipiMap = {
    "Cari": "C",
    "Muhasabe": "M",
    "Banka": "B",
    "Stok": "S",
  };

  final Map<String, String> borcTipiMap = {
    "Borç": "B",
    "Alacak": "A",
  };

  final List<String> exportTipiList = [
    "Mal Bedeli",
    "Gümrük Vergisi",
    "Komisyon",
    "Sigorta",
    "Yurt içi Nakliye",
    "Yurt dışı Nakliye",
    "Ordino",
    "Fonlar",
    "Ardiye",
    "Yükleme/Boşaltma",
    "Mesai",
    "Yolluk",
    "Diğer 1",
    "Diğer 2",
    "Diğer 3",
    "Diğer 4",
    "Diğer 5",
    "Diğer 6",
    "Diğer 7",
    "Diğer 8",
    "Diğer 9",
    "Diğer 10",
    "Diğer 11",
    "Diğer 12",
    "Diğer 13",
    "Diğer 14",
    "Diğer 15",
    "Diğer 16",
  ];

  @observable
  late DekontKalemler model;

  @observable
  ObservableList<DovizKurlariModel>? dovizKurlariListesi;

  @action
  void setModel(DekontKalemler value) => model = value;

  @computed
  List<bool> get selectedBorcTipi => List.generate(borcTipiMap.length, (index) => model.ba == borcTipiMap.values.toList()[index]);

  @computed
  List<bool> get selectedHesapTipi => List.generate(hesapTipiMap.length, (index) => model.hesapTipi == hesapTipiMap.values.toList()[index]);

  @action
  void setBa(int value) => model = model.copyWith(ba: borcTipiMap.values.toList()[value]);

  @action
  void setHesapTipi(int value) => model = model.copyWith(hesapTipi: hesapTipiMap.values.toList()[value]);

  @action
  void setDepoKodu(DepoList? value) => model = model.copyWith(depoKodu: value?.depoKodu, depoAdi: value?.depoTanimi);

  @action
  void setBelgeNo(String? value) => model = model.copyWith(belgeNo: value);

  @action
  void setHesapKodu(String? value) => model = model.copyWith(hesapKodu: value);

  @action
  void setKalemAdi(String? value) => model = model.copyWith(kalemAdi: value, hesapAdi: value);

  @action
  void setDovizTipi(DovizList? value) => model = model.copyWith(dovizTipi: value?.dovizKodu, dovizTipiAdi: value?.isim);

  @action
  void setDovizTutari(double? value) => model = model.copyWith(dovizTutari: value);

  @action
  void setTutar(double? value) => model = model.copyWith(tutar: double.tryParse(value?.toStringAsFixed(2) ?? ""));

  @action
  void setAciklama(String? value) => model = model.copyWith(aciklama: value);

  @action
  void setExportTipi(int? value) => model = model.copyWith(exportTipi: value);

  @action
  void setExportRefNo(String? value) => model = model.copyWith(exportRefno: value);

  @action
  void setPlasiyerKodu(PlasiyerList? value) => model = model.copyWith(plasiyerKodu: value?.plasiyerKodu, plasiyerAdi: value?.plasiyerAciklama);

  @action
  void setDovizKurlariListesi(List<DovizKurlariModel>? value) => dovizKurlariListesi = value?.asObservable();

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
      queryParameters: {"EkranTipi": "D", "DovizKodu": model.dovizTipi, "tarih": DateTime.now().toDateString},
    );
    if (result.data is List) {
      setDovizKurlariListesi(result.data.cast<DovizKurlariModel>());
    }
  }
}
