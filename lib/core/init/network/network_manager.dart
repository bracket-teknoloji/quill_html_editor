// ignore_for_file: avoid_print

import "dart:convert";
import "dart:developer";

// ignore: uri_does_not_exist
// import "package:dio/browser.dart" if (dart.library.io) "package:dio/io.dart";
import "package:dio/dio.dart";
import "package:flutter/foundation.dart";
import "package:flutter/material.dart";
import "package:get/get.dart" hide FormData, Response;
import "package:json_annotation/json_annotation.dart";
import "package:kartal/kartal.dart";

import "package:picker/core/base/model/base_network_mixin.dart";
import "package:picker/core/base/model/base_proje_model.dart";
import "package:picker/core/base/model/doviz_kurlari_model.dart";
import "package:picker/core/base/model/edit_fatura_model.dart";
import "package:picker/core/base/model/generic_response_model.dart";
import "package:picker/core/base/model/kullanicilar_model.dart";
import "package:picker/core/base/model/muhasebe_referans_model.dart";
import "package:picker/core/base/view/stok_rehberi/model/stok_rehberi_request_model.dart";
import "package:picker/core/components/dialog/bottom_sheet/bottom_sheet_dialog_manager.dart";
import "package:picker/core/components/dialog/bottom_sheet/model/bottom_sheet_model.dart";
import "package:picker/core/constants/enum/grup_kodu_enums.dart";
import "package:picker/core/constants/extensions/date_time_extensions.dart";
import "package:picker/core/init/app_info/app_info.dart";
import "package:picker/core/init/cache/cache_manager.dart";
import "package:picker/view/add_company/model/account_model.dart";
import "package:picker/view/auth/login/model/login_model.dart";
import "package:picker/view/main_page/alt_sayfalar/cari/cari_listesi/model/cari_listesi_model.dart";
import "package:picker/view/main_page/alt_sayfalar/cari/cari_listesi/model/cari_request_model.dart";
import "package:picker/view/main_page/alt_sayfalar/finans/cek_senet/cek_senet_evraklar/model/evraklar_model.dart";
import "package:picker/view/main_page/alt_sayfalar/hucre_takibi/hucre_listesi/model/hucre_listesi_model.dart";
import "package:picker/view/main_page/alt_sayfalar/hucre_takibi/hucre_listesi/model/hucre_listesi_request_model.dart";
import "package:picker/view/main_page/alt_sayfalar/kalite_kontrol/olcum_belge_edit/model/olcum_pdf_model.dart";
import "package:picker/view/main_page/alt_sayfalar/kalite_kontrol/olcum_ekle/model/olcum_operator_model.dart";
import "package:picker/view/main_page/alt_sayfalar/siparis/base_siparis_edit/model/base_siparis_edit_model.dart";
import "package:picker/view/main_page/alt_sayfalar/siparis/siparisler/model/siparis_edit_request_model.dart";
import "package:picker/view/main_page/alt_sayfalar/stok/stok_liste/model/stok_listesi_model.dart";
import "package:talker_dio_logger/talker_dio_logger_interceptor.dart";
import "package:talker_dio_logger/talker_dio_logger_settings.dart";
// import "package:talker_dio_logger/talker_dio_logger_interceptor.dart";
// import "package:talker_dio_logger/talker_dio_logger_settings.dart";
import "package:uuid/uuid.dart";

import "../../../view/add_company/model/account_response_model.dart";
import "../../../view/main_page/alt_sayfalar/stok/base_stok_edit/model/stok_muhasebe_kodu_model.dart";
import "../../base/model/base_empty_model.dart";
import "../../base/model/base_grup_kodu_model.dart";
import "../../base/model/base_pdf_model.dart";
import "../../base/model/print_model.dart";
import "../../base/model/siradaki_belge_no_model.dart";
import "../../base/view/pdf_viewer/model/pdf_viewer_model.dart";
import "../../components/dialog/dialog_manager.dart";
import "../../constants/enum/dio_enum.dart";
import "login/api_urls.dart";

final class NetworkManager {
  factory NetworkManager() => _singleton;

  NetworkManager._internal() {
    log("NetworkManager oluşturuldu", name: "NETWORK MANAGER");
    _dio.interceptors.add(
      InterceptorsWrapper(
        onRequest: (options, handler) => handler.next(options),
        onError: (e, handler) async {
          // if (!await Permission.nearbyWifiDevices.isGranted) {
          //   handler.next(
          //     DioException(requestOptions: RequestOptions(), message: "Nearby WiFi devices permission not granted."),
          //   );
          //   return;
          // }
          switch (e.type) {
            case DioExceptionType.connectionError:
              handler.next(
                DioException(
                  requestOptions: RequestOptions(),
                  message: "İnternet bağlantınızı kontrol ediniz. ${e.error ?? e.message}",
                ),
              );
            case DioExceptionType.unknown:
              handler.next(
                DioException(
                  requestOptions: RequestOptions(),
                  message: "\nBilinmeyen bir hata oluştu. Lütfen internet bağlantınızı kontrol ediniz.\n $e",
                ),
              );
            case DioExceptionType.receiveTimeout || DioExceptionType.sendTimeout || DioExceptionType.connectionTimeout:
              handler.resolve(
                Response(
                  requestOptions: RequestOptions(),
                  data: {
                    "error":
                        "Bağlantı zaman aşımına uğradı.\nLütfen bağlantı yönteminizi ve internet bağlantınızı kontrol ediniz.",
                  },
                ),
              );
            default:
              handler.next(
                DioException(
                  requestOptions: RequestOptions(),
                  type: e.type,
                  message:
                      "Bağlantı zaman aşımına uğradı.\nLütfen bağlantı yönteminizi ve internet bağlantınızı kontrol ediniz.",
                ),
              );
          }
        },
      ),
    );
    if (kDebugMode) {
      _dio.interceptors.add(
        TalkerDioLogger(
          settings: TalkerDioLoggerSettings(
            printResponseData: false,
            requestFilter: (requestOptions) => !requestOptions.path.contains("GetEvrakResim"),
            responseFilter: (response) => !response.requestOptions.path.contains("GetEvrakResim"),
          ),
        ),
      );
    }
  }
  //create singleton
  static final NetworkManager _singleton = NetworkManager._internal();

  final Dio _dio = Dio();

  BaseOptions get _dioOptions => BaseOptions(
    baseUrl: getBaseUrl,
    preserveHeaderCase: true,
    followRedirects: false,
    validateStatus: (status) => status! < 500,
    receiveTimeout: const Duration(minutes: 2),
    connectTimeout: const Duration(seconds: 20),
    sendTimeout: const Duration(minutes: 2),
    receiveDataWhenStatusError: true,
    persistentConnection: true,
    contentType: Headers.jsonContentType,
  );

  BaseOptions get _eBelgeDioOptions => BaseOptions(
    baseUrl: getBaseUrl,
    preserveHeaderCase: true,
    followRedirects: false,
    validateStatus: (status) => status! < 500,
    receiveTimeout: const Duration(minutes: 2),
    receiveDataWhenStatusError: true,
    persistentConnection: true,
    contentType: Headers.jsonContentType,
  );

  Future<TokenModel?> getToken({
    Map<String, dynamic>? headers,
    dynamic data,
    Map<String, dynamic>? queryParameters,
  }) async {
    // final FormData formData = FormData.fromMap(data);
    _dio.options.baseUrl = getBaseUrl;
    log(AccountModel.instance.toString());
    log(CacheManager.getAccounts(CacheManager.getVerifiedUser.account?.firma ?? "")?.wsWan ?? "");
    try {
      final response = await _dio.request(
        ApiUrls.token,
        queryParameters: queryParameters,
        cancelToken: CancelToken(),
        options: Options(
          headers: {
            "Access-Control-Allow-Origin": "*",
            "Platform": AccountModel.instance.platform,
            "Access-Control-Allow-Headers": "Access-Control-Allow-Origin, Accept",
          },
          contentType: Headers.formUrlEncodedContentType,
          method: HttpTypes.POST,
        ),
        data: data,
      );
      final a = response.data;
      return TokenModel().fromJson(a);
    } catch (e) {
      return TokenModel()..error = e.toString();
    }
  }

  Future<GenericResponseModel<T>> dioGet<T extends NetworkManagerMixin>({
    required String path,
    required T bodyModel,
    Map<String, String>? headers,
    dynamic data,
    Map<String, dynamic>? queryParameters,
    bool addQuery = true,
    bool addSirketBilgileri = true,
    bool addCKey = true,
    bool addTokenKey = true,
    bool showLoading = false,
    bool showError = true,
  }) async {
    GenericResponseModel<T> responseModel = GenericResponseModel<T>();
    Response<Map<String, dynamic>> response;
    if (showLoading) {
      DialogManager().showLoadingDialog("Yükleniyor...");
    }
    try {
      final Map<String, String> head = getStandardHeader(addTokenKey, addSirketBilgileri, addCKey);
      if (headers != null) head.addEntries(headers.entries);
      final Map<String, dynamic> queries = getStandardQueryParameters();
      if (queryParameters != null) queries.addEntries(queryParameters.entries);
      if (queryParameters != null) queries.addEntries(queryParameters.entries);

      if (path.startsWith("EBelge")) {
        _dio.options = _eBelgeDioOptions;
      } else {
        _dio.options = _dioOptions;
      }
      // response = await dio.post(path, queryParameters: queries, options: Options(headers: head, responseType: ResponseType.json), data: data);
      response = await _dio.get(
        path,
        queryParameters: queries,
        cancelToken: CancelToken(),
        options: Options(headers: head, contentType: Headers.jsonContentType),
        data: data,
      );
      responseModel = GenericResponseModel<T>.fromJson(response.data ?? {}, bodyModel);
    } catch (e) {
      String errorText = e.toString();
      if (e is MissingRequiredKeysException) {
        errorText = "${e.missingKeys} eksik";
      }
      if (showLoading) {
        DialogManager().hideAlertDialog;
      }
      //TODO HATA BULUTA GÖNDERİLECEK
      if (showError) {
        await DialogManager().showAlertDialog(e.toString());
      }
      return GenericResponseModel<T>(success: false, message: errorText);
    }
    if (showLoading) {
      DialogManager().hideAlertDialog;
    }

    if (!responseModel.isSuccess) {
      if (showError) {
        await DialogManager().showAlertDialog(responseModel.message ?? "Bilinmeyen bir hata oluştu.");
      }
      if (responseModel.errorCode == 1) {
        Get.toNamed("/");
      }
    }
    return responseModel;
  }

  Future<GenericResponseModel<T>> dioPost<T extends NetworkManagerMixin>({
    required String path,
    required T bodyModel,
    Map<String, String>? headers,
    dynamic data,
    Map<String, dynamic>? queryParameters,
    bool addQuery = true,
    bool addSirketBilgileri = true,
    bool addCKey = true,
    bool addTokenKey = true,
    bool showLoading = false,
    bool showError = true,
  }) async {
    GenericResponseModel<T> responseModel = GenericResponseModel<T>();
    Response<Map<String, dynamic>> response;
    if (showLoading) {
      DialogManager().showLoadingDialog("Lütfen Bekleyiniz...");
    }
    try {
      final Map<String, String> head = getStandardHeader(addTokenKey, addSirketBilgileri, addCKey);
      if (headers != null) head.addEntries(headers.entries);
      final Map<String, dynamic> queries = getStandardQueryParameters();
      if (queryParameters != null) queries.addEntries(queryParameters.entries);
      if (queryParameters != null) queries.addEntries(queryParameters.entries);
      if (path.startsWith("EBelge")) {
        _dio.options = _eBelgeDioOptions;
      } else {
        _dio.options = _dioOptions;
      }
      // response = await dio.post(path, queryParameters: queries, options: Options(headers: head, responseType: ResponseType.json), data: data);
      response = await _dio.post(
        path,
        queryParameters: queries,
        cancelToken: CancelToken(),
        options: Options(headers: head, contentType: kIsWeb ? null : Headers.jsonContentType),
        data: data,
      );
      responseModel = GenericResponseModel<T>.fromJson(response.data ?? {}, bodyModel);
    } catch (e) {
      if (showLoading) {
        DialogManager().hideAlertDialog;
      }
      //TODO HATA BULUTA GÖNDERİLECEK
      if (showError) {
        await DialogManager().showAlertDialog(e.toString());
      }
      return GenericResponseModel<T>(success: false, message: e.toString());
    }
    if (showLoading) {
      DialogManager().hideAlertDialog;
    }

    if (!responseModel.isSuccess) {
      if (showError) {
        await DialogManager().showAlertDialog(responseModel.message ?? "Bilinmeyen bir hata oluştu.");
      }
      if (responseModel.errorCode == 1) {
        Get.toNamed("/");
      }
    }
    return responseModel;
  }

  Future<GenericResponseModel> deleteFatura(EditFaturaModel model, {bool showError = true, bool showLoading = true}) =>
      dioPost<EditFaturaModel>(
        path: ApiUrls.deleteFatura,
        bodyModel: EditFaturaModel(),
        data: model.toJson(),
        showError: showError,
        showLoading: showLoading,
      );

  Future<MemoryImage?> getImage(String? path) async {
    if (path == null) {
      return null;
    }
    final Map<String, String> head = getStandardHeader(true, true, true);
    final response = await _dio.get(path, options: Options(headers: head, responseType: ResponseType.bytes));
    // response is a png file
    try {
      if (response.data is Uint8List) {
        return MemoryImage(response.data);
      } else {
        return null;
      }
    } catch (e) {
      log(e.toString());
      return null;
    }
  }

  Future<List<EvraklarModel?>?> getEvraklar(String? path, String? belgeNo) async {
    if (path == null) {
      return null;
    }
    final response = await dioGet(
      path: ApiUrls.getEvraklar,
      bodyModel: EvraklarModel(),
      queryParameters: {"BelgeNo": belgeNo, "BelgeTipi": "STOK", "UrlGetir": "E"},
    );

    if (response.isSuccess) {
      return response.dataList;
    }
    return null;
  }

  Future<Uint8List?> getImageUint8List(String path) async {
    final Map<String, String> head = getStandardHeader(true, true, true);
    final response = await _dio.get(path, options: Options(headers: head, responseType: ResponseType.bytes));
    log(response.data.toString());
    // response is a png file
    if (response.data is Uint8List) {
      return response.data;
    }
    return null;
  }

  Future<GenericResponseModel<BasePdfModel>> getPDF(PdfModel model) async {
    final Map<String, String> head = getStandardHeader(true, true, true);
    final response = await dioPost<BasePdfModel>(
      path: ApiUrls.print,
      bodyModel: BasePdfModel(),
      showLoading: true,
      headers: head,
      data: model.toJsonWithDicParamsMap(),
    );
    return response;
  }

  Future<GenericResponseModel<BasePdfModel>> getTeknikResimPdf(OlcumPdfModel model) async {
    final Map<String, String> head = getStandardHeader(true, true, true);
    final response = await dioPost<BasePdfModel>(
      path: ApiUrls.getBelge,
      bodyModel: BasePdfModel(),
      showLoading: true,
      headers: head,
      data: model.copyWith(tur: "T").toJson(),
    );
    return response;
  }

  Future<GenericResponseModel<BasePdfModel>> getKontrolPlaniPdf(OlcumPdfModel model) async {
    final Map<String, String> head = getStandardHeader(true, true, true);
    final response = await dioPost<BasePdfModel>(
      path: ApiUrls.getBelge,
      bodyModel: BasePdfModel(),
      showLoading: true,
      headers: head,
      data: model.copyWith(tur: "K").toJson(),
    );
    return response;
  }

  Future<GenericResponseModel> dbUpdate(String veriTabani) async {
    final Map<String, String> head = getStandardHeader(true, true, true);
    final response = await dioPost<BasePdfModel>(
      path: ApiUrls.dbUpdate,
      bodyModel: BasePdfModel(),
      headers: head,
      showLoading: true,
      data: {"Veritabani": veriTabani},
    );
    return response;
  }

  Future<List<BaseGrupKoduModel>> getGrupKod({
    required GrupKoduEnum name,
    int? grupNo,
    bool? kullanimda,
    bool? kategoriModuMu,
  }) async {
    final queryParams = {
      "Modul": name.module,
      "GrupNo": grupNo,
      "Kullanimda": kullanimda,
      "KategoriModu": kategoriModuMu == true ? "E" : null,
    };
    log(queryParams.toString());
    final responseKod = await dioGet<BaseGrupKoduModel>(
      path: ApiUrls.getGrupKodlari,
      bodyModel: BaseGrupKoduModel(),
      // headers: {"Modul": name.module, "GrupNo": grupNo.toStringIfNotNull ?? "", "Kullanimda": (kullanimda ?? true) ? "E" : "H"},
      showLoading: true,
      queryParameters: queryParams,
    );
    if (responseKod.isSuccess) return responseKod.dataList;
    return [];
  }

  Map<String, String> getStandardHeader(
    bool addTokenKey, [
    bool headerSirketBilgileri = false,
    bool headerCKey = false,
  ]) {
    final Map<String, String> header = {};
    if (addTokenKey) {
      final String token = CacheManager.getToken();
      header.addAll({"Authorization": "Bearer $token"});
    }
    if (headerSirketBilgileri) {
      final veriTabani = CacheManager.getVeriTabani;
      final Map<String, String> sirketBilgileri = {
        "User-Agent": "PickerFlutter${AccountModel.instance.platform}App",
        "VERITABANI": veriTabani["Şirket"].toString(),
        "ISLETME_KODU": veriTabani["İşletme"].toString(),
        "SUBE_KODU": veriTabani["Şube"].toString(),
        "Platform": AccountModel.instance.platform ?? "",
        "X-app-version": AppInfoModel.instance.version ?? "",
      };
      header.addEntries(sirketBilgileri.entries);
    }
    if (headerCKey) {
      const uuid = Uuid();
      final timeZoneMinutes = DateTime.now().timeZoneOffset.inMinutes;
      final String baseEncoded = base64Encode(
        utf8.encode(
          '{\n  "GUID": "${uuid.v4()}",\n  "TZ_MINUTES": $timeZoneMinutes,\n  "ZAMAN": "${DateTime.now().toDateTimeString()}"\n}',
        ),
      );
      header.addAll({"CKEY": baseEncoded});
    }
    return header;
  }

  Map<String, dynamic> getStandardQueryParameters() {
    final Map<String, dynamic> query = {};
    return query;
  }

  Future<List<BaseProjeModel>?> getProjeData() async {
    final result = await dioGet<BaseProjeModel>(path: ApiUrls.getProjeler, bodyModel: BaseProjeModel());
    if (result.isSuccess) {
      return result.dataList;
    }
    return null;
  }

  Future<List<double>?> getKDVOrani() async {
    final result = await dioGet<BaseEmptyModel>(
      path: ApiUrls.getStokDigerBilgi,
      showLoading: true,
      bodyModel: BaseEmptyModel(),
      queryParameters: {"BilgiTipi": "KDVGRUP"},
    );
    return (jsonDecode(result.paramData?["STOK_KDVGRUP_JSON"]) as List).map((e) => e as double).toList();
  }

  Future<GenericResponseModel<AccountResponseModel>> getUyeBilgileri(
    String? email, {
    String? password,
    bool getFromCache = true,
    bool? isDebug,
  }) async {
    if (email == "demo@netfect.com") {
      return GenericResponseModel(success: true);
    }
    final data2 =
        getFromCache
            ? (CacheManager.getHesapBilgileri?..cihazKimligi = AccountModel.instance.cihazKimligi)
            : AccountModel.instance;
    data2?.cihazTarihi = DateTime.now().toDateTimeString();
    data2?.konumTarihi = DateTime.now().toDateTimeString();
    final result = await dioPost<AccountResponseModel>(
      bodyModel: AccountResponseModel(),
      showError: false,
      data: data2?.toJson(),
      addTokenKey: false,
      addCKey: false,
      showLoading: !getFromCache,
      addSirketBilgileri: false,
      path: ApiUrls.getUyeBilgileri,
    );
    if (result.isSuccess) {
      final List<AccountResponseModel> list = result.dataList;
      if (list.ext.isNotNullOrEmpty) {
        CacheManager.setIsLicenseVerified(email ?? list.firstOrNull?.email ?? "", true);
      }
      if (getFromCache) {
        final List<AccountResponseModel> list = result.dataList;
        if (list.firstOrNull != null) {
          CacheManager.setAccounts(
            list.firstOrNull!..parola = password ?? CacheManager.getVerifiedUser.account?.parola ?? "",
          );
        }
      }
    } else {
      if (result.errorCode == 5) {
        CacheManager.setIsLicenseVerified(email ?? result.dataList.firstOrNull?.email ?? "", false);
      }
    }
    return result;
  }

  //SırakadiBelgeNoModel koyma sebebim boş bir modele ihtiyacımın olması.
  //Sadece succes döndürüyor.
  Future<GenericResponseModel> postPrint({required PrintModel model}) async => await dioPost<SiradakiBelgeNoModel>(
    path: ApiUrls.print,
    bodyModel: SiradakiBelgeNoModel(),
    data: model.toJson(),
    showLoading: true,
  );

  Future<List<StokMuhasebeKoduModel>> getMuhasebeKodlari({
    Map<String, dynamic>? queryParams,
    bool? stokMu = true,
  }) async {
    final GenericResponseModel<StokMuhasebeKoduModel> result = await dioGet<StokMuhasebeKoduModel>(
      path: stokMu == true ? ApiUrls.getStokMuhasebeKodlari : ApiUrls.getMuhasebeMuhasebeKodlari,
      bodyModel: StokMuhasebeKoduModel(),
      showLoading: true,
      queryParameters: queryParams,
    );
    return result.dataList;
  }

  Future<String?> getSiradakiBelgeNo(SiradakiBelgeNoModel model) async {
    final result = await dioGet<SiradakiBelgeNoModel>(
      path: ApiUrls.getSiradakiBelgeNo,
      bodyModel: SiradakiBelgeNoModel(),
      data: (model..belgeNo = null).toJson(),
    );
    if (result.isSuccess) {
      return result.dataList.firstOrNull?.belgeNo;
    }
    return null;
  }

  Future<CariListesiModel?> getCariModel(CariRequestModel model) async {
    final result = await dioGet<CariListesiModel>(
      path: ApiUrls.getCariler,
      bodyModel: CariListesiModel(),
      showLoading: true,
      queryParameters: model.toJson(),
    );
    if (result.isSuccess) {
      if (result.dataList.length == 1) {
        return result.dataList.firstOrNull;
      } else {
        // ignore: use_build_context_synchronously
        final cariModel = await Get.toNamed("/mainPage/cariListesiOzel", arguments: model..kod = null);
        if (cariModel is CariListesiModel) {
          return cariModel;
        }
      }
    }
    return null;
  }

  Future<StokListesiModel?> getStokModel(StokRehberiRequestModel model) async {
    final result = await dioPost<StokListesiModel>(
      path: ApiUrls.getStoklar,
      bodyModel: StokListesiModel(),
      showLoading: true,
      data: model.toJson(),
    );
    if (result.isSuccess) {
      return result.dataList.firstOrNull;
    }
    return null;
  }

  Future<HucreListesiModel?> getHucreModel(HucreListesiRequestModel model) async {
    final result = await dioPost<HucreListesiModel>(
      path: ApiUrls.getStoklar,
      bodyModel: HucreListesiModel(),
      showLoading: true,
      queryParameters: model.toJson(),
    );
    if (result.isSuccess) {
      return result.dataList.firstOrNull;
    }
    return null;
  }

  Future<List<KullanicilarModel>?> getKullanicilar() async {
    final result = await dioPost<KullanicilarModel>(
      path: ApiUrls.getGenelRehber,
      bodyModel: const KullanicilarModel(),
      showLoading: true,
      data: {"RehberKodu": 3},
    );
    if (result.isSuccess) {
      return result.dataList;
    }
    return null;
  }

  Future<List<OlcumOperatorModel>?> getOperatorler() async {
    final result = await dioGet<OlcumOperatorModel>(
      path: ApiUrls.getOlcumPersonel,
      bodyModel: OlcumOperatorModel(),
      showLoading: true,
    );
    if (result.isSuccess) {
      return result.dataList;
    }
    return null;
  }

  Future<List<MuhasebeReferansModel>?> getSartliKabuller() async {
    final result = await dioGet<MuhasebeReferansModel>(
      path: ApiUrls.getSartliKabuller,
      bodyModel: MuhasebeReferansModel(),
      showLoading: true,
    );
    if (result.isSuccess) {
      return result.dataList;
    }
    return null;
  }

  Future<List<KullanicilarModel>?> getCariAktiviteBolumler() async {
    final result = await dioPost<KullanicilarModel>(
      path: ApiUrls.getGenelRehber,
      bodyModel: const KullanicilarModel(),
      showLoading: true,
      data: {"RehberKodu": 4},
    );
    if (result.isSuccess) {
      return result.dataList;
    }
    return null;
  }

  Future<List<KullanicilarModel>?> getIlgiliKisiler() async {
    final result = await dioPost<KullanicilarModel>(
      path: ApiUrls.getGenelRehber,
      bodyModel: const KullanicilarModel(),
      showLoading: true,
      data: {"RehberKodu": 5},
    );
    if (result.isSuccess) {
      return result.dataList;
    }
    return null;
  }

  Future<List<KullanicilarModel>?> getCariAktiviteAciklamalar() async {
    final result = await dioPost<KullanicilarModel>(
      path: ApiUrls.getGenelRehber,
      bodyModel: const KullanicilarModel(),
      showLoading: true,
      data: {"RehberKodu": 6},
    );
    if (result.isSuccess) {
      return result.dataList;
    }
    return null;
  }

  Future<List<KullanicilarModel>?> getCariAktiviteSonucAciklamalar() async {
    final result = await dioPost<KullanicilarModel>(
      path: ApiUrls.getGenelRehber,
      bodyModel: const KullanicilarModel(),
      showLoading: true,
      data: {"RehberKodu": 7},
    );
    if (result.isSuccess) {
      return result.dataList;
    }
    return null;
  }

  Future<BaseSiparisEditModel?> getFatura(BuildContext context, SiparisEditRequestModel model) async {
    final result = await dioGet<BaseSiparisEditModel>(
      path: ApiUrls.getFaturalar,
      bodyModel: BaseSiparisEditModel(),
      showLoading: true,
      // headers: {"platform": AccountModel.instance.platform ?? ""},
      queryParameters: model.toJson(),
    );
    if ((result.isSuccess) && result.isSuccess) {
      final List<BaseSiparisEditModel> list = result.dataList;
      if (result.dataList.length == 1) {
        return result.dataList.firstOrNull;
      } else {
        // ignore: use_build_context_synchronously
        return await BottomSheetDialogManager().showBottomSheetDialog(
          context,
          title: "Fatura Seçiniz",
          children:
              list.map((e) => BottomSheetModel(title: e.cariAdi ?? "", description: e.belgeNo, value: e)).toList(),
        );
      }
    }
    return null;
  }

  Future<BaseSiparisEditModel?> postFatura(BuildContext context, SiparisEditRequestModel model) async {
    final result = await dioPost<BaseSiparisEditModel>(
      path: ApiUrls.getFaturalar,
      bodyModel: BaseSiparisEditModel(),
      showLoading: true,
      // headers: {"platform": AccountModel.instance.platform ?? ""},
      data: model.toJson(),
    );
    if ((result.isSuccess) && result.isSuccess) {
      final List<BaseSiparisEditModel> list = result.dataList;
      if (result.dataList.length == 1) {
        return result.dataList.firstOrNull;
      } else {
        // ignore: use_build_context_synchronously
        return await BottomSheetDialogManager().showBottomSheetDialog(
          context,
          title: "Fatura Seçiniz",
          children:
              list.map((e) => BottomSheetModel(title: e.cariAdi ?? "", description: e.belgeNo, value: e)).toList(),
        );
      }
    }
    return null;
  }

  Future<BaseSiparisEditModel?> getBaseSiparisEditModel(SiparisEditRequestModel model) async {
    final result = await dioPost<BaseSiparisEditModel>(
      path: ApiUrls.getFaturaDetay,
      bodyModel: BaseSiparisEditModel(),
      showLoading: true,
      data: model.toJson(),
    );
    if (result.isSuccess) {
      return result.dataList.firstOrNull;
    }
    return null;
  }

  Future<List<DovizKurlariModel>?> getDovizKurlari(int? dovizKodu, {DateTime? tarih}) async {
    final result = await dioGet<DovizKurlariModel>(
      path: ApiUrls.getDovizKurlari,
      bodyModel: DovizKurlariModel(),
      showLoading: true,
      queryParameters: {
        "EkranTipi": "D",
        "DovizKodu": dovizKodu,
        "tarih": tarih?.toDateString ?? DateTime.now().toDateString,
      },
    );
    if (result.isSuccess) {
      return result.dataList;
    }
    return null;
  }

  static String get getBaseUrl {
    final AccountResponseModel? account = CacheManager.getAccounts(AccountModel.instance.uyeEmail ?? "");
    return "${CacheManager.getUzaktanMi(account?.firmaKisaAdi) ? (account?.wsWan ?? account?.wsLan ?? "https://bracket.brckt.net/Picker/api") : account?.wsLan}/";
  }
}
