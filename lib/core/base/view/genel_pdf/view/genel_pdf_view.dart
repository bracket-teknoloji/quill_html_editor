import "dart:convert";
import "dart:io";

import "package:flutter/foundation.dart";
import "package:flutter/material.dart";
import "package:flutter/services.dart";
import "package:flutter_mobx/flutter_mobx.dart";
import "package:path_provider/path_provider.dart";
import "package:share_plus/share_plus.dart";
import "package:syncfusion_flutter_pdfviewer/pdfviewer.dart";

import "../../../../components/wrap/appbar_title.dart";
import "../../../model/base_pdf_model.dart";
import "../../../state/base_state.dart";
import "../view_model/genel_pdf_view_model.dart";

final class GenelPdfView extends StatefulWidget {
  const GenelPdfView({super.key, this.model});
  final BasePdfModel? model;

  @override
  State<GenelPdfView> createState() => _GenelPdfViewState();
}

final class _GenelPdfViewState extends BaseState<GenelPdfView> {
  GenelPdfViewModel viewModel = GenelPdfViewModel();
  BasePdfModel? pdfFile;
  late PdfViewerController pdfViewerController;
  OverlayEntry? overlayEntry;

  @override
  void initState() {
    super.initState();
    pdfViewerController = PdfViewerController();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) async {
      viewModel.changePdfFile(await getFile);
    });
  }

  @override
  void dispose() {
    pdfViewerController.dispose();
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
          title: "PDF Görüntüle",
          subtitle: widget.model?.dosyaAdi,
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
        // bottom: AppBarPreferedSizedBottom(
        //   children: [
        //     AppBarButton(
        //       icon: Icons.print_outlined,
        //       child: Text(loc.generalStrings.print),
        //       onPressed: () async {
        //         final PrintModel printModel = PrintModel(raporOzelKod: widget.pdfData?.raporOzelKod ?? "", standart: true, etiketSayisi: 1, dicParams: widget.pdfData?.dicParams);
        //         await bottomSheetDialogManager.showPrintBottomSheetDialog(context, printModel, false, false);
        //       },
        //     ),
        //     AppBarButton(
        //       icon: Icons.picture_as_pdf_outlined,
        //       child: const Text("PDF Görüntüle"),
        //       onPressed: () async {
        //         if (await getFile != null) {
        //           await OpenFile.open((await getFile)!.path);
        //         }
        //       },
        //     ),
        //     // AppBarButton(
        //     //     icon: Icons.mail_outline_outlined,
        //     //     child: const Text("Mail Gönder"),
        //     //     onPressed: () async {
        //     //       //! EKLENECEK
        //     //       await fileChecker();
        //     //     }),
        //   ],
        // ),
      );

  Observer body() => Observer(
        builder: (_) {
          if (viewModel.pdfFile != null) {
            return Observer(
              builder: (_) => SfPdfViewer.file(
                viewModel.pdfFile!,
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
            );
          } else {
            return const Center(child: CircularProgressIndicator.adaptive());
          }
        },
      );

  BottomAppBar bottomAppBar() => BottomAppBar(
        child: Row(
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

  Future<void> fileChecker() async {
    if (await getFile != null) {
      await Share.shareXFiles([XFile((await getFile)!.path)], subject: "Pdf Paylaşımı");
    } else {
      dialogManager.showErrorSnackBar("Dosya bulunamadı. Lütfen tekrar deneyiniz.");
    }
  }

  Future<File?> get getFile async {
    if (kIsWeb) {
      return null;
    }
    final appStorage = await getApplicationDocumentsDirectory();
    //create a folder in documents/picker as name picker
    await Directory("${appStorage.path}/picker/pdf").create(recursive: true);
    final file = File(
      "${appStorage.path}/picker/pdf/${widget.model?.dosyaAdi ?? "demo.pdf"}${widget.model?.uzanti}",
    );
    final fileWriter = file.openSync(mode: FileMode.write)..writeFromSync(base64Decode(widget.model?.byteData ?? ""));
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
