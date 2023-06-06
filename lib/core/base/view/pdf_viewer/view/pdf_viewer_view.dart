import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_pdfview/flutter_pdfview.dart';
import 'package:picker/core/base/model/base_pdf_model.dart';
import 'package:picker/core/base/view/pdf_viewer/model/pdf_viewer_model.dart';

import '../../../state/base_state.dart';

class PDFViewerView extends StatefulWidget {
  final PdfModel? pdfData;
  const PDFViewerView({super.key, this.pdfData});

  @override
  State<PDFViewerView> createState() => _PDFViewerViewState();
}

class _PDFViewerViewState extends BaseState<PDFViewerView> {
  BasePdfModel? pdfFile;
  Future? pdfFuture;
  @override
  void initState() {
    getData();
    super.initState();
  }

  Future<bool> getData() async {
    var result = await networkManager.getPDF(widget.pdfData ?? PdfModel());
    if (result != null) {
      pdfFile = result.data.first;
      pdfFuture = Future.value(true);
    }
    setState(() {});
    return true;
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: pdfFuture,
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.done) {
          return PDFView(
            nightMode: true,
            pageFling: true,
            pdfData: base64Decode(pdfFile!.byteData ?? ""),

            // filePath: "https://www.africau.edu/images/default/sample.pdf",
            onError: (error) {
              dialogManager.snackBarError("Bir hata oluştu");
            },
            onPageError: (page, error) {},
            onViewCreated: (PDFViewController pdfViewController) {
              pdfViewController.setPage(0);
            },
            onLinkHandler: (String? uri) {},
            onPageChanged: (int? page, int? total) {},
          );
        } else if (snapshot.hasError) {
          return Center(child: Text("Bir hata oluştu\n${snapshot.error}"));
        } else {
          return const Center(child: CircularProgressIndicator());
        }
      },
    );
  }
}
