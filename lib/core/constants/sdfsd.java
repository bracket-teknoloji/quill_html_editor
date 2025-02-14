if (fiyatRehberGorebilir()) {
   if (!_paramModel.OzelFiyatSistemi) { //apk 166 : if (_paramModel.OzelFiyatSistemi == false) eklendi
    if (_initStokResponseModel.dovizliMi(_satisaYonelikMi)) {
     b.layoutDovizFiyati.setRightImageResource(R.drawable.ic_rehber_gray, new OneClickListener() {
      @Override
      public void onOneClick(View v) {
       b.layoutBrutFiyatTL.setRightImageResource(0);
       showFiyatSecDialog(b.layoutDovizFiyati);
      }
     });
    } else {
     b.layoutBrutFiyatTL.setRightImageResource(R.drawable.ic_rehber_gray, new OneClickListener() {
      @Override
      public void onOneClick(View v) {
       b.layoutDovizFiyati.setRightImageResource(0);
       showFiyatSecDialog(b.layoutBrutFiyatTL);
      }
     });
    }
   } else { // APK 233
    b.layoutBrutFiyatTL.setRightImageResource(R.drawable.ic_rehber_gray, new OneClickListener() {
     @Override
     public void onOneClick(View v) {
      b.layoutDovizFiyati.setRightImageResource(0);
      showListeFiyatSecDialog(b.layoutBrutFiyatTL);
     }
    });
   }
  }
private boolean fiyatRehberGorebilir() {
  if (_profilModel.kullanici_AdminMi) return true;
  if (!_profilModel.stok_FiyatGorEkrani) return false;

  if (_alisaYonelikMi) {
   return (_profilModel.stokFiyatGorEkraniGorunecekAlanMi("alis_doviz_fiyati") || _profilModel.stokFiyatGorEkraniGorunecekAlanMi(
     "alis_fiyat1")  _profilModel.stokFiyatGorEkraniGorunecekAlanMi("alis_fiyat2")  _profilModel.stokFiyatGorEkraniGorunecekAlanMi(
     "alis_fiyat3") || _profilModel.stokFiyatGorEkraniGorunecekAlanMi("alis_fiyat4"));
  } else {
   return (_profilModel.stokFiyatGorEkraniGorunecekAlanMi("satis_doviz_fiyati") || _profilModel.stokFiyatGorEkraniGorunecekAlanMi(
     "satis_fiyat1")  _profilModel.stokFiyatGorEkraniGorunecekAlanMi("satis_fiyat2")  _profilModel.stokFiyatGorEkraniGorunecekAlanMi(
     "satis_fiyat3") || _profilModel.stokFiyatGorEkraniGorunecekAlanMi("satis_fiyat4"));
  }
 }