public void showEBElgeIslemleri(final FaturaResponseModel faturaResponseModel, CariResponseModel cariResponseModel, final IResultListener<GenericResponseModel<EBelgeResponseModel>> resultListener) {
        if (_generalManager.isDemoShowAlert())
            return;
        if (MenuManager.eBelgeLisansiVar() == false) {
            ToastUtils.showErrorToast("E-Belge işlemleri için yetkiniz yok.");
            return;
        }
        String belgeTuru = faturaResponseModel.getBelgeTuru();
        boolean ebelgeGondermeYetkili = MenuManager.eBelgeGondermeYetkili(faturaResponseModel.getEBelgeTuru());
        boolean ebelgeGoruntulemeYetkili = MenuManager.eBelgeGoruntulemeYetkili(faturaResponseModel.getEBelgeTuru());
        final boolean satisMi = BelgeUtils.belgeSatisMi(belgeTuru);
        final boolean faturaMi = BelgeUtils.belgeFaturaMi(belgeTuru);
        boolean irsaliyeMi = BelgeUtils.belgeIrsaliyeMi(belgeTuru);
        boolean satisIrsaliyesiMi = belgeTuru.equalsIgnoreCase(BLLConstants.PICKER_BELGE_TURU_SATIS_IRSALIYESI);
        boolean datMi = BelgeUtils.datMi(belgeTuru);
        boolean ambarCikisMi = belgeTuru.equalsIgnoreCase(BLLConstants.PICKER_BELGE_TURU_AMBAR_CIKISI);
        final GridDialogHelper gridDialogHelper = new GridDialogHelper(_dialogHelper.getActivity());
        //Görüntüle
        if (faturaResponseModel.eBelgeMi()) {
            gridDialogHelper.addItem("E-Belge Görüntüle", (faturaResponseModel.eFaturaMi() && MenuManager.islemeYetkiliMi(YetkiKodu.EFAT_GORUNTULE))
                    || (faturaResponseModel.eArsivMi() && MenuManager.islemeYetkiliMi(YetkiKodu.EAR_GORUNTULE))
                    || (faturaResponseModel.eIrsaliyeMi() && MenuManager.islemeYetkiliMi(YetkiKodu.EIR_GORUNTULE)), R.drawable.ic_eye_white, itemModel -> eBelgeGoruntule(faturaResponseModel.getEBelgeTuru(),
                                                                                                                                                                          belgeTuru,
                                                                                                                                                                          faturaResponseModel.ResmiBelgeNo,
                                                                                                                                                                          false,
                                                                                                                                                                          null));
        }
        //Taslağı sil
        if ((satisIrsaliyesiMi || ambarCikisMi || datMi || faturaMi) && (faturaResponseModel.eArsivTaslakMi() || faturaResponseModel.efaturaTaslakMi() || faturaResponseModel.eIrsaliyeTaslakMi())) {
            gridDialogHelper.addItem("Taslağı Sil",
                                     (faturaResponseModel.eFaturaMi() && MenuManager.islemeYetkiliMi(YetkiKodu.EFAT_TASLAK_SIL))
                            || (faturaResponseModel.eArsivMi() && MenuManager.islemeYetkiliMi(YetkiKodu.EAR_TASLAK_SIL))
                            || (faturaResponseModel.eIrsaliyeMi() && MenuManager.islemeYetkiliMi(YetkiKodu.EIR_TASLAK_SIL)),
                                     R.drawable.ic_delete_white, itemModel -> showEBelgeTaslakSil(faturaResponseModel, resultListener));
        }
        //Gönder
        boolean eFaturaSerisinden = _paramModel.eFaturaSerisindenMi(faturaResponseModel.FisNo);
        boolean eArsivSerisinden = _paramModel.eArsivSerisindenMi(faturaResponseModel.FisNo);
        boolean eIrsaliyeSerisinden = _paramModel.eIrsaliyeSerisindenMi(faturaResponseModel.FisNo);
        //e-belge gönder
        if (satisMi && faturaMi) {
            if (cariResponseModel.EFaturaMi) {
                //apk 219 : e-fatura e-arşiv, taslak oluşturma yetki sorunu çözüldü.
                //e-fat gönder
                boolean taslakOlusabilir = faturaResponseModel.eFaturaMi() == false && eFaturaSerisinden;
                boolean taslakGonderilebilir = faturaResponseModel.efaturaTaslakMi() && faturaResponseModel.efaturaBasariylaGonderildiMi() == false && MenuManager.islemeYetkiliMi(YetkiKodu.EFAT_GONDER);
                boolean taslakVeyaGondermeYetkili = (taslakOlusabilir && MenuManager.islemeYetkiliMi(YetkiKodu.EFAT_TASLAK_OLUTUR)) || (taslakGonderilebilir && MenuManager.islemeYetkiliMi(YetkiKodu.EFAT_GONDER));
                if (taslakOlusabilir || taslakGonderilebilir) {
                    gridDialogHelper.addItem("E-Fatura Gönder", taslakVeyaGondermeYetkili, R.drawable.ic_send_white,
                                             itemModel -> showEBelgeGonder(EBELGE_TURU_FATURA, belgeTuru, faturaResponseModel.FisNo, cariResponseModel.CariKodu, resultListener));
                }
            } else {
                //E-arşiv gönder
                boolean taslakOlusabilir = faturaResponseModel.eArsivMi() == false && (_paramModel.EArsivCokluSeri == false || eArsivSerisinden);
                boolean taslakGonderilebilir = faturaResponseModel.eArsivTaslakMi() && faturaResponseModel.eArsivBasariylaGonderildiMi() == false;
                boolean taslakVeyaGondermeYetkili = (taslakOlusabilir && MenuManager.islemeYetkiliMi(YetkiKodu.EAR_TASLAK_OLUSTUR)) || (taslakGonderilebilir && MenuManager.islemeYetkiliMi(YetkiKodu.EAR_GONDER));
                if (taslakOlusabilir || taslakGonderilebilir) {
                    gridDialogHelper.addItem("E-Arşiv Gönder", taslakVeyaGondermeYetkili, R.drawable.ic_send_white,
                                             itemModel -> showEBelgeGonder(EBELGE_TURU_ARSIV, belgeTuru, faturaResponseModel.FisNo, cariResponseModel.CariKodu, resultListener));
                }
            }
        } else if (satisIrsaliyesiMi || datMi || ambarCikisMi) {
            //E-irs gönder
            boolean taslakOlusabilir = faturaResponseModel.eIrsaliyeCheckIsaretli() && faturaResponseModel.eIrsaliyeMi() == false && eIrsaliyeSerisinden;
            boolean taslakGonderilebilir = faturaResponseModel.eIrsaliyeTaslakMi() && faturaResponseModel.eIrsaliyeBasariylaGonderildiMi() == false;
            boolean taslakVeyaGondermeYetkili = (taslakOlusabilir && MenuManager.islemeYetkiliMi(YetkiKodu.EIR_TASLAK_OLUSTUR)) || (taslakGonderilebilir && MenuManager.islemeYetkiliMi(YetkiKodu.EIR_GONDER));
            if (taslakOlusabilir || taslakGonderilebilir) {
                gridDialogHelper.addItem("E-İrsaliye Gönder", taslakVeyaGondermeYetkili, R.drawable.ic_send_white,
                                         itemModel -> showEBelgeGonder(EBELGE_TURU_IRSALIYE, belgeTuru, faturaResponseModel.FisNo, cariResponseModel.CariKodu, resultListener));
            }
        }
        //Belge durumunu sorgula
        boolean durumSorgulanabilirMi = false;
        if (satisMi) {
            //apk 169 : durum sorgulama seçeneği, belge başarılıysa da çıkıyor.
            durumSorgulanabilirMi = (faturaResponseModel.eFaturaMi() && faturaResponseModel.efaturaTaslakMi() == false)
                    || (faturaResponseModel.eArsivMi() && faturaResponseModel.eArsivTaslakMi() == false)
                    || (faturaResponseModel.eIrsaliyeMi() && faturaResponseModel.eIrsaliyeTaslakMi() == false);
        }
        if (durumSorgulanabilirMi) {
            gridDialogHelper.addItem("Durum Sorgula", (faturaResponseModel.eFaturaMi() && MenuManager.islemeYetkiliMi(YetkiKodu.EFAT_GIDEN_KUTUSU))
                    || (faturaResponseModel.eArsivMi() && MenuManager.islemeYetkiliMi(YetkiKodu.EAR_GIDEN_KUTUSU))
                    || (faturaResponseModel.eIrsaliyeMi() && MenuManager.islemeYetkiliMi(YetkiKodu.EIR_GIDEN_KUTUSU)), R.drawable.ic_sorgula_white, itemModel -> {
                        EBelgeFilterRequestModel eBelgeFilterRequestModel = new EBelgeFilterRequestModel();
                        eBelgeFilterRequestModel.KutuTipi = satisMi ? EBELGE_GIDEN_KUTUSU : EBELGE_GELEN_KUTUSU;
                        eBelgeFilterRequestModel.BaslamaTarihi = faturaResponseModel.getTarihString();
                        eBelgeFilterRequestModel.BitisTarihi = DateTimeUtils.getNowDate();
                        eBelgeFilterRequestModel.EBelgeTuru = faturaResponseModel.getEBelgeTuru();
                        eBelgeFilterRequestModel.ResmiBelgeNo = faturaResponseModel.ResmiBelgeNo;
                        _rxJavaHelper.convertDialogObservable(getEFaturalarObservable(eBelgeFilterRequestModel), result -> {
                            if (result.dataList.isEmpty()) {
                                _dialogHelper.showErrorDialog(faturaResponseModel.ResmiBelgeNo, "E-Belge kaydı bulunamadı.");
                            } else {
                                EFaturaResponseModel eFaturaResponseModel = result.dataList.get(0);
                                _dialogHelper.showInfoDialog(eFaturaResponseModel.CevapKodu + "\n" + eFaturaResponseModel.getCevapAciklama());
                                if (resultListener != null) {
                                    GenericResponseModel<EBelgeResponseModel> genericResponseModel = new GenericResponseModel<>();
                                    genericResponseModel.success = true;
                                    EBelgeResponseModel eBelgeResponseModel = new EBelgeResponseModel();
                                    eBelgeResponseModel.IslemKodu = EBELGE_ISLEM_KODU_SORGULA;
                                    genericResponseModel.dataList.add(eBelgeResponseModel);
                                    resultListener.onResult(genericResponseModel);
                                }
                            }
                        });
                    });
        }
        //Eşleştirme İptali
        boolean eslestirmeIptalEdilebilir = BelgeUtils.alisaYonelikMi(belgeTuru)
                && faturaResponseModel.eBelgeMi()
                && faturaResponseModel.eBelgeTaslakMi() == false;
        if (eslestirmeIptalEdilebilir) {
            gridDialogHelper.addItem("Eşleştirme İptali", ((irsaliyeMi && MenuManager.islemeYetkiliMi(YetkiKodu.EIR_GONDER)) || (faturaMi && MenuManager.islemeYetkiliMi(YetkiKodu.EFAT_GONDER))), R.drawable.ic_close_gray,
                                     itemModel -> _dialogHelper.showAskDialog(faturaResponseModel.FisNo, _langModel.genelIslemiOnayliyorMusunuz, (dialog, which) -> {
                                         EBelgeRequestModel eBelgeRequestModel = new EBelgeRequestModel(EBELGE_ISLEM_KODU_EFAT_BAGLANTISINI_KOPAR, faturaResponseModel.getEBelgeTuru());
                                         eBelgeRequestModel.bilgileriFaturaModeldenAl(faturaResponseModel);
                                         eBelgeIslemi(eBelgeRequestModel, new IResultListener<GenericResponseModel<EBelgeResponseModel>>() {
                                             @Override
                                             public void onResult(GenericResponseModel<EBelgeResponseModel> result) {
                                                 ToastUtils.showSuccessToast(result.message);
                                                 if (resultListener != null) {
                                                     resultListener.onResult(result);
                                                 }
                                             }

                                             @Override
                                             public void onError(CustomException exception) {
                                                 if (resultListener != null) {
                                                     resultListener.onError(exception);
                                                 }
                                             }
                                         });
                                     }));
        }
        //E-Belge eşleştir
        boolean eslestirilebilir = BelgeUtils.alisaYonelikMi(belgeTuru) && faturaResponseModel.eBelgeMi() == false && faturaResponseModel.ResmiBelgeNo.isEmpty() == false;
        boolean eslestirmeYetkili = ((irsaliyeMi && MenuManager.islemeYetkiliMi(YetkiKodu.EIR_GONDER)) || (faturaMi && MenuManager.islemeYetkiliMi(YetkiKodu.EFAT_GONDER)));
        if (eslestirilebilir) {
            gridDialogHelper.addItem("E-Belge Eşleştir", eslestirmeYetkili, R.drawable.ic_belge_baglanti_gray,
                                     itemModel -> _dialogHelper.showAskDialog(faturaResponseModel.FisNo, _langModel.genelIslemiOnayliyorMusunuz, (dialog, which) -> {
                                         EBelgeRequestModel eBelgeRequestModel = new EBelgeRequestModel(EBELGE_ISLEM_KODU_EBELGE_ESLESTIR, faturaResponseModel.getEBelgeTuru());
                                         eBelgeRequestModel.bilgileriFaturaModeldenAl(faturaResponseModel);
                                         eBelgeRequestModel.GelenGidenKutuTuru = EBELGE_GELEN_KUTUSU;
                                         if (eBelgeRequestModel.EBelgeTuru.isEmpty()) {
                                             eBelgeRequestModel.EBelgeTuru = faturaMi ? EBELGE_TURU_FATURA : EBELGE_TURU_ARSIV;
                                         }
                                         eBelgeIslemi(eBelgeRequestModel, new IResultListener<GenericResponseModel<EBelgeResponseModel>>() {
                                             @Override
                                             public void onResult(GenericResponseModel<EBelgeResponseModel> result) {
                                                 ToastUtils.showSuccessToast(result.message);
                                                 if (resultListener != null) {
                                                     resultListener.onResult(result);
                                                 }
                                             }

                                             @Override
                                             public void onError(CustomException exception) {
                                                 if (resultListener != null) {
                                                     resultListener.onError(exception);
                                                 }
                                             }
                                         });
                                     }));
        }
        //Yazdır
        if (faturaResponseModel.eBelgeMi()) {
            gridDialogHelper.addItem("Yazdır", ebelgeGoruntulemeYetkili, R.drawable.ic_print_gray,
                                     itemModel -> showYazdirDialog(faturaResponseModel.ResmiBelgeNo, belgeTuru, faturaResponseModel.getEBelgeTuru(), null));
        }
        //
        gridDialogHelper.setTitle(faturaResponseModel.FisNo);
        gridDialogHelper.show();
    }