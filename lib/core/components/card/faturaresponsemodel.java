package tr.com.bracket.picker40.models;

import android.util.ArrayMap;

import androidx.annotation.NonNull;
import androidx.annotation.Nullable;

import com.google.gson.annotations.SerializedName;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.Date;
import java.util.List;
import java.util.Map;

import tr.com.bracket.picker40.R;
import tr.com.bracket.picker40.bll.BLLConstants;
import tr.com.bracket.picker40.bll.BelgeUtils;
import tr.com.bracket.picker40.bll.CariManager;
import tr.com.bracket.picker40.bll.EBelgeManager;
import tr.com.bracket.picker40.bll.FaturaManager;
import tr.com.bracket.picker40.bll.PrefManager;
import tr.com.bracket.picker40.utils.ArrayListUtils;
import tr.com.bracket.picker40.utils.DateTimeUtils;
import tr.com.bracket.picker40.utils.StringUtils;

public class FaturaResponseModel implements Cloneable {


    public static final int ISLEM_KODU_ONAYLA = 1;
    public static final int ISLEM_KODU_ONAYI_GERI_AL = 2;
    public static final int ISLEM_KODU_CARI_KODU_DEGISTIR = 3;
    public static final int ISLEM_KODU_EFATTAN_ALISFAT = 4;
    public static final int ISLEM_KODU_TEKLIF_REVIZE = 5;
    public static final int ISLEM_KODU_MUS_SIPTEN_SATICI_SIP = 6;
    public static final int ISLEM_KODU_SIPTEN_FATUIRS = 7;
    public static final int ISLEM_KODU_KAPAT = 8;
    public static final int ISLEM_KODU_AC = 9;
    public static final int ISLEM_KODU_BELGE_NO_DEGISTIR = 10;
    public static final int ISLEM_KODU_E_BELGE_QR_DAN_ALIS_BELGESI = 11; //apk 192
    public static final int ISLEM_KODU_KONTROL_ACIKLAMASI_KAYDET = 12; //apk 205
    public static final int ISLEM_KODU_STOK_FIYAT_GUNCELLE = 13; //apk 229
    public static final int ISLEM_KODU_EK_ACIKLAMALARI_GUNCELLE = 14; //apk 231

    @SerializedName("TAG")
    public final String Tag = "FaturaModel";

    //Temp


    @SerializedName("TEMP_KAYIT_TIPI")
    public int TempKayitTipi;

    @SerializedName("ISLEM_ID")
    private String IslemID = "";

    @SerializedName("REMOTE_TEMP_BELGE")
    public boolean RemoteTempBelgeMi;

    @SerializedName("REMOTE_TEMP_BELGE_ETIKETI")
    public String RemoteTempBelgeEtiketi = "";

    @SerializedName("TEMP_BELGE_ID") //apk 208
    public int TempBelgeID;

    @SerializedName("TEMP_JSON_DATA")
    public String TempJsonData = "";

    @SerializedName("CARI_MODEL")
    public CariResponseModel CariModel;

    @SerializedName("TEMP_SIP_KALEM_LIST")
    public ArrayList<FaturaKalemResponseModel> TempSipKalemOrjList = new ArrayList<>();

    @SerializedName("TEMP_ISLEM_KODU")
    public int TempIslemKodu;

    @SerializedName("ISLEME_BASLAMA_TARIHI")
    public Date IslemeBaslamaTarihi;

    @SerializedName("TEMP_EFATURA_MODEL") //apk 192 : @SerializedName("TEMP_EFATURA_MODEL") eklendi.
    public EFaturaResponseModel tempEFaturaModel;

    @SerializedName("PARAM_MAP") //apk 199
    public Map<String, String> ParamMap = new ArrayMap<>();

    //

    @SerializedName("KALEM_LIST")
    public ArrayList<FaturaKalemResponseModel> KalemList = new ArrayList<>();

    @SerializedName("CARI_LIST")
    public List<CariResponseModel> CariList = new ArrayList<>();

    @SerializedName("TARIH")
    public Date Tarih;

    @SerializedName("TESLIM_TARIHI")
    public Date TeslimTarihi;

    @SerializedName("ISTENILEN_TESLIM_TARIHI") //apk 164
    public Date IstenilenTeslimTarihi;

    @SerializedName("KOSUL_TARIHI") // apk 161
    public Date KosulTarihi;

    @SerializedName("BELGE_NO")
    public String FisNo = "";

    @SerializedName("RESMI_BELGE_NO")
    public String ResmiBelgeNo = "";

    @SerializedName("BELGE_TURU")
    private String PickerBelgeTuru = "";

    @SerializedName("BELGE_KODU")
    public String ERPBelgeKodu = "";

    @SerializedName("ACIKLAMA")
    public String Aciklama = "";

    @SerializedName("ACIK1")
    private String EkAciklama1 = "";

    @SerializedName("ACIK2")
    private String EkAciklama2 = "";

    @SerializedName("ACIK3")
    private String EkAciklama3 = "";

    @SerializedName("ACIK4")
    private String EkAciklama4 = "";

    @SerializedName("ACIK5")
    private String EkAciklama5 = "";

    @SerializedName("ACIK6")
    private String EkAciklama6 = "";

    @SerializedName("ACIK7")
    private String EkAciklama7 = "";

    @SerializedName("ACIK8")
    private String EkAciklama8 = "";

    @SerializedName("ACIK9")
    private String EkAciklama9 = "";

    @SerializedName("ACIK10")
    private String EkAciklama10 = "";

    @SerializedName("ACIK11")
    private String EkAciklama11 = "";

    @SerializedName("ACIK12")
    private String EkAciklama12 = "";

    @SerializedName("ACIK13")
    private String EkAciklama13 = "";

    @SerializedName("ACIK14")
    private String EkAciklama14 = "";

    @SerializedName("ACIK15")
    private String EkAciklama15 = "";

    @SerializedName("ACIK16")
    private String EkAciklama16 = "";

    @SerializedName("FIYAT_GRUBU")
    public String FiyatGrubu = "";

    @SerializedName("KALEM_ADEDI")
    public int KalemAdedi;

    @SerializedName("CARI_KODU")
    public String CariKodu = "";

    @SerializedName("VERGI_NO")
    public String VergiNo = "";

    @SerializedName("TESLIM_CARI")
    public String TeslimCariKodu = "";

    @SerializedName("TESLIM_CARI_ADI")
    public String TeslimCariAdi = "";

    @SerializedName("CARI_ADI")
    public String CariAdi = "";

    @SerializedName("TOPLU_DEPO")
    private int TopluDepo;

    @SerializedName("HEDEF_DEPO")
    private int HedefDepo;

    @SerializedName("TIPI")
    private int NetsisBelgeTipi;

    @SerializedName("VADE_GUNU")
    public int VadeGunu;

    @SerializedName("VADE_TARIHI")
    public Date VadeTarihi;

    //dat

    @SerializedName("CIKIS_SUBE_KODU")
    public int CikisSubeKodu;

    @SerializedName("GIRIS_SUBE_KODU")
    public int GirisSubeKodu;

    @SerializedName("LOKAL_DAT")
    public String LokalDAT = "";

    @SerializedName("DAT_ONAYDA")
    public String DATOnayda = "";

    @SerializedName("DAT_ONAYLANDI")
    public String DATOnaylandi = "";


    //Proje

    @SerializedName("PROJE_KODU")
    public String ProjeKodu = "";

    @SerializedName("PROJE_ACIKLAMA")
    public String ProjeAdi = "";

    @SerializedName("GENEL_ISKONTO1")
    private double GenelIskonto1T;

    @SerializedName("GENEL_ISKONTO2")
    private double GenelIskonto2T;

    @SerializedName("GENEL_ISKONTO3")
    private double GenelIskonto3T;

    @SerializedName("GENISK1_TIPI")
    public int GENISK1_TIPI;

    @SerializedName("GENISK2_TIPI")
    public int GENISK2_TIPI;

    @SerializedName("GENISK3_TIPI")
    public int GENISK3_TIPI;

    @SerializedName("KDV_DAHIL")
    private String KdvDahil = "";

    @SerializedName("CARI_DOVIZLI")
    public boolean CariDovizli;

    @SerializedName("CARI_DOVIZKODU")
    public int CariDovizKodu;

    @SerializedName("OZEL_KOD1")
    public String OzelKod1 = "";

    @SerializedName("OZEL_KOD2")
    public String OzelKod2 = "";

    @SerializedName("KOSUL_KODU")
    public String KosulKodu = "";

    @SerializedName("KOSUL_ADI")
    public String KosulAdi = "";

    @SerializedName("EXPORT_TIPI")
    public int ExportTipi;

    @SerializedName("EXPORTREFNO")
    private String ExportRefNo = "";

    @SerializedName("KAYITYAPANKUL")
    public String KayitYapanKullanici = "";

    @SerializedName("KAYITTARIHI")
    public Date KayitTarihi;

    @SerializedName("DUZELTMEYAPANKUL")
    public String DuzeltmeYapanKullanici = "";

    @SerializedName("DUZELTMETARIHI")
    public Date DuzeltmeTarihi;

    @SerializedName("MASRAF_KODU")
    public String MasrafKodu = "";

    @SerializedName("CIKIS_YERI")
    public String CikisYeriTipi = "";

    @SerializedName("HAREKET_TURU")
    public String AmbarHareketTuru = "";

    @SerializedName("KASA_KODU")
    public String KasaKodu = "";

    //Tutar

    @SerializedName("KDV")
    public double KdvTutari;

    @SerializedName("OTV_TUTARI")
    public double OtvTutari;

    @SerializedName("GENEL_TOPLAM")
    public double GenelToplam;

    @SerializedName("DOVIZ_TIPI")
    public int DovizTipi;

    @SerializedName("DOVIZ_ADI")
    public String DovizAdi = "";

    @SerializedName("DOVIZ_TUTARI")
    public double DovizTutari;

    @SerializedName("EK_MALIYET1_TUTARI")
    public double EkMaliyet1Tutari;

    @SerializedName("EK_MALIYET2_TUTARI")
    public double EkMaliyet2Tutari;

    @SerializedName("EK_MALIYET3_TUTARI")
    public double EkMaliyet3Tutari;

    @SerializedName("ARA_TOPLAM")
    public double AraToplam;


    //Plasiyer


    @SerializedName("PLASIYER_KODU")
    public String PlasiyerKodu = "";

    @SerializedName("PLASIYER_ACIKLAMA")
    public String PlasiyerAdi = "";

    //E-Fatura
    @SerializedName("EFATURA_MI")
    public String EFatura = "";

    @SerializedName("EFATURA_DURUMU")
    public String EFaturaDurumKodu = "";

    @SerializedName("EFATURA_TIPI")
    private String EFaturaSenaryo = "";

    @SerializedName("EFATURA_DURUM_ACIKLAMA")
    public String EFaturaDurumAciklama = "";

    @SerializedName("EFATURA_GIB_DURUM_KODU")
    public int EFaturaGibDurumKodu;

    @SerializedName("EFAT_ONAY_DURUM_KODU")
    public String EFaturaOnayDurumKodu = "";

    @SerializedName("EFAT_ONAY_ACIKLAMA")
    public String EFaturaOnayAciklama = "";

    @SerializedName("EFAT_OZELKOD") //apk 146
    private int EFatIstisnaKodu;


    //e-İrsaliye
    @SerializedName("EIRSALIYE_MI")
    private String EIrsaliyeMi = "";

    @SerializedName("EIRSALIYE_DURUMU")
    public String EIrsaliyeDurumKodu = "";

    @SerializedName("EIRSALIYE_DURUM_ACIKLAMA")
    public String EIrsaliyeDurumAciklama = "";

    @SerializedName("EIRSALIYE_GIB_DURUM_KODU")
    public int EIrsaliyeGibDurumKodu;

    @SerializedName("EBELGE_CHECKBOX")
    private String EBelgeCheckBox = "";

    @SerializedName("EIRS_BILGI_MODEL")
    public EIrsaliyeBilgiModel EIrsBilgiModel;


    //E-Arşiv

    @SerializedName("EARSIV_MI")
    public String EArsiv = "";

    @SerializedName("EARSIV_DURUMU")
    public String EArsivDurumKodu = "";

    @SerializedName("EARSIV_DURUM_ACIKLAMA")
    public String EArsivDurumAciklama = "";

    @SerializedName("EARSIV_GIB_DURUM_KODU")
    public int EArsivGibDurumKodu;


    //Talep-Teklif

    @SerializedName("ONCEKI_REVIZE_NO")
    public String TeklifOncekiRevizeNo = "";

    @SerializedName("SONRAKI_REVIZE_NO")
    public String TeklifSonrakiRevizeNo = "";

    @SerializedName("TEKLIFLESTI") //apk 223
    private String Tekliflesti = "";

    @SerializedName("SIPARISLESTI")
    public String TeklifSiparislesti = "";

    @SerializedName("IRSALIYELESTI")
    public String TeklifSipIrsaliyelesti = "";

    @SerializedName("FATURALASTI")
    public String Faturalasti = "";

    @SerializedName("FATURALASAN_SAYI") //apk 146
    public int FaturalasanSayi;

    @SerializedName("IRSLESEN_SAYI")//apk 146
    public int IrslesenSayi;


    //Diğer

    @SerializedName("EK_ACIKLAMA")
    public String HtmlEkAciklama = "";

    @SerializedName("C_YEDEK6")
    public String C_YEDEK6 = "";

    @SerializedName("ODEME_KODU") //apk 155
    public String ODEME_KODU = "";

    @SerializedName("KAPATILMIS") //apk 155
    public String KAPATILMIS = "";

    @SerializedName("F_YEDEK4") //apk 155
    public double F_YEDEK4;

    @SerializedName("MIKTAR") //apk 155
    public double Miktar;

    @SerializedName("TAMAMLANAN_MIKTAR") //apk 155
    public double TamamlananMiktar;

    @SerializedName("KALAN_MIKTAR") //apk 155
    public double KalanMiktar;

    @SerializedName("UETDS_BILDIRILDI") //apk 163
    public String UetdsBildirildi = "";

    @SerializedName("URET_MAL_TOP_ID")
    public int UretimeMalToplamaID;

    @SerializedName("ONAYLAYANKUL") //apk 205
    public String OnaylayanKul = "";

    @SerializedName("ONAYTARIHI")
    public Date OnayTarihi;

    @SerializedName("KONTROL_ACIKLAMA") //apk 205
    public String KontrolAciklama = "";

    @SerializedName("ISEMRI_NO") //apk 207
    public String IsEmriNo = "";

    @SerializedName("CARI_EFATURAMI") //apk 212
    public String CariEFaturaMi_EH = "";


    //apk 210 (request model alanları. Modeller birleştirilmeye başlandı.)


    @SerializedName("_YeniKayit")
    private boolean R_YeniKayit;

    @SerializedName("EIRSALIYE")
    private String R_EIrsaliyeCheckBox = "";

    @SerializedName("EFATURA_SENARYO")
    private String R_EFaturaSenaryoTipi = "";

    @SerializedName("EFATURA_OZEL_KOD")
    private int R_EFaturaOzelKod;

    @SerializedName("ISLEM_KODU")
    private int R_IslemKodu;

    @SerializedName("PickerBelgeTuru")
    private String R_PickerBelgeTuru = "";

    @SerializedName("BelgeTipi")
    private int R_BelgeTipi;

    @SerializedName("MEVCUT_BELGE_NO")
    private String R_MevcutBelgeNo = "";

    @SerializedName("MEVCUT_CARI_KODU")
    private String R_MevcutCariKodu = "";

    @SerializedName("YENI_CARI_KODU")
    private String R_YeniCariKodu = "";

    @SerializedName("YENI_BELGE_NO")
    private String R_YeniBelgeNo = "";

    @SerializedName("CIKIS_DEPO_KODU")
    private int R_CikisDepoKodu;

    @SerializedName("GIRIS_DEPO_KODU")
    private int R_GirisDepoKodu;

    @SerializedName("EK_ACIK_1")
    private String R_EkAciklama1 = "";

    @SerializedName("EK_ACIK_2")
    private String R_EkAciklama2 = "";

    @SerializedName("EK_ACIK_3")
    private String R_EkAciklama3 = "";

    @SerializedName("EK_ACIK_4")
    private String R_EkAciklama4 = "";

    @SerializedName("EK_ACIK_5")
    private String R_EkAciklama5 = "";

    @SerializedName("EK_ACIK_6")
    private String R_EkAciklama6 = "";

    @SerializedName("EK_ACIK_7")
    private String R_EkAciklama7 = "";

    @SerializedName("EK_ACIK_8")
    private String R_EkAciklama8 = "";

    @SerializedName("EK_ACIK_9")
    private String R_EkAciklama9 = "";

    @SerializedName("EK_ACIK_10")
    private String R_EkAciklama10 = "";

    @SerializedName("EK_ACIK_11")
    private String R_EkAciklama11 = "";

    @SerializedName("EK_ACIK_12")
    private String R_EkAciklama12 = "";

    @SerializedName("EK_ACIK_13")
    private String R_EkAciklama13 = "";

    @SerializedName("EK_ACIK_14")
    private String R_EkAciklama14 = "";

    @SerializedName("EK_ACIK_15")
    private String R_EkAciklama15 = "";

    @SerializedName("EK_ACIK_16")
    private String R_EkAciklama16 = "";

    @SerializedName("KALEMLER")
    private List<FaturaKalemResponseModel> R_ListKalemler = new ArrayList<>();

    @SerializedName("KDV_DAHILMI")
    private boolean R_KdvDahilMi;

    @SerializedName("GEN_ISK1T")
    private double R_GenelIskonto1T;

    @SerializedName("GEN_ISK2T")
    private double R_GenelIskonto2T;

    @SerializedName("GEN_ISK3T")
    private double R_GenelIskonto3T;

    @SerializedName("GEN_ISK1O")
    private double R_GenelIskonto1O;

    @SerializedName("GEN_ISK2O")
    private double R_GenelIskonto2O;

    @SerializedName("GEN_ISK3O")
    private double R_GenelIskonto3O;

    @SerializedName("EXPORT_REFNO")
    private String R_ExportRefNo = "";

    @SerializedName("TEKLIF_REVIZE_ISLEMI")
    private boolean R_TeklifRevizeIslemi;

    @SerializedName("MUS_SIPTEN_SATICI_SIP")
    private boolean R_MusSiptenSaticiSipIslemi;

    @SerializedName("IRSALIYEDEN_FATURA")
    private boolean R_IrsaliyedenFaturaIslemi;

    @SerializedName("EFATTAN_ALIS_FAT")
    private boolean R_EFattanAlisFatIslemi;

    @SerializedName("EBELGE_ZARFID")
    private String R_EBelgeZarfID = "";

    @SerializedName("EFATURA_INCKEYNO")
    private int R_EFaturaIncKeyNo;

    @SerializedName("MUHTELIF_CARI_MODEL")
    private CariRequestModel R_MuhtelifCariRequest;


    public boolean isUetdsBildirildi() {
        return UetdsBildirildi.equals("E");
    }

    public boolean isTekliflesti() {
        return Tekliflesti.equalsIgnoreCase("E");
    }

    public boolean teklifSiparislestiMi() {
        return TeklifSiparislesti.equalsIgnoreCase("E");
    }

    public boolean teklifSipIrsaliyelestiMi() {
        return TeklifSipIrsaliyelesti.equals("E");
    }

    public boolean teklifSipIrsFaturalastiMi() {
        return Faturalasti.equals("E");
    }

    public boolean teklifRevizeEdilebilirMi() {
        boolean belgeIslemGormus = kapaliMi() || teklifRevizeEdilmisMi() || onaydaMi() || teklifSiparislestiMi() || teklifSipIrsaliyelestiMi() || teklifSipIrsFaturalastiMi();
        return belgeIslemGormus == false;
    }

    public boolean teklifSipariseDonerMi() {
        boolean belgeIslemGormus = kapaliMi() || teklifRevizeEdilmisMi() || onaydaMi();
        return belgeIslemGormus == false;
    }

    public boolean teklifIrsaliyeDonerMi() {
        boolean belgeIslemGormus = kapaliMi() || teklifRevizeEdilmisMi() || onaydaMi();
        if (belgeIslemGormus)
            return false;
        return teklifSiparislestiMi();
    }

    public boolean teklifFaturayaDonerMi() {
        boolean belgeIslemGormus = kapaliMi() || teklifRevizeEdilmisMi() || onaydaMi();
        if (belgeIslemGormus)
            return false;
        if (teklifSiparislestiMi() == false)
            return false;
        return teklifSiparislestiMi() || teklifSipIrsaliyelestiMi();
    }

    //Sipariş

    public boolean siparisIrsaliyeDonerMi() {
        if (kapaliMi() || onaydaMi()) {
            return false;
        } else {
            return true;
        }
    }

    public boolean siparisFaturayaDonerMi() {
        if (kapaliMi() || onaydaMi()) {
            return false;
        } else {
            return true;
        }
    }

    //Ortak

    public boolean muhtelifCariMi() {
        return CariKodu.equals(CariManager.MUHTELIF_CARI_KODU);
    }

    @Override
    public FaturaResponseModel clone() {
        try {
            return (FaturaResponseModel) super.clone();
        } catch (Exception e) {
            return null;
        }
    }

    public String getEkAciklamalarFullString(@NonNull ParamResponseModel paramModel, @Nullable ProfilResponseModel profilModel_nullable) {
        boolean ekAciklamalarAktif = paramModel.ekAciklamalarAktifMi();
        boolean belgeAciklamaAktif = paramModel.aciklamaAktifMi();
        if (ekAciklamalarAktif == false && belgeAciklamaAktif == false) {
            return "";
        }
        List<Integer> listYetki = new ArrayList<>();
        if (profilModel_nullable == null) {
            listYetki.add(-1);
        } else {
            listYetki = profilModel_nullable.getAciklamaAlanList(getBelgeTuru());
        }
        String belgeAciklama = "";
        if (belgeAciklamaAktif) {
            belgeAciklama = Aciklama.trim().isEmpty() == false ? ("Belge Açıklaması: " + Aciklama) : "";
        }
        String acik1 = ekAciklamalarAktif && getEkAciklama1().trim().isEmpty() == false && (listYetki.contains(-1) || listYetki.contains(1)) ? (paramModel.getEkAciklamaTanimi(1) + ": " + getEkAciklama1()) : "";
        String acik2 = ekAciklamalarAktif && getEkAciklama2().trim().isEmpty() == false && (listYetki.contains(-1) || listYetki.contains(2)) ? (paramModel.getEkAciklamaTanimi(2) + ": " + getEkAciklama2()) : "";
        String acik3 = ekAciklamalarAktif && getEkAciklama3().trim().isEmpty() == false && (listYetki.contains(-1) || listYetki.contains(3)) ? (paramModel.getEkAciklamaTanimi(3) + ": " + getEkAciklama3()) : "";
        String acik4 = ekAciklamalarAktif && getEkAciklama4().trim().isEmpty() == false && (listYetki.contains(-1) || listYetki.contains(4)) ? (paramModel.getEkAciklamaTanimi(4) + ": " + getEkAciklama4()) : "";
        String acik5 = ekAciklamalarAktif && getEkAciklama5().trim().isEmpty() == false && (listYetki.contains(-1) || listYetki.contains(5)) ? (paramModel.getEkAciklamaTanimi(5) + ": " + getEkAciklama5()) : "";
        String acik6 = ekAciklamalarAktif && getEkAciklama6().trim().isEmpty() == false && (listYetki.contains(-1) || listYetki.contains(6)) ? (paramModel.getEkAciklamaTanimi(6) + ": " + getEkAciklama6()) : "";
        String acik7 = ekAciklamalarAktif && getEkAciklama7().trim().isEmpty() == false && (listYetki.contains(-1) || listYetki.contains(7)) ? (paramModel.getEkAciklamaTanimi(7) + ": " + getEkAciklama7()) : "";
        String acik8 = ekAciklamalarAktif && getEkAciklama8().trim().isEmpty() == false && (listYetki.contains(-1) || listYetki.contains(8)) ? (paramModel.getEkAciklamaTanimi(8) + ": " + getEkAciklama8()) : "";
        String acik9 = ekAciklamalarAktif && getEkAciklama9().trim().isEmpty() == false && (listYetki.contains(-1) || listYetki.contains(9)) ? (paramModel.getEkAciklamaTanimi(9) + ": " + getEkAciklama9()) : "";
        String acik10 = ekAciklamalarAktif && getEkAciklama10().trim().isEmpty() == false && (listYetki.contains(-1) || listYetki.contains(10)) ? (paramModel.getEkAciklamaTanimi(10) + ": " + getEkAciklama10()) : "";
        String acik11 = ekAciklamalarAktif && getEkAciklama11().trim().isEmpty() == false && (listYetki.contains(-1) || listYetki.contains(11)) ? (paramModel.getEkAciklamaTanimi(11) + ": " + getEkAciklama11()) : "";
        String acik12 = ekAciklamalarAktif && getEkAciklama12().trim().isEmpty() == false && (listYetki.contains(-1) || listYetki.contains(12)) ? (paramModel.getEkAciklamaTanimi(12) + ": " + getEkAciklama12()) : "";
        String acik13 = ekAciklamalarAktif && getEkAciklama13().trim().isEmpty() == false && (listYetki.contains(-1) || listYetki.contains(13)) ? (paramModel.getEkAciklamaTanimi(13) + ": " + getEkAciklama13()) : "";
        String acik14 = ekAciklamalarAktif && getEkAciklama14().trim().isEmpty() == false && (listYetki.contains(-1) || listYetki.contains(14)) ? (paramModel.getEkAciklamaTanimi(14) + ": " + getEkAciklama14()) : "";
        String acik15 = ekAciklamalarAktif && getEkAciklama15().trim().isEmpty() == false && (listYetki.contains(-1) || listYetki.contains(15)) ? (paramModel.getEkAciklamaTanimi(15) + ": " + getEkAciklama15()) : "";
        String acik16 = ekAciklamalarAktif && getEkAciklama16().trim().isEmpty() == false && (listYetki.contains(-1) || listYetki.contains(16)) ? (paramModel.getEkAciklamaTanimi(16) + ": " + getEkAciklama16()) : "";
        return StringUtils.getNewLineStringFromArray(Arrays.asList(belgeAciklama, acik1, acik2, acik3, acik4, acik5, acik6, acik7, acik8, acik9, acik10, acik11, acik12, acik13, acik14, acik15, acik16));
    }

    public String getKosulAdi() {
        return KosulAdi.isEmpty() ? KosulKodu : KosulAdi;
    }

    public int getBelgeTipi() {
        //apk 212 : sipariş teklif onayda görünmeme sorunu giderildi.
        int tipi = NetsisBelgeTipi;
        if (tipi <= 0) {
            tipi = R_BelgeTipi;
        }
        return tipi;
    }

    public int getBelgeTipi_AcikKapaliIadeYurtDisi() {
        int tipi = NetsisBelgeTipi;
        if (tipi <= 0) {
            tipi = R_BelgeTipi;
        }
        boolean siparisMi = BelgeUtils.belgeSiparisMi(getBelgeTuru());
        boolean talTekMi = BelgeUtils.talepTeklifMi(getBelgeTuru());
        if ((siparisMi || talTekMi) && tipi == FaturaManager.SIPARIS_TIPI_ONAY_BEKLIYOR) {
            return ExportTipi > 0 ? FaturaManager.SIPARIS_TIPI_YURT_DISI : FaturaManager.SIPARIS_TIPI_YURT_ICI;
        }
        return tipi;
    }

    public ArrayList<FaturaKalemResponseModel> getKalemList() {
        return ArrayListUtils.getListNullCheck(KalemList);
    }

    public boolean isIhracatKayitliBelge() {
        return isIthalat() && ExportTipi == 5 && (BelgeUtils.belgeIrsaliyeMi(getBelgeTuru()) || BelgeUtils.belgeFaturaMi(getBelgeTuru()));
    }

    public String getBelgeNo() {
        if (FisNo.isEmpty() && Arrays.asList(BLLConstants.TEMP_KAYIT_TIPI_LOCAL_YARIM, BLLConstants.TEMP_KAYIT_TIPI_LOCAL_BELGE).contains(TempKayitTipi)) {
            return StringUtils.kelimeAl(IslemID.replace("-", " "), 1);
        }
        return FisNo;
    }

    public boolean isFatuIrsIadeMi() {
        return BelgeUtils.belgeIadeMi(getBelgeTuru(), this.getBelgeTipi());
    }

    public boolean isSiparisFarkliSube() {
        return BelgeUtils.belgeSiparisMi(getBelgeTuru()) && KAPATILMIS.equalsIgnoreCase("P");
    }

    public boolean eArsivMi() {
        return faturaMi() && EArsiv.equals("E");
    }

    public boolean eArsivBasariylaGonderildiMi() {
        return eArsivMi() && EArsivDurumKodu.equals(FaturaManager.EFATURA_DURUM_BASARIYLA_GONDERILDI);
    }

    public boolean eArsivTaslakMi() {
        return eArsivMi() && EArsivDurumKodu.equals(FaturaManager.EFATURA_DURUM_TASLAK);
    }

    public boolean eIrsaliyeTaslakMi() {
        return eIrsaliyeMi() && EIrsaliyeDurumKodu.equals(FaturaManager.EFATURA_DURUM_TASLAK);
    }

    public boolean eIrsaliyeBasariylaGonderildiMi() {
        return eIrsaliyeMi() && EIrsaliyeDurumKodu.equals(FaturaManager.EFATURA_DURUM_BASARIYLA_GONDERILDI);
    }

    public String getEBelgeCevapAciklama() {
        if (eFaturaMi()) {
            if (efaturaTaslakMi())
                return "Taslak";
            return EFaturaDurumAciklama;
        } else if (eArsivMi()) {
            if (eArsivTaslakMi())
                return "Taslak";
            return EArsivDurumAciklama;
        } else if (eIrsaliyeMi()) {
            if (eIrsaliyeTaslakMi())
                return "Taslak";
            return EIrsaliyeDurumAciklama;
        } else {
            return "";
        }
    }

    public int getEBelgeCevapKodu() {
        if (eFaturaMi()) {
            if (efaturaTaslakMi())
                return 0;
            return EFaturaGibDurumKodu;
        } else if (eArsivMi()) {
            if (eArsivTaslakMi())
                return 0;
            return EArsivGibDurumKodu;
        } else if (eIrsaliyeMi()) {
            if (eIrsaliyeTaslakMi())
                return 0;
            return EIrsaliyeGibDurumKodu;
        } else {
            return 0;
        }
    }

    public String getEBelgeTuru() {
        String eBelgeTipi = "";
        if (eFaturaMi()) {
            eBelgeTipi = EBelgeManager.EBELGE_TURU_FATURA;
        }
        if (eBelgeTipi.isEmpty() && eArsivMi()) {
            eBelgeTipi = EBelgeManager.EBELGE_TURU_ARSIV;
        }
        if (eBelgeTipi.isEmpty()) {
            if (irsaliyeMi() || datMi() || ambarMi()) {
                eBelgeTipi = EBelgeManager.EBELGE_TURU_IRSALIYE;
            }
        }
        return eBelgeTipi;
    }

    public boolean eBelgeMi() {
        return eFaturaMi() || eArsivMi() || eIrsaliyeMi();
    }

    public boolean eBelgeTaslakMi() {
        return efaturaTaslakMi() || eArsivTaslakMi() || eIrsaliyeTaslakMi();
    }

    public boolean kapaliMi() {
        return getBelgeTipi() == FaturaManager.BELGE_TIPI_KAPALI;
    }

    public boolean isIthalat() {
        if (BelgeUtils.talepTeklifMi(getBelgeTuru()) || BelgeUtils.sipIrsFatu(getBelgeTuru())) {
            return getBelgeTipi() == FaturaManager.BELGE_TIPI_ITHALAT || ExportTipi > 0;
        } else {
            return false;
        }
    }

    public boolean kdvDahilMi() {
        if (KdvDahil != null)
            return KdvDahil.equals("E");
        else
            return false;
    }

    public boolean irsaliyeMi() {
        return getBelgeTuru().equals(BLLConstants.PICKER_BELGE_TURU_ALIS_IRSALIYESI)
                || getBelgeTuru().equals(BLLConstants.PICKER_BELGE_TURU_SATIS_IRSALIYESI)
                ;
    }

    public boolean faturaMi() {
        return getBelgeTuru().equals(BLLConstants.PICKER_BELGE_TURU_SATIS_FATURASI)
                || getBelgeTuru().equals(BLLConstants.PICKER_BELGE_TURU_ALIS_FATURASI)
                ;
    }

    public boolean siparisMi() {
        return getBelgeTuru().equals(BLLConstants.PICKER_BELGE_TURU_SATICI_SIPARISI)
                || getBelgeTuru().equals(BLLConstants.PICKER_BELGE_TURU_MUSTERI_SIPARISI)
                ;
    }

    public boolean datMi() {
        return BelgeUtils.datMi(getBelgeTuru());
    }

    public boolean ambarMi() {
        return getBelgeTuru().equals(BLLConstants.PICKER_BELGE_TURU_AMBAR_CIKISI)
                || getBelgeTuru().equals(BLLConstants.PICKER_BELGE_TURU_AMBAR_GIRISI)
                ;
    }

    public boolean stekMi() {
        return getBelgeTuru().equalsIgnoreCase(BLLConstants.PICKER_BELGE_TURU_SATIS_TEKLIFI);
    }

    public boolean atalMi() {
        return getBelgeTuru().equalsIgnoreCase(BLLConstants.PICKER_BELGE_TURU_SATINALMA_TALEBI);
    }

    public boolean isLokalDAT() {
        return BelgeUtils.datMi(getBelgeTuru()) && LokalDAT.equalsIgnoreCase("E");
    }

    public boolean subeDATMi() {
        return BelgeUtils.datMi(getBelgeTuru()) && LokalDAT.equalsIgnoreCase("E") == false;
    }

    public boolean buSubedenGidenDAT() {
        return subeDATMi()
                && getBelgeTuru().equalsIgnoreCase(BLLConstants.PICKER_BELGE_TURU_DEPO_TRANSFERI_CIKIS)
                ;
    }

    public boolean buSubeyeGelenDAT() {
        return subeDATMi()
                && getBelgeTuru().equalsIgnoreCase(BLLConstants.PICKER_BELGE_TURU_DEPO_TRANSFERI_GIRIS)
                ;
    }

    public boolean onaydaMi() {
        if (BelgeUtils.datMi(getBelgeTuru())) {
            return DATOnayda.equalsIgnoreCase("E"); // apk 154 (eskiden lokal dat onaylansın parametresi şartı aranıyordu.)
        } else if (BelgeUtils.talepTeklifMi(getBelgeTuru()) || BelgeUtils.belgeSiparisMi(getBelgeTuru())) {
            return getBelgeTipi() == FaturaManager.SIPARIS_TIPI_ONAY_BEKLIYOR;
        }
        return false;
    }

    public boolean onaylandiMi() {
        if (BelgeUtils.datMi(getBelgeTuru())) {
            return DATOnaylandi.equalsIgnoreCase("E");
        } else if (BelgeUtils.talepTeklifMi(getBelgeTuru()) || BelgeUtils.belgeSiparisMi(getBelgeTuru())) {
            return getBelgeTipi() != FaturaManager.SIPARIS_TIPI_ONAY_BEKLIYOR;
        } else {
            return true;
        }
    }

    public void belgeOnayla(boolean onayla) {
        if (BelgeUtils.datMi(getBelgeTuru())) {
            DATOnayda = onayla ? "" : "E";
            DATOnaylandi = onayla ? "E" : "";
        } else if (BelgeUtils.belgeSiparisMi(getBelgeTuru())) {
            boolean ithalat = ExportTipi > 0;
            setNetsisBelgeTipi(onayla ? (ithalat ? FaturaManager.SIPARIS_TIPI_YURT_DISI : FaturaManager.SIPARIS_TIPI_YURT_ICI) : FaturaManager.SIPARIS_TIPI_ONAY_BEKLIYOR);
        } else if (BelgeUtils.talepTeklifMi(getBelgeTuru())) {
            boolean ithalat = C_YEDEK6.equalsIgnoreCase("E");
            setNetsisBelgeTipi(onayla ? (ithalat ? FaturaManager.SIPARIS_TIPI_YURT_DISI : FaturaManager.SIPARIS_TIPI_YURT_ICI) : FaturaManager.SIPARIS_TIPI_ONAY_BEKLIYOR);
        }
    }

    public String getCariAdi() {
        String result = "";
        if (CariAdi.isEmpty() == false)
            result = CariAdi;
        else if (datMi() == false && muhtelifCariMi())
            result = "[Muhtelif Cari]";
        else
            result = CariKodu;
        if (datMi() && (result.isEmpty() || result.equalsIgnoreCase(CariManager.MUHTELIF_CARI_KODU)) && TeslimCariKodu.isEmpty() == false)
            result = TeslimCariAdi;
        return result;
    }

    public String getTeslimCariAdi() {
        return TeslimCariAdi.isEmpty() ? TeslimCariKodu : TeslimCariAdi;
    }

    public String getProjeAdi() {
        return ProjeAdi.isEmpty() ? ProjeKodu : ProjeAdi;
    }

    public String getTarihString() {
        return DateTimeUtils.dateToString(Tarih);
    }

    public boolean dovizliMi() {
        return DovizTipi > 0;
    }

    public String getBoslukDovizAdi() {
        return DovizAdi.isEmpty() ? "" : " " + DovizAdi;
    }


    public String getPlasiyerAdi() {
        return PlasiyerAdi.isEmpty() ? PlasiyerKodu : PlasiyerAdi;
    }

    //

    public boolean eFaturaMi() {
        return faturaMi() && EFatura.equals("E");
    }

    public boolean efaturaBasariylaGonderildiMi() {
        return eFaturaMi() && EFaturaDurumKodu.equals(FaturaManager.EFATURA_DURUM_BASARIYLA_GONDERILDI);
    }

    public boolean efaturaTaslakMi() {
        return eFaturaMi() && EFaturaDurumKodu.equals(FaturaManager.EFATURA_DURUM_TASLAK);
    }

    public String getEFaturaSenaryoAdi() {
        return EBelgeManager.getSenaryoAdi(EFaturaSenaryo);
    }

    public boolean eFaturaRetMiEdildi() {
        return eFaturaMi() && EFaturaOnayDurumKodu.equals(EBelgeManager.ONAY_DURUMU_RET);
    }

    public boolean eIrsaliyeMi() {
        String belgeTuru = getBelgeTuru();
        boolean irsOrAmbarCikisOrDat = BelgeUtils.belgeIrsaliyeMi(belgeTuru) || BelgeUtils.datMi(belgeTuru) || BelgeUtils.ambarCikisMi(belgeTuru);
        return irsOrAmbarCikisOrDat && EIrsaliyeMi.equalsIgnoreCase("E");
    }

    public boolean eIrsaliyeCheckIsaretli() {
        return StringUtils.getSiradakiIlkDeger(EBelgeCheckBox, R_EIrsaliyeCheckBox).equalsIgnoreCase("E");
    }

    public boolean teklifRevizeEdilmisMi() {
        return TeklifSonrakiRevizeNo.isEmpty() == false;
    }

    //setters

    public void setYeniKayit(boolean b) {
        R_YeniKayit = b;
    }

    public void setIslemGuid(String islemID) {
        IslemID = islemID;
    }

    public String getIslemGuid() {
        return IslemID;
    }

    public void setRemoteTempBelgeMi(boolean remoteTempBelgeMi) {
        RemoteTempBelgeMi = remoteTempBelgeMi;
    }

    public void setIslemeBaslamaTarihi(Date islemeBaslamaTarihi) {
        IslemeBaslamaTarihi = islemeBaslamaTarihi;
    }

    public void setParamMap(Map<String, String> paramMap) {
        ParamMap = paramMap;
    }

    public void setKalemList(ArrayList<FaturaKalemResponseModel> kalemList) {
        KalemList = kalemList;
    }

    public void setTarih(Date tarih) {
        Tarih = tarih;
    }

    public void setTeslimTarihi(Date teslimTarihi) {
        TeslimTarihi = teslimTarihi;
    }

    public void setIstenilenTeslimTarihi(Date istenilenTeslimTarihi) {
        IstenilenTeslimTarihi = istenilenTeslimTarihi;
    }

    public void setKosulTarihi(Date kosulTarihi) {
        KosulTarihi = kosulTarihi;
    }

    public void setFisNo(String fisNo) {
        FisNo = fisNo;
    }

    public void setResmiBelgeNo(String resmiBelgeNo) {
        ResmiBelgeNo = resmiBelgeNo;
    }

    public void setPickerBelgeTuru(String pickerBelgeTuru) {
        PickerBelgeTuru = pickerBelgeTuru;
        this.R_PickerBelgeTuru = pickerBelgeTuru;
    }

    public void setAciklama(String aciklama) {
        Aciklama = aciklama;
    }

    public void setEkAciklama1(String ekAciklama1) {
        EkAciklama1 = ekAciklama1;
        R_EkAciklama1 = ekAciklama1;

    }

    public void setEkAciklama2(String ekAciklama2) {
        EkAciklama2 = ekAciklama2;
        R_EkAciklama2 = ekAciklama2;

    }

    public void setEkAciklama3(String ekAciklama3) {
        EkAciklama3 = ekAciklama3;
        R_EkAciklama3 = ekAciklama3;

    }

    public void setEkAciklama4(String ekAciklama4) {
        EkAciklama4 = ekAciklama4;
        R_EkAciklama4 = ekAciklama4;

    }

    public void setEkAciklama5(String ekAciklama5) {
        EkAciklama5 = ekAciklama5;
        R_EkAciklama5 = ekAciklama5;

    }

    public void setEkAciklama6(String ekAciklama6) {
        EkAciklama6 = ekAciklama6;
        R_EkAciklama6 = ekAciklama6;

    }

    public void setEkAciklama7(String ekAciklama7) {
        EkAciklama7 = ekAciklama7;
        R_EkAciklama7 = ekAciklama7;

    }

    public void setEkAciklama8(String ekAciklama8) {
        EkAciklama8 = ekAciklama8;
        R_EkAciklama8 = ekAciklama8;

    }

    public void setEkAciklama9(String ekAciklama9) {
        EkAciklama9 = ekAciklama9;
        R_EkAciklama9 = ekAciklama9;

    }

    public void setEkAciklama10(String ekAciklama10) {
        EkAciklama10 = ekAciklama10;
        R_EkAciklama10 = ekAciklama10;

    }

    public void setEkAciklama11(String ekAciklama11) {
        EkAciklama11 = ekAciklama11;
        R_EkAciklama11 = ekAciklama11;

    }

    public void setEkAciklama12(String ekAciklama12) {
        EkAciklama12 = ekAciklama12;
        R_EkAciklama12 = ekAciklama12;

    }

    public void setEkAciklama13(String ekAciklama13) {
        EkAciklama13 = ekAciklama13;
        R_EkAciklama13 = ekAciklama13;

    }

    public void setEkAciklama14(String ekAciklama14) {
        EkAciklama14 = ekAciklama14;
        R_EkAciklama14 = ekAciklama14;

    }

    public void setEkAciklama15(String ekAciklama15) {
        EkAciklama15 = ekAciklama15;
        R_EkAciklama15 = ekAciklama15;

    }

    public void setEkAciklama16(String ekAciklama16) {
        EkAciklama16 = ekAciklama16;
        R_EkAciklama16 = ekAciklama16;

    }

    public void setCariKodu(String cariKodu) {
        CariKodu = cariKodu;
    }

    public void setTeslimCariKodu(String teslimCariKodu) {
        TeslimCariKodu = teslimCariKodu;
    }

    public void setCariAdi(String cariAdi) {
        CariAdi = cariAdi;
    }

    public void setTopluDepo(int topluDepo) {
        TopluDepo = topluDepo;
        if (BelgeUtils.datMi(getBelgeTuru())) {
            R_CikisDepoKodu = topluDepo;
        }
    }

    public int getDepoKodu() {
        return TopluDepo;
    }


    public void setNetsisBelgeTipi(int netsisBelgeTipi) {
        NetsisBelgeTipi = netsisBelgeTipi;
        this.R_BelgeTipi = netsisBelgeTipi;
    }

    public void setVadeGunu(int vadeGunu) {
        VadeGunu = vadeGunu;
    }

    public void setGirisSubeKodu(int girisSubeKodu) {
        GirisSubeKodu = girisSubeKodu;
    }

    public void setLokalDAT(String lokalDAT) {
        LokalDAT = lokalDAT;
    }

    public void setProjeKodu(String projeKodu) {
        ProjeKodu = projeKodu;
    }

    public void setGenelIskonto1(double oran, double tutar) {
        this.GenelIskonto1T = tutar;
        this.R_GenelIskonto1T = tutar;
        this.R_GenelIskonto1O = oran;
    }

    public void setGenelIskonto2(double oran, double tutar) {
        this.GenelIskonto2T = tutar;
        this.R_GenelIskonto2T = tutar;
        this.R_GenelIskonto2O = oran;
    }

    public void setGenelIskonto3(double oran, double tutar) {
        this.GenelIskonto3T = tutar;
        this.R_GenelIskonto3T = tutar;
        this.R_GenelIskonto3O = oran;
    }

    public void setGENISK1_TIPI(int GENISK1_TIPI) {
        this.GENISK1_TIPI = GENISK1_TIPI;
    }

    public void setGENISK2_TIPI(int GENISK2_TIPI) {
        this.GENISK2_TIPI = GENISK2_TIPI;
    }

    public void setGENISK3_TIPI(int GENISK3_TIPI) {
        this.GENISK3_TIPI = GENISK3_TIPI;
    }

    public void setKdvDahil(boolean isDahil) {
        KdvDahil = isDahil ? "E" : "H";
        R_KdvDahilMi = isDahil;
    }

    public void setOzelKod1(String ozelKod1) {
        OzelKod1 = ozelKod1;
    }

    public void setOzelKod2(String ozelKod2) {
        OzelKod2 = ozelKod2;
    }

    public void setKosulKodu(String kosulKodu) {
        KosulKodu = kosulKodu;
    }

    public void setExportTipi(int exportTipi) {
        ExportTipi = exportTipi;
    }

    public void setExportRefNo(String exportRefNo) {
        ExportRefNo = exportRefNo;
        R_ExportRefNo = exportRefNo;
    }

    public String getExportRefNo() {
        return StringUtils.getSiradakiIlkDeger(ExportRefNo, R_ExportRefNo);
    }

    public void setMasrafKodu(String masrafKodu) {
        MasrafKodu = masrafKodu;
    }

    public void setCikisYeriTipi(String cikisYeriTipi) {
        CikisYeriTipi = cikisYeriTipi;
    }

    public void setAmbarHareketTuru(String ambarHareketTuru) {
        AmbarHareketTuru = ambarHareketTuru;
    }

    public void setKasaKodu(String kasaKodu) {
        KasaKodu = kasaKodu;
    }

    public void setKdvTutari(double kdvTutari) {
        KdvTutari = kdvTutari;
    }

    public void setGenelToplam(double genelToplam) {
        GenelToplam = genelToplam;
    }

    public void setDovizTipi(int dovizTipi) {
        DovizTipi = dovizTipi;
    }

    public void setEkMaliyet1Tutari(double ekMaliyet1Tutari) {
        EkMaliyet1Tutari = ekMaliyet1Tutari;
    }

    public void setEkMaliyet2Tutari(double ekMaliyet2Tutari) {
        EkMaliyet2Tutari = ekMaliyet2Tutari;
    }

    public void setEkMaliyet3Tutari(double ekMaliyet3Tutari) {
        EkMaliyet3Tutari = ekMaliyet3Tutari;
    }

    public void setPlasiyerKodu(String plasiyerKodu) {
        PlasiyerKodu = plasiyerKodu;
    }


    public void setEFaturaSenaryo(String s) {
        this.EFaturaSenaryo = s;
        this.R_EFaturaSenaryoTipi = s;
    }

    public void setEFatIstisnaKodu(int value) {
        this.EFatIstisnaKodu = value;
        this.R_EFaturaOzelKod = value;
    }

    public void setEIrsBilgiModel(EIrsaliyeBilgiModel EIrsBilgiModel) {
        this.EIrsBilgiModel = EIrsBilgiModel;
    }


    public void setHtmlEkAciklama(String htmlEkAciklama) {
        HtmlEkAciklama = htmlEkAciklama;
    }

    public void setODEME_KODU(String ODEME_KODU) {
        this.ODEME_KODU = ODEME_KODU;
    }

    public void setKAPATILMIS(String KAPATILMIS) {
        this.KAPATILMIS = KAPATILMIS;
    }

    public void setF_YEDEK4(double f_YEDEK4) {
        F_YEDEK4 = f_YEDEK4;
    }

    public void setMiktar(double miktar) {
        Miktar = miktar;
    }

    public void setUretimeMalToplamaID(int uretimeMalToplamaID) {
        UretimeMalToplamaID = uretimeMalToplamaID;
    }

    public void setKontrolAciklama(String kontrolAciklama) {
        KontrolAciklama = kontrolAciklama;
    }

    public void setIsEmriNo(String isEmriNo) {
        IsEmriNo = isEmriNo;
    }

    public void setHedefTopluDepo(int value) {
        this.HedefDepo = value;
        this.R_GirisDepoKodu = value;
    }

    public int getHedefDepo() {
        if (HedefDepo != 0) {
            return HedefDepo;
        } else {
            return R_GirisDepoKodu;
        }
    }

    public void setCikisDepo(int value) {
        R_CikisDepoKodu = value;
    }

    public void setGirisDepo(int value) {
        R_GirisDepoKodu = value;
    }

    public void setMevcutBelgeNo(String value) {
        R_MevcutBelgeNo = value;
    }

    public void setMevcutCariKodu(String value) {
        R_MevcutCariKodu = value;
    }

    public void setMusSiptenSaticiSipIslemi(boolean value) {
        R_MusSiptenSaticiSipIslemi = value;
    }

    public void setEFattanAlisFatIslemi(boolean value) {
        R_EFattanAlisFatIslemi = value;
    }

    public void setEBelgeZarfID(String value) {
        this.R_EBelgeZarfID = value;
    }

    public void setEFaturaIncKeyNo(int value) {
        this.R_EFaturaIncKeyNo = value;
    }

    public void setEIrsaliyeIsaretli(boolean value) {
        this.R_EIrsaliyeCheckBox = value ? "E" : "";
        this.EBelgeCheckBox = value ? "E" : "";
    }

    public void setMuhtelifCariModel(CariRequestModel cariModel) {
        this.R_MuhtelifCariRequest = cariModel;
    }

    public void setTeklifRevizeIslemi(boolean b) {
        this.R_TeklifRevizeIslemi = b;
    }

    public void addKalemRequestModel(FaturaKalemResponseModel model) {
        if (this.R_ListKalemler == null) {
            this.R_ListKalemler = new ArrayList<>();
        }
        R_ListKalemler.add(model);
    }

    public void setIslemKodu(int value) {
        this.R_IslemKodu = value;
    }

    public int getIslemKodu() {
        return this.R_IslemKodu;
    }

    public void setYeniCariKodu(String value) {
        this.R_YeniCariKodu = value;
    }

    public void setYeniBelgeNo(String value) {
        this.R_YeniBelgeNo = value;
    }

    public boolean getIsYeniKayit() {
        return R_YeniKayit;
    }

    public String getMevcutBelgeNo() {
        return R_MevcutBelgeNo;
    }

    public String getBelgeTuru() {
        return StringUtils.getSiradakiIlkDeger(PickerBelgeTuru, R_PickerBelgeTuru);
    }

    public void setIrsaliyedenFaturaIslemi(boolean value) {
        R_IrsaliyedenFaturaIslemi = value;
    }

    public double getGenelIskonto1T() {
        if (this.R_GenelIskonto1T != 0) {
            return R_GenelIskonto1T;
        } else {
            return GenelIskonto1T;
        }
    }

    public double getGenelIskonto2T() {
        if (this.R_GenelIskonto2T != 0) {
            return R_GenelIskonto2T;
        } else {
            return GenelIskonto2T;
        }
    }

    public double getGenelIskonto3T() {
        if (this.R_GenelIskonto3T != 0) {
            return R_GenelIskonto3T;
        } else {
            return GenelIskonto3T;
        }
    }

    public double getGenelIskonto1O() {
        return R_GenelIskonto1O;
    }

    public double getGenelIskonto2O() {
        return R_GenelIskonto2O;
    }

    public double getGenelIskonto3O() {
        return R_GenelIskonto3O;
    }

    public String getEfaturaSenaryo() {
        return StringUtils.getSiradakiIlkDeger(EFaturaSenaryo, R_EFaturaSenaryoTipi);
    }

    public String getEkAciklama1() {
        return StringUtils.getSiradakiIlkDeger(EkAciklama1, R_EkAciklama1);
    }

    public String getEkAciklama2() {
        return StringUtils.getSiradakiIlkDeger(EkAciklama2, R_EkAciklama2);
    }

    public String getEkAciklama3() {
        return StringUtils.getSiradakiIlkDeger(EkAciklama3, R_EkAciklama3);
    }

    public String getEkAciklama4() {
        return StringUtils.getSiradakiIlkDeger(EkAciklama4, R_EkAciklama4);
    }

    public String getEkAciklama5() {
        return StringUtils.getSiradakiIlkDeger(EkAciklama5, R_EkAciklama5);
    }

    public String getEkAciklama6() {
        return StringUtils.getSiradakiIlkDeger(EkAciklama6, R_EkAciklama6);
    }

    public String getEkAciklama7() {
        return StringUtils.getSiradakiIlkDeger(EkAciklama7, R_EkAciklama7);
    }

    public String getEkAciklama8() {
        return StringUtils.getSiradakiIlkDeger(EkAciklama8, R_EkAciklama8);
    }

    public String getEkAciklama9() {
        return StringUtils.getSiradakiIlkDeger(EkAciklama9, R_EkAciklama9);
    }

    public String getEkAciklama10() {
        return StringUtils.getSiradakiIlkDeger(EkAciklama10, R_EkAciklama10);
    }

    public String getEkAciklama11() {
        return StringUtils.getSiradakiIlkDeger(EkAciklama11, R_EkAciklama11);
    }

    public String getEkAciklama12() {
        return StringUtils.getSiradakiIlkDeger(EkAciklama12, R_EkAciklama12);
    }

    public String getEkAciklama13() {
        return StringUtils.getSiradakiIlkDeger(EkAciklama13, R_EkAciklama13);
    }

    public String getEkAciklama14() {
        return StringUtils.getSiradakiIlkDeger(EkAciklama14, R_EkAciklama14);
    }

    public String getEkAciklama15() {
        return StringUtils.getSiradakiIlkDeger(EkAciklama15, R_EkAciklama15);
    }

    public String getEkAciklama16() {
        return StringUtils.getSiradakiIlkDeger(EkAciklama16, R_EkAciklama16);
    }

    public boolean isTempSipKalemListSipNoVar(String sipNo) {
        if (TempSipKalemOrjList != null) {
            for (FaturaKalemResponseModel m : TempSipKalemOrjList) {
                if (m.FisNo.equalsIgnoreCase(sipNo)) {
                    return true;
                }
            }
        }
        return false;
    }

    public boolean isTeslimCariFarkli() {
        return TeslimCariKodu.isEmpty() == false && StringUtils.isEqualsTR(TeslimCariKodu, CariKodu) == false;
    }

    public boolean isTempBelge() {
        return this.RemoteTempBelgeMi || TempKayitTipi > 0;
    }

    public String getTempBelgeEtiketi() {
        if (RemoteTempBelgeMi) {
            return RemoteTempBelgeEtiketi.isEmpty() == false ? RemoteTempBelgeEtiketi : BLLConstants.getTempKayitAdi(BLLConstants.TEMP_KAYIT_TIPI_REMOTE_BELGE);
        } else {
            return BLLConstants.getTempKayitAdi(this.TempKayitTipi);
        }
    }

    public boolean isTempLocalYarim() {
        return this.TempKayitTipi == BLLConstants.TEMP_KAYIT_TIPI_LOCAL_YARIM;
    }

    public boolean isTempLocalTamBelge() {
        return this.TempKayitTipi == BLLConstants.TEMP_KAYIT_TIPI_LOCAL_BELGE;
    }

    public boolean isTempRemoteBelge() {
        return this.TempKayitTipi == BLLConstants.TEMP_KAYIT_TIPI_REMOTE_BELGE;
    }

    public boolean isTempLocalMerkezeGonderildi() {
        return this.TempKayitTipi == BLLConstants.TEMP_KAYIT_TIPI_LOCAL_MERKEZE_GONDERILDI;
    }


}



