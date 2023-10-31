import "dart:convert";
import "dart:developer";

import "package:flutter/material.dart";
import "package:flutter_mobx/flutter_mobx.dart";
import "package:flutter_svg/flutter_svg.dart";
import "package:get/get.dart";
import "package:kartal/kartal.dart";
import "package:wave/config.dart";
import "package:wave/wave.dart";

import "../../../core/base/model/generic_response_model.dart";
import "../../../core/base/state/base_state.dart";
import "../../../core/constants/ui_helper/ui_helper.dart";
import "../../../core/init/app_info/app_info.dart";
import "../../../core/init/cache/cache_manager.dart";
import "../../../core/init/network/login/api_urls.dart";
import "../../add_company/model/account_model.dart";
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
  Widget build(BuildContext context) => Scaffold(
        floatingActionButton: Text.rich(
          TextSpan(
            children: [
              TextSpan(text: "Powered by ", style: TextStyle(color: theme.colorScheme.primary.withOpacity(0.8))),
              const TextSpan(text: "Bracket Teknoloji\n", style: TextStyle(fontWeight: FontWeight.bold)),
            ],
          ),
        ),
        floatingActionButtonLocation: context.isLandscape ? FloatingActionButtonLocation.endFloat : FloatingActionButtonLocation.centerFloat,
        body: Stack(
          children: [
            WaveWidget(
              config: CustomConfig(durations: [8000, 10000], heightPercentages: [0.78, 0.8], colors: [theme.colorScheme.surfaceVariant, theme.colorScheme.surface.withOpacity(0.5)]),
              size: const Size(double.infinity, double.infinity),
              waveAmplitude: 2,
              wavePhase: 0,
              duration: 200,
              backgroundColor: theme.scaffoldBackgroundColor,
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: Wrap(
                direction: Axis.vertical,
                alignment: WrapAlignment.center,
                crossAxisAlignment: WrapCrossAlignment.center,
                children: [
                  Wrap(
                    alignment: WrapAlignment.center,
                    crossAxisAlignment: WrapCrossAlignment.center,
                    direction: Axis.vertical,
                    children: [
                      Observer(builder: (_) => Visibility(visible: !viewModel.isError, child: const CircularProgressIndicator.adaptive().paddingAll(UIHelper.lowSize))),
                      Observer(builder: (_) => Visibility(visible: !viewModel.isError, child: Text(viewModel.title, maxLines: 10, textAlign: TextAlign.center))),
                      Observer(
                        builder: (_) => Visibility(
                          visible: viewModel.isError,
                          child: Row(
                            children: [
                              OutlinedButton(
                                onPressed: login,
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
                        ),
                      ),
                    ],
                  ).paddingOnly(bottom: UIHelper.highSize * 7),
                ],
              ).paddingOnly(bottom: UIHelper.midSize),
            ),
            Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      SvgPicture.asset("assets/splash/PickerLogoTuruncu.svg", height: height * 0.1),
                      const Text("Picker\nVeri Toplama Çözümleri", overflow: TextOverflow.ellipsis, maxLines: 3, textAlign: TextAlign.center).paddingAll(UIHelper.lowSize),
                      Text(AppInfoModel.instance.version ?? "").paddingOnly(bottom: UIHelper.highSize),
                    ],
                  ),
                  Observer(
                    builder: (_) => Visibility(
                      visible: viewModel.isError,
                      child: SizedBox(width: width * 0.6, child: Text(viewModel.title, overflow: TextOverflow.ellipsis, maxLines: 10, textAlign: TextAlign.center)),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      );

  Future<void> login() async {
    viewModel.setTitle("Giriş Yapılıyor...");
    viewModel.setIsError(false);
    if (CacheManager.getVerifiedUser.username == null) {
      Get.offAllNamed("/login");
    } else if (CacheManager.getLogout == true) {
      AccountModel.setFromAccountResponseModel(CacheManager.getAccounts(CacheManager.getVerifiedUser.account?.email ?? ""));
      final response = await networkManager.getToken(
        path: ApiUrls.token,
        queryParameters: {
          "deviceInfos": jsonEncode((CacheManager.getHesapBilgileri?..cihazKimligi = AccountModel.instance.cihazKimligi)?.toJson()),
        },
        data: {
          "grant_type": "password",
          "username": CacheManager.getVerifiedUser.username,
          "password": CacheManager.getVerifiedUser.password,
        },
      );
      if (response != null && response.error == null) {
        if (response.accessToken != null) {
          CacheManager.setVerifiedUser(CacheManager.getVerifiedUser);
          CacheManager.setToken(response.accessToken!);
          await getSession();
        } else {
          Get.offAllNamed("/login");
        }
      } else {
        viewModel.setTitle("\n\n${response?.errorDescription ?? response?.error ?? "Bağlantı kurulamadı. Lütfen internet bağlantınızı kontrol edin."}");
        viewModel.setIsError(true);
      }
    } else {
      Get.offAllNamed("/login");
    }
  }

  Future<void> getSession() async {
    viewModel.setTitle("Lisans bilgileri alınıyor...");
    final GenericResponseModel lisansResponse = await networkManager.getUyeBilgileri(CacheManager.getVerifiedUser.account?.email ?? "");
    if (!CacheManager.getIsLicenseVerified(CacheManager.getVerifiedUser.account?.email ?? "")) {
      viewModel.setTitle("${lisansResponse.message}\n ${lisansResponse.ex?["Message"]}\nLisans bilgileri alınamadı. Lütfen internet bağlantınızı kontrol edin.");
      viewModel.setIsError(true);
      return;
    }

    viewModel.setTitle("${CacheManager.getVeriTabani()["Şirket"] ?? ""} şirketi için\noturum açılıyor...");
    AccountModel.instance
      ..kullaniciAdi = CacheManager.getVerifiedUser.username
      ..aktifVeritabani = CacheManager.getVeriTabani()["Şirket"]
      ..aktifIsletmeKodu = CacheManager.getVeriTabani()["İşletme"]
      ..aktifSubeKodu = CacheManager.getVeriTabani()["Şube"];
    final response = await networkManager.dioPost<MainPageModel>(
      path: ApiUrls.createSession,
      bodyModel: MainPageModel(),
      data: AccountModel.instance,
      headers: {
        "VERITABANI": CacheManager.getVeriTabani()["Şirket"].toString(),
        "ISLETME_KODU": CacheManager.getVeriTabani()["İşletme"].toString(),
        "SUBE_KODU": CacheManager.getVeriTabani()["Şube"].toString(),
        "content-type": "application/json",
      },
    );
    if (response.data != null) {
      CacheManager.setAnaVeri(response.data.first);
      Get.offAllNamed("/mainPage");
      if (response.message.ext.isNotNullOrNoEmpty) dialogManager.showAlertDialog(response.message.toString());
      final result = await networkManager.dioPost<AccountModel>(path: ApiUrls.saveUyeBilgileri, showError: false, bodyModel: AccountModel(), data: CacheManager.getHesapBilgileri?.toJson());
      if (result.success == true) {
        log("Başarılı");
      } else {
        log("Başarısız");
      }
    } else {
      Get.offAllNamed("/entryCompany", arguments: true);
    }
  }
}
// if (_paramModel.MuhasebeEntegre && _paramModel.MuhFislerdeRefKodSorulsun && !cariResponseModel.MuhKodu.isEmpty()) {
//             b.layoutMuhaRef.visibleIf((cariResponseModel.MuhHesapTipi.equals("A") && _paramModel.MuhFislerdeRefKodSorulsun_Aktif) ||
//                                               (cariResponseModel.MuhHesapTipi.equals("P") && _paramModel.MuhFislerdeRefKodSorulsun_Pasif) ||
//                                               (cariResponseModel.MuhHesapTipi.equals("G") && _paramModel.MuhFislerdeRefKodSorulsun_Gelir) ||
//                                               (cariResponseModel.MuhHesapTipi.equals("I") && _paramModel.MuhFislerdeRefKodSorulsun_Gider) ||
//                                               (cariResponseModel.MuhHesapTipi.equals("N") && _paramModel.MuhFislerdeRefKodSorulsun_Nazim));

//             if (b.layoutMuhaRef.isVisible()) {
//                 KullaniciYetkiResponseModel kulYetki = PrefManager.getInstance().getKullaniciYetkiResponseModel();
//                 if (kulYetki != null && !kulYetki.varsayilan_MuhasebeReferansKodu.isEmpty()) {
//                     b.layoutMuhaRef.setKeyValue(kulYetki.varsayilan_MuhasebeReferansKodu, kulYetki.varsayilan_MuhasebeReferansTanimi);
//                     b.layoutMuhaRef.setViewEnable(_profilModel.kullanici_AdminMi);
//                 } else {
//                     b.layoutMuhaRef.clearKeyValue();
//                 }
//             } else {
//                 b.layoutMuhaRef.clearKeyValue();
//             }

//         } else {
//             b.layoutMuhaRef.visibleIf(false);
//             b.layoutMuhaRef.clearKeyValue();
//         }