import "../../../view/main_page/alt_sayfalar/cari/cari_aktivite_kayitlari/model/cari_aktivite_listesi_model.dart";
import "../../../view/main_page/alt_sayfalar/hucre_takibi/hucre_transferi/model/hucre_transferi_model.dart";
import "../../../view/main_page/alt_sayfalar/sayim/sayim_listesi/model/sayim_listesi_model.dart";
import "../../base/model/print_model.dart";
import "../../base/view/pdf_viewer/model/pdf_viewer_model.dart";
import "../enum/dizayn_ozel_kod_enum.dart";

final class SingletonModels {
  static SayimListesiModel? _sayimListesi;

  static SayimListesiModel? get sayimListesi => _sayimListesi;

  static set setSayimListesi(SayimListesiModel? value) => _sayimListesi = value;

  static set setFiltreModel(SayimFiltreModel? value) => _sayimListesi = _sayimListesi?.copyWith(filtre: value);

  //* Sayım PrintModel
  static PrintModel? _sayimPrintModel;

  static PrintModel get sayimPrintModel =>
      _sayimPrintModel ??
      PrintModel(
        raporOzelKod: DizaynOzelKodEnum.sayim.ozelKodAdi,
        dicParams: DicParams(belgeTipi: "SAYI", belgeNo: ""),
      );

  static set sayimPrintModel(PrintModel? value) => _sayimPrintModel = value;

  static CariAktiviteListesiModel? _cariAktiviteListesi;

  static CariAktiviteListesiModel? get cariAktiviteListesi => _cariAktiviteListesi;

  static set setCariAktiviteListesi(CariAktiviteListesiModel? value) => _cariAktiviteListesi = value;

  static HucreTransferiModel? _hucreTransferiModel;

  static HucreTransferiModel get hucreTransferiModel => _hucreTransferiModel ?? HucreTransferiModel();

  static set hucreTransferiModel(HucreTransferiModel? value) => _hucreTransferiModel = value;
}
