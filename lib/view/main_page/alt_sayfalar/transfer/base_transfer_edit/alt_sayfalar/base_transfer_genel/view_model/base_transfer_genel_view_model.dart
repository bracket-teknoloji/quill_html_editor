import "package:mobx/mobx.dart";

import "../../../../../../../../../core/base/model/base_proje_model.dart";
import "../../../../../../../../../core/constants/extensions/date_time_extensions.dart";
import "../../../../../../../../core/base/view/masraf_kodu/model/masraf_kodu_rehberi_model.dart";
import "../../../../../../model/param_model.dart";
import "../../../../../siparis/base_siparis_edit/model/base_siparis_edit_model.dart";
import "../../../../../uretim/is_emirleri/is_emri_rehberi/model/is_emirleri_model.dart";

part "base_transfer_genel_view_model.g.dart";

final class BaseTransferGenelViewModel = _BaseTransferGenelViewModelBase with _$BaseTransferGenelViewModel;

abstract class _BaseTransferGenelViewModelBase with Store {
  final Map<String, String> hareketTuruMap = <String, String>{
    "Masraf Merkezi": "A",
    "Depolar": "B",
    "Üretim": "C",
    "Muhtelif": "D",
    "Konsinye": "F",
  };

  final Map<String, String> cikisYeriMap = <String, String>{
    "Masraf Merkezi": "M",
    "Stok": "S",
    "Ana Mal Grubu": "A",
    "Mal Grubu": "G",
    "Serbest": "F",
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
  void changeKdvDahil(bool value) {
    kdvDahil = value;
    BaseSiparisEditModel.instance.kdvDahil = value ? "E" : "H";
    BaseSiparisEditModel.instance.kdvDahilMi = value;
    BaseSiparisEditModel.instance.kalemlerOTVHesapla();
    BaseSiparisEditModel.setInstance(model);
  }

  @action
  void changeIsEmri(IsEmirleriModel? value) {
    BaseSiparisEditModel.instance.isemriAciklama = value?.stokKodu;
    BaseSiparisEditModel.instance.isemriNo = value?.isemriNo;
  }

  @action
  void changeMasrafKodu(MasrafKoduRehberiModel? value) {
    model = model.copyWith(masrafKodu: value?.masrafKodu, masrafKoduAdi: value?.masrafAdi);
    BaseSiparisEditModel.instance.masrafKodu = value?.masrafKodu;
    BaseSiparisEditModel.instance.masrafKoduAdi = value?.masrafAdi;
  }

  @action
  void changeCikisYeri(String? value) {
    model = model.copyWith(cikisYeri: value);
    BaseSiparisEditModel.instance.cikisYeri = value;
  }

  @action
  void setHareketTuru(String? value) {
    model = model.copyWith(hareketTuru: value);
    BaseSiparisEditModel.setInstance(model);
  }

  @action
  void setMasrafKoduTipi(int? value) {
    model = model.copyWith(masrafKoduTipi: value);
    BaseSiparisEditModel.setInstance(model);
  }

  @action
  void setCikisSube(SubeList? value) {
    model = model.copyWith(cikisSubeKodu: value?.subeKodu, cikisSubeAciklama: value?.subeAdi);
    BaseSiparisEditModel.setInstance(model);
  }

  @action
  void setGirisSube(SubeList? value) {
    model = model.copyWith(girisSubeKodu: value?.subeKodu, girisSubeAciklama: value?.subeAdi);
    BaseSiparisEditModel.setInstance(model);
  }

  @action
  void setOzelKod1(String? value) {
    model = model.copyWith(ozelKod1: value);
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
  void setTopluGirisDepoKodu(DepoList? value) {
    model = model.copyWith(girisDepoKodu: value?.depoKodu, topluGirisDepoTanimi: value?.depoTanimi, hedefDepo: value?.depoKodu, hedefDepoAdi: value?.depoTanimi);
    BaseSiparisEditModel.setInstance(model);
  }

  @action
  void setTopluCikisDepoKodu(DepoList? value) {
    model = model.copyWith(cikisDepoKodu: value?.depoKodu, topluCikisDepoTanimi: value?.depoTanimi, topluDepo: value?.depoKodu);
    BaseSiparisEditModel.setInstance(model);
  }

  @action
  void setLokalDepo(bool value) {
    model = model.copyWith(lokalDat: value ? "E" : "H");
    BaseSiparisEditModel.setInstance(model);
  }

  @action
  void setEIrsaliye(bool value) {
    model = model.copyWith(ebelgeCheckbox: value ? "E" : "H");
    BaseSiparisEditModel.setInstance(model);
  }

  @action
  void setAciklama(int index, String? value) {
    switch (index) {
      case 1:
        model = model.copyWith(acik1: value);
      case 2:
        model = model.copyWith(acik2: value);
      case 3:
        model = model.copyWith(acik3: value);
      case 4:
        model = model.copyWith(acik4: value);
      case 5:
        model = model.copyWith(acik5: value);
      case 6:
        model = model.copyWith(acik6: value);
      case 7:
        model = model.copyWith(acik7: value);
      case 8:
        model = model.copyWith(acik8: value);
      case 9:
        model = model.copyWith(acik9: value);
      case 10:
        model = model.copyWith(acik10: value);
      case 11:
        model = model.copyWith(acik11: value);
      case 12:
        model = model.copyWith(acik12: value);
      case 13:
        model = model.copyWith(acik13: value);
      case 14:
        model = model.copyWith(acik14: value);
      case 15:
        model = model.copyWith(acik15: value);
      case 16:
        model = model.copyWith(acik16: value);
      default:
    }
    BaseSiparisEditModel.setInstance(model);
  }
}
