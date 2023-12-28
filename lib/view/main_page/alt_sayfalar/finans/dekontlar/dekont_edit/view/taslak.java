 private void eFattanDekont(final EFaturaResponseModel eFaturaModel) {
        CariFilterRequestModel cariFilterModel = new CariFilterRequestModel();
        cariFilterModel.VergiNo = eFaturaModel.VERGI_NO;
        cariFilterModel.KisitYok = true;
        cariFilterModel.EFaturaGoster = true;
        //Cari getir
        _cariManager.getCariler(cariFilterModel, genericResponseModel -> {
            CariResponseModel cariModel = null;
            if (genericResponseModel.isDataEmpty() == false) {
                cariModel = genericResponseModel.getFirstModel();
            }
            String kalemAciklama = "E-Faturadan dekont işlemi.";
            List<DekontKalemModel> dekontKalemList = new ArrayList<>();
            DekontKalemModel dekontKalem = new DekontKalemModel();
            //Cari-borç
            dekontKalem.HesapTipi = "C";
            if (cariModel == null) {
                dekontKalem.HesapAdi = "Cari seçin.";
            } else {
                dekontKalem.HesapKodu = cariModel.CariKodu;
                dekontKalem.HesapAdi = cariModel.getCariAdi();
            }
            dekontKalem.BorcAlacak = "A";
            dekontKalem.Tutar = eFaturaModel.GenelToplam;
            dekontKalem.Tarih = DateTimeUtils.nowDate();
            dekontKalem.PlasiyerKodu = _userYetkiModel.getSeciliGelecekPlasiyerKodu();
            dekontKalem.ProjeKodu = _profilModel.getVarsayilanProjeKodu();
            dekontKalem.BelgeNo = eFaturaModel.ResmiBelgeNo;
            dekontKalem.Aciklama = kalemAciklama;
            dekontKalemList.add(dekontKalem);
            //Ara Toplam-alacak
            dekontKalem = new DekontKalemModel();
            dekontKalem.Tutar = eFaturaModel.GenelToplam - eFaturaModel.KdvTutari;
            dekontKalem.BorcAlacak = "B";
            dekontKalem.HesapTipi = "M";
            dekontKalem.HesapAdi = "Muhasebe kodu seçin.";
            dekontKalem.Tarih = DateTimeUtils.nowDate();
            dekontKalem.PlasiyerKodu = _userYetkiModel.getSeciliGelecekPlasiyerKodu();
            dekontKalem.ProjeKodu = _profilModel.getVarsayilanProjeKodu();
            dekontKalem.BelgeNo = eFaturaModel.ResmiBelgeNo;
            dekontKalem.Aciklama = kalemAciklama;
            dekontKalemList.add(dekontKalem);
            //KDV-alacak
            if (eFaturaModel.KdvTutari > 0) {
                dekontKalem = new DekontKalemModel();
                dekontKalem.Tutar = eFaturaModel.KdvTutari;
                dekontKalem.BorcAlacak = "B";
                dekontKalem.HesapTipi = "M";
                dekontKalem.HesapAdi = "Muhasebe kodu seçin.";
                dekontKalem.Tarih = DateTimeUtils.nowDate();
                dekontKalem.PlasiyerKodu = _userYetkiModel.getSeciliGelecekPlasiyerKodu();
                dekontKalem.ProjeKodu = _profilModel.getVarsayilanProjeKodu();
                dekontKalem.BelgeNo = eFaturaModel.ResmiBelgeNo;
                dekontKalem.Aciklama = kalemAciklama;
                dekontKalemList.add(dekontKalem);
            }
            DFrgDekontDetay frg = new DFrgDekontDetay();
            frg._initoBaglantiEFatIncKeyNo = eFaturaModel.ID;
            frg._initKalemList = dekontKalemList;
            frg.setOnSaveDialogResultListener(dialogResultCode -> refreshData());
            frg.showDF(getActivity());
        });
    }