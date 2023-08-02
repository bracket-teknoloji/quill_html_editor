// ignore_for_file: avoid_print

import 'dart:convert';
import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart' hide FormData;
import 'package:picker/core/base/model/base_network_mixin.dart';
import 'package:picker/core/base/model/base_proje_model.dart';
import 'package:picker/core/base/model/delete_fatura_model.dart';
import 'package:picker/core/base/model/generic_response_model.dart';
import 'package:picker/core/components/dialog/bottom_sheet/bottom_sheet_dialog_manager.dart';
import 'package:picker/core/constants/extensions/date_time_extensions.dart';
import 'package:picker/core/init/cache/cache_manager.dart';
import 'package:picker/view/add_company/model/account_model.dart';
import 'package:picker/view/auth/model/login_model.dart';

import '../../base/model/base_grup_kodu_model.dart';
import '../../base/model/base_pdf_model.dart';
import '../../base/model/print_model.dart';
import '../../base/model/siradaki_belge_no_model.dart';
import '../../base/view/pdf_viewer/model/pdf_viewer_model.dart';
import '../../components/dialog/dialog_manager.dart';
import '../../constants/enum/dio_enum.dart';
import 'login/api_urls.dart';

class NetworkManager {
  Dio get dio => Dio(BaseOptions(
        baseUrl: getBaseUrl,
        receiveTimeout: const Duration(minutes: 2),
        connectTimeout: const Duration(seconds: 20),
        sendTimeout: const Duration(minutes: 2),
        receiveDataWhenStatusError: true,
        
        contentType: "application/json",
        responseType: ResponseType.json,
      ));
  NetworkManager() {
    dio.interceptors.add(
      InterceptorsWrapper(
        onRequest: (options, handler) {
          //if appLifeCycleState is paused or inactive, cancel the request
          // if (appLifeCycleState == AppLifecycleState.paused || appLifeCycleState == AppLifecycleState.inactive) {
          //   return handler.reject(DioException(requestOptions: options, error: "App is paused or inactive"));
          // }
          return handler.next(options);
        },
        onResponse: (e, handler) => handler.next(e),
        onError: (e, handler) {
          print(e);
          if (e.type == DioExceptionType.connectionError) {
            return handler.next(DioException(requestOptions: RequestOptions(), message: "İnternet bağlantınızı kontrol ediniz. ${e.error}"));
          } else if (e.type == DioExceptionType.connectionTimeout) {
            return handler.next(DioException(requestOptions: RequestOptions(), message: "Bağlantı zaman aşımına uğradı."));
          } else if (e.type == DioExceptionType.unknown) {
            return handler.next(DioException(requestOptions: RequestOptions(), message: "\nBilinmeyen bir hata oluştu. Lütfen internet bağlantınızı kontrol ediniz."));
          }else if (e.type == DioExceptionType.receiveTimeout || e.type == DioExceptionType.sendTimeout || e.type == DioExceptionType.connectionTimeout) {
            return handler.next(DioException(requestOptions: RequestOptions(), message: e.message));
          }else {
            handler.next(e);
          }
        },
      ),
    );
  }

  Future<TokenModel?> getToken({required String path, Map<String, dynamic>? headers, dynamic data, Map<String, dynamic>? queryParameters}) async {
    FormData formData = FormData.fromMap(data);
    log(AccountModel.instance.toString());
    log(CacheManager.getAccounts(CacheManager.getVerifiedUser.account?.firma ?? "")?.wsWan ?? "");
    final response = await dio.request(path,
        queryParameters: queryParameters,
        cancelToken: CancelToken(),
        options: Options(headers: {
          "Access-Control-Allow-Origin": "*",
          // "Content-Type": "application/x-www-form-urlencoded",
          "Platform": "netfect",
          "Access-Control-Allow-Headers": "Access-Control-Allow-Origin, Accept"
        }, contentType: "application/x-www-form-urlencoded", method: HttpTypes.GET, responseType: ResponseType.json),
        data: kIsWeb ? formData : data);
    var a = response.data;
    return TokenModel().fromJson(a);
  }

  Future<GenericResponseModel> dioGet<T extends NetworkManagerMixin>(
      {required String path,
      required T bodyModel,
      Map<String, String>? headers,
      dynamic data,
      Map<String, dynamic>? queryParameters,
      bool addQuery = true,
      bool addSirketBilgileri = true,
      bool addCKey = true,
      bool addTokenKey = true,
      bool showLoading = false,
      bool showError = true}) async {
    CancelToken cancelToken = CancelToken();
    Map<String, String> head = getStandardHeader(addTokenKey, addSirketBilgileri, addCKey);
    if (headers != null) head.addEntries(headers.entries);
    Map<String, dynamic> queries = getStandardQueryParameters();
    if (queryParameters != null) queries.addEntries(queryParameters.entries);
    if (showLoading) {
      DialogManager().showLoadingDialog("Yükleniyor...");
    }
    final response = await dio.get(path, queryParameters: queries, options: Options(headers: head), cancelToken: cancelToken);
    GenericResponseModel<T> responseModel = GenericResponseModel<T>.fromJson(response.data, bodyModel);
    if (showLoading) {
      DialogManager().hideAlertDialog;
    }
    if (responseModel.success != true) {
      if (showError) {
        DialogManager().showAlertDialog(responseModel.message ?? "Bilinmeyen bir hata oluştu.");
      }
      if (responseModel.errorCode == 1) {
        Get.toNamed("/");
      }
    }
    return responseModel;
  }

  Future<GenericResponseModel> dioPost<T extends NetworkManagerMixin>(
      {required String path,
      required T bodyModel,
      Map<String, String>? headers,
      dynamic data,
      Map<String, dynamic>? queryParameters,
      bool addQuery = true,
      bool addSirketBilgileri = true,
      bool addCKey = true,
      bool addTokenKey = true,
      bool showLoading = false,
      bool showError = true}) async {
    dynamic response;
    if (showLoading) {
      DialogManager().showLoadingDialog("Yükleniyor...");
    }
    try {
      Map<String, String> head = getStandardHeader(addTokenKey, addSirketBilgileri, addCKey);
      if (headers != null) head.addEntries(headers.entries);
      Map<String, dynamic> queries = getStandardQueryParameters();
      if (queryParameters != null) queries.addEntries(queryParameters.entries);
      if (queryParameters != null) queries.addEntries(queryParameters.entries);
      response = await dio.post(path, queryParameters: queries, options: Options(headers: head, responseType: ResponseType.json), data: data);
    } catch (e) {
      if (showError) {
        DialogManager().showAlertDialog(e.toString());
      }
      return GenericResponseModel<T>(success: false, message: e.toString());
    }
    if (showLoading) {
      DialogManager().hideAlertDialog;
    }
    GenericResponseModel<T> responseModel = GenericResponseModel<T>.fromJson(response.data, bodyModel);

    if (responseModel.success != true) {
      if (showError) {
        DialogManager().showAlertDialog(responseModel.message ?? "Bilinmeyen bir hata oluştu.");
      }
      if (responseModel.errorCode == 1) {
        Get.toNamed("/");
      }
    }
    return responseModel;
  }

  Future<GenericResponseModel> deleteFatura(DeleteFaturaModel model ,{showError =true, showLoading =true} ) {
    return dioPost<DeleteFaturaModel>(path: ApiUrls.deleteFatura, bodyModel: DeleteFaturaModel(), data: model.toJson(), showError: showError, showLoading: showLoading);
  }

  Future<MemoryImage> getImage(String path) async {
    Map<String, String> head = getStandardHeader(true, true, true);
    final response = await dio.get(path, options: Options(headers: head, responseType: ResponseType.bytes));
    log(response.data.toString());
    // response is a png file
    return MemoryImage(response.data);
  }

  Future<GenericResponseModel> getPDF(PdfModel model) async {
    Map<String, String> head = getStandardHeader(true, true, true);
    final response = await dioPost<BasePdfModel>(path: ApiUrls.print, bodyModel: BasePdfModel(), headers: head, data: model.toJson());
    return response;
  }

  Future<List<BaseGrupKoduModel>> getGrupKod({required String name, required int grupNo, bool? kullanimda}) async {
    var responseKod = await dioGet<BaseGrupKoduModel>(
        path: ApiUrls.getGrupKodlari,
        bodyModel: BaseGrupKoduModel(),
        addCKey: true,
        headers: {"Modul": name, "GrupNo": grupNo.toString(), "Kullanimda": (kullanimda ?? true) ? "E" : "H"},
        addQuery: true,
        addSirketBilgileri: true,
        queryParameters: {"Modul": name, "GrupNo": grupNo});
    return responseKod.data.map((e) => e as BaseGrupKoduModel).toList().cast<BaseGrupKoduModel>();
  }

  Map<String, String> getStandardHeader(bool addTokenKey, [bool headerSirketBilgileri = false, bool headerCKey = false]) {
    Map<String, String> header = {};
    if (addTokenKey) {
      String token = CacheManager.getToken();
      header.addAll({"Authorization": "Bearer $token"});
    }
    if (headerSirketBilgileri) {
      var veriTabani = CacheManager.getVeriTabani();
      Map<String, String> sirketBilgileri = {
        "VERITABANI": veriTabani["Şirket"].toString(),
        "ISLETME_KODU": veriTabani["İşletme"].toString(),
        "SUBE_KODU": veriTabani["Şube"].toString(),
      };
      header.addEntries(sirketBilgileri.entries);
    }
    if (headerCKey) {
      final timeZoneMinutes = DateTime.now().timeZoneOffset.inMinutes;
      String baseEncoded = base64Encode(utf8.encode('{"TZ_MINUTES" :$timeZoneMinutes,"ZAMAN": "${DateTime.now().toDateTimeString()}"}'));
      header.addAll({"CKey": baseEncoded});
    }
    return header;
  }

  Map<String, dynamic> getStandardQueryParameters() {
    Map<String, dynamic> query = {};
    return query;
  }

  Future<List<BaseProjeModel>?> getProjeData() async {
    var result = await dioGet<BaseProjeModel>(path: ApiUrls.getProjeler, bodyModel: BaseProjeModel());
    if (result.success ?? false) {
      return result.data.map((e) => e as BaseProjeModel).toList().cast<BaseProjeModel>();
    }
    return null;
  }
  Future<GenericResponseModel> postPrint(BuildContext context, {required DicParams model}) async {
    var result = await BottomSheetDialogManager().showPrintDialog(context, model);
    if (result != null) {
      return dioPost<PrintModel>(path: ApiUrls.print, bodyModel: PrintModel(), data: model.toJson());
    }
    else{
      return GenericResponseModel(success: false);
    }
  }

  Future<String?> getSiradakiBelgeNo(SiradakiBelgeNoModel model) async {
    var result = await dioGet<SiradakiBelgeNoModel>(path: ApiUrls.getSiradakiBelgeNo, bodyModel: SiradakiBelgeNoModel(), data: (model..belgeNo = null).toJson());
    if (result.success ?? false) {
      return result.data.first.belgeNo;
    }
    return null;
  }

  String get getBaseUrl {
    String result;
    if (CacheManager.getAccounts(AccountModel.instance.uyeEmail ?? "")?.wsWan != null) {
      result = "${CacheManager.getAccounts(AccountModel.instance.uyeEmail ?? "")?.wsWan}/";
    } else {
      result = (CacheManager.getAccounts(AccountModel.instance.uyeEmail ?? "")?.wsLan ?? "http://ofis.bracket.com.tr:7575/Picker/");
    }
    return result;
  }
}
