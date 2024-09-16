import "../model/base_network_mixin.dart";
import "listable_mixin.dart";

/// Eğer Listeleme yapılacak ekranımızda arama işlemi yapılacaksa bu mixini kullanınınız.
/// Bu mixin ile birlikte SearchBar işlemlerini yapabilirsiniz.
mixin SearchableMixin<T extends NetworkManagerMixin> on ListableMixin<T> {
  /// Default olarak false başlanılması önerilir.
  /// [changeSearchBarStatus] metodu kullanıldıkça durumu güncellenmektedir.
  /// Eğer view üzerinde kullanacaksanız viewModel içerisinde override edip observable olarak kullanabilirsiniz.
  bool get isSearchBarOpen;

  /// SearchBar içerisinde değişiklik oldukça bu değişkene atanacaktır.
  String? get searchText;

  /// SearchBar açıp kapatma durumunu değiştirmek için kullanılır.
  /// ViewModel içerisinde override edilmesi gerekir.
  void changeSearchBarStatus();

  ///SearchText değiştiğinde bu metod çalışacaktır.
  void setSearchText(String? value);
}
