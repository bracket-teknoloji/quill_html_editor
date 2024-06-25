import "package:flutter/foundation.dart";
import "package:picker/core/base/model/base_network_mixin.dart";
import "package:picker/core/base/view_model/scroll_controllable_mixin.dart";

/// Eğer ViewModel'imizde sayfalama yapısı var ise bu Mixin ile birlikte kullanmalıyız.
mixin PageableMixin<T extends NetworkManagerMixin> on ScrollControllableMixin<T> {
  /// Sayfa default [1] olarak atanmıştır.
  int page = 1;

  /// İlk istekte daha var mı yok mu bilemediğimizden dolayı [dahaVarMi] true atanır.
  /// Sonradan kontrol edilip güncellenir.
  bool dahaVarMi = true;

  @nonVirtual

  /// Sayfayı [1] artırmak için kullanılır.
  ///
  /// Bu metodu override etmeyiniz.
  void increasePage() => page++;

  @nonVirtual

  /// Sayfa sayısını [1] yapar.
  /// Listedeki elemanları siler.
  ///
  /// Bu metodu override etmeyiniz.
  void resetPage() {
    super.resetList();
    page = 1;
  }

  /// Veriler sayfalama yapısında olduğu için listeye ekleme işlemi bu mixin ile yapılır.
  void addObservableList(List<T>? list);

  @nonVirtual

  /// DahaVarMi değişkenini değerine göre günceller.
  void setDahaVarMi(bool result) => dahaVarMi = result;
}
