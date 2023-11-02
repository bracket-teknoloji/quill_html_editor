RowEFaturalarBinding bin = (RowEFaturalarBinding) binding;
                bin.lblResmiBelgeNo.setValue(model.ResmiBelgeNo);
                bin.lblTarih.setValue(model.Tarih);
                bin.lblKayitTar.setValue(model.KayitTarihi);
                bin.lblCariAdi.setValue(model.CariAdi);
                bin.lblVergiNo.visibleIf(_gelen);
                if(bin.lblVergiNo.isVisible()){
                    bin.lblVergiNo.setValue(model.VERGI_NO);
                }
                //Fatura işlendi
                String faturaNetsiseIslendiAciklama = model.getGelenBelgeNetsiseIslendiAciklama();
                bin.lblBelgeNetsiseIslendi.setVisibility(faturaNetsiseIslendiAciklama.isEmpty() ? GONE : VISIBLE);
                bin.lblBelgeNetsiseIslendi.setValue(faturaNetsiseIslendiAciklama);
                //Onay Durumu
                bin.lblOnayDurumu.visibleIf(model.eFaturaMi() || model.eIrsaliyeMi());
                bin.lblOnayDurumu.setValue(model.getOnayAciklama());
                bin.lblOnayDurumu.setTextColorRes(model.onayBekliyor() ? R.color.colorAccent : R.color.colorGray);
                //Cevap Kodu
                bin.lblCevapKodu.setVisibility(model.gelenMi() ? GONE : VISIBLE);
                bin.lblCevapKodu.setValue(model.CevapKodu);
                //Senaryo
                bin.lblSenaryo.setVisibility(model.eFaturaMi() ? VISIBLE : GONE);
                bin.lblSenaryo.setValue(model.getSenaryoAdi());
                //Fatura Tipi
                bin.lblTipi.visibleIf(model.eIrsaliyeMi() == false);
                bin.lblTipi.setValue(model.FaturaTipi);
                //
                bin.lblGenelToplam.visibleIf(_eIrsaliye == false);
                bin.lblGenelToplam.setValue(model.GenelToplam, _paramModel.getBoslukParaBirimi());
                //Döviz
                bin.lblDovizliGenelToplam.setVisibility(model.dovizliMi() && _eIrsaliye == false ? VISIBLE : GONE);
                bin.lblDovizliGenelToplam.setValue(model.DovizTutari, model.DovizAdi);
                //Tag
                bin.lblTagDovizli.setVisibility(model.dovizliMi() && _eIrsaliye == false ? VISIBLE : GONE);
                bin.lblTAGRet.setVisibility(model.retEdildi() ? VISIBLE : GONE);
                bin.lblTAGTaslak.setVisibility(model.taslakMi() ? VISIBLE : GONE);
                bin.ivBasimYapildi.setVisibility(model.basimYapildi() ? VISIBLE : GONE);
                //Gönderme durumu
                if (model.gelenMi() || model.taslakMi()) {
                    bin.lblTagGondermeDurumu.setVisibility(GONE);
                } else {
                    bin.lblTagGondermeDurumu.setVisibility(VISIBLE);
                    if (model.GondermeDurumu.equals(FaturaManager.EFATURA_DURUM_GONDERILIYOR)) {
                        bin.lblTagGondermeDurumu.setBackgroundResource(R.drawable.ic_elips_yellow);
                        bin.lblTagGondermeDurumu.setValue("Uyarı");
                    } else if (model.GondermeDurumu.equals(FaturaManager.EFATURA_DURUM_HATA)) {
                        bin.lblTagGondermeDurumu.setBackgroundResource(R.drawable.ic_elips_red);
                        bin.lblTagGondermeDurumu.setValue("Hata");
                    } else if (model.basariylaGonderildi()) {
                        bin.lblTagGondermeDurumu.setBackgroundResource(R.drawable.ic_elips_green);
                        bin.lblTagGondermeDurumu.setValue("Başarılı");
                    } else {
                        bin.lblTagGondermeDurumu.setBackgroundResource(R.drawable.ic_elips_red);
                        bin.lblTagGondermeDurumu.setValue("Hata");
                    }
                }
                //iptal
                if ((model.eFaturaMi() && model.EFaturaIptalTarihi != null)) {
                    bin.lblTAGIptal.setVisibility(VISIBLE);
                    bin.lblTAGIptal.setValue("İptal (" + DateTimeUtils.dateToString(model.EFaturaIptalTarihi) + ")");
                } else if (model.eArsivMi() && model.gidenFaturaIptalEdildi()) {
                    bin.lblTAGIptal.setVisibility(VISIBLE);
                    bin.lblTAGIptal.setValue("İptal");
                } else {
                    bin.lblTAGIptal.setVisibility(GONE);
                }
                //E-Arşiv gönderim şekli
                bin.lblGonderimSekli.setVisibility(model.eArsivMi() && model.gelenMi() == false ? VISIBLE : GONE);
                bin.lblGonderimSekli.setValue(model.gonderimSekliEPostaMi() ? "E-Posta" : "Kağıt");
                //E-Arşiv e-posta
                bin.lblEPosta.setVisibility(model.eArsivMi() && model.gelenMi() == false && model.gonderimSekliEPostaMi() ? VISIBLE : GONE);
                bin.lblEPosta.setValue(model.EPosta);
                //Kontrol Durumu2
                bin.lblKontrolAciklama.visibleIf(_eFatura && _gelen);
                if (bin.lblKontrolAciklama.isVisible()) {
                    bin.lblKontrolAciklama.setLeftValueDrawable(model.gelenEFatKontrolEdildi() ? R.drawable.ic_ok_positive_16 : 0);
                    bin.lblKontrolAciklama.setTextColorRes(model.gelenEFatKontrolEdildi() ? R.color.colorPositive : R.color.defaultTextColor);
                    bin.lblKontrolAciklama.setValue(model.gelenEFatKontrolEdildi() ? model.GelenEFatKontrolAciklama : "Hayır");
                }
                //gelen fat işlemdi arkaplan
                if (_gelen) {
                    bin.layoutContent.setBackgroundResource(model.getGelenBelgeNetsiseIslendiAciklama().isEmpty() ? R.drawable.ripple_white : R.color.colorPositiveLight);
                }

















                private void showItemBSD(final EFaturaResponseModel responseModel) {
        final boolean yanitlanabilir = (responseModel.eFaturaMi() && responseModel.gelenMi() && responseModel.ticariMi() && responseModel.onayBekliyor()) || (responseModel.eIrsaliyeMi() && responseModel.gelenMi() && responseModel.onayBekliyor());
        final boolean yanitlamaYetkili = (responseModel.eFaturaMi() && MenuManager.islemeYetkiliMi(YetkiKodu.EFAT_TASLAK_OLUTUR)) || (responseModel.eIrsaliyeMi() && MenuManager.islemeYetkiliMi(YetkiKodu.EIR_TASLAK_OLUSTUR));
        //
        final boolean alisFatOlusturuabilir = responseModel.gelenMi() && responseModel.eFaturaMi() && responseModel.gelenFatAlisFatOlarakIslendiMi() == false && responseModel.gelenFatDekontOlarakIslendi() == false && responseModel.kabulEdildi();
        final boolean alisFatOlusturmaYetkili = MenuManager.islemeYetkiliMi(YetkiKodu.EFAT_ALIS_FAT_OLUSTUR) && MenuManager.islemeYetkiliMi(YetkiKodu.ALIS_FATURASI_EKLE);
        //
        _bsdItem.clearItems();
        _bsdItem.setTitle(responseModel.ResmiBelgeNo);
        //E-belge görüntüle
        _bsdItem.addItem(R.drawable.ic_eye_white, "E-Belge Görüntüle", (model, position) -> {
            final DFrgEFatPdfViewer frg = new DFrgEFatPdfViewer();
            frg._initEFaturaModel = responseModel;
            frg._initPaylasimYapabilsin = true;
            //Yanıtla
            if (yanitlanabilir && yanitlamaYetkili) {
                frg._initYanitlayabilsin = true;
                frg._initYanitlaClickListener = new OneClickListener() {
                    @Override
                    public void onOneClick(View v) {
                        _eBelgeManager.showYanitGonderDialog(responseModel, result -> {
                            String enumOnayDurum = result.getParamValue(BLLConstants.KEY_ONAY_DURUM_KODU);
                            responseModel.yanitla(enumOnayDurum);
                            _fastRVAdapter.notifyItemChangedRv(responseModel);
                        });
                    }
                };
            }
            //Alış fat oluştur
            if (alisFatOlusturuabilir && alisFatOlusturmaYetkili) {
                frg._initAlisFatOlusturabilir = true;
                frg._initAlisaFatOlusturClickListener = new OneClickListener() {
                    @Override
                    public void onOneClick(View v) {
                        eFattanAlisFat_1_CariSorgula(BLLConstants.PICKER_BELGE_TURU_ALIS_FATURASI, responseModel);
                    }
                };
            }
            frg.setOnDialogResultListener(dialogResultCode -> {
                if (frg._responseYazdirildi) {
                    responseModel.BasimYapildi = "E";   //apk 161
                    _fastRVAdapter.notifyItemChangedRv(responseModel);
                }
            });
            frg.showDF(getActivity());
        }).enable = (responseModel.eFaturaMi() && MenuManager.islemeYetkiliMi(YetkiKodu.EFAT_GORUNTULE))
                || (responseModel.eArsivMi() && responseModel.gelenMi() == false && MenuManager.islemeYetkiliMi(YetkiKodu.EAR_GORUNTULE))
                || (responseModel.eIrsaliyeMi() && MenuManager.islemeYetkiliMi(YetkiKodu.EIR_GORUNTULE));
        //Yanıtla
        if (yanitlanabilir) {
            _bsdItem.addItem(R.drawable.ic_reply_gray, "Yanıt Gönder", (model, position) -> _eBelgeManager.showYanitGonderDialog(responseModel, result -> {
                String onayDurumKodu = result.getParamValue(BLLConstants.KEY_ONAY_DURUM_KODU);
                responseModel.yanitla(onayDurumKodu);
                _fastRVAdapter.notifyItemChangedRv(responseModel);
            })).enable = yanitlamaYetkili;
        }
        //Belgeyi görüntüle
        if (_gelen) {
            if (responseModel.gelenFatAlisFatOlarakIslendiMi()) {
                _bsdItem.addItem(R.drawable.ic_eye_white, "Alış Faturasını Görüntüle",
                                 (model, position) -> _faturaManager.showBelgeDetayReadOnly(responseModel.BelgeTuru, responseModel.BelgeNo, responseModel.CariKodu));
            }
            if (responseModel.gelenIrsIslendiMi()) {
                _bsdItem.addItem(R.drawable.ic_eye_white, "Alış İrsaliyesini Görüntüle",
                                 (model, position) -> _faturaManager.showBelgeDetayReadOnly(responseModel.BelgeTuru, responseModel.BelgeNo, responseModel.CariKodu));
            }
            if (responseModel.gelenFatDekontOlarakIslendi()) {
                _bsdItem.addItem(R.drawable.ic_eye_white, "Dekont Görüntüle", (model, position) -> {
                    EFaturaResponseModel.IslenenDekontModel dekontModel = responseModel.getIslenenDekontModel();
                    _bankaManager.showDekontReadOnly("", dekontModel.Seri, dekontModel.No);
                });
            }
        } else {
            if (responseModel.eFaturaMi() && responseModel.gidenFaturaIptalEdildi() == false) {
                _bsdItem.addItem(R.drawable.ic_eye_white, "Satış Faturasını Görüntüle",
                                 (model, position) -> _faturaManager.showBelgeDetayReadOnly(responseModel.BelgeTuru, responseModel.BelgeNo, responseModel.CariKodu));
            } else if (responseModel.eIrsaliyeMi()) {
                String belgeAdi = BelgeUtils.getBelgeTuruGorunenAdi(responseModel.BelgeTuru, 0);
                _bsdItem.addItem(R.drawable.ic_eye_white, belgeAdi + " Görüntüle",
                                 (model, position) -> _faturaManager.showBelgeDetayReadOnly(responseModel.BelgeTuru, responseModel.BelgeNo, responseModel.CariKodu));
            }
        }
        //cari oluştur
        if (MenuManager.islemeYetkiliMi(YetkiKodu.CARI_KARTI_KAYDET) && _eFatura && _gelen && responseModel.KayitliCariKodu.isEmpty()) {
            _bsdItem.addItem(R.drawable.ic_add_gray, "Cari Oluştur", (model, position) -> cariOlustur(responseModel, result -> {
                responseModel.KayitliCariKodu = result.CariKodu;
                _fastRVAdapter.notifyItemChangedRv(responseModel);
            }));
        }
        //Alış faturası oluştur
        if (alisFatOlusturuabilir) {
            _bsdItem.addItem(R.drawable.ic_add_gray, "Alış Faturası Oluştur", (model, position) -> eFattanAlisFat_1_CariSorgula(BLLConstants.PICKER_BELGE_TURU_ALIS_FATURASI, responseModel)).enable = alisFatOlusturmaYetkili;
            _bsdItem.addItem(R.drawable.ic_add_gray, "Dekont Oluştur", (model, position) -> eFattanDekont(responseModel)).enable = MenuManager.islemeYetkiliMi(YetkiKodu.DEKONT_EKLE);
        }
        //Alış irsaliyesi oluştur
        if (responseModel.gelenMi() && responseModel.eIrsaliyeMi() && responseModel.gelenIrsIslendiMi() == false && responseModel.kabulEdildi()) {
            _bsdItem.addItem(R.drawable.ic_add_gray, "Alış İrsaliyesi Oluştur",
                             (model, position) -> eFattanAlisFat_1_CariSorgula(BLLConstants.PICKER_BELGE_TURU_ALIS_IRSALIYESI, responseModel)).enable = MenuManager.islemeYetkiliMi(YetkiKodu.ALIS_IRSALIYESI_EKLE);
        }
        //Belge bağlantısını kopar(eşleştirme itali)
        if (responseModel.gelenMi() && responseModel.eFaturaMi() && responseModel.gelenFatAlisFatOlarakIslendiMi()) {
            _bsdItem.addItem(R.drawable.ic_close_gray, "E-Fatura Eşleştirme İptali",
                             (model, position) -> _dialogHelper.showAskDialog(responseModel.ResmiBelgeNo, responseModel.BelgeNo + " belge bağlantısı iptal edilsin mi ?", (dialog, which) -> {
                                 EBelgeRequestModel eBelgeRequestModel = new EBelgeRequestModel(EBelgeManager.EBELGE_ISLEM_KODU_EFAT_BAGLANTISINI_KOPAR, EBelgeManager.EBELGE_TURU_FATURA);
                                 eBelgeRequestModel.bilgileriEBelgeModeldenAl(responseModel);
                                 _eBelgeManager.eBelgeIslemi(eBelgeRequestModel, result -> {
                                     ToastUtils.showSuccessToast(result.message);
                                     responseModel.irsFatuEslemeIptali();
                                     _fastRVAdapter.notifyItemChangedRv(responseModel);
                                 });
                             })).enable = MenuManager.islemeYetkiliMi(YetkiKodu.EFAT_ALIS_FAT_OLUSTUR);
        }
        //E-Belge eşleştirodel.kabulEdildi() && ((responseModel.eFaturaMi() && responseModel.gelenFatAlisFatOlarakIslendiMi() == false) || (responseModel.eIrsaliyeMi() && responseModel.gelenIrsIslendiMi() 
        boolean eslemeYapilabilir = _gelen && responseM== false));
        boolean eslestirmeYetkili = ((responseModel.eIrsaliyeMi() && MenuManager.islemeYetkiliMi(YetkiKodu.EIR_GONDER)) || (responseModel.eFaturaMi() && MenuManager.islemeYetkiliMi(YetkiKodu.EFAT_GONDER)));
        if (eslemeYapilabilir) {
            _bsdItem.addItem(R.drawable.ic_belge_baglanti_gray, "E-Belge Eşleştir",
                             (model, position) -> _dialogHelper.showAskDialog(responseModel.ResmiBelgeNo, _langModel.genelIslemiOnayliyorMusunuz, (dialog, which) -> {
                                 EBelgeRequestModel eBelgeRequestModel = new EBelgeRequestModel(EBelgeManager.EBELGE_ISLEM_KODU_EBELGE_ESLESTIR, responseModel.EBelgeTuru);
                                 eBelgeRequestModel.bilgileriEBelgeModeldenAl(responseModel);
                                 _eBelgeManager.eBelgeIslemi(eBelgeRequestModel, result -> {
                                     String eslesenBelgeNo = result.getParamValue("ESLESEN_BELGE_NO");
                                     ToastUtils.showSuccessToast(result.message);
                                     if (eslesenBelgeNo.isEmpty()) {
                                         refreshData();
                                     } else {
                                         responseModel.irsFatuEslestir(eslesenBelgeNo);
                                         _fastRVAdapter.notifyItemChangedRv(responseModel);
                                     }
                                 });
                             })).enable = eslestirmeYetkili;
        }
        //Harici yolla iptal et
        if (responseModel.taslakMi() == false && responseModel.gelenMi() == false && responseModel.eFaturaMi() && responseModel.EFaturaIptalTarihi == null) {
            _bsdItem.addItem(R.drawable.ic_delete_gray, "Harici Yolla Fatura İptali", (model, position) -> {
                DatePicker datePicker = new DatePicker(getContext(), "İptal Tarihi");
                datePicker.setOnSelectedListener(new DatePicker.DatePickerListener() {
                    @Override
                    public void onSelect(String sDate, final Date dtDate) {
                        _dialogHelper.showAskDialog(responseModel.ResmiBelgeNo, "Fatura harici yolla iptal edilsin mi ?", "İptal Tarihi : " + sDate, (dialog, which) -> {
                            EBelgeRequestModel eBelgeRequestModel = new EBelgeRequestModel(EBelgeManager.EBELGE_ISLEM_KODU_EFAT_HARICI_YOLLA_IPTAL_ET, EBelgeManager.EBELGE_TURU_FATURA);
                            eBelgeRequestModel.bilgileriEBelgeModeldenAl(responseModel);
                            eBelgeRequestModel.IncKeyNo = responseModel.ID;
                            eBelgeRequestModel.IptalTarihi = dtDate;
                            _eBelgeManager.eBelgeIslemi(eBelgeRequestModel, result -> {
                                ToastUtils.showSuccessToastLong(result.message);
                                refreshData();
                            });
                        });
                    }

                    @Override
                    public void onCancel() {

                    }
                });
                datePicker.show();

            }).enable = MenuManager.islemeYetkiliMi(YetkiKodu.EFAT_ALIS_FAT_OLUSTUR);
        }
        //E-Arşiv iptal fat oluştur
        if (responseModel.taslakMi() == false && responseModel.eArsivMi() && responseModel.gelenMi() == false && responseModel.gidenFaturaIptalEdildi() == false) {
            _bsdItem.addItem(R.drawable.ic_add_gray, "İptal Faturası Oluştur",
                             (model, position) -> _dialogHelper.showAskDialog(responseModel.ResmiBelgeNo, _langModel.genelIslemiOnayliyorMusunuz, (dialog, which) -> {
                                 EBelgeRequestModel eBelgeRequestModel = new EBelgeRequestModel(EBelgeManager.EBELGE_ISLEM_KODU_EARSIV_IPTAL_FAT_OLUSTUR, EBelgeManager.EBELGE_TURU_ARSIV);
                                 eBelgeRequestModel.bilgileriEBelgeModeldenAl(responseModel);
                                 _eBelgeManager.eBelgeIslemi(eBelgeRequestModel, result -> {
                                     ToastUtils.showSuccessToastLong(result.message);
                                     refreshData();
                                 });
                             })).enable = MenuManager.islemeYetkiliMi(YetkiKodu.EAR_GONDER);
        }
        //E-Arşiv iptal edildiyse fatura belgesini sil.
        if (responseModel.taslakMi() == false && responseModel.eArsivMi() && responseModel.gelenMi() == false && responseModel.gidenFaturaIptalEdildi()) {
            _bsdItem.addItem(R.drawable.ic_delete_gray, "Satış Faturasını Sil",
                             (model, position) -> _dialogHelper.showAskDialog(responseModel.ResmiBelgeNo, "E-Arşiv belgesine ait satış faturası silinsin mi ?", (dialog, which) -> {
                                 EBelgeRequestModel eBelgeRequestModel = new EBelgeRequestModel(EBelgeManager.EBELGE_ISLEM_KODU_EARSIV_SATIS_FATURASINI_SIL, EBelgeManager.EBELGE_TURU_ARSIV);
                                 eBelgeRequestModel.bilgileriEBelgeModeldenAl(responseModel);
                                 _eBelgeManager.eBelgeIslemi(eBelgeRequestModel, result -> {
                                     ToastUtils.showSuccessToastLong(result.message);
                                     refreshData();
                                 });
                             })).enable = MenuManager.islemeYetkiliMi(YetkiKodu.SATIS_FATURASI_SIL);
        }
        //Giden belge zarf sil (apk 176)
        if (responseModel.ZarfSilinebilir_EH.equalsIgnoreCase("E") && MenuManager.eBelgeGondermeYetkili(_ebelgeTuru)) {
            _bsdItem.addItem(R.drawable.ic_delete_gray, "Zarfı Sil", (model, position) -> _dialogHelper.showAskDialog(responseModel.ResmiBelgeNo, _langModel.genelIslemiOnayliyorMusunuz,
                                                                                                                      (dialog, which) -> {
                                                                                                                          EBelgeRequestModel eBelgeRequestModel = new EBelgeRequestModel(EBelgeManager.EBELGE_ISLEM_KODU_ZARF_SIL,
                                                                                                                                                                                         _ebelgeTuru);
                                                                                                                          eBelgeRequestModel.bilgileriEBelgeModeldenAl(responseModel);
                                                                                                                          _eBelgeManager.eBelgeIslemi(eBelgeRequestModel,
                                                                                                                                                      result -> {
                                                                                                                                                          ToastUtils.showSuccessToastLong(result.message);
                                                                                                                                                          _fastRVAdapter.removeItemAll(responseModel);
                                                                                                                                                      });
                                                                                                                      })).enable = MenuManager.islemeYetkiliMi(YetkiKodu.SATIS_FATURASI_SIL);
        }
        //Kontrol Durumu
        if (_eFatura && _gelen) {
            _bsdItem.addItem(R.drawable.ic_edit_gray, "Kontrol Durumunu Değiştir", (model, position) -> showKontrolDurumDegistir(responseModel,
                                                                                                                                 result -> _fastRVAdapter.notifyItemChangedRv(responseModel)));
        }
        //Cari işlemleri
        if ((responseModel.eArsivMi() && responseModel.gelenMi() == false) || (responseModel.eFaturaMi() && _gelen && responseModel.KayitliCariKodu.isEmpty() == false) || (responseModel.eFaturaMi() && _gelen == false)) {
            _bsdItem.addItem(R.drawable.ic_menu_cari, "Cari İşlemleri",
                             (model, position) -> _cariManager.showCariIslemleriDialog(_ebelgeTuru, null, responseModel.KayitliCariKodu.isEmpty() ? responseModel.CariKodu : responseModel.KayitliCariKodu,
                                                                                       result -> refreshData()));
        }
        //Yazdır
        if ((_gelen && _eArsiv) == false) {
            _bsdItem.addItem(R.drawable.ic_print_gray, "Yazdır", (model, position) -> _eBelgeManager.showYazdirDialog(responseModel.ResmiBelgeNo, responseModel.BelgeTuru, responseModel.EBelgeTuru,
                                                                                                                      result -> {
                                                                                                                          responseModel.BasimYapildi = "E";
                                                                                                                          _fastRVAdapter.notifyItemChangedRv(responseModel);
                                                                                                                      }));
        }
        //
        _bsdItem.show();
    }










class EFaturaResponseModel
{
    String EBelgeTuru = "";
    int ID;
    int EFatMasID;
    int EIrsMasID;
    String Gelen = "";
    String Taslak = "";
    String Gonderildi = "";
    String FaturaIslendi = "";
    String DekontIslendi = "";
    String IptalEdildi = "";
    String DekontJson = "";
    int CevapKodu;
    String CevapAciklama = "";
    String BASARIYLA_GONDERILDI = "";
    String OnayDurumKodu = "";
    String OnayAciklama = "";
    String BelgeNo = "";
    String ResmiBelgeNo = "";
    Date Tarih;
    Date KayitTarihi;
    Date EFaturaIptalTarihi;
    String BelgeTuru = "";
    String KayitliCariKodu = "";
    String CariKodu = "";
    String CariAdi = "";
    String VERGI_NO = "";
    String Ilce = "";
    String Sehir = "";
    int DovizTipi;
    String DovizAdi = "";
    double DovizTutari;
    double DovizKuru;
    String BasimYapildi = "";
    double IskontoTutari;
    double GenelToplam;
    double KdvTutari;
    String Senaryo = "";
    String ZarfID = "";
    String UUID = "";
    String FaturaTipi = "";
    String KayitYapanKul = "";
    String DizaynYolu = "";
    String GondermeDurumu = "";
    String GelenEFatKontrolEdildi = "";
    String GelenEFatKontrolAciklama = "";
    String ZarfSilinebilir_EH = "";
    String GonderimSekliEPosta_EH = "";
    String EPosta = "";
}






    public class EFaturaResponseModel{
    public String EBelgeTuru = "";
    public int ID;
    public int EFatMasID;
    public int EIrsMasID;
    public String Gelen = "";
    public String Taslak = "";
    public String Gonderildi = "";
    public String FaturaIslendi = "";
    public String DekontIslendi = "";
    public String IptalEdildi = "";
    public String DekontJson = "";
    public int CevapKodu;
    public String CevapAciklama = "";
    public String BASARIYLA_GONDERILDI = "";
    public String OnayDurumKodu = "";
    public String OnayAciklama = "";
    public String BelgeNo = "";
    public String ResmiBelgeNo = "";
    public Date Tarih;
    public Date KayitTarihi;
    public Date EFaturaIptalTarihi;
    public String BelgeTuru = "";
    public String KayitliCariKodu = "";
    public String CariKodu = "";
    public String CariAdi = "";
    public String VERGI_NO = "";
    public String Ilce = "";
    public String Sehir = "";
    public int DovizTipi;
    public String DovizAdi = "";
    public double DovizTutari;
    public double DovizKuru;
    public String BasimYapildi = "";
    public double IskontoTutari;
    public double GenelToplam;
    public double KdvTutari;
    public String Senaryo = "";
    public String ZarfID = "";
    public String UUID = "";
    public String FaturaTipi = "";
    public String KayitYapanKul = "";
    public String DizaynYolu = "";
    public String GondermeDurumu = "";
    public String GelenEFatKontrolEdildi = "";
    public String GelenEFatKontrolAciklama = "";
    public String ZarfSilinebilir_EH = "";


    //E-Arşiv

    private String GonderimSekliEPosta_EH = "";
    public String EPosta = "";

    public static class IslenenDekontModel {

        @SerializedName("FDekSeri")
        public String Seri = "";

        @SerializedName("FDekNo")
        public int No;

        public String getDekontNo() {
            return Seri + "-" + No;
        }

    }

}









package tr.com.bracket.picker40.models;

import com.google.gson.annotations.SerializedName;

import java.util.Date;

import tr.com.bracket.picker40.api.GsonManager;
import tr.com.bracket.picker40.bll.EBelgeManager;
import tr.com.bracket.picker40.bll.FaturaManager;
import tr.com.bracket.picker40.bll.PrefManager;

public class EFaturaResponseModel implements Cloneable {

    @SerializedName("EBELGE_TURU")
    public String EBelgeTuru = "";

    @SerializedName("INCKEYNO")
    public int ID;

    @SerializedName("EFATMAS_INCKEYNO")
    public int EFatMasID;

    @SerializedName("EIRSMAS_INCKEYNO")
    public int EIrsMasID;

    @SerializedName("GELEN")
    public String Gelen = "";

    @SerializedName("TASLAK")
    public String Taslak = "";

    @SerializedName("GONDERILDI")
    public String Gonderildi = "";

    @SerializedName("FATURA_ISLENDI")
    public String FaturaIslendi = "";

    @SerializedName("DEKONT_ISLENDI")
    public String DekontIslendi = "";

    @SerializedName("IPTAL_EDILDI")
    public String IptalEdildi = "";

    @SerializedName("DEKONT_JSON")
    public String DekontJson = "";

    @SerializedName("CEVAP_KODU")
    public int CevapKodu;

    @SerializedName("CEVAP_ACIKLAMA")
    public String CevapAciklama = "";

    @SerializedName("BASARIYLA_GONDERILDI")
    public String BASARIYLA_GONDERILDI = "";

    @SerializedName("ONAY_DURUM_KODU")
    public String OnayDurumKodu = "";

    @SerializedName("ONAY_ACIKLAMA")
    public String OnayAciklama = "";

    @SerializedName("BELGE_NO")
    public String BelgeNo = "";

    @SerializedName("RESMI_BELGE_NO")
    public String ResmiBelgeNo = "";

    @SerializedName("TARIH")
    public Date Tarih;

    @SerializedName("KAYITTARIHI")
    public Date KayitTarihi;

    @SerializedName("IPTAL_TARIHI")
    public Date EFaturaIptalTarihi;

    @SerializedName("BELGE_TURU")
    public String BelgeTuru = "";

    @SerializedName("KAYITLI_CARI_KODU")
    public String KayitliCariKodu = "";

    @SerializedName("CARI_KODU")
    public String CariKodu = "";

    @SerializedName("CARI_ADI")
    public String CariAdi = "";

    @SerializedName("VERGI_NO")
    public String VERGI_NO = "";

    @SerializedName("CARI_ILCE")
    public String Ilce = "";

    @SerializedName("CARI_IL")
    public String Sehir = "";

    @SerializedName("DOVIZ_TIPI")
    public int DovizTipi;

    @SerializedName("DOVIZ_ADI")
    public String DovizAdi = "";

    @SerializedName("DOVIZ_TUTARI")
    public double DovizTutari;

    @SerializedName("DOVIZ_KURU")
    public double DovizKuru;

    @SerializedName("BASIM_YAPILDI")
    public String BasimYapildi = "";

    @SerializedName("ISKONTO_TUTARI")
    public double IskontoTutari;

    @SerializedName("GENEL_TOPLAM")
    public double GenelToplam;

    @SerializedName("KDV_TUTARI")
    public double KdvTutari;

    @SerializedName("SENARYO")
    public String Senaryo = "";

    @SerializedName("ZARFID")
    public String ZarfID = "";

    @SerializedName("UUID")
    public String UUID = "";

    @SerializedName("FATURA_TIPI")
    public String FaturaTipi = "";

    @SerializedName("KAYITYAPANKUL")
    public String KayitYapanKul = "";

    @SerializedName("DIZAYN_YOLU")
    public String DizaynYolu = "";

    @SerializedName("GONDERME_DURUMU")
    public String GondermeDurumu = "";

    @SerializedName("KONTROL_EDILDI")
    public String GelenEFatKontrolEdildi = "";

    @SerializedName("KONTROL_ACIKLAMA")
    public String GelenEFatKontrolAciklama = "";

    @SerializedName("ZARF_SILINEBILIR") // apk 176
    public String ZarfSilinebilir_EH = "";


    //E-Arşiv


    @SerializedName("GONDERIM_SEKLI_EPOSTA")
    private String GonderimSekliEPosta_EH = "";

    @SerializedName("EPOSTA")
    public String EPosta = "";

    public boolean gonderimSekliEPostaMi() {
        return GonderimSekliEPosta_EH.equals("E");
    }


    public boolean dovizliMi() {
        return DovizTipi > 0;
    }

    public String getDovizAdi() {
        return dovizliMi() ? DovizAdi : PrefManager.getInstance().getParamsModel().ParaBirimi;
    }

    public boolean retEdildi() {
        return OnayDurumKodu.equals(EBelgeManager.ONAY_DURUMU_RET);
    }

    public boolean onayBekliyor() {
        return (eFaturaMi() || eIrsaliyeMi()) && gelenMi() && OnayDurumKodu.equals(EBelgeManager.ONAY_DURUMU_YANIT_BEKLIYOR);
    }

    public boolean kabulEdildi() {
        if (eFaturaMi()) {
            if (ticariMi() == false)
                return true;
            return OnayDurumKodu.equals(EBelgeManager.ONAY_DURUMU_KABUL) || OnayDurumKodu.equals(EBelgeManager.ONAY_DURUMU_SARTLI_KABUL);
        } else if (eIrsaliyeMi()) {
            return OnayDurumKodu.equals(EBelgeManager.ONAY_DURUMU_KABUL)
                    || OnayDurumKodu.equals(EBelgeManager.ONAY_DURUMU_SARTLI_KABUL)
                    || OnayDurumKodu.equals(EBelgeManager.ONAY_DURUMU_PARCALI_KABUL);
        }
        return false;
    }

    public boolean gelenMi() {
        return Gelen.equalsIgnoreCase("E");
    }

    public boolean taslakMi() {
        return gelenMi() == false && Taslak.equals("E");
    }

    public String getSenaryoAdi() {
        return EBelgeManager.getSenaryoAdi(Senaryo);
    }

    public String getOnayAciklama() {
        String result = OnayAciklama;
        if (taslakMi())
            return "";
        return result;
    }

    public boolean eFaturaMi() {
        return EBelgeTuru.equals(EBelgeManager.EBELGE_TURU_FATURA);
    }

    public boolean eIrsaliyeMi() {
        return EBelgeTuru.equals(EBelgeManager.EBELGE_TURU_IRSALIYE);
    }

    public boolean eArsivMi() {
        return EBelgeTuru.equals(EBelgeManager.EBELGE_TURU_ARSIV);
    }

    public boolean basariylaGonderildi() {
        return BASARIYLA_GONDERILDI.equals("E");
    }

    public boolean gonderilemedi() {
        if (basariylaGonderildi())
            return false;
        return CevapKodu != 0;
    }

    public boolean gonderiliyor() {
        if (gelenMi() || basariylaGonderildi() || gonderilemedi() || taslakMi())
            return false;
        return true;
    }


    public boolean basimYapildi() {
        return BasimYapildi.equals("E");
    }

    public String getCevapAciklama() {
        if (taslakMi())
            return "Taslak";
        String result = CevapAciklama;
        if (result.isEmpty())
            result = "" + CevapKodu;
        return result;
    }

    public String getGelenBelgeNetsiseIslendiAciklama() {
        if (gelenMi() == false)
            return "";
        if (eArsivMi() && FaturaIslendi.equalsIgnoreCase("E") && BelgeNo.isEmpty() == false) {
            return BelgeNo + " belge Netsis'e aktarıldı.";
        } else if (eFaturaMi()) {
            if (FaturaIslendi.equalsIgnoreCase("E"))
                return BelgeNo + " belge Netsis'e aktarıldı.";
            else if (gelenFatDekontOlarakIslendi()) {
                return getIslenenDekontModel().getDekontNo() + " dekont kaydedildi.";
            } else {
                return "";
            }
        } else if (eIrsaliyeMi() && BelgeNo.isEmpty() == false) {
            return BelgeNo + " belge Netsis'e aktarıldı.";
        }
        return "";
    }

    public boolean gelenFatAlisFatOlarakIslendiMi() {
        return gelenMi() && eFaturaMi() && FaturaIslendi.equalsIgnoreCase("E");
    }


    public boolean gelenIrsIslendiMi() {
        return gelenMi() && eIrsaliyeMi() && BelgeNo.isEmpty() == false;
    }


    public boolean ticariMi() {
        return eFaturaMi() && Senaryo.equals(FaturaManager.EFATURA_TIPI_TICARI);
    }

    public boolean gelenFatDekontOlarakIslendi() {
        return gelenMi() && DekontIslendi.equals("E");
    }

    public IslenenDekontModel getIslenenDekontModel() {
        IslenenDekontModel model = GsonManager.fromJson(DekontJson, IslenenDekontModel.class);
        if (model == null)
            model = new IslenenDekontModel();
        return model;
    }

    public boolean gidenFaturaIptalEdildi() {
        return gelenMi() == false && IptalEdildi.equals("E");
    }

    public boolean eArsivIptalFaturasi() {
        if (taslakMi())
            return false;
        return eArsivMi() && FaturaTipi.equals("IPTAL");
    }

    public boolean gelenEFatKontrolEdildi() {
        return GelenEFatKontrolEdildi.equalsIgnoreCase("E");
    }

    public int getMasID() {
        if (eIrsaliyeMi())
            return EIrsMasID;
        else if (eFaturaMi())
            return EFatMasID;
        else
            return 0;
    }

    public void irsFatuEslemeIptali() {
        if (gelenMi() == false) return;
        FaturaIslendi = "";
        BelgeNo = "";
    }

    public void irsFatuEslestir(String belgeNo) {
        if (gelenMi() == false) return;
        this.FaturaIslendi = "E";
        this.BelgeNo = belgeNo;
    }

    public static class IslenenDekontModel {


        @SerializedName("FDekSeri")
        public String Seri = "";

        @SerializedName("FDekNo")
        public int No;

        public String getDekontNo() {
            return Seri + "-" + No;
        }

    }

    public boolean iadeFaturasiMi() {
        return FaturaTipi.equalsIgnoreCase("IADE");
    }

    public void yanitla(String enumOnayDurum) {
        OnayAciklama = EBelgeManager.getOnayDurumAciklama(enumOnayDurum);
        OnayDurumKodu = enumOnayDurum;
    }

}