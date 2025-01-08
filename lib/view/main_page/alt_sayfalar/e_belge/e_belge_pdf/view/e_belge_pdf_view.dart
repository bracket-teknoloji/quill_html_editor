import "dart:convert";
import "dart:io";

import "package:flutter/foundation.dart";
import "package:flutter/material.dart";
import "package:flutter/services.dart";
import "package:flutter_mobx/flutter_mobx.dart";
import "package:get/get.dart";
import "package:open_filex/open_filex.dart";
import "package:share_plus/share_plus.dart";
import "package:syncfusion_flutter_pdfviewer/pdfviewer.dart";

import "../../../../../../core/base/state/base_state.dart";
import "../../../../../../core/components/bottom_bar/bottom_bar.dart";
import "../../../../../../core/components/button/elevated_buttons/footer_button.dart";
import "../../../../../../core/components/dialog/bottom_sheet/model/bottom_sheet_model.dart";
import "../../../../../../core/components/wrap/appbar_title.dart";
import "../../../../../../core/constants/extensions/widget_extensions.dart";
import "../../../../../../core/constants/ui_helper/ui_helper.dart";
import "../../../../../../core/init/platform_implementations.dart" if (dart.library.html) "package:picker/core/init/web/file_downloader.dart" show fileDownload;
import "../../e_belge_gelen_giden_kutusu/model/e_belge_listesi_model.dart";
import "../model/e_belge_pdf_request_model.dart";
import "../view_model/e_belge_pdf_view_model.dart";

final class EBelgePdfView extends StatefulWidget {
  const EBelgePdfView({required this.model, super.key});
  final EBelgeListesiModel model;

  @override
  State<EBelgePdfView> createState() => _EBelgePdfViewState();
}

final class _EBelgePdfViewState extends BaseState<EBelgePdfView> {
  late final EBelgePdfViewModel viewModel;
  late PdfViewerController pdfViewerController;
  OverlayEntry? overlayEntry;

  @override
  void initState() {
    viewModel = EBelgePdfViewModel(model: EBelgePdfRequestModel.fromEBelgeListesiModel(widget.model));
    pdfViewerController = PdfViewerController();
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      await viewModel.getData();
      if (viewModel.eBelgePdfModel == null) {
        Get.back();
      }
    });
    super.initState();
  }

  @override
  void dispose() {
    pdfViewerController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) => BaseScaffold(
        appBar: appBar,
        bottomNavigationBar: Observer(
          builder: (_) => bottomAppBar.yetkiVarMi(viewModel.pageCounter > 1),
        ),
        body: body(context),
      );

  AppBar get appBar => AppBar(
        title: Observer(
          builder: (_) => AppBarTitle(title: widget.model.getTitle, subtitle: viewModel.model.resmiBelgeNo),
        ),
        actions: [
          IconButton(onPressed: fileChecker, icon: const Icon(Icons.share_outlined)),
          IconButton(onPressed: () => Get.back(result: true), icon: const Icon(Icons.send_outlined)).yetkiVarMi(widget.model.taslakMi),
          IconButton(onPressed: secenekler, icon: const Icon(Icons.more_vert_outlined)),
        ].whereType<IconButton>().toList(),
      );

  Observer body(BuildContext context) => Observer(
        builder: (_) => viewModel.eBelgePdfModel != null
            ? Observer(
                builder: (_) => SfPdfViewer.memory(
                  base64Decode(viewModel.eBelgePdfModel?.fileModel?.byteData ?? ""),
                  controller: pdfViewerController,
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
              )
            : const Center(child: CircularProgressIndicator.adaptive()),
      );

  Observer get bottomAppBar => Observer(
        builder: (_) => BottomBarWidget(
          isScrolledDown: viewModel.pageCounter > 1,
          children: [
            FooterButton(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Expanded(child: Observer(builder: (_) => Text(viewModel.getPageCounter))),
                    FloatingActionButton.small(onPressed: () => pdfViewerController.firstPage(), child: const Icon(Icons.first_page_outlined)),
                    FloatingActionButton.small(onPressed: () => pdfViewerController.previousPage(), child: const Icon(Icons.arrow_back_outlined)),
                    FloatingActionButton.small(onPressed: () => pdfViewerController.nextPage(), child: const Icon(Icons.arrow_forward_outlined)),
                    FloatingActionButton.small(onPressed: () => pdfViewerController.lastPage(), child: const Icon(Icons.last_page_outlined)),
                  ],
                ).marginAll(UIHelper.lowSize),
              ],
            ),
          ],
        ),
      );

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

  void fileChecker() {
    if (viewModel.eBelgePdfModel?.fileModel?.byteData != null) {
      XFile? file;
      if (!kIsWeb) file = XFile.fromData(base64Decode(viewModel.eBelgePdfModel?.fileModel?.byteData ?? ""), mimeType: "application/pdf", name: viewModel.eBelgePdfModel?.fileModel?.dosyaAdi ?? "file");
      Share.shareXFiles([file!], subject: "Pdf Paylaşımı");
    } else {
      dialogManager.showErrorSnackBar("Dosya bulunamadı. Lütfen tekrar deneyiniz.");
    }
  }

  Future<void> secenekler() async {
    await bottomSheetDialogManager.showBottomSheetDialog(
      context,
      title: loc.generalStrings.options,
      children: [
        BottomSheetModel(
          title: "PDF Görüntüle",
          iconWidget: Icons.picture_as_pdf_outlined,
          onTap: () async {
            if (kIsWeb) return fileDownload(base64Decode(viewModel.eBelgePdfModel?.fileModel?.byteData ?? ""), viewModel.eBelgePdfModel?.fileModel?.dosyaAdi ?? "pdf");
            final file = await viewModel.getFile();
            if (file != null) {
              await OpenFilex.open(file.path);
            }
          },
        ),
        // BottomSheetModel(
        //   title: "PDF Görüntüle",
        //   iconWidget: Icons.picture_as_pdf_outlined,
        //   onTap: () async {
        //     await bottomSheetDialogManager.showPrintBottomSheetDialog(context, printModel, askDizayn, askMiktar);
        //   },
        // ),
      ],
    );
  }
}
