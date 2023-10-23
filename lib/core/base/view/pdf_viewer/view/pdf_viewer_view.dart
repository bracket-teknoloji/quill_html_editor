import "dart:convert";
import "dart:io";

import "package:flutter/material.dart";
import "package:flutter/services.dart";
import "package:flutter_mobx/flutter_mobx.dart";
import "package:open_file_plus/open_file_plus.dart";
import "package:path_provider/path_provider.dart";
import "package:share_plus/share_plus.dart";
import "package:syncfusion_flutter_pdfviewer/pdfviewer.dart";

import "../../../../components/appbar/appbar_prefered_sized_bottom.dart";
import "../../../../components/button/elevated_buttons/bottom_appbar_button.dart";
import "../../../../constants/extensions/date_time_extensions.dart";
import "../../../model/base_pdf_model.dart";
import "../../../model/print_model.dart";
import "../../../state/base_state.dart";
import "../model/pdf_viewer_model.dart";
import "../view_model/pdf_viewer_view_model.dart";

class PDFViewerView extends StatefulWidget {
  final String title;
  final PdfModel? pdfData;
  final Future Function()? filterBottomSheet;
  const PDFViewerView({super.key, this.pdfData, this.filterBottomSheet, required this.title});

  @override
  State<PDFViewerView> createState() => _PDFViewerViewState();
}

class _PDFViewerViewState extends BaseState<PDFViewerView> {
  PdfViewerViewModel viewModel = PdfViewerViewModel();
  BasePdfModel? pdfFile;
  late PdfViewerController pdfViewerController;
  OverlayEntry? overlayEntry;

  @override
  void initState() {
    pdfViewerController = PdfViewerController();
    super.initState();
  }

  @override
  void dispose() {
    pdfViewerController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    //* Açılıştaki dialog için
    Future.delayed(Duration.zero, () async {
      final bool result = await widget.filterBottomSheet?.call() ?? true;
      if (result) {
        getData();
      }
    });
    //* Sayfa
    return Scaffold(
      appBar: appBar(context),
      bottomNavigationBar: Observer(builder: (_) => Visibility(visible: viewModel.pageCounter > 1, child: bottomAppBar())),
      body: body(),
    );
  }

  void awaiter() async {
    final File? pdf = await getFile;
    if (pdf != null) {
      viewModel.changePdfFile(pdf);
    }
  }

  AppBar appBar(BuildContext context) => AppBar(
        title: Text(widget.title),
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
          //😳     title: "Yazıcı", children: CacheManager.getAnaVeri()?.paramModel?.yaziciList?.map((e) => BottomSheetModel(title: e.yaziciAdi ?? "", onTap: () {})).toList());
          //     },
          //     icon: const Icon(Icons.more_vert_outlined)),
        ],
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(60),
          child: AppBarPreferedSizedBottom(
            children: [
              if (widget.filterBottomSheet != null)
                AppBarButton(
                  icon: Icons.filter_alt_outlined,
                  onPressed: () async {
                    final bool result = widget.filterBottomSheet != null ? await widget.filterBottomSheet!() : true;

                    if (result) {
                      getData();
                    }
                  },
                  child: const Text("Filtrele"),
                )
              else
                null,
              AppBarButton(
                icon: Icons.print_outlined,
                child: const Text("Yazdır"),
                onPressed: () async {
                  final PrintModel printModel = PrintModel(raporOzelKod: widget.pdfData?.raporOzelKod ?? "", standart: true, etiketSayisi: 1, dicParams: widget.pdfData?.dicParams);
                  await bottomSheetDialogManager.showPrintBottomSheetDialog(context, printModel, false, false);
                },
              ),
              AppBarButton(
                icon: Icons.picture_as_pdf_outlined,
                child: const Text("PDF Görüntüle"),
                onPressed: () async {
                  if (await getFile != null) {
                    OpenFile.open((await getFile)!.path);
                  }
                },
              ),
              // AppBarButton(
              //     icon: Icons.mail_outline_outlined,
              //     child: const Text("Mail Gönder"),
              //     onPressed: () async {
              //       //! EKLENECEK
              //       await fileChecker();
              //     }),
            ],
          ),
        ),
      );

  Observer body() => Observer(
        builder: (_) {
          if (viewModel.futureController.value == true && viewModel.pdfFile != null) {
            return Observer(
              builder: (_) => SfPdfViewer.file(
                viewModel.pdfFile!,
                controller: pdfViewerController,
                interactionMode: PdfInteractionMode.selection,
                onTextSelectionChanged: (details) {
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

  BottomAppBar bottomAppBar() => BottomAppBar(
        height: 70,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          mainAxisSize: MainAxisSize.min,
          children: [
            Expanded(child: Observer(builder: (_) => Text(viewModel.getPageCounter))),
            IconButton(onPressed: () => pdfViewerController.firstPage(), icon: const Icon(Icons.first_page_outlined)),
            IconButton(onPressed: () => pdfViewerController.previousPage(), icon: const Icon(Icons.arrow_back_outlined)),
            IconButton(onPressed: () => pdfViewerController.nextPage(), icon: const Icon(Icons.arrow_forward_outlined)),
            Observer(builder: (_) => IconButton(onPressed: () => pdfViewerController.lastPage(), icon: const Icon(Icons.last_page_outlined))),
          ],
        ),
      );
  Future getData() async {
    viewModel.resetFuture();
    final result = await networkManager.getPDF(widget.pdfData ?? PdfModel());
    if (result.data != null) {
      pdfFile = result.data.first;
      if (result.success == true) {
        viewModel.setFuture(result.success);
        awaiter();
      }
    }
    return true;
  }

  Future<void> fileChecker() async {
    if (await getFile != null) {
      Share.shareXFiles([XFile((await getFile)!.path)], subject: "Pdf Paylaşımı");
    } else {
      dialogManager.showErrorSnackBar("Dosya bulunamadı. Lütfen tekrar deneyiniz.");
    }
  }

  Future<File?> get getFile async {
    final appStorage = await getApplicationDocumentsDirectory();
    //create a folder in documents/picker as name picker
    await Directory("${appStorage.path}/picker/pdf").create(recursive: true);
    final file = File(
      '${appStorage.path}/picker/pdf/${widget.pdfData?.raporOzelKod}${widget.pdfData?.dicParams?.cariKodu ?? widget.pdfData?.dicParams?.stokKodu ?? ""}${DateTime.now().toDateTimeHypenString()}.${pdfFile?.uzanti ?? "pdf"}',
    );
    final fileWriter = file.openSync(mode: FileMode.write);
    fileWriter.writeFromSync(base64Decode(pdfFile?.byteData ?? ""));
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
