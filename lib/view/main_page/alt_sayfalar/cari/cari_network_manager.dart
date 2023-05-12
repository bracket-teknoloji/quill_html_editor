import 'package:picker/view/main_page/alt_sayfalar/cari/cari_listesi/model/cari_kosullar_model.dart';

import '../../../../core/base/model/base_network_mixin.dart';
import '../../../../core/base/model/generic_response_model.dart';
import '../../../../core/init/network/login/api_urls.dart';
import '../../../../core/init/network/network_manager.dart';
import 'cari_listesi/model/cari_listesi_grup_kodu_model.dart';
import 'cari_listesi/model/cari_sehirler_model.dart';

class CariNetworkManager {
  static NetworkManager networkManager = NetworkManager();
  static Future<GenericResponseModel<NetworkManagerMixin>> getKod() async {
    var responseKod = await networkManager.dioGet<CariGrupKoduModel>(
        path: ApiUrls.getGrupKodlari,
        bodyModel: CariGrupKoduModel(),
        addCKey: true,
        headers: {"Modul": "CARI", "GrupNo": "1"},
        addQuery: true,
        addSirketBilgileri: true,
        queryParameters: {"Modul": "CARI", "GrupNo": "-1"});
    return responseKod;
  }

  static Future<GenericResponseModel<NetworkManagerMixin>> getFilterData() async {
    GenericResponseModel<NetworkManagerMixin> responseSehirler;
    responseSehirler = await networkManager.dioGet<CariSehirlerModel>(
        path: ApiUrls.getCariKayitliSehirler, bodyModel: CariSehirlerModel(), addTokenKey: true, addSirketBilgileri: true, headers: {"Modul": "CARI", "GrupNo": "-1", "Kullanimda": "E"});

    return responseSehirler;
  }

  static Future<GenericResponseModel<NetworkManagerMixin>> getkosullar() async {
    Map<String, String> queryParams = {"Tarih": "", "KisitYok": "H", "BelgeTuru": "CARI"};
    var responseKosullar = await networkManager.dioGet<CariKosullarModel>(
        path: ApiUrls.getKosullar, bodyModel: CariKosullarModel(), addCKey: true, addSirketBilgileri: true, addTokenKey: true, addQuery: true, queryParameters: queryParams);
    return responseKosullar;
  }
}
