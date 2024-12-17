enum DepoFarkRaporuFiltreEnum {
  tumu("Tümü"),
  sayilanlar("Sayılanlar"),
  sayilmayanlar("Sayılmayanlar"),
  fazlaSayilanlar("Fazla Sayılanlar"),
  eksikSayilanlar("Eksik Sayılanlar"),
  farkVerenler("Fark Verenler");

  const DepoFarkRaporuFiltreEnum(this.filtreAdi);

  final String filtreAdi;

  bool get tumuMu => this == DepoFarkRaporuFiltreEnum.tumu;

  bool get sayilanlarMi => this == DepoFarkRaporuFiltreEnum.sayilanlar;

  bool get sayilmayanlarMi => this == DepoFarkRaporuFiltreEnum.sayilmayanlar;

  bool get fazlaSayilanlarMi => this == DepoFarkRaporuFiltreEnum.fazlaSayilanlar;

  bool get eksikSayilanlarMi => this == DepoFarkRaporuFiltreEnum.eksikSayilanlar;

  bool get farkVerenlerMi => this == DepoFarkRaporuFiltreEnum.farkVerenler;
}
