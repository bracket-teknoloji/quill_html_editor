enum BarkodTipiEnum {
  ean13("A", "Ean13"),
  ean13_2("B", "Ean13+2"),
  ean13_5("C", "Ean 13+5"),
  ean8("D", "Ean8"),
  jan13("E", "Jan13"),
  jan8("F", "Jan8"),
  upcA("G", "Upc A"),
  upcB("H", "Upc B"),
  upcC("I", "Upc C"),
  code39Kont("J", "Code 39 + Kont"),
  code39("K", "Code 39"),
  interleaved2_5("L", "Interleaved 2/5"),
  industrial2_5("M", "Industrial 2/5"),
  codeBar("N", "CodeBar"),
  code128("O", "Code 128"),
  ucc128("P", "Ucc 128"),
  discrete2_5("Q", "Discrete 2/5"),
  matrix2_5("R", "Matrix 2/5"),
  code93("S", "Code 93"),
  ascii("T", "ASCII");

  const BarkodTipiEnum(this.barkodTipi, this.barkodAdi);

  final String barkodTipi;
  final String barkodAdi;
}
