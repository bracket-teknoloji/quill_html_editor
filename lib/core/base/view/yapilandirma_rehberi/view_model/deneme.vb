Imports DevExpress.XtraBars.Docking2010
Imports DevExpress.XtraEditors

Public Class Uc_YapilandirmaSecimi

  Private Property StokKodu As String = String.Empty
  Public Property SecilenYapKod As String = String.Empty
  Public Property SecilenYapAcik As String = String.Empty

  Public Sub New()
    Call InitializeComponent()
  End Sub

  Private DtOzellik As DataTable = Nothing
  Private DtYap As DataTable = Nothing
  Public Function BilgileriGetir(StokKodu As String) As Boolean
    Me.StokKodu = StokKodu

    Dim SQ As String = "USE [" & RegeditIslemleri.AktifSirket & "];" & vbCrLf
    SQ &= "DECLARE @STOK_KODU AS NVARCHAR(35) = " & SqlGuvenlikStrN(StokKodu) & vbCrLf
    SQ &= "DECLARE @TABLO AS TABLE(SIRA INT, OZELLIK_KODU VARCHAR(8), ACIKLAMA VARCHAR(50))" & vbCrLf & vbCrLf

    SQ &= "INSERT INTO @TABLO" & vbCrLf
    SQ &= "SELECT P.SIRA, P.OZELLIK_KODU, O.ACIKLAMA" & vbCrLf
    SQ &= "FROM VNF_YAPPROF AS P" & vbCrLf
    SQ &= "INNER JOIN VNF_YAPOZMAS AS O ON O.KOD = P.OZELLIK_KODU" & vbCrLf
    SQ &= "WHERE P.STOK_KODU = @STOK_KODU" & vbCrLf & vbCrLf

    ' DtOzellik
    SQ &= "SELECT SIRA, OZELLIK_KODU, ACIKLAMA" & vbCrLf
    SQ &= "FROM @TABLO" & vbCrLf
    SQ &= "WHERE OZELLIK_KODU IN (SELECT VNF_YAPTRA.KOD" & vbCrLf
    SQ &= "            FROM VNF_YAPMAS" & vbCrLf
    SQ &= "            INNER JOIN VNF_YAPTRA ON VNF_YAPTRA.YAPKOD = VNF_YAPMAS.YAPKOD" & vbCrLf
    SQ &= "            WHERE VNF_YAPMAS.STOK_KODU = @STOK_KODU)" & vbCrLf
    SQ &= "ORDER BY SIRA" & vbCrLf & vbCrLf

    ' DtYap
    SQ &= "SELECT VNF_YAPTRA.YAPKOD, VNF_YAPMAS.YAPACIK, VNF_YAPTRA.KOD, VNF_YAPOZMAS.ACIKLAMA AS KOD_ACIKLAMA, VNF_YAPTRA.DEGER, VNF_YAPOZTRA.DEGER_ACIKLAMA, VNF_YAPPROF.SIRA AS OZELLIK_SIRA" & vbCrLf
    SQ &= "FROM VNF_YAPMAS" & vbCrLf
    SQ &= "INNER JOIN VNF_YAPTRA ON VNF_YAPTRA.YAPKOD = VNF_YAPMAS.YAPKOD" & vbCrLf
    SQ &= "INNER JOIN VNF_YAPOZMAS ON VNF_YAPOZMAS.KOD = VNF_YAPTRA.KOD" & vbCrLf
    SQ &= "INNER JOIN VNF_YAPOZTRA ON VNF_YAPOZTRA.KOD = VNF_YAPOZMAS.KOD AND VNF_YAPOZTRA.DEGER_KODU = VNF_YAPTRA.DEGER" & vbCrLf
    SQ &= "INNER JOIN VNF_YAPPROF ON VNF_YAPPROF.STOK_KODU = VNF_YAPMAS.STOK_KODU AND VNF_YAPPROF.OZELLIK_KODU = VNF_YAPTRA.KOD" & vbCrLf
    SQ &= "WHERE VNF_YAPMAS.STOK_KODU = @STOK_KODU" & vbCrLf
    Dim DtListe As List(Of DataTable) = Sql_TabloListe(SQ)
    If DtListe Is Nothing Then Return False

    DtOzellik = DtListe(0)
    DtYap = DtListe(1)
    If DtOzellik.Rows.Count > 0 Then
      Call ListeSecim.Clear()
      Call Doldur() : Return True
    Else
      Call NetFectUyari(StokKodu & " ürünü için özellik tanımları bulunamadı !") : Return False
    End If
  End Function

  Private ListeSecim As New List(Of ComboBoxKodTanimClassStr)
  Private Function SecimListesindeVarMi(YapKodu As String) As Boolean
    For Each item In ListeSecim
      DtYap.DefaultView.RowFilter = "YAPKOD = " & SqlGuvenlik(YapKodu) & " AND KOD = " & SqlGuvenlik(item.Kod) & " AND DEGER = " & SqlGuvenlik(item.Tanim)
      If DtYap.DefaultView.Count <= 0 Then Return False
    Next
    Return True
  End Function
  Private Function AltKodlariGetir() As List(Of ComboBoxKodTanimClassStr)
    Dim Liste As New List(Of ComboBoxKodTanimClassStr), Index As Integer
    For Each rowYap In DtYap.Rows
      If Not StrEqual(AktifOzellikKodu, NULADR(rowYap, "KOD")) Then Continue For
      Index = Liste.FindIndex(Function(i)
                    Return StrEqual(i.Kod, NULADR(rowYap, "DEGER"))
                  End Function)
      If Index >= 0 AndAlso (DtOzellik.Rows.Count - 1) > ListeSecim.Count Then
        If SecimListesindeVarMi(NULADR(rowYap, "YAPKOD")) Then
          With CType(Liste(Index).O1, List(Of ComboBoxKodTanimClassStr))
            If .FindIndex(Function(i)
                      Return StrEqual(i.Kod, NULADR(rowYap, "YAPKOD"))
                    End Function) < 0 Then Call .Add(New ComboBoxKodTanimClassStr(NULADR(rowYap, "YAPKOD"), NULADR(rowYap, "YAPACIK")))
          End With
        End If
        Continue For
      End If
      If Not SecimListesindeVarMi(NULADR(rowYap, "YAPKOD")) Then Continue For
      Call Liste.Add(New ComboBoxKodTanimClassStr(NULADR(rowYap, "DEGER"), NULADR(rowYap, "DEGER_ACIKLAMA")))
      With Liste(Liste.Count - 1)
        .O1 = New List(Of ComboBoxKodTanimClassStr)
        Call .O1.Add(New ComboBoxKodTanimClassStr(NULADR(rowYap, "YAPKOD"), NULADR(rowYap, "YAPACIK")))
      End With
    Next

    'If (DtOzellik.Rows.Count - 1) = ListeSecim.Count Then
    '  Dim Liste2 As New List(Of ComboBoxKodTanimClassStr)
    '  For Each item In Liste
    '    Do While True
    '      If item.O1.Count > 1 Then
    '        Call Liste2.Add(New ComboBoxKodTanimClassStr(item.Kod, item.Tanim) With {.O1 = New List(Of ComboBoxKodTanimClassStr) From {New ComboBoxKodTanimClassStr(item.O1(item.O1.Count - 1).Kod, item.O1(item.O1.Count - 1).Tanim)}})
    '        Call item.O1.Remove(item.O1(item.O1.Count - 1))
    '      Else
    '        Exit Do
    '      End If
    '    Loop
    '  Next
    '  If Liste2.Count > 0 Then Call Liste.AddRange(Liste2)
    ' End If
    Return Liste
  End Function

  Private Function AktifOzellikKodu() As String
    Return CType(TG.Tag, ComboBoxKodTanimClassStr).Kod
  End Function

  Private Sub ListeOzellikEkle(Deger As String)
    Dim Index As Integer = ListeSecim.FindIndex(Function(i)
                            Return StrEqual(i.Kod, AktifOzellikKodu)
                          End Function)
    If Index >= 0 Then
      ListeSecim(Index).Tanim = Deger
    Else
      Call ListeSecim.Add(New ComboBoxKodTanimClassStr(AktifOzellikKodu, Deger))
    End If
  End Sub

  Private Sub Doldur()
    If Not String.IsNullOrEmpty(NULA(DtOzellik, ListeSecim.Count, "ACIKLAMA")) Then
      TG.Text = NULA(DtOzellik, ListeSecim.Count, "ACIKLAMA")
    Else
      TG.Text = NULA(DtOzellik, ListeSecim.Count, "OZELLIK_KODU")
    End If
    TG.Tag = New ComboBoxKodTanimClassStr(NULA(DtOzellik, ListeSecim.Count, "OZELLIK_KODU"), NULA(DtOzellik, ListeSecim.Count, "ACIKLAMA"))

    Call TG.Items.Clear()
    Dim Item As DevExpress.XtraEditors.TileItem
    If ListeSecim.Count > 0 Then
      Item = New DevExpress.XtraEditors.TileItem
      'Item.Text = "Geri"
      Item.AllowGlyphSkinning = DevExpress.Utils.DefaultBoolean.True
      Item.AppearanceItem.Normal.BackColor = System.Drawing.Color.DimGray
      Item.AppearanceItem.Normal.BorderColor = System.Drawing.Color.DimGray
      Item.ImageOptions.SvgImage = My.Resources.actions_arrow2left
      Item.ImageOptions.SvgImageSize = New System.Drawing.Size(64, 64)
      Item.ImageAlignment = TileItemContentAlignment.MiddleCenter
      AddHandler Item.ItemClick, Sub()
                       SecilenYapKod = String.Empty : SecilenYapAcik = String.Empty
                       For X As Integer = ListeSecim.Count - 1 To 0 Step -1
                         If StrEqual(ListeSecim(X).Kod, AktifOzellikKodu) Then Call ListeSecim.Remove(ListeSecim(X))
                       Next
                       Call ListeSecim.Remove(ListeSecim(ListeSecim.Count - 1))
                       Call Doldur()
                     End Sub
      Call TG.Items.Add(Item)
    End If