import "package:mobx/mobx.dart";
import "package:uuid/uuid.dart";

import "../../../../../../../core/base/model/base_network_mixin.dart";
import "../../../../../../../core/base/model/ek_alanlar_model.dart";
import "../../../../../../../core/base/model/generic_response_model.dart";
import "../../../../../../../core/base/view_model/mobx_network_mixin.dart";
import "../../../../../../../core/init/network/login/api_urls.dart";
import "../../../../siparis/base_siparis_edit/model/base_siparis_edit_model.dart";
import "../../uretim_sonu_kaydi_listesi/model/uretim_sonu_kaydi_listesi_request_model.dart";
import "../model/uretim_sonu_kaydi_edit_model.dart";

part "uretim_sonu_kaydi_edit_view_model.g.dart";

final class UretimSonuKaydiEditViewModel = _UretimSonuKaydiEditViewModelBase with _$UretimSonuKaydiEditViewModel;

abstract class _UretimSonuKaydiEditViewModelBase with Store, MobxNetworkMixin {
  @observable
  bool showSaveButton = false;
  @observable
  KalemModel? model;

  @observable
  UretimSonuKaydiEditModel requestModel = UretimSonuKaydiEditModel(
    kalemList: [KalemModel()],
    ekAlanlar: EkAlanlar(),
    yeniKayit: true,
    guid: const Uuid().v4(),
  );

  @observable
  ObservableList<KalemModel>? kalemList;

  @observable
  ObservableList<EkAlanlarModel>? ekAlanlarList;

  @computed
  UretimSonuKaydiListesiRequestModel get kalemlerRequestModel =>
      UretimSonuKaydiListesiRequestModel(belgeNo: requestModel.belgeNo, ekranTipi: "D");

  @action
  void setBelgeNo(String? belgeNo) => requestModel = requestModel.copyWith(belgeNo: belgeNo);

  @action
  void setKalemList(List<KalemModel>? list) {
    kalemList = list?.asObservable();
    setRequestModel(requestModel.copyWith(kalemList: list));
  }

  @action
  void setShowSaveButton(bool value) => showSaveButton = value;

  @action
  void setRequestModel(UretimSonuKaydiEditModel value) => requestModel = value;

  @action
  Future<void> getKalemler() async {
    final result = await networkManager.dioGet(
      path: ApiUrls.getUSKKalemleri,
      bodyModel: KalemModel(),
      showLoading: true,
      queryParameters: kalemlerRequestModel.toJson(),
    );
    if (result.isSuccess) {
      final KalemModel? item = result.dataList.lastOrNull;
      setRequestModel(
        requestModel
          ..cikisDepoAdi = item?.cikisDepoAdi
          ..girisDepoAdi = item?.girisDepoAdi
          ..projeKodu = item?.projeKodu,
      );
      setModel(
        model?.copyWith(
          cikisDepoAdi: item?.cikisDepoAdi,
          girisDepoAdi: item?.girisDepoAdi,
          fireListe: item?.fireListe,
          girisdepoKodu: item?.girisDepo,
          cikisdepoKodu: item?.cikisDepo,
        ),
      );
      setKalemList(result.dataList);
    }
  }

  @action
  Future<void> getEkAlanlar() async {
    final result = await networkManager.dioGet(
      path: ApiUrls.getEkAlanlar,
      bodyModel: EkAlanlarModel(),
      showLoading: true,
      queryParameters: {"TabloAdi": "TBLSTOKURSEK"},
    );
    if (result.isSuccess) setEkAlanlarList(result.dataList);
  }

  @action
  void setModel(KalemModel? item) {
    model = item;
    if (item != null) {
      requestModel = requestModel.copyWith(
        kalemList: [item],
        depoOnceligi: item.depoOnceligi ?? "H",
        projeKodu: item.projeKodu,
      );
      if (item.girisdepoKodu != null) {
        requestModel = requestModel.copyWith(girisDepo: item.girisdepoKodu);
        requestModel = requestModel.copyWith(cikisDepo: item.cikisdepoKodu);
        // setModel(item.copyWith(girisDepo: item.girisdepoKodu, cikisDepo: item.cikisdepoKodu));
      }
    }
  }

  void setEkAlanlarList(List<EkAlanlarModel>? dataList) => ekAlanlarList = dataList?.asObservable();

  @action
  Future<GenericResponseModel<NetworkManagerMixin>> saveUSK() async => networkManager.dioPost(
    path: ApiUrls.saveUSK,
    bodyModel: UretimSonuKaydiEditModel(),
    data: requestModel.copyWith(guid: const Uuid().v4()).toJson(),
    showLoading: true,
  );
}
