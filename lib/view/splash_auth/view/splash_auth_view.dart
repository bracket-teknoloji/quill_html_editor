import "dart:convert";
import "dart:developer";

import "package:flutter/material.dart";
import "package:flutter_mobx/flutter_mobx.dart";
import "package:flutter_svg/flutter_svg.dart";
import "package:get/get.dart";
import "package:kartal/kartal.dart";
import "package:picker/core/base/model/generic_response_model.dart";
import "package:wave/config.dart";
import "package:wave/wave.dart";

import "../../../core/base/state/base_state.dart";
import "../../../core/constants/ui_helper/ui_helper.dart";
import "../../../core/init/cache/cache_manager.dart";
import "../../../core/init/network/login/api_urls.dart";
import "../../add_company/model/account_model.dart";
import "../../add_company/model/account_response_model.dart";
import "../../main_page/model/main_page_model.dart";
import "../view_model/splash_auth_view_model.dart";

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
    WidgetsFlutterBinding.ensureInitialized().addPostFrameCallback((timeStamp) async {
      await AccountModel.instance.init();
      login();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: Wrap(
        direction: Axis.vertical,
        alignment: WrapAlignment.center,
        crossAxisAlignment: WrapCrossAlignment.center,
        children: [
          Text.rich(TextSpan(children: [
            TextSpan(text: "Powered by ", style: TextStyle(color: theme.colorScheme.primary.withOpacity(0.8))),
            const TextSpan(text: "Bracket Teknoloji\n", style: TextStyle(fontWeight: FontWeight.bold)),
          ])),
          Text(AccountModel.instance.uygulamaSurumu ?? "")
        ],
      ).paddingAll(UIHelper.lowSize),
      body: Stack(
        children: [
          WaveWidget(
              config: CustomConfig(durations: [8000, 10000], heightPercentages: [0.78, 0.8], colors: [const Color.fromRGBO(70, 59, 57, 26), Colors.black.withOpacity(0.3)]),
              size: const Size(double.infinity, double.infinity),
              waveAmplitude: 2,
              wavePhase: 0,
              duration: 200,
              backgroundColor: theme.scaffoldBackgroundColor),
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Column(
                  children: [
                    SvgPicture.asset("assets/splash/PickerLogoTuruncu.svg", height: height * 0.1),
                    const Text("Picker\nVeri Toplama Çözümleri", overflow: TextOverflow.ellipsis, maxLines: 3, textAlign: TextAlign.center).paddingAll(UIHelper.lowSize),
                  ],
                ),
                SizedBox(
                    width: width * 0.6,
                    child: Observer(builder: (_) => Visibility(visible: viewModel.isError, child: Text(viewModel.title, overflow: TextOverflow.ellipsis, maxLines: 10, textAlign: TextAlign.center)))),
                Wrap(
                  alignment: WrapAlignment.center,
                  crossAxisAlignment: WrapCrossAlignment.center,
                  direction: Axis.vertical,
                  children: [
                    Observer(builder: (_) {
                      return Visibility(visible: !viewModel.isError, child: const CircularProgressIndicator.adaptive().paddingAll(UIHelper.lowSize));
                    }),
                    SizedBox(width: width * 0.6, child: Observer(builder: (_) => Visibility(visible: !viewModel.isError, child: Text(viewModel.title, maxLines: 10, textAlign: TextAlign.center)))),
                    Observer(builder: (_) {
                      return Visibility(
                        visible: viewModel.isError,
                        child: Row(
                          children: [
                            OutlinedButton(
                              onPressed: () => login(),
                              child: const Text("Tekrar Dene"),
                            ).paddingAll(UIHelper.lowSize),
                            OutlinedButton(
                              onPressed: () {
                                CacheManager.setLogout(false);
                                Get.offAllNamed("/login");
                              },
                              child: const Text("Ana Ekrana Dön"),
                            ).paddingAll(UIHelper.lowSize),
                          ],
                        ),
                      );
                    })
                  ],
                )
              ],
            ),
          )
        ],
      ),
    );
  }

  void login() async {
    viewModel.setTitle("Giriş yapılıyor...");
    viewModel.setIsError(false);
    if (CacheManager.getVerifiedUser.username == null) {
      Get.offAllNamed("/login");
    } else if (CacheManager.getLogout == true) {
      final response = await networkManager.getToken(path: ApiUrls.token, queryParameters: {
        "deviceInfos": jsonEncode((CacheManager.getHesapBilgileri?..cihazKimligi = AccountModel.instance.cihazKimligi)?.toJson())
      }, data: {
        "grant_type": "password",
        "username": CacheManager.getVerifiedUser.username,
        "password": CacheManager.getVerifiedUser.password,
      });
      if (response != null) {
        if (response.accessToken != null) {
          CacheManager.setVerifiedUser(CacheManager.getVerifiedUser);
          CacheManager.setToken(response.accessToken!);
          await getSession();
        } else {
          Get.offAllNamed("/login");
        }
      } else {
        viewModel.setTitle(response?.error ?? response?.errorDescription ?? "Bağlantı kurulamadı. Lütfen internet bağlantınızı kontrol edin.");
        viewModel.setIsError(true);
      }
    } else {
      Get.offAllNamed("/login");
    }
  }

  Future<GenericResponseModel> getUyeBilgileri() async {
    viewModel.setTitle("Lisans bilgileri alınıyor...");
    final response = await networkManager.dioPost<AccountResponseModel>(
        bodyModel: AccountResponseModel(), showError: false, data: CacheManager.getHesapBilgileri?.toJson(), addTokenKey: false, path: ApiUrls.getUyeBilgileri);
    if (response.success == true) {
      CacheManager.setAccounts(response.data.first..parola = CacheManager.getVerifiedUser.account?.parola);
    }
    return response;
  }

  Future<void> getSession() async {
    GenericResponseModel lisansResponse = await networkManager.getUyeBilgileri(CacheManager.getVerifiedUser.account?.email ?? "");
    if (CacheManager.getIsLicenseVerified(CacheManager.getVerifiedUser.account?.email ?? "") == false) {
      viewModel.setTitle(lisansResponse.message ?? "Bir hata oluştu. Lütfen tekrar deneyin.");
      viewModel.setIsError(true);
      return;
    }

    viewModel.setTitle("${CacheManager.getVeriTabani()["Şirket"] ?? ""} şirketi için oturum açılıyor...");
    AccountModel.instance
      ..kullaniciAdi = CacheManager.getVerifiedUser.username
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
      response.message.ext.isNotNullOrNoEmpty ? dialogManager.showAlertDialog(response.message.toString()) : null;
      var result = await networkManager.dioPost<AccountModel>(path: ApiUrls.saveUyeBilgileri, showError: false, bodyModel: AccountModel(), data: CacheManager.getHesapBilgileri?.toJson());
      if (result.success == true) {
        log("Başarılı");
      } else {
        log("Başarısız");
      }
    } else {
      Get.offAllNamed("/entryCompany");
    }
  }
}
