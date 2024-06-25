import "package:mobx/mobx.dart";
import "package:picker/core/base/model/base_network_mixin.dart";


/// Bu mixin ile birlikte gelen [NetworkManagerMixin] sınıfından türetilen
/// sınıflarda [observableList] değişkenini kullanarak listeleme yapıyoruz.
/// 
/// * Eğer sayfalama yapılacaksa `PageableMixin` mixin'i ile birlikte kullanmalıyız.
/// * Eğer arama yapılacaksa `SearchableMixin` mixin'i ile birlikte kullanmalıyız.
mixin ListableMixin<T extends NetworkManagerMixin> on Store {

  /// Ekranda göstereceğimiz verilerin listesi
  ObservableList<T>? get observableList;

  /// Listedeki verileri bu metod ile güncelliyoruz.
  void setObservableList(List<T>? list);

  /// Listeyi sıfırlama metodu
  Future<void> resetList() async => setObservableList(null);

  /// Bu listenin elemanlarını bu metod ile alıyoruz.
  Future<void> getData();
}
