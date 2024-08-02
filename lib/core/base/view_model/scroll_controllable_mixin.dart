import "package:flutter/material.dart";
import "package:flutter/rendering.dart";
import "package:picker/core/base/model/base_network_mixin.dart";
import "package:picker/core/base/view_model/listable_mixin.dart";

/// Bu mixin eğer sayfayı kaydırma işlemlerini takip edeceksek eklenecektir.
/// * Eğer sayfalama yapılacaksa `PageableMixin` mixin'i ile birlikte kullanmalıyız.
/// Sayfalama işlemlerinde kullanılacaksa [dahaVarMi] değişkeni ile kullanınız.
mixin ScrollControllableMixin<T extends NetworkManagerMixin> on ListableMixin<T> {
  /// Default olarak true başlanılması önerilir.
  /// [changeScrollStatus] metodu kullanıldıkça durumu güncellenmektedir.
  ///
  /// Eğer view üzerinde kullanacaksanız viewModel içerisinde override edip observable olarak kullanabilirsiniz.
  bool get isScrollDown;

  /// [isScrollDown] getter metod olarak kullanıldığı için setter ayrıca eklenmiştir.
  set isScrollDown(bool value);

  @mustCallSuper

  /// Bu metod ile [ScrollController]'dan gelen [ScrollPosition] bilgisi alınır.
  /// [ScrollPosition] bilgisi ile [isScrollDown] değişkeni güncellenmektedir.
  /// Eğer bu metodu override edecekseniz, [super.changeScrollStatus] çağrısının yapılması gerekmektedir.
  Future<void> changeScrollStatus(ScrollPosition position) async {
    if (position.userScrollDirection == ScrollDirection.forward) {
      isScrollDown = true;
    } else if (position.userScrollDirection == ScrollDirection.reverse) {
      await Future.delayed(const Duration(milliseconds: 500));
      isScrollDown = false;
    }
  }
}
