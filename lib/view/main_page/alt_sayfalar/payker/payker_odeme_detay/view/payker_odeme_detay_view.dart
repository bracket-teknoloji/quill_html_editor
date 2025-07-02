import "package:flutter/material.dart";
import "package:get/get.dart";
import "package:picker/core/base/model/base_pdf_model.dart";
import "package:picker/core/base/state/base_state.dart";
import "package:picker/core/base/view/genel_pdf/view/genel_pdf_view.dart";
import "package:picker/core/components/badge/colorful_badge.dart";
import "package:picker/core/components/layout/custom_layout_builder.dart";
import "package:picker/core/components/textfield/custom_text_field.dart";
import "package:picker/core/constants/extensions/number_extensions.dart";
import "package:picker/core/constants/ondalik_utils.dart";
import "package:picker/core/constants/ui_helper/ui_helper.dart";
import "package:picker/core/init/network/login/api_urls.dart";
import "package:picker/view/main_page/alt_sayfalar/payker/payker_odeme_listesi/model/payker_odeme_listesi_model.dart";

class PaykerOdemeDetayView extends StatefulWidget {
  const PaykerOdemeDetayView({required this.model, super.key});

  final PaykerOdemeListesiModel model;

  @override
  State<PaykerOdemeDetayView> createState() => _PaykerOdemeDetayViewState();
}

class _PaykerOdemeDetayViewState extends BaseState<PaykerOdemeDetayView> {
  @override
  Widget build(BuildContext context) => Scaffold(
    appBar: AppBar(
      title: const Text("Detay görüntüle"),
    ),
    body: SingleChildScrollView(
      child: Padding(
        padding: UIHelper.lowPadding,
        child: Card(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Center(
                child: Column(
                  children: [
                    Hero(
                      tag: widget.model.id ?? "",
                      child: CircleAvatar(
                        foregroundImage: Image.network(
                          ApiUrls.basePaykerURLWithoutApi + (widget.model.banka?.logoUrl ?? ""),
                        ).image,
                        child: Text(widget.model.kartIsim?.substring(0, 1) ?? ""),
                      ),
                    ),
                    Text(
                      widget.model.banka?.adi ?? "",
                      style: theme.textTheme.bodyLarge?.copyWith(fontWeight: FontWeight.bold),
                    ),
                    ColorfulBadge(
                      label: Text(widget.model.durum ?? "", style: const TextStyle(fontWeight: FontWeight.w500)),
                      badgeColorEnum: widget.model.badgeColor,
                      onTap: () async {
                        if (widget.model.durumAciklama case final value?) {
                          dialogManager.showInfoSnackBar(value);
                        }
                      },
                    ),
                  ],
                ),
              ),
              const SizedBox(height: UIHelper.lowSize),
              CustomTextField(
                labelText: "ID",
                readOnly: true,
                controllerText: widget.model.siparisNo ?? "",
              ),
              CustomLayoutBuilder.divideInHalf(
                children: [
                  CustomTextField(
                    labelText: "Firma ID",
                    readOnly: true,
                    controllerText: widget.model.firmaId?.toString() ?? "",
                  ),
                  CustomTextField(
                    labelText: "Kart İsim",
                    readOnly: true,
                    controllerText: widget.model.kartIsim ?? "",
                  ),
                  CustomTextField(
                    labelText: "Kart No",
                    readOnly: true,
                    controllerText: widget.model.kartNo ?? "",
                  ),
                  CustomTextField(
                    labelText: "Tutar",
                    readOnly: true,
                    controllerText: widget.model.tutar.commaSeparatedWithDecimalDigits(OndalikEnum.tutar),
                  ),

                  CustomTextField(
                    labelText: "Taksit Sayısı",
                    readOnly: true,
                    controllerText: widget.model.taksitSayisi.toStringIfNotNull ?? "",
                  ),
                ],
              ),
              CustomTextField(
                labelText: "Açıklama",
                readOnly: true,
                controllerText: widget.model.aciklama ?? "",
              ),
              CustomTextField(
                labelText: "Durum Açıklama",
                readOnly: true,
                controllerText: widget.model.durumAciklama ?? "",
              ),
              if (widget.model.durum == "ALINDI")
                Padding(
                  padding: UIHelper.lowPadding,
                  child: ElevatedButton.icon(
                    onPressed: () async {
                      final id = widget.model.belgeNo;
                      await Get.to(
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
                    label: const Text("Tahsilat Makbuzu Görüntüle"),
                    icon: const Icon(Icons.picture_as_pdf_outlined),
                  ),
                ),
            ],
          ),
        ),
      ),
    ),
  );
}
