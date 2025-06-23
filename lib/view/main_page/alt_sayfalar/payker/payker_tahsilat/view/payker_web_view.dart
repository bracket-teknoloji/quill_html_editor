import "dart:developer";

import "package:flutter/foundation.dart";
import "package:flutter/material.dart";
import "package:get/get.dart";
import "package:picker/core/base/model/base_pdf_model.dart";
import "package:picker/core/base/model/tahsilat_request_model.dart";
import "package:picker/core/base/state/base_state.dart";
import "package:picker/core/base/view/genel_pdf/view/genel_pdf_view.dart";
import "package:picker/core/init/network/login/api_urls.dart";
import "package:webview_flutter/webview_flutter.dart";

class PaykerWebView extends StatefulWidget {
  const PaykerWebView({required this.html, super.key});
  final String html;

  @override
  State<PaykerWebView> createState() => _PaykerWebViewState();
}

class _PaykerWebViewState extends BaseState<PaykerWebView> {
  late final WebViewController _webViewController;
  final _BottomBarNotifier bottomBarNotifier = _BottomBarNotifier();
  String? id;

  @override
  void initState() {
    _webViewController = WebViewController();
    if (kIsWeb) {
      // _webViewController.setNavigationDelegate(
      //   NavigationDelegate(
      //     onNavigationRequest: (request) => NavigationDecision.navigate,
      //     onHttpError: (request) {
      //       log("WebView HTTP Error: ${request.request?.uri} - $request", name: "WebViewHTTPError");
      //     },
      //     onUrlChange: (request) {
      //       if (request.url == null) return;
      //       log("WebView URL Change: ${request.url}", name: "WebViewURLChange");
      //       if (request.url!.contains("Failed")) {
      //         log("Payment Failed: ${request.url}", name: "WebViewPaymentFailed");
      //         dialogManager.showErrorSnackBar("Ödeme başarısız! \nLütfen tekrar deneyin.");
      //         Get.back(result: false);
      //       }
      //       if (request.url!.contains("Success")) {
      //         dialogManager.showSuccessSnackBar("Ödeme başarılı! \nÖdemeniz başarıyla alınmıştır.");
      //         isSuccess = true;
      //         Get.back(result: true);
      //       }
      //     },
      //   ),
      // );
    } else {
      _webViewController
        ..setJavaScriptMode(JavaScriptMode.unrestricted)
        ..setNavigationDelegate(
          NavigationDelegate(
            onNavigationRequest: (request) => NavigationDecision.navigate,
            onHttpError: (request) {
              log("WebView HTTP Error: ${request.request?.uri} - $request", name: "WebViewHTTPError");
            },
            onUrlChange: (request) {
              if (request.url == null) return;
              log("WebView URL Change: ${request.url}", name: "WebViewURLChange");
              // if (["PaymentProcessing"].any((element) => request.url!.contains(element)) && !isLoading) {
              //   dialogManager.showLoadingDialog("Ödeme alınıyor, lütfen bekleyin...");
              //   isLoading = true;
              // } else if (isLoading && !request.url!.contains("PaymentProcessing")) {
              //   isLoading = false;
              //   dialogManager.hideAlertDialog;
              // }
              if (request.url!.contains("Failed")) {
                log("Payment Failed: ${request.url}", name: "WebViewPaymentFailed");
                dialogManager.showErrorSnackBar(
                  "Ödeme başarısız!"
                  "\n"
                  "Lütfen tekrar deneyin.",
                );
                Get.back(result: false);
              }
              if (request.url!.contains("PaymentSuccess")) {
                bottomBarNotifier.show = true;
                id = request.url!.split("orderId=").last;
                dialogManager.showSuccessSnackBar(
                  "Ödeme başarılı!"
                  "\n"
                  "Ödemeniz başarıyla alınmıştır.",
                );
              }
            },
          ),
        );
    }
    _webViewController.loadHtmlString(widget.html);
    super.initState();
  }

  @override
  void dispose() {
    bottomBarNotifier.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) => PopScope(
    canPop: false,
    child: Scaffold(
      appBar: _appBar(),
      body: _body(),
      bottomNavigationBar: _bottomBar(),
    ),
  );

  AppBar _appBar() => AppBar(
    title: const Text("Payker Tahsilat"),
    leading: IconButton(
      icon: Icon(Icons.adaptive.arrow_back_outlined),
      onPressed: () {
        if (bottomBarNotifier.show) {
          Get.back(result: true);
          return;
        }
        dialogManager.showAreYouSureDialog(
          onYes: () {
            Get.back(result: false);
          },
        );
      },
    ),
  );

  WebViewWidget _body() => WebViewWidget(controller: _webViewController);

  ListenableBuilder _bottomBar() => ListenableBuilder(
    listenable: bottomBarNotifier,
    builder: (context, _) => Visibility(
      visible: bottomBarNotifier.show,
      child: BottomAppBar(
        child: Row(
          spacing: 10,
          mainAxisAlignment: MainAxisAlignment.center,
          children:
              [
                    FilledButton.tonalIcon(
                      onPressed: () {
                        bottomBarNotifier.show = false;
                        Get.back(result: true);
                      },
                      label: const Text("Listeye Dön"),
                      icon: const Icon(Icons.done_outline_outlined),
                    ),
                    FilledButton.tonalIcon(
                      onPressed: () {
                        // final result ? = await networkManager.dioGet(path: ApiUrls, bodyModel: bodyModel)
                        // Get.toNamed("/mainPage/krediKartiTahsilatiWithRequest",
                        // arguments: TahsilatRequestModel(

                        // ));
                      },
                      label: const Text("Tahsilat Oluştur"),
                      icon: const Icon(Icons.picture_as_pdf_outlined),
                    ),
                    FilledButton.tonalIcon(
                      onPressed: () {
                        Get.to(
                          () => GenelPdfView(
                            model: BasePdfModel(
                              byteData: "${ApiUrls.paykerTahsilatMakbuzu}/${id ?? ""}",
                              fromMemory: true,
                              uzanti: ".pdf",
                              dosyaAdi: "Payker Tahsilat Makbuzu - ${id ?? ""}",
                            ),
                          ),
                        );
                      },
                      label: const Text("Tahsilat Makbuzu"),
                      icon: const Icon(Icons.picture_as_pdf_outlined),
                    ),
                  ]
                  .map(
                    (e) => Expanded(child: e),
                  )
                  .toList(),
        ),
      ),
    ),
  );
}

final class _BottomBarNotifier extends ChangeNotifier {
  bool _show = false;

  bool get show => _show;

  set show(bool value) {
    if (_show != value) {
      _show = value;
      notifyListeners();
    }
  }
}
