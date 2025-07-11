package tr.com.bracket.picker40.bll;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;

import tr.com.bracket.picker40.internal_utils.NetsisDecimalHelper;
import tr.com.bracket.picker40.internal_utils.StringGenerator;
import tr.com.bracket.picker40.models.FaturaKalemResponseModel;
import tr.com.bracket.picker40.models.FaturaResponseModel;
import tr.com.bracket.picker40.models.ParamResponseModel;
import tr.com.bracket.picker40.models.ProfilResponseModel;
import tr.com.bracket.picker40.utils.DialogHelper;

public class FaturaHesaplayici {

	private List<KalemModel> _listKalem = new ArrayList<>();
	private double _araToplam1 = 0;
	private double _araToplam2 = 0;
	private double _araToplam3 = 0;
	private double _GenelIsk1O = 0;
	private double _GenelIsk2O = 0;
	private double _GenelIsk3O = 0;

	private ResultModel _resultModel = new ResultModel();
	private ProfilResponseModel _profilModel;
	private ParamResponseModel _paramModel;
	private String _belgeTipi = "";
	private String _dipFiyatKDVDurumu = "";
	private LinkedHashMap<Double, Double> _mapKDV = new LinkedHashMap<>(); //apk 192
	private LinkedHashMap<Double, Double> _mapKDVDovizli = new LinkedHashMap<>();
	private boolean _tlFiyatGelsin;

	public boolean _initKDVDahil;
	public double _initIskonto1;
	public double _initIskonto2;
	public double _initIskonto3;
	public boolean _initIskonto1OranMi;
	public boolean _initIskonto2OranMi;
	public boolean _initIskonto3OranMi;
	public double _initDovizKuru;
	public boolean _initDovizliSonucGoster;
	public double _initEkMaliyet2Tutari;
	public double _initEkMaliyet1Tutari;
	public double _initEkMaliyet3Tutari;
	public boolean _initKdvSifirOlsun; //apk 208

	public FaturaHesaplayici(String belgeTipi) {
		_belgeTipi = belgeTipi;
		_profilModel = PrefManager.getInstance().getProfilYetkiResponseModel();
		_profilModel.setBelgeTipi(belgeTipi);
		_paramModel = PrefManager.getInstance().getParamsModel();
		_paramModel.setBelgeTuru(belgeTipi);
		_dipFiyatKDVDurumu = _profilModel.getDipFiyatKDVDurumu();
		_tlFiyatGelsin = _profilModel.isTLFiyatGelsin(belgeTipi);
	}

	public void clear() {
		_araToplam1 = 0;
		_araToplam2 = 0;
		_araToplam3 = 0;
		_listKalem.clear();
	}

	public void hesapla() {
		if (_initDovizliSonucGoster && _initDovizKuru == 0) _initDovizKuru = 1;
		if (_initIskonto1 == 0 && _initIskonto2 == 0 && _initIskonto3 == 0) _hesapla();
		if (_araToplam1 == 0 && _araToplam2 == 0 && _araToplam3 == 0) _hesapla();
		if (_initIskonto1 > 0) _hesapla();
		if (_initIskonto2 > 0) _hesapla();
		if (_initIskonto3 > 0) _hesapla();
	}

	private void _hesapla() {
		_mapKDV.clear();
		_mapKDVDovizli.clear();
		_GenelIsk1O = 0;
		_GenelIsk2O = 0;
		_GenelIsk3O = 0;
		double kalemMiktar = 0;
		double kalemBrutTutar = 0;
		double kalemAraToplam = 0;
		double kalemOtvToplam = 0;
		double kalemSatirIskonto = 0;
		double kalemMalFazIskonto = 0;
		double kalemGenelToplam = 0;
		double kalemKDV = 0;
		double kalemOTV = 0;
		//Dövizli Toplamlar
		double kalemBrutTutarDovizli = 0;
		double kalemAraToplamDovizli = 0;
		double kalemSatirIskontoDovizli = 0;
		double kalemMalFazIskontoDovizli = 0;
		double kalemGenelToplamDovizli = 0;
		double kalemKDVDovizli = 0;
		//
		double kalemGenelIskonto = 0;
		double kalemGenelIskontoDovizli = 0;
		double iskonto1 = _initIskonto1;
		double iskonto2 = _initIskonto2;
		double iskonto3 = _initIskonto3;
		double kalemGenIsk1T = 0;
		double kalemGenIsk2T = 0;
		double kalemGenIsk3T = 0;
		//
		int KDVsizKalemSayisi = 0;
		int dipFiyatAltindaKalemSayisi = 0;
		//
		if (iskonto1 > 0 && _araToplam1 > 0) {
			if (_initIskonto1OranMi) {
				_GenelIsk1O = iskonto1;
			} else {
				_GenelIsk1O = (iskonto1 / _araToplam1) * 100;
			}
		}
		if (iskonto2 > 0 && _araToplam2 > 0) {
			if (_initIskonto2OranMi) {
				_GenelIsk2O = iskonto2;
			} else {
				_GenelIsk2O = (iskonto2 / _araToplam2) * 100;
			}
		}
		if (iskonto3 > 0 && _araToplam3 > 0) {
			if (_initIskonto3OranMi) {
				_GenelIsk3O = iskonto3;
			} else {
				_GenelIsk3O = (iskonto3 / _araToplam3) * 100;
			}
		}

		_araToplam1 = 0;
		_araToplam2 = 0;
		_araToplam3 = 0;
		_resultModel = new ResultModel();

		List<KalemModel> kalemList = new ArrayList<>();
		KalemModel yeniKalem;
		for (KalemModel m : _listKalem) {
			if (m.IadeMiktar > 0) {
				try {
					yeniKalem = (KalemModel) m.clone();
					yeniKalem.IadeMiktar = 0;
					kalemList.add(yeniKalem);

					yeniKalem = (KalemModel) m.clone();
					yeniKalem.Miktar = yeniKalem.IadeMiktar * -1;
					yeniKalem.IadeMiktar = 0;
					kalemList.add(yeniKalem);
				} catch (CloneNotSupportedException e) {
					e.printStackTrace();
				}
			} else {
				kalemList.add(m);
			}
		}

		for (KalemModel m : kalemList) {
			boolean eksiMiktar = m.Miktar < 0;
			if (!eksiMiktar) kalemMiktar += m.Miktar;

			double birimFiyat = m.Fiyat;
			//Dövizli mi
			if (m.dovizliKalem && m.dovizKuru == 0) m.dovizliKalem = false;
			//
			double malFazMiktar = m.MalFazMiktar;
			double miktar = (eksiMiktar ? m.Miktar * -1 : m.Miktar) - malFazMiktar;
			if (miktar < 0) miktar = 0;

			double malFazlasiTutar = malFazMiktar * birimFiyat;
			double brutTutar = (miktar * birimFiyat) + malFazlasiTutar;
			double tutar = miktar * birimFiyat;
			double kdv = 0;
			kalemOTV = 0;
			double genelIsk1 = 0;
			double genelIsk2 = 0;
			double genelIsk3 = 0;
			//Mal Faz. iskonto
			kalemMalFazIskonto += malFazlasiTutar;
			kalemMalFazIskontoDovizli += (m.dovizliKalem ? malFazlasiTutar / m.dovizKuru : 0);

			//Satır iskonto
			if (_paramModel.OzelFaturaKademesizSatirIsk) {
				double toplamOran = (m.Iskonto1OranMi ? m.Iskonto1 : 0) + m.Iskonto2O + m.Iskonto3O + m.Iskonto4O + m.Iskonto5O + m.Iskonto6O;
				if (tutar > 0) tutar -= tutar * (toplamOran / 100);
			} else {
				if (m.Iskonto1 != 0) {
					if (m.Iskonto1OranMi) {
						if (tutar > 0) tutar -= tutar * (m.Iskonto1 / 100);
					} else {
						double indirimTutari = m.Iskonto1 * (miktar + malFazMiktar);
						double indirimOrani = 0;
						if (tutar > 0 && indirimTutari > 0) indirimOrani = (indirimTutari / tutar) * 100;
						m.resultIsk1O = indirimOrani;
						if (tutar > 0) tutar -= indirimTutari;
					}
				}
				if (tutar > 0) tutar -= tutar * (m.Iskonto2O / 100);
				if (tutar > 0) tutar -= tutar * (m.Iskonto3O / 100);
				if (tutar > 0) tutar -= tutar * (m.Iskonto4O / 100);
				if (tutar > 0) tutar -= tutar * (m.Iskonto5O / 100);
				if (tutar > 0) tutar -= tutar * (m.Iskonto6O / 100);
			}

			double satirIskonto = 0;

			if (_initKDVDahil) {
				if (miktar != 0) {
					satirIskonto = (miktar * birimFiyat) - tutar;
				} else {
					satirIskonto = 0;
				}

				kalemSatirIskonto += satirIskonto;
				kalemSatirIskontoDovizli += (m.dovizliKalem && m.dovizKuru > 0 ? satirIskonto / m.dovizKuru : 0);
			} else {
				satirIskonto = brutTutar - tutar;
				kalemSatirIskonto += satirIskonto - malFazlasiTutar;
				kalemSatirIskontoDovizli += (m.dovizliKalem && m.dovizKuru > 0 ? (satirIskonto - malFazlasiTutar) / m.dovizKuru : 0);
			}

			if (eksiMiktar) {
				tutar *= -1;
				brutTutar *= -1;
			} else {
				// ##############################################################################
				// Genel isk 1
				// ##############################################################################
				_araToplam1 += tutar;
				if (_initIskonto1OranMi) {
					genelIsk1 = tutar * (_initIskonto1 / 100);
				} else {
					if (iskonto1 > 0) genelIsk1 = tutar * (_GenelIsk1O / 100);
				}
				kalemGenIsk1T += genelIsk1;
				kalemGenelIskonto += genelIsk1;
				kalemGenelIskontoDovizli += (m.dovizliKalem ? genelIsk1 / m.dovizKuru : 0);
				if (tutar > 0) tutar -= genelIsk1;
				// ##############################################################################
				// Genel isk 2
				// ##############################################################################
				_araToplam2 += tutar;
				if (_initIskonto2OranMi) {
					genelIsk2 = tutar * (_initIskonto2 / 100);
				} else {
					if (iskonto2 > 0) genelIsk2 = tutar * (_GenelIsk2O / 100);
				}
				kalemGenIsk2T += genelIsk2;
				kalemGenelIskonto += genelIsk2;
				kalemGenelIskontoDovizli += (m.dovizliKalem ? genelIsk2 / m.dovizKuru : 0);
				if (tutar > 0) tutar -= genelIsk2;
				// ##############################################################################
				// Genel isk 3
				// ##############################################################################
				_araToplam3 += tutar;
				if (_initIskonto3OranMi) {
					genelIsk3 = tutar * (_initIskonto3 / 100);
				} else {
					if (iskonto3 > 0) genelIsk3 = tutar * (_GenelIsk3O / 100);
				}
				kalemGenIsk3T += genelIsk3;
				kalemGenelIskonto += genelIsk3;
				kalemGenelIskontoDovizli += (m.dovizliKalem ? genelIsk3 / m.dovizKuru : 0);
				if (tutar > 0) tutar -= genelIsk3;
				// ##############################################################################
			}

			// Net Fiyat
			double bolenMiktar = miktar;
			if (bolenMiktar == 0) bolenMiktar = 1;
			m.resultNetFiyat = _initKDVDahil ? (tutar - kdv) / bolenMiktar : tutar / bolenMiktar;

			// ÖTV
			if (m.faturaKalem.otvVarMi) {
				if (m.faturaKalem.otvOranMi) {
					kalemOTV = (m.resultNetFiyat * (m.faturaKalem.otvDegeri / 100)) * miktar;
				} else {
					kalemOTV = m.faturaKalem.otvDegeri * miktar;
				}
			} else {
				kalemOTV = 0;
			}

			double kdvHesaplanacakTutar = tutar;
			if (!_paramModel.NetsisOzelParam_FaturaOzelIletisimVergisi) kdvHesaplanacakTutar += kalemOTV;

			// ################################################################################################################################################################################
			// Kdvyi hesaplayalım...
			if (_initKDVDahil) {
				if (tutar != 0 && !_initKdvSifirOlsun) kdv = kdvHesaplanacakTutar - (kdvHesaplanacakTutar / ((m.KDVOrani / 100) + 1));
			} else {
				if (!_initKdvSifirOlsun) kdv = kdvHesaplanacakTutar * (m.KDVOrani / 100);
			}

			if (kdv <= 0) KDVsizKalemSayisi++;
			//Toplam
			kalemBrutTutar += brutTutar;
			if (_initKDVDahil) {
				kalemAraToplam += tutar - kdv;
			} else {
				kalemAraToplam += tutar;
			}
			kalemKDV += kdv;
			_kalemKdvEkle(m.KDVOrani, kdv, 0);
			if (_initKDVDahil) {
				kalemGenelToplam += tutar;
			} else {
				kalemGenelToplam += tutar + kdv;
			}

			m.resultBrutFiyat = brutTutar / bolenMiktar; //apk 199 : tutar / yerine, brutTutar / kullanıldı.
			m.resultKDVTutari = kdv / bolenMiktar;
			if (_initKDVDahil) {
				m.resultGenelToplam = tutar / bolenMiktar;
			} else {
				m.resultGenelToplam = (tutar + kdv) / bolenMiktar;
			}
			//
			if (m.dovizliKalem && m.dovizKuru != 0) {
				m.resultNetFiyatDovizli = m.resultNetFiyat / m.dovizKuru;
				m.resultBrutFiyatDovizli = m.resultBrutFiyat / m.dovizKuru;
				m.resultKDVTutariDovizli = m.resultKDVTutari / m.dovizKuru;
				m.resultGenelToplamDovizli = m.resultGenelToplam / m.dovizKuru;
			}
			// ###################### Dip fiyat ######################
			double dipFiyatIcinHesaplananFiyat = 0;
			if (_initKDVDahil) {
				if (_dipFiyatKDVDurumu.isEmpty()
						|| _dipFiyatKDVDurumu.equalsIgnoreCase(ProfilResponseModel.DIP_FIYAT_KDV_BELGEYE_GORE)
						|| _dipFiyatKDVDurumu.equalsIgnoreCase(ProfilResponseModel.DIP_FIYAT_KDV_DAHIL)) {
					dipFiyatIcinHesaplananFiyat = m.resultGenelToplam;
				} else {
					dipFiyatIcinHesaplananFiyat = m.resultNetFiyat;
				}
			} else {
				if (_dipFiyatKDVDurumu.equalsIgnoreCase(ProfilResponseModel.DIP_FIYAT_KDV_DAHIL)) {
					dipFiyatIcinHesaplananFiyat = m.resultGenelToplam;
				} else {
					dipFiyatIcinHesaplananFiyat = m.resultNetFiyat;
				}
			}
			double dipFiyat = m.DipFiyat;
			if (m.StokSatisDovizTipi > 0 && _tlFiyatGelsin == false) dipFiyat = m.DipFiyat * m.StokSatisDovizKuru;
			m.resultDipFiyatIcinHesaplananFiyat = dipFiyatIcinHesaplananFiyat;
			if (dipFiyat > 0 && dipFiyatIcinHesaplananFiyat < dipFiyat) dipFiyatAltindaKalemSayisi++;

			// ###################### Dövizli ######################
			if (m.dovizliKalem) {
				kalemKDVDovizli += kdv / m.dovizKuru;
				_kalemKdvEkle(m.KDVOrani, 0, kdv / m.dovizKuru);
				kalemBrutTutarDovizli += brutTutar / m.dovizKuru;
				if (_initKDVDahil) {
					kalemAraToplamDovizli += (tutar - kdv) / m.dovizKuru;
					kalemGenelToplamDovizli += tutar / m.dovizKuru;
				} else {
					kalemAraToplamDovizli += tutar / m.dovizKuru;
					kalemGenelToplamDovizli += (tutar + kdv) / m.dovizKuru;
				}
			}
			m.faturaKalem.NetFiyat = m.resultNetFiyat;

			m.faturaKalem.OtvTutar = kalemOTV;
			kalemOtvToplam += m.faturaKalem.OtvTutar;
		} // for (KalemModel m : _listKalem) {
		// ################################################################################################################################################################################
		//ek maliyet 1
		if (_initEkMaliyet1Tutari != 0) {
			double ekMalKdv = 0;
			if (_paramModel.getEkMaliyet1KdvOrani() > 0) ekMalKdv = _initEkMaliyet1Tutari * (_paramModel.getEkMaliyet1KdvOrani() / 100);
			kalemKDV += ekMalKdv;

			if (_initKDVDahil) {
				kalemGenelToplam += _initEkMaliyet1Tutari + ekMalKdv;
				kalemAraToplam = kalemGenelToplam - kalemKDV;
			} else {
				kalemAraToplam += _initEkMaliyet1Tutari;
				kalemGenelToplam = kalemAraToplam + kalemKDV;
			}
		}

		//ek maliyet 2
		if (_initEkMaliyet2Tutari != 0) {
			double ekMalKdv = 0;
			if (_paramModel.getEkMaliyet2KdvOrani() > 0) ekMalKdv = _initEkMaliyet2Tutari * (_paramModel.getEkMaliyet2KdvOrani() / 100);
			kalemKDV += ekMalKdv;

			if (_initKDVDahil) {
				kalemGenelToplam += _initEkMaliyet2Tutari + ekMalKdv;
				kalemAraToplam = kalemGenelToplam - kalemKDV;
			} else {
				kalemAraToplam += _initEkMaliyet2Tutari;
				kalemGenelToplam = kalemAraToplam + kalemKDV;
			}
		}

		//ek maliyet 3
		if (_initEkMaliyet3Tutari != 0) {
			if (_initKDVDahil) {
				kalemGenelToplam += _initEkMaliyet3Tutari;
				kalemAraToplam = kalemGenelToplam - kalemKDV;
			} else {
				kalemAraToplam += _initEkMaliyet3Tutari;
				kalemGenelToplam = kalemAraToplam + kalemKDV;
			}
		}
		// ötv
		kalemGenelToplam += kalemOtvToplam;

		_resultModel.KalemSayisi = _listKalem.size();
		_resultModel.Miktar = kalemMiktar;
		_resultModel.BrutTutar = _initDovizliSonucGoster ? kalemBrutTutar / _initDovizKuru : kalemBrutTutar;
		//
		_resultModel.GenelIsk1O = _GenelIsk1O;
		_resultModel.GenelIsk2O = _GenelIsk2O;
		_resultModel.GenelIsk3O = _GenelIsk3O;
		_resultModel.GenelIsk1T = _initDovizliSonucGoster ? kalemGenIsk1T / _initDovizKuru : kalemGenIsk1T;
		_resultModel.GenelIsk2T = _initDovizliSonucGoster ? kalemGenIsk2T / _initDovizKuru : kalemGenIsk2T;
		_resultModel.GenelIsk3T = _initDovizliSonucGoster ? kalemGenIsk3T / _initDovizKuru : kalemGenIsk3T;
		_resultModel.MalFazIskTutari = _initDovizliSonucGoster ? kalemMalFazIskonto / _initDovizKuru : kalemMalFazIskonto;
		_resultModel.SatirIskTutari = _initDovizliSonucGoster ? kalemSatirIskonto / _initDovizKuru : kalemSatirIskonto;
		_resultModel.GenelIskTutari = _initDovizliSonucGoster ? kalemGenelIskonto / _initDovizKuru : kalemGenelIskonto;
		_resultModel.ToplamIskTutari = _initDovizliSonucGoster ? (kalemMalFazIskonto + kalemSatirIskonto + kalemGenelIskonto) / _initDovizKuru : kalemMalFazIskonto + kalemSatirIskonto + kalemGenelIskonto;
		//Toplam isk oranı
		if (_resultModel.SatirIskTutari > 0 && _resultModel.BrutTutar > 0)
			_resultModel.SatirIskOrani = (_resultModel.SatirIskTutari / _resultModel.BrutTutar) * 100;
		//
		_resultModel.AraToplam = _initDovizliSonucGoster ? kalemAraToplam / _initDovizKuru : kalemAraToplam;
		_resultModel.ToplamOtv = _initDovizliSonucGoster ? kalemOtvToplam / _initDovizKuru : kalemOtvToplam;;
		_resultModel.KDVTutari = _initDovizliSonucGoster ? kalemKDV / _initDovizKuru : kalemKDV;
		_resultModel.GenelToplam = _initDovizliSonucGoster ? kalemGenelToplam / _initDovizKuru : kalemGenelToplam;
		//Dovizli
		_resultModel.dovizliBrutTutar = kalemBrutTutarDovizli;
		_resultModel.dovizliMalFazIskTutari = kalemMalFazIskontoDovizli;
		_resultModel.dovizliSatirIskTutari = kalemSatirIskontoDovizli;
		_resultModel.dovizliGenelIskTutari = kalemGenelIskontoDovizli;
		_resultModel.dovizliToplamIskTutari = kalemMalFazIskontoDovizli + kalemSatirIskontoDovizli + kalemGenelIskontoDovizli;
		_resultModel.dovizliAraToplam = kalemAraToplamDovizli;
		_resultModel.dovizliKDVTutari = kalemKDVDovizli;
		_resultModel.dovizliGenelToplam = kalemGenelToplamDovizli;
		//
		if (_GenelIsk1O >= 100 && (_GenelIsk2O != 0 || _GenelIsk3O != 0)) _resultModel.GenelToplam = -1;
		if (_GenelIsk2O >= 100 && (_GenelIsk1O != 0 || _GenelIsk3O != 0)) _resultModel.GenelToplam = -1;
		if (_GenelIsk3O >= 100 && (_GenelIsk1O != 0 || _GenelIsk2O != 0)) _resultModel.GenelToplam = -1;
		if (_GenelIsk1O > 100 || _GenelIsk2O > 100 || _GenelIsk3O > 100) _resultModel.GenelToplam = -1;
		//
		_resultModel.KDVsizKalemSayisi = KDVsizKalemSayisi;
		_resultModel.dipFiyatAltindaKalemsayisi = dipFiyatAltindaKalemSayisi;
	}

	public ResultModel getResult() {
		return _resultModel;
	}

	public void setFaturaKalemModel(FaturaKalemResponseModel model) {
		setFaturaKalemList(Arrays.asList(model));
	}

	public void setFaturaKalemList(List<FaturaKalemResponseModel> listFatura) {
		_listKalem.clear();
		KalemModel kalemModel;
		for (FaturaKalemResponseModel m : listFatura) {
			if (m.isKarmaKoli()) {
				for (FaturaKalemResponseModel mBilesen : m.getKalemList()) {
					kalemModel = getKalemModelFromFaturaKalem(m);
					kalemModel.KDVOrani = mBilesen.KdvOrani;
					kalemModel.Fiyat = mBilesen.getKoliBilesenFiyati(m.BrutFiyatTL);
					kalemModel.MalFazMiktar = mBilesen.MalFazlasiMiktar;
					kalemModel.Miktar = mBilesen.KarmaKoliBilesenMiktar * m.Miktar2;
					_listKalem.add(kalemModel);
				}
			} else {
				kalemModel = getKalemModelFromFaturaKalem(m);
				kalemModel.KDVOrani = m.KdvOrani;
				kalemModel.Fiyat = m.BrutFiyatTL;
				kalemModel.MalFazMiktar = m.MalFazlasiMiktar;
				kalemModel.Miktar = m.Miktar;
				kalemModel.IadeMiktar = m.MiktarIade;
				_listKalem.add(kalemModel);
			}
		}
	}

	private KalemModel getKalemModelFromFaturaKalem(FaturaKalemResponseModel m) {
		KalemModel kalemModel = new KalemModel();
		kalemModel.faturaKalem = m;
		kalemModel.Iskonto1OranMi = m.Iskonto1OranMi;
		kalemModel.Iskonto1 = m.Iskonto1;
		kalemModel.Iskonto2O = m.Iskonto2;
		kalemModel.Iskonto3O = m.Iskonto3;
		kalemModel.Iskonto4O = m.Iskonto4;
		kalemModel.Iskonto5O = m.Iskonto5;
		kalemModel.Iskonto6O = m.Iskonto6;
		kalemModel.dovizKuru = m.DovizKuru;
		kalemModel.dovizTipi = m.getDovizTipi();
		kalemModel.dovizliKalem = m.dovizliMi();
		//Dip fiyat
		kalemModel.DipFiyat = m.DipFiyat;
		if (_tlFiyatGelsin == false) {
			kalemModel.DipFiyatDovizAdi = m.StokSatisDovizAdi;
			kalemModel.DipFiyatDovizTipi = m.StokSatisDovizTipi;
		}
		//
		kalemModel.StokSatisDovizTipi = m.StokSatisDovizTipi;
		kalemModel.StokSatisDovizKuru = m.StokSatisKuru;
		kalemModel.StokSatisDovizAdi = m.StokSatisDovizAdi;
		//
		kalemModel.StokAlisDovizTipi = m.StokAlisDovizTipi;
		kalemModel.StokAlisDovizKuru = m.StokAlisKuru;
		kalemModel.StokAlisDovizAdi = m.StokAlisDovizAdi;
		return kalemModel;
	}

	public static class KalemModel implements Cloneable {

		public FaturaKalemResponseModel faturaKalem;
		public double Miktar;
		public double MalFazMiktar;
		public double IadeMiktar;
		public double Fiyat;
		public double DipFiyat;
		public int DipFiyatDovizTipi;
		public String DipFiyatDovizAdi = "";
		public boolean Iskonto1OranMi;
		public double Iskonto1;
		public double Iskonto2O;
		public double Iskonto3O;
		public double Iskonto4O;
		public double Iskonto5O;
		public double Iskonto6O;
		public double KDVOrani;
		public boolean dovizliKalem;
		public double dovizKuru;
		public double dovizTipi;
		public int StokSatisDovizTipi;
		public String StokSatisDovizAdi = "";
		public double StokSatisDovizKuru;
		public int StokAlisDovizTipi;
		public String StokAlisDovizAdi = "";
		public double StokAlisDovizKuru;

		public double resultIsk1O;
		public double resultNetFiyat;
		public double resultBrutFiyat;
		public double resultKDVTutari;
		public double resultGenelToplam;

		public double resultNetFiyatDovizli;
		public double resultBrutFiyatDovizli;
		public double resultKDVTutariDovizli;
		public double resultGenelToplamDovizli;
		public double resultDipFiyatIcinHesaplananFiyat;

		@Override
		public Object clone() throws CloneNotSupportedException {
			return super.clone();
		}

	}

	public static class ResultModel {

		public int KalemSayisi;
		public double Miktar;
		public double MalFazMiktar;
		public double BrutTutar;
		public double MalFazIskTutari;
		public double SatirIskTutari;
		public double SatirIskOrani;
		public double GenelIskTutari;
		public double ToplamIskTutari;
		public double AraToplam;
		public double ToplamOtv;
		public double KDVTutari;
		public double GenelToplam;
		public double GenelIsk1O;
		public double GenelIsk2O;
		public double GenelIsk3O;
		public double GenelIsk1T;
		public double GenelIsk2T;
		public double GenelIsk3T;
		public int KDVsizKalemSayisi;
		public int dipFiyatAltindaKalemsayisi;

		//Dövizli
		public double dovizliBrutTutar;
		public double dovizliMalFazIskTutari;
		public double dovizliSatirIskTutari;
		public double dovizliGenelIskTutari;
		public double dovizliToplamIskTutari;
		public double dovizliAraToplam;
		public double dovizliKDVTutari;
		public double dovizliGenelToplam;
	}

	public List<KalemModel> getKalemList() {
		return _listKalem;
	}

	private void _kalemKdvEkle(double kdvOrani, double kdvTut, double kdvTutDovizli) {
		if (_initKdvSifirOlsun) {
			return;
		}
		if (kdvTutDovizli != 0) {
			if (_mapKDVDovizli.containsKey(kdvOrani)) {
				_mapKDVDovizli.put(kdvOrani, _mapKDVDovizli.get(kdvOrani) + kdvTutDovizli);
			} else {
				_mapKDVDovizli.put(kdvOrani, kdvTutDovizli);
			}
		} else {
			if (_mapKDV.containsKey(kdvOrani)) {
				_mapKDV.put(kdvOrani, _mapKDV.get(kdvOrani) + kdvTut);
			} else {
				_mapKDV.put(kdvOrani, kdvTut);
			}
		}
	}

	public void showKdvBilgi(DialogHelper dialogHelper) {
		StringGenerator sg = new StringGenerator();
		for (Map.Entry<Double, Double> m : _mapKDV.entrySet()) {
			sg.addLine("% " + NetsisDecimalHelper.getInstance().formatOran(m.getKey()) + " : " + NetsisDecimalHelper.getInstance()
					.formatTutar(m.getValue()));
		}
		if (_mapKDVDovizli.isEmpty() == false) {
			sg.addLine("");
			sg.addLine("Dövizli Tutarlar");
			for (Map.Entry<Double, Double> m : _mapKDVDovizli.entrySet()) {
				sg.addLine("% " + NetsisDecimalHelper.getInstance().formatOran(m.getKey()) + " : " + NetsisDecimalHelper.getInstance()
						.formatTutar(m.getValue()));
			}
		}
		dialogHelper.showInfoDialog("KDV Tutarları", sg.toString());
	}

}
