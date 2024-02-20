public void showSiparisIslemleri(final FaturaResponseModel faturaResponseModel, final IResultListener<GenericResponseModel> resultListener) {
		String belgeTuru = faturaResponseModel.getBelgeTuru();
		boolean duzeltmeYetkili = MenuManager.faturaDuzenleYetkisiVarMi(belgeTuru) && faturaResponseModel.kapaliMi() == false;
		_profilModel.setBelgeTipi(belgeTuru);
		_paramModel.setBelgeTuru(belgeTuru);
		final boolean satisMi = BelgeUtils.belgeSatisMi(belgeTuru);
		//Sipariş takibi
		//apk 187
		//apk 219 : sipariş takibi yapılmıyor sorunu düzeltildi.
		final boolean isFatuSiparisTakibiVar = satisMi ? _paramModel.SatistaSiparisKullan : _paramModel.AlistaSiparisKullan;
		final String fatuSipTakibiYapilmiyorMesaj = "Fatura modülünde sipariş takibi yapılmıyor. ERP'den parametreyi açın.";
		//
		final GridDialogHelper gridDialogHelper = new GridDialogHelper(_dialogHelper.getActivity());
		//İrsaliye oluştur
		final String hedefIrsTuru = satisMi ? BLLConstants.PICKER_BELGE_TURU_SATIS_IRSALIYESI : BLLConstants.PICKER_BELGE_TURU_ALIS_IRSALIYESI;
		boolean isSiptenIrsYapamaz = _profilModel.getSipBagModel(hedefIrsTuru).SipOkutulsun || _profilModel.getSipBagModel(hedefIrsTuru).SipBaglantisiz;
		if (isSiptenIrsYapamaz == false && faturaResponseModel.siparisIrsaliyeDonerMi()) {
			gridDialogHelper.addItem("İrsaliye Oluştur", MenuManager.islemeYetkiliMi(satisMi ? YetkiKodu.SATIS_IRSALIYESI_EKLE : YetkiKodu.ALIS_IRSALIYESI_EKLE), R.drawable.ic_menu_sevkiyat,
			                         itemModel -> {
				                         if (isFatuSiparisTakibiVar == false) {
					                         _dialogHelper.showErrorDialog(fatuSipTakibiYapilmiyorMesaj);
					                         return;
				                         }
				                         showSiparisKalemleriIrsFatuDonustur(faturaResponseModel, hedefIrsTuru, resultListener);
			                         });
		}
		//Fatura oluştur (siparişten)
		final String hedefFatuTuru = satisMi ? BLLConstants.PICKER_BELGE_TURU_SATIS_FATURASI : BLLConstants.PICKER_BELGE_TURU_ALIS_FATURASI;
		boolean isSiptenFatuYapamaz = _profilModel.getSipBagModel(hedefFatuTuru).SipOkutulsun || _profilModel.getSipBagModel(hedefFatuTuru).SipBaglantisiz;
		if (isSiptenFatuYapamaz == false && faturaResponseModel.siparisFaturayaDonerMi()) {
			gridDialogHelper.addItem("Fatura Oluştur\n(Siparişten)", MenuManager.islemeYetkiliMi(satisMi ? YetkiKodu.SATIS_FATURASI_EKLE : YetkiKodu.ALIS_FATURASI_EKLE), R.drawable.ic_menu_sevkiyat,
			                         itemModel -> {
				                         if (isFatuSiparisTakibiVar == false) {
					                         _dialogHelper.showErrorDialog(fatuSipTakibiYapilmiyorMesaj);
					                         return;
				                         }
				                         //
				                         showSiparisKalemleriIrsFatuDonustur(faturaResponseModel, hedefFatuTuru, resultListener);
			                         });
		}
		//Fatura oluştur (İrsaliyeden)
		if (_profilModel.getSipBagModel(hedefFatuTuru).SipOkutulsun == false && faturaResponseModel.teklifSipIrsaliyelestiMi() && faturaResponseModel.siparisFaturayaDonerMi()) {
			final String irsaliyeTuru = satisMi ? BLLConstants.PICKER_BELGE_TURU_SATIS_IRSALIYESI : BLLConstants.PICKER_BELGE_TURU_ALIS_IRSALIYESI;
			gridDialogHelper.addItem("Fatura Oluştur\n(İrs.'den)", MenuManager.islemeYetkiliMi(satisMi ? YetkiKodu.SATIS_FATURASI_EKLE : YetkiKodu.ALIS_FATURASI_EKLE), R.drawable.ic_menu_sevkiyat,
			                         itemModel -> showBelgeBaglantilariDialog(belgeTuru, faturaResponseModel.FisNo, faturaResponseModel.CariKodu, irsaliyeTuru,
			                                                                  baglantiResponseModel -> showIrsaliyeFaturalastir(baglantiResponseModel.BelgeTuru,
			                                                                                                                    baglantiResponseModel.BelgeNo,
			                                                                                                                    baglantiResponseModel.CariKodu,
			                                                                                                                    resultListener)));
		}
		//Belge bağlantıları
		if (faturaResponseModel.teklifSipIrsaliyelestiMi() || faturaResponseModel.teklifSipIrsFaturalastiMi()) {
			gridDialogHelper.addItem("Belge Bağlantıları", true, R.drawable.ic_belge_baglanti_gray,
			                         itemModel -> showBelgeBaglantilariDialog(belgeTuru, faturaResponseModel.FisNo, faturaResponseModel.CariKodu, "",
			                                                                  belgeBaglantiResponseModel -> showBelgeDetayReadOnly(belgeBaglantiResponseModel.BelgeTuru,
			                                                                                                                       belgeBaglantiResponseModel.BelgeNo,
			                                                                                                                       belgeBaglantiResponseModel.CariKodu)));
		}
		//Belge durumunu değiştir
		if (faturaResponseModel.onaydaMi() == false) {
			boolean kapaliYapabilir = faturaResponseModel.kapaliMi() == false && MenuManager.islemeYetkiliMi(satisMi ? YetkiKodu.MUSTERI_SIPARISI_KAPATMA_ISLEMI : YetkiKodu.SATICI_SIPARISI_KAPATMA_ISLEM);
			boolean acikYapabilir = faturaResponseModel.kapaliMi() && _userModel.isAdmin();
			gridDialogHelper.addItem(faturaResponseModel.kapaliMi() ? "Belgeyi Aç" : "Belgeyi Kapat",
			                         faturaResponseModel.kapaliMi() ? acikYapabilir : kapaliYapabilir,
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
				                         faturaRequestModel.setPickerBelgeTuru(faturaResponseModel.getBelgeTuru());
				                         faturaRequestModel.setFisNo(faturaResponseModel.getBelgeNo());
				                         faturaRequestModel.setCariKodu(faturaResponseModel.CariKodu);
				                         faturaRequestModel.setIslemKodu(islemKodu); //apk 146
				                         faturaRequestModel.setNetsisBelgeTipi(yeniBelgeTipi);
				                         belgeDurumuDegistir(faturaRequestModel, resultListener);
			                         }));
		}
		//Satıcı sip. oluştur
		if (_profilModel.getSipBagModel(BLLConstants.PICKER_BELGE_TURU_MUSTERI_SIPARISI).SipOkutulsun == false && faturaResponseModel.onaydaMi() == false && satisMi && _paramModel.SatisMusteriSiptenSaticiSipAktif) {
			gridDialogHelper.addItem("Satıcı Sip. Oluştur", MenuManager.islemeYetkiliMi(YetkiKodu.SATICI_SIPARISI_EKLE), R.drawable.ic_menu_siparis, itemModel -> {
				final DFrgBelgeKalemRehberi dfrgKalemRehberi = new DFrgBelgeKalemRehberi();
				dfrgKalemRehberi._initPickerBelgeTuru = BLLConstants.PICKER_BELGE_TURU_MUSTERI_SIPARISI;
				//
				FaturaFilterRequestModel faturaFilterRequestModel = new FaturaFilterRequestModel();
				faturaFilterRequestModel.KapaliBelgelerListelenmesin = true;
				faturaFilterRequestModel.BelgeNo = faturaResponseModel.FisNo;
				faturaFilterRequestModel.CariKodu = faturaResponseModel.CariKodu;
				faturaFilterRequestModel.MusSiptenSaticiSipKalanlar = true;
				faturaFilterRequestModel.KisitYok = true;
				//
				dfrgKalemRehberi._initFilterModel = faturaFilterRequestModel;
				dfrgKalemRehberi.setOnSelectedDialogResultListener(dialogResultCode -> {
					final DFrgFaturaDetay dFrgFaturaDetay = new DFrgFaturaDetay();
					dFrgFaturaDetay._initPickerBelgeTuru = BLLConstants.PICKER_BELGE_TURU_SATICI_SIPARISI;
					dFrgFaturaDetay._initIslemKodu = FaturaResponseModel.ISLEM_KODU_MUS_SIPTEN_SATICI_SIP;
					dFrgFaturaDetay._initKalemList = dfrgKalemRehberi._responseList;
					for (FaturaKalemResponseModel m : dFrgFaturaDetay._initKalemList) {
						m.ID = 0;
						m.fiyatlariTemizle();
					}
					dFrgFaturaDetay.setOnSaveDialogResultListener(dialogResultCode1 -> {
						if (resultListener != null) {
							resultListener.onResult(dFrgFaturaDetay._responseGeneric);
						}
					});
					dFrgFaturaDetay.showDF(_dialogHelper.getActivity());
				});
				dfrgKalemRehberi.showDF(_dialogHelper.getActivity());
			});
		}
		//Pdf görüntüle
		gridDialogHelper.addItem("PDF Görüntüle", _profilModel.kullanici_AdminMi || (satisMi ? _profilModel.yazdirma_MusSip : _profilModel.yazdirma_SaticiSip), R.drawable.ic_pdf_gray,
		                         itemModel -> pdfGoruntule(faturaResponseModel.FisNo, belgeTuru, faturaResponseModel.CariKodu, faturaResponseModel.TempBelgeID));
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
		//apk 163 : Belge kopyala
		gridDialogHelper.addItem("Belgeyi Kopyala", belgeKopyalayabilir(belgeTuru), R.drawable.ic_copy_gray, itemModel -> belgeyiKopyala("", faturaResponseModel, resultListener));
		//Raporlar
		gridDialogHelper.addItem("Raporlar", true, R.drawable.ic_report_white, itemModel -> showStandartRaporlarDialog(faturaResponseModel));
		//
		gridDialogHelper.setTitle(faturaResponseModel.FisNo);
		gridDialogHelper.show();
	}