import "package:mobx/mobx.dart";
import "package:picker/core/base/view_model/mobx_network_mixin.dart";
import "package:picker/core/constants/extensions/date_time_extensions.dart";
import "package:picker/core/constants/extensions/number_extensions.dart";
import "package:picker/core/constants/ondalik_utils.dart";
import "package:picker/core/init/network/login/api_urls.dart";
import "package:picker/view/main_page/alt_sayfalar/finans/dekontlar/dekont_edit/model/dekont_duzenle_request_model.dart";
import "package:picker/view/main_page/alt_sayfalar/finans/dekontlar/model/dekont_listesi_model.dart";

part "dekont_goruntule_view_model.g.dart";

class DekontGoruntuleViewModel = _DekontGoruntuleViewModelBase with _$DekontGoruntuleViewModel;

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
  Future<void> getData(DekontListesiModel model) async {
    final result =
        await networkManager.dioGet<DekontDuzenleRequestModel>(path: ApiUrls.getDekontHareketleri, bodyModel: DekontDuzenleRequestModel(), queryParameters: model.queryParam, showLoading: true);
    if (result.success ?? false) {
      final List<DekontDuzenleRequestModel> list = (result.data as List).map((e) => e as DekontDuzenleRequestModel).toList().cast<DekontDuzenleRequestModel>();
      setDekontListesi(list);
      setDekontMap({
        "Tarih": list.first.tarih.toDateString,
        "Seri": list.first.seriNo,
        "Dekont No": list.first.dekontNo,
        "Borç Toplamı": list
            .where((element) => element.ba == "B")
            .map((e) => e.tutar)
            .toList()
            .fold(0.0, (previousValue, element) => previousValue + (element ?? 0.0))
            .commaSeparatedWithDecimalDigits(OndalikEnum.tutar),
        "Alacak Toplamı": list
            .where((element) => element.ba == "A")
            .map((e) => e.tutar)
            .toList()
            .fold(0.0, (previousValue, element) => previousValue + (element ?? 0.0))
            .commaSeparatedWithDecimalDigits(OndalikEnum.tutar),
      });
    }
  }
}
