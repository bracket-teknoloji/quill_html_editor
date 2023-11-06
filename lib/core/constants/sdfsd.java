BankaFilterRequestModel filterModel = null;
                if (BelgeUtils.cekSenetMi(_belgeTipi)) {
                    filterModel = new BankaFilterRequestModel();
                    ParamResponseModel paramModel = PrefManager.getInstance().getParamsModel();
                    ArrayList<Integer> list = new ArrayList<>();
                    if (BelgeUtils.musteriCekiMi(_belgeTipi) && (paramModel.bankaHesapTipiKayitliMi(BankaManager.HesapTipi.TAHSIL_CEKLERI) || paramModel.bankaHesapTipiKayitliMi(BankaManager.HesapTipi.TEMINAT_CEKLERI))) {
                        list.add(BankaManager.HesapTipi.TAHSIL_CEKLERI);
                        list.add(BankaManager.HesapTipi.TEMINAT_CEKLERI);
                    } else if (BelgeUtils.musteriSenediMi(_belgeTipi) && (paramModel.bankaHesapTipiKayitliMi(BankaManager.HesapTipi.TAHSIL_SENETLERI) || paramModel.bankaHesapTipiKayitliMi(BankaManager.HesapTipi.TEMINAT_SENETLERI))) {
                        list.add(BankaManager.HesapTipi.TAHSIL_SENETLERI);
                        list.add(BankaManager.HesapTipi.TEMINAT_SENETLERI);
                    } else if (BelgeUtils.borcCekiMi(_belgeTipi)  && paramModel.bankaHesapTipiKayitliMi(BankaManager.HesapTipi.BORC_CEKLERI) ) {
                        list.add(BankaManager.HesapTipi.BORC_CEKLERI);
                    } else if (BelgeUtils.borcSenediMi(_belgeTipi)  && paramModel.bankaHesapTipiKayitliMi(BankaManager.HesapTipi.BORC_SENETLERI) ) {
                        list.add(BankaManager.HesapTipi.BORC_SENETLERI);
                    } else {
                        list.add(BankaManager.HesapTipi.VADESIZ_MEVDUAT);
                    }
                    filterModel.ArrHesapTipi = list;
                }