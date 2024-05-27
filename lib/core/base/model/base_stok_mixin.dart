mixin BaseStokMixin {
  String? get stokKodu;
  String? get stokAdi;

  double? get netMiktar;
  double? get bakiye;

  double? get getMiktar => netMiktar ?? bakiye;
}
