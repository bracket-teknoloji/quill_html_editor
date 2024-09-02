enum PaketIslemlerEnum {
  ekle(1),
  //TODO BU GÜNCELLENECEK
  // duzenle(0),
  paketSil(2),
  paketIcerigiSil(5);

  final int islemKodu;
  const PaketIslemlerEnum(this.islemKodu);
}
