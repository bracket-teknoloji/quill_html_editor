import "package:mobx/mobx.dart";

import "../../../../../../core/base/model/print_model.dart";
import "../../../../../../core/base/view/pdf_viewer/model/pdf_viewer_model.dart";
import "../../../../../../core/init/cache/cache_manager.dart";
import "../../stok_liste/model/stok_listesi_model.dart";

part "stok_yazdir_view_model.g.dart";

final class StokYazdirViewModel = _StokYazdirViewModelBase with _$StokYazdirViewModel;

abstract class _StokYazdirViewModelBase with Store {
  @action
  void init() => printModel = printModel.copyWith(etiketSayisi: 1);
  //*Switch
  @observable
  bool stokSecildigindeYazdir = CacheManager.getProfilParametre.stokSecildigindeYazdir;

  @observable
  bool yaziciVeDizayniHatirla = CacheManager.getProfilParametre.stokYazdirDizaynVeYaziciHatirla;

  @observable
  String? stokAdi;

  @observable
  bool showYapilandirma = false;

  @observable
  StokListesiModel? stokListesiModel;

  @action
  void changeStokSecildigindeYazdir(bool value) {
    stokSecildigindeYazdir = value;
    CacheManager.setProfilParametre(CacheManager.getProfilParametre.copyWith(stokSecildigindeYazdir: value));
  }

  @action
  void changeYaziciVeDizayniHatirla(bool value) => yaziciVeDizayniHatirla = value;

  //* PrintModel
  @observable
  PrintModel printModel = PrintModel(
    raporOzelKod: "StokEtiket",
    dicParams: DicParams(belgeNo: ""),
  );

  @action
  void setPrintModel(PrintModel? model) => printModel =
      model ??
      PrintModel(
        raporOzelKod: "StokEtiket",
        dicParams: DicParams(belgeNo: ""),
      );

  @action
  void setYapilandirmaKodu(String? yapilandirmaKodu) {
    printModel = printModel.copyWith(dicParams: printModel.dicParams?.copyWith(yapkod: yapilandirmaKodu));
    if (yapilandirmaKodu == null) {
      showYapilandirma = false;
    } else {
      showYapilandirma = true;
    }
  }

  @action
  void setHucreKodu(String? value) =>
      printModel = printModel.copyWith(dicParams: printModel.dicParams?.copyWith(hucreKodu: value));

  @action
  void setDizaynId(int? dizaynId) => printModel = printModel.copyWith(dizaynId: dizaynId);

  @action
  void setEtiketSayisi(int? etiketSayisi) => printModel = printModel.copyWith(etiketSayisi: etiketSayisi);

  @action
  void setYaziciAdi(String? yaziciAdi) => printModel = printModel.copyWith(yaziciAdi: yaziciAdi);

  @action
  void setMiktar(int? miktar) =>
      printModel = printModel.copyWith(dicParams: printModel.dicParams?.copyWith(miktar: miktar));

  @action
  void increaseMiktar() => printModel = printModel.copyWith(
    dicParams: printModel.dicParams?.copyWith(miktar: (printModel.dicParams?.miktar ?? 0) + 1),
  );

  @action
  void decreaseMiktar() {
    if (printModel.dicParams?.miktar == 0) return;
    printModel = printModel.copyWith(
      dicParams: printModel.dicParams?.copyWith(miktar: (printModel.dicParams?.miktar ?? 0) - 1),
    );
  }

  @action
  void setKopyaSayisi(int? kopyaSayisi) => printModel = printModel.copyWith(etiketSayisi: kopyaSayisi);

  @action
  void increaseKopyaSayisi() => printModel = printModel.copyWith(etiketSayisi: (printModel.etiketSayisi ?? 0) + 1);

  @action
  void decreaseKopyaSayisi() {
    if (printModel.etiketSayisi == 1) return;
    printModel = printModel.copyWith(etiketSayisi: (printModel.etiketSayisi ?? 0) - 1);
  }

  @action
  void setStokKodu(StokListesiModel? model) {
    stokAdi = model?.stokAdi;
    printModel = printModel.copyWith(dicParams: printModel.dicParams?.copyWith(stokKodu: model?.stokKodu));
    stokListesiModel = model;
  }
}
