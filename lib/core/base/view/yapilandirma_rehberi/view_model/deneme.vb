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
    Dim ListeTekOlan As List(Of ComboBoxKodTanimClassStr)
    For Each listeYap In AltKodlariGetir()
      Item = New DevExpress.XtraEditors.TileItem
      Item.Tag = listeYap
      If Not String.IsNullOrEmpty(listeYap.Tanim) Then
        Item.Text = listeYap.Tanim
      Else
        Item.Text = listeYap.Kod
      End If
      Item.ItemSize = DevExpress.XtraEditors.TileItemSize.Medium
      Item.AppearanceItem.Normal.BackColor = RenkVer()
      Item.AppearanceItem.Normal.BorderColor = RenkVer()
      ListeTekOlan = New List(Of ComboBoxKodTanimClassStr)
      For Each i In CType(listeYap.O1, List(Of ComboBoxKodTanimClassStr))
        DtYap.DefaultView.RowFilter = "YAPKOD = " & SqlGuvenlik(i.Kod)
        If DtYap.DefaultView.Count = 1 Then Call ListeTekOlan.Add(i)
      Next

      Dim Secilebilir As Boolean = False
      If CType(listeYap.O1, List(Of ComboBoxKodTanimClassStr)).Count = 1 Then
        DtYap.DefaultView.RowFilter = "YAPKOD = " & SqlGuvenlik(CType(listeYap.O1, List(Of ComboBoxKodTanimClassStr))(0).Kod)
        If DtYap.DefaultView.Count = ListeSecim.Count + 1 Then Item.Text &= vbCrLf & vbCrLf & CType(listeYap.O1, List(Of ComboBoxKodTanimClassStr))(0).Kod : Secilebilir = True
      ElseIf ListeTekOlan.Count = 1 Then
        Item.Text &= vbCrLf & vbCrLf & ListeTekOlan(0).Kod
        Secilebilir = True
      End If

      If CType(listeYap.O1, List(Of ComboBoxKodTanimClassStr)).Count > 1 Then
        Item.ImageOptions.SvgImage = My.Resources.actions_arrow2right
        Item.ImageAlignment = TileItemContentAlignment.BottomRight
      ElseIf Not Secilebilir AndAlso ListeSecim.Count < DtOzellik.Rows.Count Then
        Item.ImageOptions.SvgImage = My.Resources.actions_arrow2right
        Item.ImageAlignment = TileItemContentAlignment.BottomRight
      End If

      AddHandler Item.ItemClick, Sub(sender As Object, e As DevExpress.XtraEditors.TileItemEventArgs)
      SecilenYapKod = String.Empty : SecilenYapAcik = String.Empty
      For Each n In e.Item.Group.Items
        If n Is e.Item Then Continue For
        If n.Checked Then n.Checked = False
        Next
        Call TC_ItemCheckedChanged()

                       Dim Tag As ComboBoxKodTanimClassStr = CType(e.Item.Tag, ComboBoxKodTanimClassStr)
                       Dim ListeKod As List(Of ComboBoxKodTanimClassStr) = Tag.O1
                       Call ListeOzellikEkle(Tag.Kod)

                       ListeTekOlan = New List(Of ComboBoxKodTanimClassStr)
                       For Each i In ListeKod
                         DtYap.DefaultView.RowFilter = "YAPKOD = " & SqlGuvenlik(i.Kod)
                         If DtYap.DefaultView.Count = 1 Then Call ListeTekOlan.Add(i)
                       Next
                       If ListeKod.Count = 1 Then
                         DtYap.DefaultView.RowFilter = "YAPKOD = " & SqlGuvenlik(ListeKod(0).Kod)
                         If DtYap.DefaultView.Count > ListeSecim.Count Then
                           Call Doldur()
                         Else
                           If Not e.Item.Checked Then e.Item.Checked = True
                           SecilenYapKod = ListeKod(0).Kod : SecilenYapAcik = ListeKod(0).Tanim : Call TC_ItemCheckedChanged()
                         End If
                       ElseIf ListeTekOlan.Count = 1 Then
                         If Not e.Item.Checked Then e.Item.Checked = True
                         SecilenYapKod = ListeTekOlan(0).Kod : SecilenYapAcik = ListeTekOlan(0).Tanim : Call TC_ItemCheckedChanged()
                       Else
                         Call Doldur()
                       End If
                     End Sub
      Call TG.Items.Add(Item)
    Next
    Call TC_ItemCheckedChanged()
  End Sub

  Private Function RenkPaleti() As List(Of System.Drawing.Color)
    Dim ListeRenk As New List(Of System.Drawing.Color)
    With ListeRenk
      Call .Add(System.Drawing.Color.FromArgb(CType(CType(84, Byte), Integer), CType(CType(141, Byte), Integer), CType(CType(212, Byte), Integer)))
      Call .Add(System.Drawing.Color.FromArgb(CType(CType(9, Byte), Integer), CType(CType(93, Byte), Integer), CType(CType(21, Byte), Integer)))
      Call .Add(System.Drawing.Color.FromArgb(CType(CType(203, Byte), Integer), CType(CType(82, Byte), Integer), CType(CType(17, Byte), Integer)))
      Call .Add(System.Drawing.Color.FromArgb(CType(CType(150, Byte), Integer), CType(CType(1, Byte), Integer), CType(CType(106, Byte), Integer)))
      Call .Add(System.Drawing.Color.FromArgb(CType(CType(65, Byte), Integer), CType(CType(61, Byte), Integer), CType(CType(61, Byte), Integer)))
    End With
    Return ListeRenk
  End Function

  Private Function RenkVer() As System.Drawing.Color
    If ListeSecim.Count + 1 > RenkPaleti.Count Then
      Return RenkPaleti(RenkPaleti.Count - 1)
    Else
      Return RenkPaleti(ListeSecim.Count)
    End If
  End Function

  Private Sub WUP_ButonTiklandi(Buton As IButton) Handles WUP.ButonTiklandi
    If Buton Is WUP.Butonlar(NetFectUIButtonPanel.EButonlar.Kaydet) Then
      CObj(Me.ParentForm).DialogResult = DialogResult.OK
    Else
      CObj(Me.ParentForm).DialogResult = DialogResult.Cancel
    End If
  End Sub

  Private Sub TC_ItemCheckedChanged() Handles TC.ItemCheckedChanged, MyBase.Load
    Dim Sayi As Integer = 0
    For Each i In TG.Items
      If i.Checked Then Sayi += 1
    Next

    WUP.ButtonEnable(NetFectUIButtonPanel.EButonlar.Kaydet) = Sayi > 0
  End Sub
End Class