private void showItemBsd(final FaturaResponseModel faturaModel) {
		boolean isTempBelge = faturaModel.isTempBelge();
		_bsdItem.clearItems();
		_bsdItem.setTitle(faturaModel.FisNo);
		//remote temp belge
		if (isTempBelge) {
			boolean duzeltebilir = false;
			boolean silebilir = false;
			if (isOffline()) {
				duzeltebilir = faturaModel.isTempLocalMerkezeGonderildi() == false && (faturaModel.isTempLocalYarim() || faturaModel.isTempLocalTamBelge());
				silebilir = duzeltebilir;
			} else {
				duzeltebilir = faturaModel.isTempRemoteBelge() || faturaModel.isTempLocalYarim();
				silebilir = duzeltebilir;
				if (_profilModel.sirket_KontrolluAktar_Duzeltilemesin) {
					duzeltebilir = false;
					silebilir = false;
				}
			}
			//Görüntüle
			_bsdItem.addItem(R.drawable.ic_eye_white, _langModel.genelGoruntule, (model, position) -> showDetails(faturaModel, true));
			//Düzelt
			_bsdItem.addItem(R.drawable.ic_edit_gray, R.string.duzelt, (model, position) -> showDetails(faturaModel, false)).enable = duzeltebilir;
			//Sil
			_bsdItem.addItem(R.drawable.ic_delete_gray,
			                 _langModel.genelSil,
			                 (model, position) -> _dialogHelper.showAskDialog(faturaModel.FisNo, _langModel.genelIslemiOnayliyorMusunuz, (dialog, which) -> {
				                 if (faturaModel.isTempLocalYarim() || faturaModel.isTempLocalTamBelge() || faturaModel.isTempLocalMerkezeGonderildi()) {
					                 BelgeDB.getInstance().deleteBelge(faturaModel.getIslemGuid());
					                 _fastRVAdapter.removeItemAll(faturaModel);
				                 } else if (faturaModel.isTempRemoteBelge()) {
					                 FaturaResponseModel requestModel = new FaturaResponseModel();
					                 requestModel.setPickerBelgeTuru(_initPickerBelgeTuru);
					                 requestModel.setNetsisBelgeTipi(faturaModel.getBelgeTipi());
					                 requestModel.setFisNo(faturaModel.getBelgeNo());
					                 requestModel.setMevcutBelgeNo(faturaModel.getBelgeNo());
					                 requestModel.setCariKodu(faturaModel.CariKodu);
					                 requestModel.setMevcutCariKodu(faturaModel.CariKodu);
					                 requestModel.setIslemGuid(faturaModel.getIslemGuid());
					                 requestModel.setRemoteTempBelgeMi(faturaModel.RemoteTempBelgeMi);
					                 requestModel.TempBelgeID = faturaModel.TempBelgeID;
					                 _faturaManager.deleteFatura(requestModel,
					                                             result -> {
						                                             _fastRVAdapter.removeItemAll(faturaModel);
						                                             ToastUtils.showSuccessToastLong(faturaModel.FisNo + " silindi.");
					                                             });
				                 } else {
					                 _dialogHelper.showErrorDialog("Temp belge tipi(" + faturaModel.TempKayitTipi + ") geçersiz.");
				                 }
			                 })).enable = silebilir;
		} else {
			//Görüntüle
			_bsdItem.addItem(R.drawable.ic_eye_white, _langModel.genelGoruntule, (model, position) -> showDetails(faturaModel, true));
			//
			boolean sadeceGoruntulenir = (_siparisMi && faturaModel.kapaliMi())
					|| faturaModel.eFaturaMi()
					|| faturaModel.eArsivMi()
					|| faturaModel.eIrsaliyeMi()
					|| (_talepTeklifMi && faturaModel.kapaliMi())
					|| (faturaModel.buSubedenGidenDAT() && faturaModel.onaylandiMi()) //apk 170 .onaylandiMi() olarak düzeltildi
					|| faturaModel.buSubeyeGelenDAT()
					|| (faturaModel.datMi() && faturaModel.onaylandiMi())
					|| _profilModel.isKontrolluAktiralacakBelge(_initPickerBelgeTuru);

			//Düzelt
			if ((sadeceGoruntulenir == false) && (_duzeltmeYetkisiVar || faturaModel.RemoteTempBelgeMi)) {
				_bsdItem.addItem(R.drawable.ic_edit_gray, R.string.duzelt, (model, position) -> showDetails(faturaModel, false));
			}
			//Sil
			boolean silinebilir = (_satisMi && faturaModel.eFaturaRetMiEdildi());
			if ((sadeceGoruntulenir == false || silinebilir) && (_silmeYetkisi || faturaModel.RemoteTempBelgeMi)) {
				_bsdItem.addItem(R.drawable.ic_delete_gray,
				                 _langModel.genelSil,
				                 (model, position) -> _dialogHelper.showAskDialog(faturaModel.FisNo, getResources().getString(R.string.kayit_silinsin_mi), (dialog, which) -> {
					                 FaturaResponseModel requestModel = new FaturaResponseModel();
					                 requestModel.setPickerBelgeTuru(_initPickerBelgeTuru);
					                 requestModel.setNetsisBelgeTipi(faturaModel.getBelgeTipi());
					                 requestModel.setFisNo(faturaModel.FisNo);
					                 requestModel.setMevcutBelgeNo(faturaModel.FisNo);
					                 requestModel.setCariKodu(faturaModel.CariKodu);
					                 requestModel.setMevcutCariKodu(faturaModel.CariKodu);
					                 requestModel.setIslemGuid(faturaModel.getIslemGuid()); //apk 163
					                 _faturaManager.deleteFatura(requestModel,
					                                             result -> {
						                                             _fastRVAdapter.removeItemAll(faturaModel);
						                                             ToastUtils.showSuccessToastLong(faturaModel.FisNo + " silindi.");
					                                             });
				                 }));
			}

			if (_profilModel.aciklamaDuzenleyebilir() && (_paramModel.aciklamaAktifMi() || _paramModel.ekAciklamalarAktifMi())) {
				_bsdItem.addItem(R.drawable.ic_aciklama_duzenle, "Açıklama Düzenle", (model, position) -> {
					DFrgFaturaAciklamaDuzenle frg = new DFrgFaturaAciklamaDuzenle();
					frg._initModel = faturaModel;
					frg.setOnDialogResultListener(result -> {
						if (result != DIALOG_RESULT_SAVE) return;
						_fastRVAdapter.notifyDataSetChanged();
						ToastUtils.showSuccessToast("Açıklamalar başarıyla kaydedildi.");
					});
					frg.showDF(getActivity());
				});
			}

			//Yazdır (apk 170)
			if (_printBLLManager.yazdirmaVeyaPDFyetkiliMiFatura(_initPickerBelgeTuru)) {
				_bsdItem.addItem(R.drawable.ic_print_gray, "Yazdır", (model, position) -> _faturaManager.showFaturaYazdir(faturaModel.FisNo, faturaModel.CariKodu, faturaModel.getBelgeTuru()));
			}
		}
		//Sipariş İşlemleri
		if (_siparisMi && isTempBelge == false) {
			_bsdItem.addItem(R.drawable.ic_islemler_gray, _langModel.genelIslemler, (model, position) -> _faturaManager.showSiparisIslemleri(faturaModel, result -> {
				boolean onaylandi = result != null && result.getParamValueInt("ISLEM_KODU") == FaturaResponseModel.ISLEM_KODU_ONAYLA;
				boolean onayGeriAlindi = result != null && result.getParamValueInt("ISLEM_KODU") == FaturaResponseModel.ISLEM_KODU_ONAYI_GERI_AL;
				if (onaylandi || onayGeriAlindi) {
					faturaModel.belgeOnayla(onaylandi);
					_fastRVAdapter.notifyItemChangedRv(faturaModel);
					onBelgeOnaylandi(onaylandi, faturaModel);
				} else {
					refreshData();
				}
			}));
		}
		//Fatura İşlemleri
		if (_faturaMi && isTempBelge == false) {
			_bsdItem.addItem(R.drawable.ic_islemler_gray, _langModel.genelIslemler, (model, position) -> _faturaManager.showFaturaIslemleri(faturaModel, result -> refreshData()));
		}

		//İrsaliye İşlemleri
		if (_irsaliyeMi && isTempBelge == false) {
			_bsdItem.addItem(R.drawable.ic_islemler_gray, _langModel.genelIslemler, (model, position) -> _faturaManager.showIrsaliyeIslemleri(faturaModel, result -> refreshData()));
		}
		//Talep-teklif işlemleri
		if (_talepTeklifMi && isTempBelge == false) {
			_bsdItem.addItem(R.drawable.ic_islemler_gray, "İşlemler", (model, position) -> _faturaManager.showTeklifIslemleriDialog(faturaModel, result -> {
				boolean onaylandi = result != null && result.getParamValueInt("ISLEM_KODU") == FaturaResponseModel.ISLEM_KODU_ONAYLA;
				boolean onayGeriAlindi = result != null && result.getParamValueInt("ISLEM_KODU") == FaturaResponseModel.ISLEM_KODU_ONAYI_GERI_AL;
				if (onaylandi || onayGeriAlindi) {
					faturaModel.belgeOnayla(onaylandi);
					_fastRVAdapter.notifyItemChangedRv(faturaModel);
					onBelgeOnaylandi(onaylandi, faturaModel);
				} else {
					refreshData();
				}
			}));
		}
		//E-Belge işlemleri
		if (isTempBelge == false) {
			boolean eBelgeSerisinden = _paramModel.eFaturaSerisindenMi(faturaModel.FisNo)
					|| _paramModel.eArsivSerisindenMi(faturaModel.FisNo)
					|| _paramModel.eIrsaliyeSerisindenMi(faturaModel.FisNo);
			boolean eBelgeMi = faturaModel.eFaturaMi() || faturaModel.eArsivMi() || faturaModel.eIrsaliyeMi();
			boolean eBelgeEslestirmeIslemleriYapilabilir = faturaModel.ResmiBelgeNo.isEmpty() == false && (BelgeUtils.alisIrsMi(_initPickerBelgeTuru) || BelgeUtils.alisFatMi(_initPickerBelgeTuru));
			boolean eIrsIslemleriYapilabilir = _paramModel.EIrsaliyeAktif && (_irsaliyeMi || _datMi || _ambarMi);
			if (MenuManager.eBelgeLisansiVar() && _paramModel.EFaturaAktif && (eBelgeSerisinden || eBelgeMi || eBelgeEslestirmeIslemleriYapilabilir) && (_faturaMi || eIrsIslemleriYapilabilir)) {
				_bsdItem.addItem(R.drawable.ic_ebelge_accent, "E-Belge İşlemleri", (model, position) -> {
					String cariKodu = faturaModel.CariKodu;
					if (_datMi && CariManager.isCariKoduValid(cariKodu) == false)
						cariKodu = faturaModel.TeslimCariKodu;

					if (CariManager.isCariKoduValid(cariKodu) == false) {
						ToastUtils.showErrorToast("Belgeye cari tanımlanmamış.");
						return;
					}
					_cariManager.getCariMas(_initPickerBelgeTuru, cariKodu, cariResponseModel -> _eBelgeManager.showEBElgeIslemleri(faturaModel, cariResponseModel, result -> refreshData()));
				});
			}
		}
		//dat işlemleri
		if ((_datMi || _ambarMi) && isTempBelge == false) {
			_bsdItem.addItem(R.drawable.ic_islemler_gray, "İşlemler", (model, position) -> _faturaManager.showDATveAmbarIslemleri(faturaModel, result -> {
				boolean onaylandi = result != null && result.getParamValueInt("ISLEM_KODU") == FaturaResponseModel.ISLEM_KODU_ONAYLA;
				boolean onayGeriAlindi = result != null && result.getParamValueInt("ISLEM_KODU") == FaturaResponseModel.ISLEM_KODU_ONAYI_GERI_AL;
				if (onaylandi || onayGeriAlindi) {
					faturaModel.belgeOnayla(onaylandi);
					_fastRVAdapter.notifyItemChangedRv(faturaModel);
					onBelgeOnaylandi(onaylandi, faturaModel);
				} else {
					refreshData();
				}
			}));
		}
		//Kontrol açıklaması(apk 205)
		if (isTempBelge == false && _profilModel.isFaturaKontrolAciklamasiGirebilir(_initPickerBelgeTuru)) {
			_bsdItem.addItem(R.drawable.ic_ok_gray, "Kontrol Edildi", (model, position) -> showKontrolEdildiDialog(faturaModel));
		}
		//Cari İşlemleri
		if (_talepTeklifMi || _siparisMi || _irsaliyeMi || _faturaMi) {
			if (_cariGizle == false) {
				_bsdItem.addItem(R.drawable.ic_menu_cari, "Cari İşlemleri", (model, position) -> _cariManager.showCariIslemleriDialog(_initPickerBelgeTuru, null, faturaModel.CariKodu,
				                                                                                                                      result -> refreshData()));
			}
		}
		//
		_bsdItem.show();
	}