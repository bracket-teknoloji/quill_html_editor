// import "dart:convert";

// import "package:mobx/mobx.dart";
// import "package:picker/view/main_page/model/param_model.dart";

// import "../../../../../../../core/base/model/generic_response_model.dart";
// import "../../../../../../../core/base/view_model/mobx_network_mixin.dart";
// import "../../../../../../../core/init/network/login/api_urls.dart";
// import "../../kasa_islemleri/model/kasa_islemleri_model.dart";
// import "../../kasa_islemleri/model/kasa_islemleri_request_model.dart";

// part "kasa_hareketleri_view_model.g.dart";

// class KasaHareketleriViewModel = _KasaHareketleriViewModelBase with _$KasaHareketleriViewModel;

// abstract class _KasaHareketleriViewModelBase with Store, MobxNetworkMixin {
//   //* Observables
//   @observable
//   KasaIslemleriRequestModel kasaIslemleriRequestModel = KasaIslemleriRequestModel(sayfa: 1, menuKodu: "KASA_KHAR");

//   @observable
//   ObservableMap<String, dynamic>? paramData;

//   @observable
//   bool isScrollDown = true;

//   @observable
//   bool dahaVarMi = true;

//   @observable
//   ObservableList<KasaIslemleriModel>? kasaIslemleriListesi;

//   // @computed
//   // double get toplamDevirTutari => kasaIslemleriListesi?.first.kasaDevirTutari ?? 0;

//   //* Actions
//   @action
//   void setDahaVarMi(bool value) => dahaVarMi = value;

//   @action
//   void setIsScrollDown(bool value) => isScrollDown = value;

//   @action
//   void incrementSayfa() => kasaIslemleriRequestModel = kasaIslemleriRequestModel.copyWith(sayfa: (kasaIslemleriRequestModel.sayfa ?? 0) + 1);

//   @action
//   void resetSayfa() => kasaIslemleriRequestModel = kasaIslemleriRequestModel.copyWith(sayfa: 1);

//   @action
//   void setKasaKodu(KasaList? value) => kasaIslemleriRequestModel = kasaIslemleriRequestModel.copyWith(kasaKodu: value?.kasaKodu);

//   @action
//   void setKasaIslemleriListesi(List<KasaIslemleriModel>? value) => kasaIslemleriListesi = value?.asObservable();

//   @action
//   void addKasaIslemleriListesi(List<KasaIslemleriModel>? value) => kasaIslemleriListesi?.addAll(value ?? []);

//   @action
//   Future<void> resetPage() async {
//     resetSayfa();
//     kasaIslemleriListesi = null;
//     await getData();
//   }

//   @action
//   Future<GenericResponseModel> deleteData(int? inckeyNo) async {
//     // return GenericResponseModel(success: true);
//     return await networkManager.dioPost<KasaIslemleriModel>(path: ApiUrls.deleteKasaHareket, bodyModel: KasaIslemleriModel(), queryParameters: {"INCKEYNO": inckeyNo});
//   }

//   @action
//   Future<void> getData() async {
//     var result = await networkManager
//         .dioGet<KasaIslemleriModel>(path: ApiUrls.getKasaHareketleri, bodyModel: KasaIslemleriModel(), queryParameters: {"FilterModel": jsonEncode(kasaIslemleriRequestModel.toJson())});
//     if (result.data is List) {
//       List<KasaIslemleriModel> list = result.data.cast<KasaIslemleriModel>();
//       if ((kasaIslemleriRequestModel.sayfa ?? 0) < 2) {
//         paramData = result.paramData?.map((key, value) => MapEntry(key, double.tryParse((value as String).replaceAll(",", ".")) ?? value)).asObservable();
//         setKasaIslemleriListesi(list);
//       } else {
//         addKasaIslemleriListesi(list);
//       }
//       if (list.length < parametreModel.sabitSayfalamaOgeSayisi) {
//         setDahaVarMi(false);
//       } else {
//         setDahaVarMi(true);
//         incrementSayfa();
//       }
//     }
//   }
// }
// import "dart:convert";

// import "package:mobx/mobx.dart";
// import "package:picker/core/base/model/generic_response_model.dart";
// import "package:picker/core/base/view_model/mobx_network_mixin.dart";
// import "package:picker/core/init/network/login/api_urls.dart";
// import "package:picker/view/main_page/alt_sayfalar/finans/kasa/kasa_islemleri/model/kasa_islemleri_model.dart";
// import "package:picker/view/main_page/alt_sayfalar/finans/kasa/kasa_islemleri/model/kasa_islemleri_request_model.dart";

// part "kasa_hareketleri_view_model.g.dart";

// class KasaHareketleriViewModel = _KasaHareketleriViewModelBase with _$KasaHareketleriViewModel;

// abstract class _KasaHareketleriViewModelBase with Store, MobxNetworkMixin {
//   //* Observables
//   @observable
//   KasaIslemleriRequestModel kasaIslemleriRequestModel = KasaIslemleriRequestModel(sayfa: 1, menuKodu: "KASA_KHAR");

//   @observable
//   ObservableMap<String, dynamic>? paramData;

//   @observable
//   bool isScrollDown = true;

//   @observable
//   bool dahaVarMi = true;

//   @observable
//   ObservableList<KasaIslemleriModel>? kasaIslemleriListesi;

//   @computed
//   double get toplamDevirTutari => kasaIslemleriListesi?.first.kasaDevirTutari ?? 0;

//   //* Actions
//   @action
//   void setDahaVarMi(bool value) => dahaVarMi = value;

//   @action
//   void setIsScrollDown(bool value) => isScrollDown = value;

//   @action
//   void incrementSayfa() => kasaIslemleriRequestModel = kasaIslemleriRequestModel.copyWith(sayfa: (kasaIslemleriRequestModel.sayfa ?? 0) + 1);

//   @action
//   void resetSayfa() => kasaIslemleriRequestModel = kasaIslemleriRequestModel.copyWith(sayfa: 1);

//   @action
//   void setKasaKodu(String? value) => kasaIslemleriRequestModel = kasaIslemleriRequestModel.copyWith(kasaKodu: value);

//   @action
//   void setKasaIslemleriListesi(List<KasaIslemleriModel>? value) => kasaIslemleriListesi = value?.asObservable();

//   @action
//   void addKasaIslemleriListesi(List<KasaIslemleriModel>? value) => kasaIslemleriListesi?.addAll(value ?? []);

//   @action
//   Future<void> resetPage() async {
//     resetSayfa();
//     kasaIslemleriListesi = null;
//     await getData();
//   }

//   @action
//   Future<GenericResponseModel?> deleteData(int? inckeyNo) async {
//     return await networkManager.dioPost<KasaIslemleriModel>(path: ApiUrls.deleteKasaHareket, bodyModel: KasaIslemleriModel(), queryParameters: {"INCKEYNO": inckeyNo});
//   }

//   @action
//   Future<void> getData() async {
//     var result = await networkManager
//         .dioGet<KasaIslemleriModel>(path: ApiUrls.getKasaHareketleri, bodyModel: KasaIslemleriModel(), queryParameters: {"FilterModel": jsonEncode(kasaIslemleriRequestModel.toJson())});
//     if (result.data is List) {
//       List<KasaIslemleriModel> list = result.data.cast<KasaIslemleriModel>();
//       if ((kasaIslemleriRequestModel.sayfa ?? 0) < 2) {
//         paramData = result.paramData?.map((key, value) => MapEntry(key, double.tryParse((value as String).replaceAll(",", ".")) ?? value)).asObservable();
//         setKasaIslemleriListesi(list);
//       } else {
//         addKasaIslemleriListesi(list);
//       }
//       if (list.length < parametreModel.sabitSayfalamaOgeSayisi) {
//         setDahaVarMi(false);
//       } else {
//         setDahaVarMi(true);
//         incrementSayfa();
//       }
//     }
//   }
// }

import "dart:convert";

import "package:mobx/mobx.dart";
import "package:picker/core/base/model/base_network_mixin.dart";
import "package:picker/core/base/model/generic_response_model.dart";
import "package:picker/core/base/view_model/mobx_network_mixin.dart";
import "package:picker/core/init/network/login/api_urls.dart";
import "package:picker/view/main_page/alt_sayfalar/finans/kasa/kasa_islemleri/model/kasa_islemleri_model.dart";
import "package:picker/view/main_page/alt_sayfalar/finans/kasa/kasa_islemleri/model/kasa_islemleri_request_model.dart";

part "kasa_hareketleri_view_model.g.dart";

class KasaHareketleriViewModel = _KasaHareketleriViewModelBase with _$KasaHareketleriViewModel;

abstract class _KasaHareketleriViewModelBase with Store, MobxNetworkMixin {
  //* Observables
  @observable
  KasaIslemleriRequestModel kasaIslemleriRequestModel = KasaIslemleriRequestModel(sayfa: 1, menuKodu: "KASA_KHAR");

  @observable
  ObservableMap<String, dynamic>? paramData;

  @observable
  bool isScrollDown = true;

  @observable
  bool dahaVarMi = true;

  @observable
  ObservableList<KasaIslemleriModel>? kasaIslemleriListesi;

  @observable
  String? dovizAdi;

  // @computed
  // double get toplamDevirTutari => kasaIslemleriListesi?.first.kasaDevirTutari ?? 0;

  @computed
  double get bakiye => (paramData?["TOPLAM_GELIR"] as double? ?? 0) - (paramData?["TOPLAM_GIDER"] as double? ?? 0);

  // //* Actions
  @action
  void setDovizAdi(String? value) => dovizAdi = value;

  @action
  void setDahaVarMi(bool value) => dahaVarMi = value;

  @action
  void setIsScrollDown(bool value) => isScrollDown = value;

  @action
  void incrementSayfa() => kasaIslemleriRequestModel = kasaIslemleriRequestModel.copyWith(sayfa: (kasaIslemleriRequestModel.sayfa ?? 0) + 1);

  @action
  void resetSayfa() => kasaIslemleriRequestModel = kasaIslemleriRequestModel.copyWith(sayfa: 1);

  @action
  void setKasaKodu(String? value) => kasaIslemleriRequestModel = kasaIslemleriRequestModel.copyWith(kasaKodu: value);

  @action
  void setKasaIslemleriListesi(List<KasaIslemleriModel>? value) => kasaIslemleriListesi = value?.asObservable();

  @action
  void addKasaIslemleriListesi(List<KasaIslemleriModel>? value) => kasaIslemleriListesi?.addAll(value ?? []);

  @action
  Future<void> resetPage() async {
    resetSayfa();
    kasaIslemleriListesi = null;
    await getData();
  }

  @action
  // return GenericResponseModel(success: true);
  Future<GenericResponseModel<NetworkManagerMixin>> deleteData(int? inckeyNo) async =>
      await networkManager.dioPost<KasaIslemleriModel>(path: ApiUrls.deleteKasaHareket, bodyModel: KasaIslemleriModel(), queryParameters: {"INCKEYNO": inckeyNo});

  @action
  Future<void> getData() async {
    final result = await networkManager
        .dioGet<KasaIslemleriModel>(path: ApiUrls.getKasaHareketleri, bodyModel: KasaIslemleriModel(), queryParameters: {"FilterModel": jsonEncode(kasaIslemleriRequestModel.toJson())});
    if (result.data is List) {
      final List<KasaIslemleriModel> list = result.data.cast<KasaIslemleriModel>();
      if ((kasaIslemleriRequestModel.sayfa ?? 0) < 2) {
        paramData = result.paramData?.map((key, value) => MapEntry(key, double.tryParse((value as String).replaceAll(",", ".")) ?? value)).asObservable();
        setKasaIslemleriListesi(list);
      } else {
        addKasaIslemleriListesi(list);
      }
      if (list.length < parametreModel.sabitSayfalamaOgeSayisi) {
        setDahaVarMi(false);
      } else {
        setDahaVarMi(true);
        incrementSayfa();
      }
    }
  }
}
