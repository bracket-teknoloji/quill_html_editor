import "package:collection/collection.dart";
import "package:get/get.dart";
import "package:mobx/mobx.dart";
import "package:picker/core/base/view_model/mobx_network_mixin.dart";
import "package:picker/core/constants/extensions/iterable_extensions.dart";
import "package:picker/core/constants/extensions/number_extensions.dart";
import "package:picker/core/constants/ondalik_utils.dart";
import "package:picker/core/init/cache/cache_manager.dart";
import "package:picker/core/init/network/login/api_urls.dart";

import "../../../../../../../core/base/model/base_proje_model.dart";
import "../../../../../../../core/components/dialog/bottom_sheet/model/bottom_sheet_model.dart";
import "../model/urun_grubuna_gore_satis_grafigi_model.dart";
import "../model/urun_grubuna_gore_satis_grafigi_request_model.dart";

part "urun_grubuna_gore_satis_grafigi_view_model.g.dart";

class UrunGrubunaGoreSatisGrafigiViewModel = _UrunGrubunaGoreSatisGrafigiViewModelBase with _$UrunGrubunaGoreSatisGrafigiViewModel;

abstract class _UrunGrubunaGoreSatisGrafigiViewModelBase with Store, MobxNetworkMixin {
  final List<String> donemTipiList = [
    "TUMU",
    "BUGUN",
    "DUN",
    "BU_HAFTA",
    "BU_AY",
    "GECEN_AY",
    "SON_3_AY",
    "BU_YIL",
    "GECEN_YIL",
    "OZEL",
  ];
  final Map<String, String> raporTipi = {
    "Tutara Göre": "T",
    "Miktara Göre": "M",
  };

  final List<BottomSheetModel> grupNoBottomSheetList = [
    "Stok Grup Kodu",
    "Stok Kod 1",
    "Stok Kod 2",
    "Stok Kod 3",
    "Stok Kod 4",
    "Stok Kod 5",
  ]
      .mapIndexed(
        (index, element) => BottomSheetModel(
          title: element,
          onTap: () => Get.back(result: element),
        ),
      )
      .toList();
  @observable
  UrunGrubunaGoreSatisGrafigiRequestModel model = UrunGrubunaGoreSatisGrafigiRequestModel(tipi: CacheManager.getProfilParametre.urunGrubunaGoreSatisRaporTipi, grupla: CacheManager.getProfilParametre.urunGrubunaGoreGruplansin ? "E" : "H");

  @observable
  List<BaseProjeModel>? projeList;

  @action
  void setProjeList(List<BaseProjeModel>? value) => projeList = value;

  @action
  void setRaporTipi(String value) {
    model = model.copyWith(tipi: value);
    CacheManager.setProfilParametre(CacheManager.getProfilParametre.copyWith(urunGrubunaGoreSatisRaporTipi: value));
  }

  @action
  void setProje(BaseProjeModel? proje) => model = model.copyWith(projeKodu: proje?.projeKodu);

  @computed
  String get toplamMiktar => modelList?.map((e) => e.miktar).sum.commaSeparatedWithDecimalDigits(OndalikEnum.miktar) ?? "0";

  @computed
  String get toplamNetTutar => modelList?.map((e) => e.netTutar).sum.commaSeparatedWithDecimalDigits(OndalikEnum.tutar) ?? "0";

  @observable
  bool irsDahilValue = false;

  @observable
  bool gruplansinValue = false;

  @action
  void setIrsDahilValue(bool value) {
    irsDahilValue = value;
    value ? model.irsDahil = "E" : model.irsDahil = "H";
  }

  @action
  void setGruplansinValue(bool value) {
    gruplansinValue = value;
    CacheManager.setProfilParametre(CacheManager.getProfilParametre.copyWith(urunGrubunaGoreGruplansin: value));
    value ? model.grupla = "E" : model.grupla = "H";
  }

  @observable
  int donemTipiIndex = 0;

  @observable
  ObservableList<UrunGrubunaGoreSatisGrafigiModel>? modelList;

  @action
  void setModelList(List<UrunGrubunaGoreSatisGrafigiModel>? value) => modelList = value?.asObservable();

  Future<void> getData() async {
    final result = await networkManager.dioPost<UrunGrubunaGoreSatisGrafigiModel>(
      path: ApiUrls.getUrunGrubunaGoreSatisGrafigi,
      bodyModel: UrunGrubunaGoreSatisGrafigiModel(),
      data: model.toJson(),
    );
    if (result.isSuccess) {
      setModelList(
        result.data.map((e) => e as UrunGrubunaGoreSatisGrafigiModel).toList().cast<UrunGrubunaGoreSatisGrafigiModel>(),
      );
    }
  }
}
