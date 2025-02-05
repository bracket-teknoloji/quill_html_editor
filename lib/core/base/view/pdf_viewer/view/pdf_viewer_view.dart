import "dart:convert";
import "dart:io";

import "package:flutter/foundation.dart";
import "package:flutter/material.dart";
import "package:flutter/services.dart";
import "package:flutter_mobx/flutter_mobx.dart";
import "package:get/get.dart";
import "package:open_filex/open_filex.dart";
import "package:path_provider/path_provider.dart";
import "package:picker/core/constants/ui_helper/ui_helper.dart";
import "package:share_plus/share_plus.dart";
import "package:syncfusion_flutter_pdfviewer/pdfviewer.dart";
import "package:url_launcher/url_launcher.dart";

import "../../../../../view/add_company/model/account_model.dart";
import "../../../../../view/main_page/alt_sayfalar/cari/cari_listesi/model/cari_request_model.dart";
import "../../../../../view/main_page/model/param_model.dart";
import "../../../../components/appbar/appbar_prefered_sized_bottom.dart";
import "../../../../components/button/elevated_buttons/bottom_appbar_button.dart";
import "../../../../components/wrap/appbar_title.dart";
import "../../../../constants/extensions/date_time_extensions.dart";
import "../../../../constants/static_variables/static_variables.dart";
import "../../../../init/cache/cache_manager.dart";
import "../../../../init/platform_implementations.dart" if (dart.library.html) "package:picker/core/init/web/file_downloader.dart" show fileDownload;
import "../../../model/print_model.dart";
import "../../../state/base_state.dart";
import "../../stok_rehberi/model/stok_rehberi_request_model.dart";
import "../model/pdf_viewer_model.dart";
import "../view_model/pdf_viewer_view_model.dart";

final class PDFViewerView extends StatefulWidget {
  const PDFViewerView({required this.title, super.key, this.pdfData, this.filterBottomSheet, this.serbestMi, this.filtreVarMi = true});
  final String title;
  final PdfModel? pdfData;
  final bool? serbestMi;
  final bool filtreVarMi;
  final Future Function()? filterBottomSheet;

  @override
  State<PDFViewerView> createState() => _PDFViewerViewState();
}

final class _PDFViewerViewState extends BaseState<PDFViewerView> {
  final PdfViewerViewModel viewModel = PdfViewerViewModel();
  // BasePdfModel? pdfFile;
  late PdfViewerController pdfViewerController;
  OverlayEntry? overlayEntry;
  final String urlEncode = "%7C";

  @override
  void initState() {
    super.initState();
    pdfViewerController = PdfViewerController();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) async {
      final bool result = await widget.filterBottomSheet?.call() ?? true;
      if (result) {
        await getData();
      }
    });
  }

  @override
  void dispose() {
    pdfViewerController.dispose();
    StaticVariables.instance.serbestDicParams = {};
    super.dispose();
  }

  @override
  Widget build(BuildContext context) => BaseScaffold(
        appBar: appBar(context),
        bottomNavigationBar: Observer(builder: (_) => Visibility(visible: viewModel.pageCounter > 1, child: bottomAppBar())),
        body: body(),
      );

  AppBar appBar(BuildContext context) => AppBar(
        title: AppBarTitle(
          title: widget.title,
          subtitle: widget.pdfData!.dicParams?.belgeNo ?? "",
        ),
        actions: [
          IconButton(
            onPressed: () async {
              //! EKLENECEK
              await fileChecker();
            },
            icon: const Icon(Icons.share_outlined),
          ),
          // IconButton(
          //     onPressed: () async {
          //😳 await bottomSheetDialogManager.showBottomSheetDialog(context,
          //😳     title: "Yazıcı", children: CacheManager.getAnaVeri?.paramModel?.yaziciList?.map((e) => BottomSheetModel(title: e.yaziciAdi ?? "", onTap: () {})).toList());
          //     },
          //     icon: const Icon(Icons.more_vert_outlined)),
        ],
        bottom: AppBarPreferedSizedBottom(
          children: [
            if (widget.filterBottomSheet != null && widget.filtreVarMi)
              AppBarButton(
                icon: Icons.filter_alt_outlined,
                onPressed: () async {
                  final bool result = widget.filterBottomSheet != null ? await widget.filterBottomSheet!() : true;
                  if (result) {
                    await getData();
                  }
                },
                child: Text(loc.generalStrings.filter),
              ),
            if (!widget.filtreVarMi)
              AppBarButton(
                icon: Icons.refresh_outlined,
                child: Text(loc.generalStrings.refresh),
                onPressed: () async {
                  await getData();
                },
              ),
            AppBarButton(
              icon: Icons.print_outlined,
              child: Text(loc.generalStrings.print),
              onPressed: () async {
                final PrintModel printModel = PrintModel(raporOzelKod: widget.pdfData?.raporOzelKod ?? "", standart: true, etiketSayisi: 1, dicParams: widget.pdfData?.dicParams);
                await bottomSheetDialogManager.showPrintBottomSheetDialog(context, printModel, false, false);
              },
            ),
            AppBarButton(
              icon: Icons.picture_as_pdf_outlined,
              child: const Text("PDF Görüntüle"),
              onPressed: () async {
                if (kIsWeb) return fileDownload(base64Decode(viewModel.pdfModel?.byteData ?? ""), "${widget.pdfData?.raporOzelKod}_${widget.pdfData?.dicParams?.belgeNo}.pdf");
                if (await getFile != null) {
                  await OpenFilex.open((await getFile)!.path);
                }
              },
            ),
          ],
        ),
      );

  Observer body() => Observer(
        builder: (_) {
          if (viewModel.futureController.value == true && viewModel.pdfModel != null) {
            return Observer(
              builder: (_) => SfPdfViewer.memory(
                base64Decode(viewModel.pdfModel?.byteData ?? ""),
                controller: pdfViewerController,
                onHyperlinkClicked: (details) async {
                  final String uri = details.uri;
                  if (uri.startsWith("https://picker.link/")) {
                    if (uri.contains("CARI$urlEncode")) {
                      final String cariKodu = uriSplitter(uri);
                      return dialogManager.showCariGridViewDialog(await networkManager.getCariModel(CariRequestModel(kod: [cariKodu])));
                    }
                    if (uri.contains("CARI_HAR$urlEncode") || uri.contains("CARIHAR$urlEncode")) {
                      final String cariKodu = uriSplitter(uri);
                      return Get.toNamed("mainPage/cariHareketleri", arguments: await networkManager.getCariModel(CariRequestModel(kod: [cariKodu])));
                    }
                    if (uri.contains("STOK$urlEncode")) {
                      final String stokKodu = uriSplitter(uri);
                      return dialogManager.showStokGridViewDialog(await networkManager.getStokModel(StokRehberiRequestModel(stokKodu: stokKodu)));
                    }
                    if (uri.contains("STOK_HAR$urlEncode") || uri.contains("STOKHAR$urlEncode")) {
                      final String stokKodu = uriSplitter(uri);
                      return Get.toNamed("mainPage/stokHareketleri", arguments: await networkManager.getStokModel(StokRehberiRequestModel(stokKodu: stokKodu)));
                    }
                    if (uri.contains("CARI_RAPORLAR")) {
                      final String cariKodu = uriSplitter(uri);
                      return dialogManager.showCariRaporlarGridViewDialog(model: await networkManager.getCariModel(CariRequestModel(kod: [cariKodu])));
                    }
                    if (uri.contains("STOK_RAPORLAR")) {
                      final String stokKodu = uriSplitter(uri);

                      return dialogManager.showStokRaporlarGridViewDialog(model: await networkManager.getStokModel(StokRehberiRequestModel(stokKodu: stokKodu)));
                    }
                    if (uri.contains("SERBEST_RAPOR")) {
                      final int? serbestRaporKodu = int.tryParse(uriSplitter(uri));

                      final NetFectDizaynList? netFectDizaynList = (CacheManager.getAnaVeri?.userModel?.profilYetki?.yazdirmaSerbest == true || AccountModel.instance.adminMi
                              ? parametreModel.netFectDizaynList
                                      ?.where(
                                        (element) =>
                                            element.ozelKod == "Serbest" &&
                                            ((CacheManager.getAnaVeri?.userModel?.profilYetki?.yazdirmaDizaynSerbest?.any((element2) => element2 == element.id) ?? false) ||
                                                AccountModel.instance.adminMi),
                                      )
                                      .toList() ??
                                  []
                              : [])
                          .firstWhereOrNull((element) => element.id == serbestRaporKodu);
                      if (netFectDizaynList == null) return dialogManager.showAlertDialog("$serbestRaporKodu numaralı rapor bulunamadı.");
                      Get.toNamed("/mainPage/serbestRaporlar", arguments: netFectDizaynList, preventDuplicates: false);
                      // if (netFectDizaynList.)

                      return;
                    }
                  } else {
                    if (!await launchUrl(Uri.parse(uri), mode: LaunchMode.inAppWebView)) {
                      throw Exception("Could not launch $uri");
                    }
                  }
                },
                canShowHyperlinkDialog: false,
                onTextSelectionChanged: (details) {
                  if (kIsWeb) {
                    return;
                  }
                  if (Platform.isAndroid || Platform.isIOS) {
                    if (details.selectedText == null && overlayEntry != null) {
                      overlayEntry?.remove();
                      overlayEntry = null;
                    } else if (details.selectedText != null && overlayEntry == null) {
                      showContextMenu(context, details);
                    }
                  }
                },
                onDocumentLoaded: (details) => viewModel.changePageCounter(details.document.pages.count),
                onPageChanged: (details) => viewModel.changeCurrentPage(details.newPageNumber - 1),
              ),
            );
          } else if (viewModel.futureController.value == null) {
            return const Center(child: CircularProgressIndicator.adaptive());
          } else {
            return const Center();
          }
        },
      );

  String uriSplitter(String details) => details.split(urlEncode)[1];

  BottomAppBar bottomAppBar() => BottomAppBar(
        child: Row(
          spacing: UIHelper.lowSize,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          mainAxisSize: MainAxisSize.min,
          children: [
            Expanded(child: Observer(builder: (_) => Text(viewModel.getPageCounter))),
            FloatingActionButton(heroTag: 1, onPressed: () => pdfViewerController.firstPage(), child: const Icon(Icons.first_page_outlined)),
            FloatingActionButton(heroTag: 2, onPressed: () => pdfViewerController.previousPage(), child: const Icon(Icons.arrow_back_outlined)),
            FloatingActionButton(heroTag: 3, onPressed: () => pdfViewerController.nextPage(), child: const Icon(Icons.arrow_forward_outlined)),
            FloatingActionButton(heroTag: 4, onPressed: () => pdfViewerController.lastPage(), child: const Icon(Icons.last_page_outlined)),
          ],
        ),
      );
  Future getData() async {
    viewModel.resetFuture();
    final result = await networkManager.getPDF((widget.serbestMi == true ? widget.pdfData?.copyWith(dicParamsMap: StaticVariables.instance.serbestDicParams) : widget.pdfData) ?? PdfModel());
    if (result.isSuccess) {
      // pdfFile = result.dataList.firstOrNull!;
      if (result.isSuccess) {
        viewModel
          ..setFuture(result.isSuccess)
          ..setPdfModel(result.dataList.firstOrNull);
        // final File? pdf = await getFile;
        // if (pdf != null) {
        // }
      }
    }
    return true;
  }

  Future<void> fileChecker() async {
    if (viewModel.pdfModel != null) {
      XFile? file;
      if (kIsWeb) file = XFile.fromData(base64Decode(viewModel.pdfModel?.byteData ?? ""), mimeType: "application/pdf", name: viewModel.pdfModel?.dosyaAdi ?? "file");
      if (!kIsWeb) file = XFile((await getFile)!.path);
      Share.shareXFiles([file!], subject: "Pdf Paylaşımı");
    } else {
      dialogManager.showErrorSnackBar("Dosya bulunamadı. Lütfen tekrar deneyiniz.");
    }
  }

  Future<File?> get getFile async {
    final appStorage = await getApplicationDocumentsDirectory();
    //create a folder in documents/picker as name picker
    await Directory("${appStorage.path}/picker/pdf").create(recursive: true);
    final file = File(
      '${appStorage.path}/picker/pdf/${widget.pdfData?.raporOzelKod}${widget.pdfData?.dicParams?.cariKodu ?? widget.pdfData?.dicParams?.stokKodu ?? ""}${DateTime.now().toDateTimeHypenString}.${viewModel.pdfModel?.uzanti ?? "pdf"}',
    );
    final fileWriter = file.openSync(mode: FileMode.write)..writeFromSync(base64Decode(viewModel.pdfModel?.byteData ?? ""));
    await fileWriter.close();
    if (file.lengthSync() > 0) {
      viewModel.changePdfFile(file);
    }
    return file.lengthSync() > 0 ? file : null;
  }

  void showContextMenu(BuildContext context, PdfTextSelectionChangedDetails details) {
    final OverlayState overlayState = Overlay.of(context);
    overlayEntry = OverlayEntry(
      builder: (context) => Positioned(
        top: details.globalSelectedRegion!.center.dy - 55,
        left: details.globalSelectedRegion!.bottomLeft.dx,
        child: ElevatedButton(
          onPressed: () {
            Clipboard.setData(ClipboardData(text: details.selectedText ?? ""));
            dialogManager.showSuccessSnackBar("Kopyalandı");
            pdfViewerController.clearSelection();
            overlayEntry?.remove();
          },
          child: const Text("Kopyala"),
        ),
      ),
    );
    if (overlayEntry != null) {
      overlayState.insert(overlayEntry!);
    }
  }
}
