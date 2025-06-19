import "package:flutter/material.dart";
import "package:picker/core/base/model/base_pdf_model.dart";
import "package:picker/core/base/view/genel_pdf/view/genel_pdf_view.dart";

class PaykerTahsilatMakbuzuView extends StatefulWidget {
  const PaykerTahsilatMakbuzuView({required this.model, super.key});

  final BasePdfModel model;

  @override
  State<PaykerTahsilatMakbuzuView> createState() => _PaykerTahsilatMakbuzuViewState();
}

class _PaykerTahsilatMakbuzuViewState extends State<PaykerTahsilatMakbuzuView> {
  @override
  Widget build(BuildContext context) => GenelPdfView(
    model: widget.model,
  );
}
