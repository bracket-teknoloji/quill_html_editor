import 'package:mobx/mobx.dart';
import 'package:picker/view/main_page/alt_sayfalar/temsilci_profil/model/temsilci_profil_model.dart';

part 'temsilci_profil_view_model.g.dart';

class TemsilciProfilViewModel = _TemsilciProfilViewModelBase with _$TemsilciProfilViewModel;

abstract class _TemsilciProfilViewModelBase with Store {
  @observable
  String? aciklama;

  @observable
  String? donem = "Ocak";

  @action
  void setDonem(String? value) => donem = value;

  @observable
  int donemKodu = DateTime.now().month;

  @action
  void setDonemKodu(int value) => donemKodu = value;

  @action
  void setAciklama(String? value) => aciklama = value;

  @observable
  ObservableList<TemsilciProfilModel>? temsilciProfilList;

  @action
  void setTemsilciProfilList(List<TemsilciProfilModel>? value) => temsilciProfilList = value?.asObservable();

  @computed
  double get getTodaySales => temsilciProfilList?.where((element) => element.tabloTipi == "SATIS").map((e) => e.tutar).reduce((value, element) => value! + element!)?.toDouble() ?? 0;

  @computed
  double get getBuAyToplam =>
      temsilciProfilList?.where((element) => element.tabloTipi == "SATIS" && element.ayKodu == DateTime.now().month).map((e) => e.tutar).reduce((value, element) => value! + element!) ?? 0;

  @computed
  double get getGecenAyToplam =>
      temsilciProfilList
          ?.where((element) => element.tabloTipi == "SATIS" && element.ayKodu == DateTime.now().month - 1)
          .map((e) => e.tutar)
          .reduce((value, element) => value! + element!)
          ?.toDouble() ??
      0;
  @computed
  double get getBuYilToplam =>
      temsilciProfilList?.where((element) => element.tabloTipi == "SATIS" && element.ayKodu! < DateTime.now().month).map((e) => e.tutar).reduce((value, element) => value! + element!)?.toDouble() ?? 0;

  List<String> aylar = ["Ocak", "Şubat", "Mart", "Nisan", "Mayıs", "Haziran", "Temmuz", "Ağustos", "Eylül", "Ekim", "Kasım", "Aralık"];
}
