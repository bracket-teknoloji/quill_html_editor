import 'package:mobx/mobx.dart';
import 'package:picker/core/init/cache/cache_manager.dart';
import 'package:picker/view/main_page/alt_sayfalar/stok/stok_yeni_kayit/model/stok_yeni_kayit_model.dart';

import '../../../../../../core/base/model/base_proje_model.dart';
import '../../../../model/main_page_model.dart';

part 'stok_yeni_kayit_view_model.g.dart';

class StokYeniKayitViewModel = _StokYeniKayitViewModelBase with _$StokYeniKayitViewModel;

abstract class _StokYeniKayitViewModelBase with Store {
  @observable
  List<BaseProjeModel>? projeListesi;
  @action
  void setProjeListesi(List<BaseProjeModel>? model) => projeListesi = model;
  @observable
  MainPageModel? anaVeri = CacheManager.getAnaVeri();
  @observable
  StokYeniKayitModel model = StokYeniKayitModel()..miktar = 0..tarih = DateTime.now();

  @observable
  ObservableList<bool> isSelected = [true, false].asObservable();

  @action
  void changeIsSelected(int index) {
    for (int i = 0; i < isSelected.length; i++) {
      if (i == index) {
        isSelected[i] = true;
      } else {
        isSelected[i] = false;
      }
    }
  }

  List<String> toggleButtonName = ["Giriş", "Çıkış"];
  Map<String,String> hareketTurMap = {
    "Devir": "A",
    "Depo Transferi": "B",
    "Üretim": "C",
    "Muhtelif": "D",
    "Miktarsız Maliyet": "E",
    "Konsinye": "F",
  };
}
