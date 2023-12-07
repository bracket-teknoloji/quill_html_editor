public void showTeklifIslemleriDialog(final FaturaResponseModel faturaResponseModel, final IResultListener<GenericResponseModel> resultListener) {
		String belgeTuru = faturaResponseModel.getBelgeTuru();
		boolean duzeltmeYetkili = MenuManager.faturaDuzenleYetkisiVarMi(belgeTuru) && faturaResponseModel.kapaliMi() == false;
		_paramModel.setBelgeTuru(belgeTuru);
		_profilModel.setBelgeTipi(belgeTuru);
		final GridDialogHelper gridDialogHelper = new GridDialogHelper(_dialogHelper.getActivity());
		if (faturaResponseModel.atalMi() || faturaResponseModel.stekMi() || BelgeUtils.stalMi(belgeTuru)) {
			gridDialogHelper.addItem("PDF Görüntüle", _printBLLManager.yazdirmaVeyaPDFyetkiliMi(_printBLLManager.getRaporKoduFromFatura(belgeTuru)), R.drawable.ic_pdf_gray,
			                         itemModel -> pdfGoruntule(faturaResponseModel.FisNo, belgeTuru, faturaResponseModel.CariKodu, faturaResponseModel.TempBelgeID));
		}
		//revize et
		if (faturaResponseModel.stekMi() && faturaResponseModel.teklifRevizeEdilebilirMi()) {
			gridDialogHelper.addItem("Revize Et", MenuManager.islemeYetkiliMi(YetkiKodu.STEK_EKLE) && faturaResponseModel.kapaliMi() == false, R.drawable.ic_revizyon_gray, itemModel -> {
				final DFrgFaturaDetay frg = new DFrgFaturaDetay();
				frg._initPickerBelgeTuru = belgeTuru;
				frg._initBelgeNo = faturaResponseModel.FisNo;
				frg._initCariKodu = faturaResponseModel.CariKodu;
				frg._initIslemKodu = FaturaResponseModel.ISLEM_KODU_TEKLIF_REVIZE;
				if (faturaResponseModel.FisNo.isEmpty() == false) {
					frg._initReadOnlyMod = MenuManager.faturaDuzenleYetkisiVarMi(belgeTuru) == false;
				}
				frg.setOnSaveDialogResultListener(dialogResultCode -> {
					if (resultListener != null) {
						resultListener.onResult(frg._responseGeneric);
					}
				});
				frg.showDF(_dialogHelper.getActivity());

			});
		}
		if (BelgeUtils.stalMi(belgeTuru) && faturaResponseModel.teklifSipariseDonerMi()) {
			gridDialogHelper.addItem("Satış Teklif Oluştur", MenuManager.islemeYetkiliMi(YetkiKodu.STEK_EKLE), R.drawable.ic_menu_teklif,
			                         itemModel -> showTeklifKalemleri(faturaResponseModel, resultListener, "TEKLIF"));
		}
		if ((faturaResponseModel.stekMi() || BelgeUtils.stalMi(belgeTuru)) && faturaResponseModel.teklifSipariseDonerMi()) {
			gridDialogHelper.addItem("Müşteri Siparişi Oluştur", MenuManager.islemeYetkiliMi(YetkiKodu.MUSTERI_SIPARISI_EKLE), R.drawable.ic_menu_siparis,
			                         itemModel -> showTeklifKalemleri(faturaResponseModel, resultListener, "SIPARIS"));
		}
		if (faturaResponseModel.stekMi() && faturaResponseModel.teklifIrsaliyeDonerMi()) {
			gridDialogHelper.addItem("Satış İrsaliyesi Oluştur", MenuManager.islemeYetkiliMi(YetkiKodu.SATIS_IRSALIYESI_EKLE), R.drawable.ic_menu_sevkiyat,
			                         itemModel -> showTeklifFatuIrsDonustur(BLLConstants.PICKER_BELGE_TURU_MUSTERI_SIPARISI,
			                                                                BLLConstants.PICKER_BELGE_TURU_SATIS_IRSALIYESI,
			                                                                faturaResponseModel,
			                                                                resultListener));
		}
		if (faturaResponseModel.stekMi() && faturaResponseModel.teklifFaturayaDonerMi() && faturaResponseModel.teklifSipIrsaliyelestiMi() == false) {
			gridDialogHelper.addItem("Fatura Oluştur\n(Siparişten)", MenuManager.islemeYetkiliMi(YetkiKodu.SATIS_IRSALIYESI_EKLE), R.drawable.ic_menu_sevkiyat,
			                         itemModel -> showTeklifFatuIrsDonustur(BLLConstants.PICKER_BELGE_TURU_MUSTERI_SIPARISI,
			                                                                BLLConstants.PICKER_BELGE_TURU_SATIS_FATURASI,
			                                                                faturaResponseModel,
			                                                                resultListener));
		}
		if (faturaResponseModel.stekMi() && faturaResponseModel.teklifFaturayaDonerMi() && faturaResponseModel.teklifSipIrsaliyelestiMi()) {
			gridDialogHelper.addItem("Fatura Oluştur\n(İrs.'den)", MenuManager.islemeYetkiliMi(YetkiKodu.SATIS_IRSALIYESI_EKLE), R.drawable.ic_menu_sevkiyat,
			                         itemModel -> showTeklifFatuIrsDonustur(BLLConstants.PICKER_BELGE_TURU_SATIS_IRSALIYESI,
			                                                                BLLConstants.PICKER_BELGE_TURU_SATIS_FATURASI,
			                                                                faturaResponseModel,
			                                                                resultListener));
		}

		//Satıcı Sip Oluştur(Talepten)
		if (faturaResponseModel.atalMi() && faturaResponseModel.teklifSipariseDonerMi()) {
			gridDialogHelper.addItem("Satıcı Siparişi Oluştur", MenuManager.islemeYetkiliMi(YetkiKodu.SATICI_SIPARISI_EKLE), R.drawable.ic_menu_siparis,
			                         itemModel -> showTeklifKalemleri(faturaResponseModel, resultListener, "SIPARIS"));
		}
		//Satıcı sip oluştur (Tekliften - bağlantısız)
		if (faturaResponseModel.stekMi() && faturaResponseModel.teklifSipariseDonerMi()) {
			gridDialogHelper.addItem("Satıcı Siparişi Oluştur", MenuManager.faturaEklemeYetkisiVarMi(BLLConstants.PICKER_BELGE_TURU_SATICI_SIPARISI), R.drawable.ic_menu_siparis,
			                         itemModel -> belgeyiKopyalaFiyatsiz(BLLConstants.PICKER_BELGE_TURU_SATICI_SIPARISI, faturaResponseModel, resultListener));
		}
		//Belge Bağlantıları
		if (faturaResponseModel.teklifSiparislestiMi() || faturaResponseModel.teklifSipIrsaliyelestiMi() || faturaResponseModel.teklifSipIrsFaturalastiMi()) {
			gridDialogHelper.addItem("Belge Bağlantıları", true, R.drawable.ic_belge_baglanti_gray,
			                         itemModel -> showBelgeBaglantilariDialog(faturaResponseModel.getBelgeTuru(), faturaResponseModel.FisNo, faturaResponseModel.CariKodu, "",
			                                                                  belgeBaglantiResponseModel -> showBelgeDetayReadOnly(belgeBaglantiResponseModel.BelgeTuru,
			                                                                                                                       belgeBaglantiResponseModel.BelgeNo,
			                                                                                                                       belgeBaglantiResponseModel.CariKodu)));
		}
		if (faturaResponseModel.onaydaMi() == false) {
			gridDialogHelper.addItem(faturaResponseModel.kapaliMi() ? "Belgeyi Aç" : "Belgeyi Kapat",
			                         MenuManager.faturaDuzenleYetkisiVarMi(belgeTuru),
			                         faturaResponseModel.kapaliMi() ? R.drawable.ic_unlock_gray : R.drawable.ic_lock_gray,
			                         itemModel -> _dialogHelper.showAskDialog(faturaResponseModel.FisNo, _langModel.genelIslemiOnayliyorMusunuz, (dialog, which) -> {
				                         int yeniBelgeTipi = 0;
				                         int islemKodu = 0;
				                         if (faturaResponseModel.kapaliMi()) {
					                         islemKodu = FaturaResponseModel.ISLEM_KODU_AC;
					                         if (faturaResponseModel.ExportTipi > 0)
						                         yeniBelgeTipi = BELGE_TIPI_ITHALAT;
					                         else
						                         yeniBelgeTipi = BELGE_TIPI_ACIK;
				                         } else {
					                         islemKodu = FaturaResponseModel.ISLEM_KODU_KAPAT;
					                         yeniBelgeTipi = BELGE_TIPI_KAPALI;
				                         }
				                         FaturaResponseModel faturaRequestModel = new FaturaResponseModel();
				                         faturaRequestModel.setPickerBelgeTuru(belgeTuru);
				                         faturaRequestModel.setNetsisBelgeTipi(yeniBelgeTipi);
				                         faturaRequestModel.FisNo = faturaResponseModel.FisNo;
				                         faturaRequestModel.setPickerBelgeTuru(belgeTuru);
				                         faturaRequestModel.CariKodu = faturaResponseModel.CariKodu;
				                         faturaRequestModel.setIslemKodu(islemKodu); //apk 146
				                         belgeDurumuDegistir(faturaRequestModel, resultListener);
			                         }));
		}
		//Belge kopyala
		gridDialogHelper.addItem("Belgeyi Kopyala", belgeKopyalayabilir(belgeTuru), R.drawable.ic_copy_gray, itemModel -> belgeyiKopyala("", faturaResponseModel, resultListener));
		//Cari İşlemleri
		if (faturaResponseModel.muhtelifCariMi() == false) {
			gridDialogHelper.addItem("Cari İşlemleri", MenuManager.menuYetkiliMi(MenuManager.SUB_MENU_CODE_CARILER), R.drawable.ic_menu_cari, itemModel -> {
				CariManager cariManager = new CariManager(_dialogHelper);
				cariManager.showCariIslemleriDialog(belgeTuru, null, faturaResponseModel.CariKodu, resultListener);
			});
		}
		//Cari Kodu değiştir
		gridDialogHelper.addItem("Cari Kodu Değiştir", _profilModel.faturaCariKoduDegistirebilir(), R.drawable.ic_edit_gray, itemModel -> showCariKoduDegistir(faturaResponseModel, resultListener));
		//Belge no değiştir
		gridDialogHelper.addItem("Belge No Değiştir", duzeltmeYetkili, R.drawable.ic_edit_gray, itemModel -> showNumaraDegistir(faturaResponseModel, resultListener));
		//onay işlemleri
		if (_paramModel.isFaturaOnaySistemiAktif(belgeTuru)) {
			if (faturaResponseModel.onaydaMi()) {
				gridDialogHelper.addItem("Onayla", _profilModel.belgeOnaylayabilir(), R.drawable.ic_ok_gray,
				                         itemModel -> onayIslemi(belgeTuru, faturaResponseModel.FisNo, faturaResponseModel.CariKodu, true, resultListener));
			} else if (faturaResponseModel.onaylandiMi()) {
				gridDialogHelper.addItem("Onayı Geri Al", _profilModel.belgeOnaylayabilir(), R.drawable.ic_restore_gray,
				                         itemModel -> onayIslemi(belgeTuru, faturaResponseModel.FisNo, faturaResponseModel.CariKodu, false, resultListener));
			}
		}
		//
		gridDialogHelper.setTitle(faturaResponseModel.FisNo);
		gridDialogHelper.show();
	}