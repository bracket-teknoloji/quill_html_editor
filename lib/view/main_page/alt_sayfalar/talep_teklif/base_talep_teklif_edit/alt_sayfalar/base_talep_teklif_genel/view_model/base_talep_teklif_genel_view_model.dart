import "package:mobx/mobx.dart";
import "package:picker/core/base/view/genel_rehber/model/genel_rehber_model.dart";
import "package:picker/core/base/view_model/mobx_network_mixin.dart";
import "package:picker/core/init/network/login/api_urls.dart";
import "package:picker/view/main_page/alt_sayfalar/cari/cari_listesi/model/cari_kosullar_model.dart";

import "../../../../../../../../../core/base/model/base_proje_model.dart";
import "../../../../../../../../../core/constants/extensions/date_time_extensions.dart";
import "../../../../../../model/param_model.dart";
import "../../../../../siparis/base_siparis_edit/model/base_siparis_edit_model.dart";

part "base_talep_teklif_genel_view_model.g.dart";

final class BaseTalepTeklifGenelViewModel = _BaseTalepTeklifGenelViewModelBase with _$BaseTalepTeklifGenelViewModel;

abstract class _BaseTalepTeklifGenelViewModelBase with Store, MobxNetworkMixin {
  final Map<String, int> belgeTipi = <String, int>{"Kapalı": 1, "Açık": 2, "İade": 3, "Zayi İade": 4, "İhracat": 5};

  final Map<String, int> ihracatTipi = <String, int>{
    "FOB": 1,
    "CIF": 2,
    "CF": 3,
    "FOT": 4,
    "İhracat Kayıt No": 5,
    "DAF": 6,
    "EXW": 7,
    "İhracat Kur Farkı": 8,
    "CIP": 9,
    "CPT": 10,
    "DAT": 11,
    "DAP": 12,
    "DDP": 13,
    "DES": 14,
    "DEQ": 15,
    "DDU": 16,
    "FCA": 17,
    "FAS": 18,
    "CFR": 19,
  };

  @observable
  bool kdvDahil = BaseSiparisEditModel.instance.kdvDahil == "E" ? true : false;

  @observable
  BaseSiparisEditModel model = BaseSiparisEditModel.instance;

  @action
  void setCariAdi(String? value) {
    model = model.copyWith(cariAdi: value);
    BaseSiparisEditModel.setInstance(model);
  }

  @action
  void setExportTipi(MapEntry<String, int>? value) {
    if (value == null) return;
    model = model.copyWith(exportTipi: value.value);
    BaseSiparisEditModel.setInstance(model);
  }

  @action
  void setExportRefNo(String? value) {
    model = model.copyWith(exportrefno: value);
    BaseSiparisEditModel.setInstance(model);
  }

  @action
  void setCariKodu(String? value) {
    model = model.copyWith(cariKodu: value);
    BaseSiparisEditModel.setInstance(model);
  }

  @action
  void setTeslimCariAdi(String? value) {
    model = model.copyWith(teslimCariAdi: value);
    BaseSiparisEditModel.setInstance(model);
  }

  @action
  void setTeslimCariKodu(String? value) {
    model = model.copyWith(teslimCari: value);
    BaseSiparisEditModel.setInstance(model);
  }

  @action
  void setDepoKodu(DepoList? value) {
    model = model.copyWith(topluDepo: value?.depoKodu, depoTanimi: value?.depoTanimi);
    BaseSiparisEditModel.setInstance(model);
  }

  @action
  void setOdemeKodu(String? value) {
    model = model.copyWith(odemeKodu: value);
    BaseSiparisEditModel.setInstance(model);
  }

  @action
  void setKosulKodu(CariKosullarModel? value) {
    if (value == null) {
      model = model..kosulKodu = null;
      return;
    }
    model = model.fromKosulModel(value);
    BaseSiparisEditModel.setInstance(model);
  }

  @action
  void setOzelKod1(String? value) {
    model = model.copyWith(ozelKod1: value);
    BaseSiparisEditModel.setInstance(model);
  }

  @action
  Future<bool> fiyatGuncelle() async {
    final result = await networkManager.dioPost(
      path: ApiUrls.saveFatura,
      bodyModel: BaseSiparisEditModel(),
      showLoading: true,
      data: BaseSiparisEditModel.forOzelKod1FiyatGuncelleme(model),
    );
    if (result.isSuccess) {
      model.kalemList = result.dataList.firstOrNull?.kalemList;
      BaseSiparisEditModel.setInstance(model);
      return true;
    }
    return false;
  }

  @action
  void changeKdvDahil(bool value) {
    kdvDahil = value;
    BaseSiparisEditModel.instance.kdvDahil = value ? "E" : "H";
    BaseSiparisEditModel.instance.kdvDahilMi = value;
    BaseSiparisEditModel.instance.kalemlerOTVHesapla();
    BaseSiparisEditModel.setInstance(model);
  }

  @action
  void setBelgeTipi(int? value) {
    model = model.copyWith(belgeTipi: value, tipi: value);
    BaseSiparisEditModel.setInstance(model);
  }

  @action
  void setOzelKod2(String? value) {
    model = model.copyWith(ozelKod2: value);
    BaseSiparisEditModel.setInstance(model);
  }

  @action
  void setPlasiyer(PlasiyerList? value) {
    model = model.copyWith(plasiyerKodu: value?.plasiyerKodu, plasiyerAciklama: value?.plasiyerAciklama);
    BaseSiparisEditModel.setInstance(model);
  }

  @action
  void setProje(BaseProjeModel? value) {
    model = model.copyWith(projeAciklama: value?.projeAciklama, projeKodu: value?.projeKodu);
    BaseSiparisEditModel.setInstance(model);
  }

  @action
  void setTarih(DateTime? value) {
    model = model.copyWith(tarih: value.dateTimeWithoutTime);
    BaseSiparisEditModel.setInstance(model);
  }

  @action
  void setTopluDepoKodu(int? value) {
    model = model.copyWith(topluDepo: value);
    BaseSiparisEditModel.setInstance(model);
  }

  @action
  void setAciklama(int index, GenelRehberModel? value) {
    if (value?.adi == value?.kodu) {
      value?.adi = null;
    }
    switch (index) {
      case 1:
        model = model.copyWith(acik1: value?.kodu, aciklama1Adi: value?.adi);
      case 2:
        model = model.copyWith(acik2: value?.kodu, aciklama2Adi: value?.adi);
      case 3:
        model = model.copyWith(acik3: value?.kodu, aciklama3Adi: value?.adi);
      case 4:
        model = model.copyWith(acik4: value?.kodu, aciklama4Adi: value?.adi);
      case 5:
        model = model.copyWith(acik5: value?.kodu, aciklama5Adi: value?.adi);
      case 6:
        model = model.copyWith(acik6: value?.kodu, aciklama6Adi: value?.adi);
      case 7:
        model = model.copyWith(acik7: value?.kodu, aciklama7Adi: value?.adi);
      case 8:
        model = model.copyWith(acik8: value?.kodu, aciklama8Adi: value?.adi);
      case 9:
        model = model.copyWith(acik9: value?.kodu, aciklama9Adi: value?.adi);
      case 10:
        model = model.copyWith(acik10: value?.kodu, aciklama10Adi: value?.adi);
      case 11:
        model = model.copyWith(acik11: value?.kodu, aciklama11Adi: value?.adi);
      case 12:
        model = model.copyWith(acik12: value?.kodu, aciklama12Adi: value?.adi);
      case 13:
        model = model.copyWith(acik13: value?.kodu, aciklama13Adi: value?.adi);
      case 14:
        model = model.copyWith(acik14: value?.kodu, aciklama14Adi: value?.adi);
      case 15:
        model = model.copyWith(acik15: value?.kodu, aciklama15Adi: value?.adi);
      case 16:
        model = model.copyWith(acik16: value?.kodu, aciklama16Adi: value?.adi);
      default:
    }
    BaseSiparisEditModel.setInstance(model);
  }
}
