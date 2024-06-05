import "package:picker/view/main_page/alt_sayfalar/cari/cari_aktivite_kayitlari/model/cari_aktivite_listesi_model.dart";
import "package:picker/view/main_page/alt_sayfalar/hucre_takibi/hucre_transferi/model/hucre_transferi_model.dart";
import "package:picker/view/main_page/alt_sayfalar/sayim/sayim_listesi/model/sayim_listesi_model.dart";

class SingletonModels {
  static SayimListesiModel? _sayimListesi;

  static SayimListesiModel? get sayimListesi => _sayimListesi;

  static set setSayimListesi(SayimListesiModel? value) => _sayimListesi = value;

  static set setFiltreModel(SayimFiltreModel? value) => _sayimListesi = _sayimListesi?.copyWith(filtre: value);


  static CariAktiviteListesiModel? _cariAktiviteListesi;

  static CariAktiviteListesiModel? get cariAktiviteListesi => _cariAktiviteListesi;

  static set setCariAktiviteListesi(CariAktiviteListesiModel? value) => _cariAktiviteListesi = value;

  static HucreTransferiModel? _hucreTransferiModel;

  static HucreTransferiModel get hucreTransferiModel => _hucreTransferiModel ?? HucreTransferiModel();

  static set hucreTransferiModel(HucreTransferiModel? value) => _hucreTransferiModel = value;
  
}
