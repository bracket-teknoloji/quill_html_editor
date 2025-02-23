private void referansGosterGizle() {
  b.layoutReferansKodu.visibleIf(_islemCariEFTHavale && cariMuhReferansVisible());
  if (b.layoutReferansKodu.isVisible()) {
   KullaniciYetkiResponseModel kulYetki = PrefManager.getInstance().getKullaniciYetkiResponseModel();
   if (kulYetki != null && !kulYetki.varsayilan_MuhasebeReferansKodu.isEmpty()) {
    b.layoutReferansKodu.setKeyValue(kulYetki.varsayilan_MuhasebeReferansKodu, kulYetki.varsayilan_MuhasebeReferansTanimi);
    b.layoutReferansKodu.setViewEnable(_profilModel.kullanici_AdminMi);
   } else {
    b.layoutReferansKodu.clearKeyValue();
   }
  } else {
   b.layoutReferansKodu.clearKeyValue();
  }
 }
 private boolean cariMuhReferansVisible() {
  CariResponseModel cariModel = b.layoutCari.getCariModel();
  if (cariModel != null && _paramModel.MuhasebeEntegre && _paramModel.MuhFislerdeRefKodSorulsun) {
   return (cariModel.MuhHesapTipi.equals("A") && _paramModel.MuhFislerdeRefKodSorulsun_Aktif) ||
     (cariModel.MuhHesapTipi.equals("P") && _paramModel.MuhFislerdeRefKodSorulsun_Pasif) ||
     (cariModel.MuhHesapTipi.equals("G") && _paramModel.MuhFislerdeRefKodSorulsun_Gelir) ||
     (cariModel.MuhHesapTipi.equals("I") && _paramModel.MuhFislerdeRefKodSorulsun_Gider) ||
     (cariModel.MuhHesapTipi.equals("N") && _paramModel.MuhFislerdeRefKodSorulsun_Nazim);
  } else {
   return false;
  }
 }

 private boolean bankaMuhReferansVisible() {
  if (_selectedKaynakHesap != null && _paramModel.MuhasebeEntegre && _paramModel.MuhFislerdeRefKodSorulsun) {
   return (_selectedKaynakHesap.MuhasebeHesapTipi.equals("A") && _paramModel.MuhFislerdeRefKodSorulsun_Aktif) ||
     (_selectedKaynakHesap.MuhasebeHesapTipi.equals("P") && _paramModel.MuhFislerdeRefKodSorulsun_Pasif) ||
     (_selectedKaynakHesap.MuhasebeHesapTipi.equals("G") && _paramModel.MuhFislerdeRefKodSorulsun_Gelir) ||
     (_selectedKaynakHesap.MuhasebeHesapTipi.equals("I") && _paramModel.MuhFislerdeRefKodSorulsun_Gider) ||
     (_selectedKaynakHesap.MuhasebeHesapTipi.equals("N") && _paramModel.MuhFislerdeRefKodSorulsun_Nazim);
  } else {
   return false;
  }
 }

private void referansGosterGizle() {
 b.layoutReferansKodu.visibleIf(_islemCariEFTHavale && (cariMuhReferansVisible() || bankaMuhReferansVisible()));
 if (b.layoutReferansKodu.isVisible()) {
  KullaniciYetkiResponseModel kulYetki = PrefManager.getInstance().getKullaniciYetkiResponseModel();
  if (kulYetki != null && !kulYetki.varsayilan_MuhasebeReferansKodu.isEmpty()) {
   b.layoutReferansKodu.setKeyValue(kulYetki.varsayilan_MuhasebeReferansKodu, kulYetki.varsayilan_MuhasebeReferansTanimi);
   b.layoutReferansKodu.setViewEnable(_profilModel.kullanici_AdminMi);
  } else {
   b.layoutReferansKodu.clearKeyValue();
  }
 } else {
  b.layoutReferansKodu.clearKeyValue();
 }
}