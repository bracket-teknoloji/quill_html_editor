public void setDurum(String durum) {
   if (durum.equalsIgnoreCase(TEKRAR_EDEN_BARKOD_ENGELLE)) {
    _tumunuFalseYap();
    mevcutaEkle = true;
    engelle = true;
   } else if (durum.equalsIgnoreCase(TEKRAR_EDEN_BARKOD_ENGELLE_HERBARKOD_BIR_KALEM)) {
    _tumunuFalseYap();
    engelle = true;
   } else if (durum.equalsIgnoreCase(TEKRAR_EDEN_BARKOD_YENI_EKLE)) {
    _tumunuFalseYap();
    yeniEkle = true;
   } else if (durum.equalsIgnoreCase(TEKRAR_EDEN_BARKOD_MEVCUTA_EKLE)) {
    _tumunuFalseYap();
    mevcutaEkle = true;
   } else if (durum.equalsIgnoreCase(TEKRAR_EDEN_BARKOD_SOR_YENI_EKLE)) {
    _tumunuFalseYap();
    sorYeniEkle = true;
   } else if (durum.equalsIgnoreCase(TEKRAR_EDEN_BARKOD_SOR_MEVCUTA_EKLE)) {
    _tumunuFalseYap();
    sorMevcutaEkle = true;
   }
  }


private void kalemMevcutsaSor(String buBarkoddanBulundu, StokResponseModel stokModel, DialogInterface.OnClickListener onClickListener) {
  if (_profilModel.barkodluUrunGirisi()) {
   FaturaKalemResponseModel kalem = getMevcutKalem(stokModel,
                                                   buBarkoddanBulundu.isEmpty() == false,
                                                   buBarkoddanBulundu.isEmpty() ? stokModel.Kodu : buBarkoddanBulundu,
                                                   stokModel.YapKod);
   if (kalem != null) {
    ProfilResponseModel.TekrarEdenBarkod tekrarModel = _profilModel.barkodluGirisTekrarEdenBarkodDurumu();
    if (tekrarModel.engelle) {
     ToastUtils.showErrorToastLong(StringUtils.getNewLineStringFromArray(Arrays.asList("Barkod zaten okutuldu.",
                                                                                       buBarkoddanBulundu,
                                                                                       kalem.getStokAdi(),
                                                                                       kalem.YapAciklama)));
    } else if (tekrarModel.isSor()) {
     _dialogHelper.showAskDialog(kalem.getStokAdi(),
                                 "Stok Kodu : " + kalem.StokKodu + (kalem.YapKod.isEmpty() ? "" : "\nYap. Kodu : " + kalem.YapKod) + "\nBarkod : " + buBarkoddanBulundu + "\n\n" +
                                   "Ürün listenizde mevcut." + "\nYine de eklensin mi ?",
                                 onClickListener);
     PickerUtils.basarisizIslem();
    } else {
     if (onClickListener != null) {
      onClickListener.onClick(null, 0);
     }
    }
    focusBarkod();
    return;
   }
  } else {
   FaturaKalemResponseModel kalem = getMevcutKalem(stokModel, false, stokModel.Kodu, stokModel.YapKod);
   if (kalem != null) {
    PickerUtils.basarisizIslem();
    _dialogHelper.showAskDialog(kalem.getStokAdi(),
                                "Stok Kodu : " + kalem.StokKodu + (kalem.YapKod.isEmpty() ? "" : "\nYap. Kodu : " + kalem.YapKod) + "\n\nÜrün listenizde mevcut." + "\nYine de " +
                                  "eklensin mi ?",
                                onClickListener);
    focusBarkod();
    return;
   }
  }
  onClickListener.onClick(null, 0);
 }