import "dart:developer";

import "package:picker/core/constants/extensions/date_time_extensions.dart";

import "../../../../core/base/model/base_edit_siradaki_kod_model.dart";
import "../../../../core/base/model/base_grup_kodu_model.dart";
import "../../../../core/base/model/base_network_mixin.dart";
import "../../../../core/base/model/generic_response_model.dart";
import "../../../../core/components/dialog/dialog_manager.dart";
import "../../../../core/constants/enum/grup_kodu_enums.dart";
import "../../../../core/init/network/login/api_urls.dart";
import "../../../../core/init/network/network_manager.dart";
import "cari_listesi/model/cari_kosullar_model.dart";
import "cari_listesi/model/cari_sehirler_model.dart";

class CariNetworkManager {
  static NetworkManager networkManager = NetworkManager();
  static Future<GenericResponseModel<NetworkManagerMixin>> getKod({GrupKoduEnum? name}) async {
    final GenericResponseModel<NetworkManagerMixin> responseKod = await networkManager.dioGet<BaseGrupKoduModel>(
      path: ApiUrls.getGrupKodlari,
      showError: false,
      showLoading: true,
      bodyModel: BaseGrupKoduModel(),
      // headers: <String, String>{"Modul": name?.name ?? "CARI", "GrupNo": "-1", "Kullanimda": "E"},
      queryParameters: <String, dynamic>{"Modul": name ?? "CARI", "GrupNo": "-1", "Kullanimda": "E"},
    );
    return responseKod;
  }

  static Future<List<CariSehirlerModel>?> getFilterData() async {
    GenericResponseModel<NetworkManagerMixin> responseSehirler;
    responseSehirler = await networkManager.dioGet<CariSehirlerModel>(
      path: ApiUrls.getCariKayitliSehirler,
      bodyModel: CariSehirlerModel(),
      addTokenKey: true,
      addSirketBilgileri: true,
      headers: <String, String>{"Modul": "CARI", "GrupNo": "-1", "Kullanimda": "E"},
    );

    return responseSehirler.data?.cast<CariSehirlerModel>();
  }

  static Future<List<CariKosullarModel>?> getkosullar(DateTime? date) async {
    final Map<String, String> queryParams = <String, String>{"Tarih": date.toDateString, "KisitYok": "H", "BelgeTuru": "CARI"};
    final GenericResponseModel<NetworkManagerMixin> responseKosullar =
        await networkManager.dioGet<CariKosullarModel>(path: ApiUrls.getKosullar, bodyModel: CariKosullarModel(), queryParameters: queryParams);
    return responseKosullar.data?.cast<CariKosullarModel>();
  }

  static Future<GenericResponseModel<NetworkManagerMixin>> getCariListesi() async {
    final GenericResponseModel<NetworkManagerMixin> responseKosullar = await networkManager.dioGet<CariKosullarModel>(path: ApiUrls.getKosullar, bodyModel: CariKosullarModel());
    return responseKosullar;
  }

  static Future<String?> getSiradakiKod({String? kod}) async {
    try {
      DialogManager().showLoadingDialog("${kod ?? ""} Kod Getiriliyor...");
      final Map<String, String?> queryParameters2 = <String, String?>{
        "Kod": kod,
        "SonKoduGetir": "H",
        "Modul": "CARI",
      };
      if (kod == null) {
        queryParameters2.addAll(<String, String?>{"Kod": kod});
      }
      final GenericResponseModel result = await networkManager.dioGet<BaseEditSiradakiKodModel>(
        path: ApiUrls.getSiradakiKod,
        bodyModel: BaseEditSiradakiKodModel(),
        queryParameters: queryParameters2,
      );
      DialogManager().hideAlertDialog;
      return result.paramData?["SIRADAKI_NO"];
    } catch (e) {
      DialogManager().hideAlertDialog;
      log(e.toString());
      return null;
    }
  }
}
