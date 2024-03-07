import "package:picker/view/main_page/alt_sayfalar/sayim/sayim_listesi/model/sayim_listesi_model.dart";

class SingletonModels {
  static SayimListesiModel? _sayimListesi;

  static SayimListesiModel? get sayimListesi => _sayimListesi;

  static set setSayimListesi(SayimListesiModel? value) => _sayimListesi = value;

  static set setFiltreModel(SayimFiltreModel? value) => _sayimListesi = _sayimListesi?..filtre = value;

  
}
