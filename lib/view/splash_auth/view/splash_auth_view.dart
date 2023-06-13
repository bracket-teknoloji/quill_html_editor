import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:get/get.dart';
import 'package:picker/core/constants/ui_helper/ui_helper.dart';
import 'package:picker/view/add_company/model/account_model.dart';
import 'package:wave/config.dart';
import 'package:wave/wave.dart';

import '../../../core/base/state/base_state.dart';
import '../../../core/init/cache/cache_manager.dart';
import '../../../core/init/network/login/api_urls.dart';
import '../../../core/init/network/network_manager.dart';
import '../../add_company/model/account_response_model.dart';
import '../../main_page/model/main_page_model.dart';
import '../view_model/splash_auth_view_model.dart';

class SplashAuthView extends StatefulWidget {
  const SplashAuthView({super.key});

  @override
  State<SplashAuthView> createState() => _SplashAuthViewState();
}

class _SplashAuthViewState extends BaseState<SplashAuthView> {
  SplashAuthViewModel viewModel = SplashAuthViewModel();
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Future.delayed(const Duration(seconds: 0), () async {
      login();
    });
    return Scaffold(
      body: Stack(
        children: [ WaveWidget(
              config: CustomConfig(durations: [8000, 10000], heightPercentages: [0.78, 0.8], colors: [const Color.fromRGBO(70, 59, 57, 26), Colors.black.withOpacity(0.3)]),
              size: const Size(double.infinity, double.infinity),
              waveAmplitude: 2,
              wavePhase: 0,
              duration: 200,
              backgroundColor: theme.scaffoldBackgroundColor),
          Center(
            child: Wrap(
              alignment: WrapAlignment.center,
              crossAxisAlignment: WrapCrossAlignment.center,
              runAlignment: WrapAlignment.center,
              direction: Axis.vertical,
              children: [
                const CircularProgressIndicator.adaptive().paddingAll(UIHelper.lowSize),
                Observer(builder: (_) => Text(viewModel.title)),
              ],
            ),
          )
        ],
      ),
    );
  }

  void login() async {
    if (CacheManager.getVerifiedUser?["user"] == null) {
      Get.offAllNamed("/login");
    } else if (CacheManager.getLogout == true) {
      final response = await NetworkManager.getToken(path: ApiUrls.token, queryParameters: {
        "deviceInfos": jsonEncode(CacheManager.getHesapBilgileri().toJson())
      }, data: {
        "grant_type": "password",
        "username": CacheManager.getVerifiedUser?["user"],
        "password": CacheManager.getVerifiedUser?["password"],
      });
      if (response.accessToken != null) {
        CacheManager.setToken(response.accessToken ?? "");
        CacheManager.setVerifiedUser({
          "user": CacheManager.getVerifiedUser?["user"],
          "password": CacheManager.getVerifiedUser?["password"],
          "company": CacheManager.getVerifiedUser?["company"],
          "email": CacheManager.getVerifiedUser?["email"]
        });
        await getSession();
      }
    } else {
      Get.offAllNamed("/login");
    }
  }

  Future<void> getSession() async {
    viewModel.setTitle("${CacheManager.getVerifiedUser?["company"] ?? ""}\n şirketi için oturum açılıyor...");
    AccountResponseModel? accountResponseModel = CacheManager.getAccounts(CacheManager.getVerifiedUser?["company"]);
    AccountModel.instance
      ..kullaniciAdi = CacheManager.getVerifiedUser?["user"]
      ..uyeSifre = accountResponseModel?.parola
      ..uyeEmail = accountResponseModel?.email
      ..aktifVeritabani = CacheManager.getVeriTabani()["Şirket"]
      ..aktifIsletmeKodu = CacheManager.getVeriTabani()["İşletme"]
      ..aktifSubeKodu = CacheManager.getVeriTabani()["Şube"];
    final response = await networkManager.dioPost<MainPageModel>(path: ApiUrls.createSession, bodyModel: MainPageModel(), addTokenKey: true, data: AccountModel.instance, headers: {
      "VERITABANI": CacheManager.getVeriTabani()["Şirket"].toString(),
      "ISLETME_KODU": CacheManager.getVeriTabani()["İşletme"].toString(),
      "SUBE_KODU": CacheManager.getVeriTabani()["Şube"].toString(),
      "content-type": "application/json"
    });
    if (response.data != null) {
      CacheManager.setAnaVeri(response.data.first);
      Get.offAllNamed("/mainPage");
    } else {
      Get.offAllNamed("/entryCompany");
    }
  }
}
