import "package:mobx/mobx.dart";

import "../../../../../../../../../core/base/view_model/mobx_network_mixin.dart";
import "../../../../../../../../../core/constants/extensions/date_time_extensions.dart";
import "../../../../../../../../../core/constants/extensions/iterable_extensions.dart";
import "../../../../../../../../../core/constants/extensions/number_extensions.dart";
import "../../../../../../../../../core/constants/ondalik_utils.dart";
import "../../../../../../../../../core/init/network/login/api_urls.dart";
import "../../../../model/dekont_listesi_model.dart";
import "../../../model/dekont_duzenle_request_model.dart";

part "dekont_goruntule_view_model.g.dart";

final class DekontGoruntuleViewModel = _DekontGoruntuleViewModelBase with _$DekontGoruntuleViewModel;

abstract class _DekontGoruntuleViewModelBase with Store, MobxNetworkMixin {
  final List<String> titleList = [
    "Tarih",
    "Seri",
    "Dekont No",
    "Borç Toplamı",
    "Alacak Toplamı",
  ];

  @observable
  ObservableList<DekontDuzenleRequestModel> dekontListesi = ObservableList<DekontDuzenleRequestModel>();

  @action
  void setDekontListesi(List<DekontDuzenleRequestModel> value) => dekontListesi = value.asObservable();

  @observable
  ObservableMap<String, dynamic>? dekontMap;

  @action
  void setDekontMap(Map<String, dynamic> value) => dekontMap = value.asObservable();

  @action
  Future<void> getData(DekontListesiModel? model, String? refkey) async {
    final result = await networkManager.dioGet<DekontDuzenleRequestModel>(
      path: ApiUrls.getDekontHareketleri,
      bodyModel: DekontDuzenleRequestModel(),
      queryParameters: model?.queryParam ?? {"refKey": refkey},
      showLoading: true,
    );
    if (result.isSuccess) {
      final List<DekontDuzenleRequestModel> list = result.dataList;
      setDekontListesi(list);
      setDekontMap({
        "Tarih": list.firstOrNull?.tarih.toDateString,
        "Seri": list.firstOrNull?.seriNo,
        "Dekont No": list.firstOrNull?.dekontNo,
        "Borç Toplamı": list.where((element) => element.ba == "B").map((e) => e.tutar).sum.commaSeparatedWithDecimalDigits(OndalikEnum.tutar),
        "Alacak Toplamı": list.where((element) => element.ba == "A").map((e) => e.tutar).sum.commaSeparatedWithDecimalDigits(OndalikEnum.tutar),
      });
    }
  }
}
