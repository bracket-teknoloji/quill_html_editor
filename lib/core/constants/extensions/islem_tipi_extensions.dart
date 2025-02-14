import "../enum/islem_tipi_enum.dart";

extension IslemTipiExtensions on IslemTipiEnum {
  bool get islemMi => switch (this) {
    IslemTipiEnum.cari || IslemTipiEnum.stok => true,
    _ => false,
  };
}
