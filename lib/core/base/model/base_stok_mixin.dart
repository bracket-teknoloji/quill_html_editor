mixin BaseStokMixin {
  String? get stokKodu;
  String? get stokAdi;
  String? get olcuBirimi;

  double? get netMiktar;
  double? get bakiye;

  double? get getMiktar => netMiktar ?? bakiye;
}
