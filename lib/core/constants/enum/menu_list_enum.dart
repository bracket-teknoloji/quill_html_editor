enum MenuItemsEnum {
  cari("CARI"),
  eBelge("EBEL"),
  finans("YONE"),
  malKabul("MKBL"),
  sayim("SYIM"),
  sevkiyat("SEVK"),
  genelBelgeKontrol("GNEL_BEKO"),
  genelSerbestRaporlar("GNEL_SRAP"),
  hucreTakibi("HTAK"),
  sevkEmri("SEMR"),
  siparis("SIPA"),
  stok("STOK"),
  stokPaketleme("STOK_PKET"),
  tahsilat("TAHS"),
  talepTeklif("TEKL"),
  temsilciProfil("TEMS"),
  transfer("TRNS"),
  uretim("URET"),
  uetds("EUTD"),
  kalkon("KALKON");

  const MenuItemsEnum(this.yetkiName);

  final String yetkiName;
}
