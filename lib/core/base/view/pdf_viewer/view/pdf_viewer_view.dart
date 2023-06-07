import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_pdfview/flutter_pdfview.dart';
import 'package:open_file/open_file.dart';
import 'package:path_provider/path_provider.dart';
import 'package:picker/core/base/model/base_pdf_model.dart';
import 'package:picker/core/base/view/pdf_viewer/model/pdf_viewer_model.dart';
import 'package:picker/core/base/view/pdf_viewer/view_model/pdf_viewer_view_model.dart';
import 'package:share_plus/share_plus.dart';

import '../../../../../view/main_page/model/param_model.dart';
import '../../../../components/appbar/appbar_prefered_sized_bottom.dart';
import '../../../../components/button/elevated_buttons/bottom_appbar_button.dart';
import '../../../../components/dialog/bottom_sheet/model/bottom_sheet_model.dart';
import '../../../../init/cache/cache_manager.dart';
import '../../../state/base_state.dart';

class PDFViewerView extends StatefulWidget {
  final String title;
  final PdfModel? pdfData;

  final Future Function() filterBottomSheet;
  const PDFViewerView({super.key, this.pdfData, required this.filterBottomSheet, required this.title});

  @override
  State<PDFViewerView> createState() => _PDFViewerViewState();
}

class _PDFViewerViewState extends BaseState<PDFViewerView> {
  PdfViewerViewModel viewModel = PdfViewerViewModel();
  BasePdfModel? pdfFile;
  PDFViewController? pdfViewController;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    //* Açılıştaki dialog için
    Future.delayed(Duration.zero, () async {
      bool result = await widget.filterBottomSheet();
      if (result) {
        getData();
      }
    });
    //* Sayfa
    return Scaffold(appBar: appBar(context), bottomNavigationBar: Observer(builder: (_) => Visibility(visible: viewModel.pageCounter > 1, child: bottomAppBar())), body: body());
  }

  AppBar appBar(BuildContext context) {
    return AppBar(
      title: Text(widget.title),
      actions: [
        IconButton(
            onPressed: () async {
              //! EKLENECEK
              Share.shareXFiles([XFile((await getFile).path)], subject: "Pdf Paylaşımı");
            },
            icon: const Icon(Icons.share_outlined)),
        IconButton(
            onPressed: () async {
              await bottomSheetDialogManager.showBottomSheetDialog(context,
                  title: "Yazıcı", children: CacheManager.getAnaVeri()?.paramModel?.yaziciList?.map((e) => BottomSheetModel(title: e.yaziciAdi ?? "", onTap: () {})).toList());
            },
            icon: const Icon(Icons.more_vert_outlined)),
      ],
      bottom: PreferredSize(
        preferredSize: const Size.fromHeight(60),
        child: AppBarPreferedSizedBottom(
          children: [
            AppBarButton(
                icon: Icons.filter_alt_outlined,
                onPressed: () async {
                  bool result = await widget.filterBottomSheet();
                  if (result) {
                    getData();
                  }
                },
                child: const Text("Filtrele")),
            AppBarButton(
                icon: Icons.print_outlined,
                child: const Text("Yazdır"),
                onPressed: () async {
                  List<YaziciList>? yaziciList = CacheManager.getAnaVeri()?.paramModel?.yaziciList;
                  await bottomSheetDialogManager.showBottomSheetDialog(context, title: "Yazıcı", children: yaziciList!.map((e) => BottomSheetModel(title: e.yaziciAdi ?? "", onTap: () {})).toList());
                }),
            AppBarButton(
                icon: Icons.picture_as_pdf_outlined,
                child: const Text("PDF Görüntüle"),
                onPressed: () async {
                  File file = await getFile;
                  OpenFile.open(file.path);
                }),
            AppBarButton(
                icon: Icons.mail_outline_outlined,
                child: const Text("Mail Gönder"),
                onPressed: () async {
                  //! EKLENECEK

                  Share.shareXFiles([XFile((await getFile).path)], subject: "Pdf Paylaşımı");
                }),
          ],
        ),
      ),
    );
  }

  Future<File> get getFile async {
    final appStorage = await getApplicationDocumentsDirectory();
    final file = File('${appStorage.path}/${widget.pdfData?.raporOzelKod}${widget.pdfData?.dicParams?.cariKodu}.${pdfFile?.uzanti ?? "pdf"}');
    final raf = file.openSync(mode: FileMode.write);
    raf.writeFromSync(base64Decode(pdfFile?.byteData ?? ""));
    await raf.close();
    print(file.path);
    return file;
  }

  Observer body() {
    return Observer(builder: (_) {
      if (viewModel.futureController.value == true) {
        return PDFView(
          nightMode: false,
          pageFling: true,
          pdfData: base64Decode(pdfFile?.byteData ?? ""),
          onError: (error) {
            dialogManager.snackBarError("Bir hata oluştu");
          },
          onPageError: (page, error) {},
          onViewCreated: (PDFViewController pdfViewController) {
            this.pdfViewController = pdfViewController;
          },
          onLinkHandler: (String? uri) {},
          autoSpacing: true,
          onPageChanged: (int? page, int? total) {
            viewModel.changeCurrentPage(page ?? 0);
            viewModel.changePageCounter(total ?? 0);
          },
        );
      } else if (viewModel.futureController.value == null) {
        return const Center(child: CircularProgressIndicator());
      } else {
        return const Center();
      }
    });
  }

  BottomAppBar bottomAppBar() => BottomAppBar(
          child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(child: Observer(builder: (_) => Text(viewModel.getPageCounter))),
          IconButton(onPressed: () => pdfViewController?.setPage(0), icon: const Icon(Icons.first_page_outlined)),
          IconButton(onPressed: () => pdfViewController?.setPage(viewModel.currentPage - 1), icon: const Icon(Icons.arrow_back_outlined)),
          IconButton(onPressed: () => pdfViewController?.setPage(viewModel.currentPage + 1), icon: const Icon(Icons.arrow_forward_outlined)),
          Observer(
              builder: (_) => IconButton(
                  onPressed: () {
                    pdfViewController?.setPage(viewModel.pageCounter);
                  },
                  icon: const Icon(Icons.last_page_outlined))),
        ],
      ));
  Future getData() async {
    viewModel.resetFuture();
    var result = await networkManager.getPDF(widget.pdfData ?? PdfModel());
    if (result.data != null) {
      pdfFile = result.data.first;
      if (result.success == true) {
        viewModel.setFuture(result.success);
      }
    }
    return true;
  }
}
