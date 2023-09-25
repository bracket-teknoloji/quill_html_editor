using System;
using System.Collections.Generic;
using System.Diagnostics;
using System.Globalization;
using System.IO;
using System.Linq;
using System.Reflection;
using System.Runtime.CompilerServices;
using System.Security;
using System.Text;
using System.Threading.Tasks;
using Microsoft.VisualBasic;
using DevExpress.XtraBars.Docking2010;
using DevExpress.XtraEditors;

public class Uc_YapilandirmaSecimi
{
    private string StokKodu { get; set; } = string.Empty;
    public string SecilenYapKod { get; set; } = string.Empty;
    public string SecilenYapAcik { get; set; } = string.Empty;

    public Uc_YapilandirmaSecimi()
    {
        InitializeComponent();
    }

    private DataTable DtOzellik = null
    private DataTable DtYap = null
    public bool BilgileriGetir(string StokKodu)
    {
        this.StokKodu = StokKodu;

        string SQ = "USE [" + RegeditIslemleri.AktifSirket + "];" + Constants.vbCrLf;
        SQ += "DECLARE @STOK_KODU AS NVARCHAR(35) = " + SqlGuvenlikStrN(StokKodu) + Constants.vbCrLf;
        SQ += "DECLARE @TABLO AS TABLE(SIRA INT, OZELLIK_KODU VARCHAR(8), ACIKLAMA VARCHAR(50))" + Constants.vbCrLf + Constants.vbCrLf;

        SQ += "INSERT INTO @TABLO" + Constants.vbCrLf;
        SQ += "SELECT P.SIRA, P.OZELLIK_KODU, O.ACIKLAMA" + Constants.vbCrLf;
        SQ += "FROM VNF_YAPPROF AS P" + Constants.vbCrLf;
        SQ += "INNER JOIN VNF_YAPOZMAS AS O ON O.KOD = P.OZELLIK_KODU" + Constants.vbCrLf;
        SQ += "WHERE P.STOK_KODU = @STOK_KODU" + Constants.vbCrLf + Constants.vbCrLf;

        // DtOzellik
        SQ += "SELECT SIRA, OZELLIK_KODU, ACIKLAMA" + Constants.vbCrLf;
        SQ += "FROM @TABLO" + Constants.vbCrLf;
        SQ += "WHERE OZELLIK_KODU IN (SELECT VNF_YAPTRA.KOD" + Constants.vbCrLf;
        SQ += "            FROM VNF_YAPMAS" + Constants.vbCrLf;
        SQ += "            INNER JOIN VNF_YAPTRA ON VNF_YAPTRA.YAPKOD = VNF_YAPMAS.YAPKOD" + Constants.vbCrLf;
        SQ += "            WHERE VNF_YAPMAS.STOK_KODU = @STOK_KODU)" + Constants.vbCrLf;
        SQ += "ORDER BY SIRA" + Constants.vbCrLf + Constants.vbCrLf;

        // DtYap
        SQ += "SELECT VNF_YAPTRA.YAPKOD, VNF_YAPMAS.YAPACIK, VNF_YAPTRA.KOD, VNF_YAPOZMAS.ACIKLAMA AS KOD_ACIKLAMA, VNF_YAPTRA.DEGER, VNF_YAPOZTRA.DEGER_ACIKLAMA, VNF_YAPPROF.SIRA AS OZELLIK_SIRA" + Constants.vbCrLf;
        SQ += "FROM VNF_YAPMAS" + Constants.vbCrLf;
        SQ += "INNER JOIN VNF_YAPTRA ON VNF_YAPTRA.YAPKOD = VNF_YAPMAS.YAPKOD" + Constants.vbCrLf;
        SQ += "INNER JOIN VNF_YAPOZMAS ON VNF_YAPOZMAS.KOD = VNF_YAPTRA.KOD" + Constants.vbCrLf;
        SQ += "INNER JOIN VNF_YAPOZTRA ON VNF_YAPOZTRA.KOD = VNF_YAPOZMAS.KOD AND VNF_YAPOZTRA.DEGER_KODU = VNF_YAPTRA.DEGER" + Constants.vbCrLf;
        SQ += "INNER JOIN VNF_YAPPROF ON VNF_YAPPROF.STOK_KODU = VNF_YAPMAS.STOK_KODU AND VNF_YAPPROF.OZELLIK_KODU = VNF_YAPTRA.KOD" + Constants.vbCrLf;
        SQ += "WHERE VNF_YAPMAS.STOK_KODU = @STOK_KODU" + Constants.vbCrLf;
        List<DataTable> DtListe = Sql_TabloListe(SQ);
        if (DtListe == null)
            return false;

        DtOzellik = DtListe[0];
        DtYap = DtListe[1];
        if (DtOzellik.Rows.Count > 0)
        {
            ListeSecim.Clear();
            Doldur(); return true;
        }
        else
        {
            NetFectUyari(StokKodu + " ürünü için özellik tanımları bulunamadı !"); return false;
        }
    }

    private List<ComboBoxKodTanimClassStr> ListeSecim = new List<ComboBoxKodTanimClassStr>();


    private bool SecimListesindeVarMi(string YapKodu)
    {
        foreach (var item in ListeSecim)
        {
            DtYap.DefaultView.RowFilter = "YAPKOD = " + SqlGuvenlik(YapKodu) + " AND KOD = " + SqlGuvenlik(item.Kod) + " AND DEGER = " + SqlGuvenlik(item.Tanim);
            if (DtYap.DefaultView.Count <= 0)
                return false;
        }
        return true;
    }


    private List<ComboBoxKodTanimClassStr> AltKodlariGetir()
    {
        List<ComboBoxKodTanimClassStr> Liste = new List<ComboBoxKodTanimClassStr>();
        int Index;
        foreach (var rowYap in DtYap.Rows)
        {
            if (!StrEqual(AktifOzellikKodu, NULADR(rowYap, "KOD")))
                continue;
            Index = Liste.FindIndex(i =>
            {
                return StrEqual(i.Kod, NULADR(rowYap, "DEGER"));
            });
            if (Index >= 0 && (DtOzellik.Rows.Count - 1) > ListeSecim.Count)
            {
                if (SecimListesindeVarMi(NULADR(rowYap, "YAPKOD")))
                {
                    {
                        var withBlock = (List<ComboBoxKodTanimClassStr>)Liste[Index]["01"];
                        if (withBlock.FindIndex(i =>
                        {
                            return StrEqual(i.Kod, NULADR(rowYap, "YAPKOD"));
                        }) < 0)
                            withBlock.Add(new ComboBoxKodTanimClassStr(NULADR(rowYap, "YAPKOD"), NULADR(rowYap, "YAPACIK")));
                    }
                }
                continue;
            }
            if (!SecimListesindeVarMi(NULADR(rowYap, "YAPKOD")))
                continue;
            Liste.Add(new ComboBoxKodTanimClassStr(NULADR(rowYap, "DEGER"), NULADR(rowYap, "DEGER_ACIKLAMA")));
            {
                var withBlock = Liste[Liste.Count - 1];
                withBlock.O1 = new List<ComboBoxKodTanimClassStr>();
                withBlock.O1.Add(new ComboBoxKodTanimClassStr(NULADR(rowYap, "YAPKOD"), NULADR(rowYap, "YAPACIK")));
            }
        }

        return Liste;
    }

    private string AktifOzellikKodu()
    {
        return (ComboBoxKodTanimClassStr)TG.Tag.Kod;
    }

    private void ListeOzellikEkle(string Deger)
    {
        int Index = ListeSecim.FindIndex(i =>
        {
            return StrEqual(i.Kod, AktifOzellikKodu);
        });
        if (Index >= 0)
            ListeSecim[Index].Tanim = Deger;
        else
            ListeSecim.Add(new ComboBoxKodTanimClassStr(AktifOzellikKodu, Deger));
    }

    private void Doldur()
    {
        if (!string.IsNullOrEmpty(NULA(DtOzellik, ListeSecim.Count, "ACIKLAMA")))
            TG.Text = NULA(DtOzellik, ListeSecim.Count, "ACIKLAMA");
        else
            TG.Text = NULA(DtOzellik, ListeSecim.Count, "OZELLIK_KODU");
        TG.Tag = new ComboBoxKodTanimClassStr(NULA(DtOzellik, ListeSecim.Count, "OZELLIK_KODU"), NULA(DtOzellik, ListeSecim.Count, "ACIKLAMA"));

        TG.Items.Clear();
        DevExpress.XtraEditors.TileItem Item;
        if (ListeSecim.Count > 0)
        {
            Item = new DevExpress.XtraEditors.TileItem();
            Item.ItemClick += () =>
            {
                SecilenYapKod = string.Empty; SecilenYapAcik = string.Empty;
                for (int X = ListeSecim.Count - 1; X >= 0; X += -1)
                {
                    if (StrEqual(ListeSecim[X].Kod, AktifOzellikKodu))
                        ListeSecim.Remove(ListeSecim[X]);
                }
                ListeSecim.Remove(ListeSecim[ListeSecim.Count - 1]);
                Doldur();
            };
            TG.Items.Add(Item);
        }
        List<ComboBoxKodTanimClassStr> ListeTekOlan;
        foreach (var listeYap in AltKodlariGetir())
        {
            Item = new DevExpress.XtraEditors.TileItem();
            Item.Tag = listeYap;
            if (!string.IsNullOrEmpty(listeYap.Tanim))
                Item.Text = listeYap.Tanim;
            else
                Item.Text = listeYap.Kod;
            Item.ItemSize = DevExpress.XtraEditors.TileItemSize.Medium;
            Item.AppearanceItem.Normal.BackColor = RenkVer();
            Item.AppearanceItem.Normal.BorderColor = RenkVer();
            ListeTekOlan = new List<ComboBoxKodTanimClassStr>();
            foreach (var i in (List<ComboBoxKodTanimClassStr>)listeYap.O1)
            {
                DtYap.DefaultView.RowFilter = "YAPKOD = " + SqlGuvenlik(i.Kod);
                if (DtYap.DefaultView.Count == 1)
                    ListeTekOlan.Add(i);
            }

            bool Secilebilir = false;
            if ((List<ComboBoxKodTanimClassStr>)listeYap.O1.Count == 1)
            {
                DtYap.DefaultView.RowFilter = "YAPKOD = " + SqlGuvenlik((List<ComboBoxKodTanimClassStr>)listeYap.O1[0].Kod);
                if (DtYap.DefaultView.Count == ListeSecim.Count + 1)
                {
                    Item.Text += Constants.vbCrLf + Constants.vbCrLf + (List<ComboBoxKodTanimClassStr>)listeYap.O1[0].Kod; Secilebilir = true;
                }
            }
            else if (ListeTekOlan.Count == 1)
            {
                Item.Text += Constants.vbCrLf + Constants.vbCrLf + ListeTekOlan[0].Kod;
                Secilebilir = true;
            }

            if ((List<ComboBoxKodTanimClassStr>)listeYap.O1.Count > 1)
            {
                Item.ImageOptions.SvgImage = My.Resources.actions_arrow2right;
                Item.ImageAlignment = TileItemContentAlignment.BottomRight;
            }
            else if (!Secilebilir && ListeSecim.Count < DtOzellik.Rows.Count)
            {
                Item.ImageOptions.SvgImage = My.Resources.actions_arrow2right;
                Item.ImageAlignment = TileItemContentAlignment.BottomRight;
            }

            Item.ItemClick += (object sender, DevExpress.XtraEditors.TileItemEventArgs e) =>
            {
                SecilenYapKod = string.Empty; SecilenYapAcik = string.Empty;
                foreach (var n in e.Item.Group.Items)
                {
                    if (n == e.Item)
                        continue;
                    if (n.Checked)
                        n.Checked = false;
                }
                TC_ItemCheckedChanged();

                ComboBoxKodTanimClassStr Tag = (ComboBoxKodTanimClassStr)e.Item.Tag;
                List<ComboBoxKodTanimClassStr> ListeKod = Tag.O1;
                ListeOzellikEkle(Tag.Kod);

                ListeTekOlan = new List<ComboBoxKodTanimClassStr>();
                foreach (var i in ListeKod)
                {
                    DtYap.DefaultView.RowFilter = "YAPKOD = " + SqlGuvenlik(i.Kod);
                    if (DtYap.DefaultView.Count == 1)
                        ListeTekOlan.Add(i);
                }
                if (ListeKod.Count == 1)
                {
                    DtYap.DefaultView.RowFilter = "YAPKOD = " + SqlGuvenlik(ListeKod[0].Kod);
                    if (DtYap.DefaultView.Count > ListeSecim.Count)
                        Doldur();
                    else
                    {
                        if (!e.Item.Checked)
                            e.Item.Checked = true;
                        SecilenYapKod = ListeKod[0].Kod; SecilenYapAcik = ListeKod[0].Tanim; TC_ItemCheckedChanged();
                    }
                }
                else if (ListeTekOlan.Count == 1)
                {
                    if (!e.Item.Checked)
                        e.Item.Checked = true;
                    SecilenYapKod = ListeTekOlan[0].Kod; SecilenYapAcik = ListeTekOlan[0].Tanim; TC_ItemCheckedChanged();
                }
                else
                    Doldur();
            };
            TG.Items.Add(Item);
        }
        TC_ItemCheckedChanged();
    }

    private void WUP_ButonTiklandi(IButton Buton)
    {
        if (Buton == WUP.Butonlar(NetFectUIButtonPanel.EButonlar.Kaydet))
            (object)this.ParentForm.DialogResult = DialogResult.OK;
        else
            (object)this.ParentForm.DialogResult = DialogResult.Cancel;
    }

    private void TC_ItemCheckedChanged()
    {
        int Sayi = 0;
        foreach (var i in TG.Items)
        {
            if (i.Checked)
                Sayi += 1;
        }

        WUP.ButtonEnable(NetFectUIButtonPanel.EButonlar.Kaydet) = Sayi > 0;
    }
}
