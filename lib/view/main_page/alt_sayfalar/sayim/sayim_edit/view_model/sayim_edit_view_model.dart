import "package:kartal/kartal.dart";
import "package:mobx/mobx.dart";
import "package:picker/core/base/model/base_proje_model.dart";
import "package:picker/core/base/model/print_model.dart";
import "package:picker/core/base/view/pdf_viewer/model/pdf_viewer_model.dart";
import "package:picker/core/constants/enum/dizayn_ozel_kod_enum.dart";
import "package:picker/core/init/cache/cache_manager.dart";
import "package:picker/core/init/dependency_injection/intectable_interface.dart";
import "package:picker/view/main_page/alt_sayfalar/sayim/sayim_edit/sayilanlar_listesi/model/sayilan_kalemler_request_model.dart";
import "package:picker/view/main_page/alt_sayfalar/sayim/sayim_listesi/model/sayim_kalem_request_model.dart";
import "package:picker/view/main_page/alt_sayfalar/stok/base_stok_edit/model/stok_detay_model.dart";
import "package:picker/view/main_page/alt_sayfalar/stok/stok_liste/model/stok_listesi_model.dart";

import "../../../../../../core/base/model/generic_response_model.dart";
import "../../../../../../core/base/view_model/mobx_network_mixin.dart";
import "../../../../../../core/constants/extensions/number_extensions.dart";
import "../../../../../../core/init/network/login/api_urls.dart";
import "../../../siparis/base_siparis_edit/model/base_siparis_edit_model.dart";
import "../../../siparis/siparisler/model/siparisler_request_model.dart";
import "../../sayim_listesi/model/sayim_listesi_model.dart";

part "sayim_edit_view_model.g.dart";

final class SayimEditViewModel = _SayimEditViewModelBase with _$SayimEditViewModel;

abstract class _SayimEditViewModelBase with Store, MobxNetworkMixin implements InjectableInterface {
  @observable
  int tabIndex = 0;

  @observable
  SiparislerRequestModel faturaRequestModel = SiparislerRequestModel();

  @observable
  SayimListesiModel? sayimListesiModel;

  @action
  void setSayimListesiModel(SayimListesiModel? value) => sayimListesiModel = value;

  @computed
  bool get indexSifirMi => tabIndex == 0;

  @action
  void setTabIndex(int value) => tabIndex = value;

  @action
  Future<GenericResponseModel<SayimListesiModel>> sendData(int depoKodu) async => await networkManager.dioPost(
    path: ApiUrls.saveSayim,
    bodyModel: SayimListesiModel(),
    data: filtreModel.copyWith(depoKodu: depoKodu).toJson(),
    showLoading: true,
  );

  @action
  Future<bool> sayimiBitir() async {
    final result = await networkManager.dioPost(
      path: ApiUrls.saveSayim,
      bodyModel: SayimListesiModel(),
      data: SayimFiltreModel(belgeNo: filtreModel.belgeNo, islemKodu: 5),
    );
    return result.isSuccess;
  }

  Future<List<KalemModel>?> getKalemler(String hedefDepo) async {
    faturaRequestModel = SiparislerRequestModel(
      depoKodu: sayimListesiModel?.depoKodu.toStringIfNotNull,
      hedefDepoKodu: hedefDepo,
      belgeNo: sayimListesiModel?.fisno,
      ekranTipi: null,
      filtreKodu: 5,
      pickerBelgeTuru: "",
      iadeMi: false,
    );
    final result = await networkManager.dioGet(
      path: ApiUrls.getFaturalar,
      bodyModel: BaseSiparisEditModel(),
      showLoading: true,
      queryParameters: faturaRequestModel.toJson(),
    );
    if (result.isSuccess) {
      return result.dataList.first.kalemList;
    }
    return null;
  }

  @observable
  SayimFiltreModel filtreModel = SayimFiltreModel(islemKodu: 1);

  @action
  void setFiltreModel(SayimFiltreModel? value) {
    filtreModel = value ?? filtreModel.copyWith(fisno: sayimListesiModel?.fisno);
  }

  @observable
  StokListesiModel? stokModel;

  @action
  void setStokModel(StokListesiModel? model) {
    stokModel = model;
    filtreModel = filtreModel.copyWith(stokKodu: model?.stokKodu, stokAdi: model?.stokAdi);
  }

  @observable
  bool hemenKaydetsinMi = CacheManager.getProfilParametre.sayimStokSecildigindeHemenKaydet;

  @observable
  bool otomatikEtiketYazdir = CacheManager.getProfilParametre.sayimOtomatikEtiketYazdir;

  @observable
  bool nqrOkutuldugundaQRAc = CacheManager.getProfilParametre.sayimNqrOkutuldugundaQRAc;

  bool isStokValid(StokListesiModel? stokModel) {
    if (!(filtreModel.arrGrupKodu?.contains(stokModel?.grupKodu) ?? false) &&
        (filtreModel.arrGrupKodu?.ext.isNotNullOrEmpty ?? false)) {
      return false;
    }
    if (!(filtreModel.arrKod1?.contains(stokModel?.kod1) ?? false) &&
        (filtreModel.arrKod1?.ext.isNotNullOrEmpty ?? false)) {
      return false;
    }
    if (!(filtreModel.arrKod2?.contains(stokModel?.kod2) ?? false) &&
        (filtreModel.arrKod1?.ext.isNotNullOrEmpty ?? false)) {
      return false;
    }
    if (!(filtreModel.arrKod3?.contains(stokModel?.kod3) ?? false) &&
        (filtreModel.arrKod1?.ext.isNotNullOrEmpty ?? false)) {
      return false;
    }
    if (!(filtreModel.arrKod4?.contains(stokModel?.kod4) ?? false) &&
        (filtreModel.arrKod1?.ext.isNotNullOrEmpty ?? false)) {
      return false;
    }
    if (!(filtreModel.arrKod5?.contains(stokModel?.kod5) ?? false) &&
        (filtreModel.arrKod1?.ext.isNotNullOrEmpty ?? false)) {
      return false;
    }
    return true;
  }

  // @action
  // Future<bool?> deleteItem() async {
  //   final result = await networkManager.dioPost(
  //     path: ApiUrls.deleteSayimKalem,
  //     bodyModel: SayimFiltreModel(),
  //     showLoading: true,
  //     queryParameters: SayimKalemRequestModel.fromSayimFiltreModel(filtreModel).toJson(),
  //   );
  //   return result.isSuccess;
  // }

  @action
  void setHemenKaydet(bool value) {
    hemenKaydetsinMi = value;
    CacheManager.setProfilParametre(CacheManager.getProfilParametre.copyWith(sayimStokSecildigindeHemenKaydet: value));
  }

  @observable
  PrintModel printModel = PrintModel(
    raporOzelKod: DizaynOzelKodEnum.sayim.ozelKodAdi,
    dicParams: DicParams(belgeTipi: "SAYI", belgeNo: ""),
  );

  @action
  void setPrintModel(PrintModel? value) {
    printModel =
        value ??
        PrintModel(
          raporOzelKod: DizaynOzelKodEnum.sayim.ozelKodAdi,
          dicParams: DicParams(belgeTipi: "SAYI", belgeNo: ""),
        );
  }

  @action
  void setOtomatikEtiketYazdir(bool value) {
    otomatikEtiketYazdir = value;
    if (!value) {
      setPrintModel(null);
    }
    CacheManager.setProfilParametre(CacheManager.getProfilParametre.copyWith(sayimOtomatikEtiketYazdir: value));
  }

  @action
  void setNqrOkutuldugundaQRAc(bool value) {
    nqrOkutuldugundaQRAc = value;
    CacheManager.setProfilParametre(CacheManager.getProfilParametre.copyWith(sayimNqrOkutuldugundaQRAc: value));
  }

  @action
  void setProjeKodu(BaseProjeModel? value) {
    filtreModel = filtreModel.copyWith(projeKodu: value?.projeKodu, projeAdi: value?.projeAciklama);
  }

  @action
  void setOlcuBirimi(int? value) {
    filtreModel = filtreModel.copyWith(olcuBirimKodu: value);
  }

  @action
  void setEkAlan1(String? value) {
    filtreModel = filtreModel.copyWith(kull1s: value);
  }

  @action
  void setEkAlan2(String? value) {
    filtreModel = filtreModel.copyWith(kull2s: value);
  }

  @action
  void setEkAlan3(String? value) {
    filtreModel = filtreModel.copyWith(kull3s: value);
  }

  @action
  void setEkAlan4(String? value) {
    filtreModel = filtreModel.copyWith(kull4s: value);
  }

  @action
  void setEkAlan5(String? value) {
    filtreModel = filtreModel.copyWith(kull5s: value);
  }

  @action
  void setSeriler(List<SeriList>? list) {
    filtreModel = filtreModel.copyWith(seriList: list);
  }

  @action
  void increaseMiktar() {
    filtreModel = filtreModel.copyWith(miktar: (filtreModel.miktar ?? 0) + 1);
  }

  @action
  void setMiktar(double? value) {
    filtreModel = filtreModel.copyWith(miktar: value);
  }

  @action
  void decreaseMiktar() {
    if (filtreModel.miktar case (0 || null)) {
      filtreModel = filtreModel.copyWith(miktar: 0);
    } else {
      filtreModel = filtreModel.copyWith(miktar: (filtreModel.miktar ?? 0) - 1);
    }
  }

  @override
  Future<void> load() async {}

  @observable
  ObservableList<SayimFiltreModel>? _sayimListesi;

  @observable
  SayilanKalemlerRequestModel requestModel = SayilanKalemlerRequestModel(
    kullaniciAdi: CacheManager.getAnaVeri!.userModel!.kuladi.toString(),
    filtreKodu: 3,
  );

  @observable
  String filterText = "";

  @computed
  ObservableList<SayimFiltreModel>? get sayimListesi => _sayimListesi
      ?.where((element) => element.stokAdi?.toLowerCase().contains(filterText.toLowerCase()) == true)
      .toList()
      .asObservable();

  @action
  void setSayimListesi(List<SayimFiltreModel>? value) => _sayimListesi = value?.asObservable();

  @action
  void setFilterText(String? value) => filterText = value ?? "";

  @action
  Future<bool?> deleteItem(SayimFiltreModel model) async {
    final result = await networkManager.dioPost(
      path: ApiUrls.deleteSayimKalem,
      bodyModel: SayimFiltreModel(),
      showLoading: true,
      queryParameters: SayimKalemRequestModel.fromSayimFiltreModel(model, sayimListesiModel?.depoKodu).toJson(),
    );
    return result.isSuccess;
  }

  @action
  Future<void> getData() async {
    setSayimListesi(null);
    final result = await networkManager.dioGet(
      path: ApiUrls.getSayimKalemleri,
      bodyModel: SayimFiltreModel(),
      queryParameters: requestModel
          .copyWith(belgeNo: sayimListesiModel?.fisno, depoKodu: sayimListesiModel?.depoKodu)
          .toJson(),
    );
    if (result.isSuccess) {
      setSayimListesi(result.dataList);
    }
  }

  @action
  Future<SayimFiltreModel?> getSelectedItem(SayimFiltreModel? model) async {
    final result = await networkManager.dioGet(
      path: ApiUrls.getSayimKalemleri,
      bodyModel: SayimFiltreModel(),
      showLoading: true,
      queryParameters: requestModel
          .copyWith(id: model?.id, belgeNo: sayimListesiModel?.fisno, depoKodu: model?.depoKodu)
          .toJson(),
    );
    if (result.isSuccess) {
      return result.dataList.firstOrNull;
    }
    return null;
  }
}
