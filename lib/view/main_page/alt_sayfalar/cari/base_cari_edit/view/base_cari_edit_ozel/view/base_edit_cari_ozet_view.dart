import "package:flutter/material.dart";
import "package:kartal/kartal.dart";

import "../../../../../../../../core/base/state/base_state.dart";
import "../../../../../../../../core/components/helper_widgets/custom_label_widget.dart";
import "../../../../../../../../core/components/textfield/custom_text_field.dart";
import "../../../../../../../../core/constants/extensions/number_extensions.dart";
import "../../../../../../../../core/constants/ondalik_utils.dart";
import "../../../../cari_listesi/model/cari_detay_model.dart";

class BaseEditCariOzetView extends StatefulWidget {
  const BaseEditCariOzetView({super.key});

  @override
  State<BaseEditCariOzetView> createState() => _BaseEditCariOzetViewState();
}

class _BaseEditCariOzetViewState extends BaseState<BaseEditCariOzetView> {
  CariDetayModel? cariDetayModel = CariDetayModel.instance;
  List<BakiyeList>? bakiyeList = CariDetayModel.instance.bakiyeList ?? [];
  final formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    TextEditingController borcEuroController = TextEditingController(text: getBorc("Euro"));
    TextEditingController alacakEuroController = TextEditingController(text: getAlacak("Euro"));
    TextEditingController bakiyeEuroController = TextEditingController(text: getBakiye("Euro"));
    TextEditingController borcDolarController = TextEditingController(text: getBorc("Dolar"));
    TextEditingController alacakDolarController = TextEditingController(text: getAlacak("Dolar"));
    TextEditingController bakiyeDolarController = TextEditingController(text: getBakiye("Dolar"));
    TextEditingController borcTLController = TextEditingController(text: getBorc(mainCurrency));
    TextEditingController alacakTLController = TextEditingController(text: getAlacak(mainCurrency));
    TextEditingController bakiyeTLController = TextEditingController(text: getBakiye(mainCurrency));
    TextEditingController borcToplamiController = TextEditingController(text: "${cariDetayModel?.riskBorcToplami?.commaSeparatedWithDecimalDigits(OndalikEnum.tutar) ?? "0.00"} $mainCurrency");
    TextEditingController alacakToplamiController = TextEditingController(text: "${cariDetayModel?.riskAlacakToplami?.commaSeparatedWithDecimalDigits(OndalikEnum.tutar) ?? "0.00"} $mainCurrency");
    TextEditingController bakiyeToplamiController = TextEditingController(text: "${cariDetayModel?.riskBakiye?.commaSeparatedWithDecimalDigits(OndalikEnum.tutar) ?? "0.00"} $mainCurrency");
    TextEditingController riskLimitiController = TextEditingController(text: "${cariDetayModel?.riskLimiti?.commaSeparatedWithDecimalDigits(OndalikEnum.tutar) ?? "0.00"} $mainCurrency");
    TextEditingController teminatController = TextEditingController(text: "${cariDetayModel?.teminatTutari?.commaSeparatedWithDecimalDigits(OndalikEnum.tutar) ?? "0.00"} $mainCurrency");
    TextEditingController senetAsilController = TextEditingController(text: "${cariDetayModel?.senetAsilRiski?.commaSeparatedWithDecimalDigits(OndalikEnum.tutar) ?? "0.00"} $mainCurrency");
    TextEditingController senetCiroController = TextEditingController(text: "${cariDetayModel?.senetCiroRiski?.commaSeparatedWithDecimalDigits(OndalikEnum.tutar) ?? "0.00"} $mainCurrency");
    TextEditingController cekAsilController = TextEditingController(text: "${cariDetayModel?.cekAsilRiski?.commaSeparatedWithDecimalDigits(OndalikEnum.tutar) ?? "0.00"} $mainCurrency");
    TextEditingController cekCiroController = TextEditingController(text: "${cariDetayModel?.cekCiroRiski?.commaSeparatedWithDecimalDigits(OndalikEnum.tutar) ?? "0.00"} $mainCurrency");
    TextEditingController siparisController = TextEditingController(text: "${cariDetayModel?.siparisRiski?.commaSeparatedWithDecimalDigits(OndalikEnum.tutar) ?? "0.00"} $mainCurrency");
    TextEditingController sevkController = TextEditingController(text: "${cariDetayModel?.sevkRiski?.commaSeparatedWithDecimalDigits(OndalikEnum.tutar) ?? "0.00"} $mainCurrency");
    TextEditingController yuklemelerController = TextEditingController(text: "${cariDetayModel?.yuklemeRiski?.commaSeparatedWithDecimalDigits(OndalikEnum.tutar) ?? "0.00"} $mainCurrency");
    TextEditingController irsaliyeController = TextEditingController(text: "${cariDetayModel?.irsaliyeRiski?.commaSeparatedWithDecimalDigits(OndalikEnum.tutar) ?? "0.00"} $mainCurrency");
    TextEditingController teminatRiskiController = TextEditingController(text: "${cariDetayModel?.teminatRiski?.commaSeparatedWithDecimalDigits(OndalikEnum.tutar) ?? "0.00"} $mainCurrency");
    TextEditingController toplamRiskController =
        TextEditingController(text: "${((cariDetayModel?.riskBorcToplami ?? 0) - (cariDetayModel?.riskAlacakToplami ?? 0)).commaSeparatedWithDecimalDigits(OndalikEnum.tutar)} $mainCurrency");
    return SingleChildScrollView(
      child: Form(
          autovalidateMode: AutovalidateMode.onUserInteraction,
          child: Column(children: [
            getBakiye(mainCurrency) == ""
                ? const Center(
                    child: Column(
                      children: [Icon(Icons.crisis_alert_outlined), Text("Kayıt Bulunamadı")],
                    ),
                  )
                : CustomWidgetWithLabel(
                    text: "Döviz Bakiyeleri",
                    child: Wrap(
                      children: [
                        const Divider(),
                        const Row(
                          children: [
                            Expanded(child: Text("  Borç")),
                            Expanded(child: Text("  Alacak")),
                            Expanded(child: Text("  Bakiye")),
                          ],
                        ),
                        CustomWidgetWithLabel(
                            text: "  €",
                            isVertical: false,
                            child: SizedBox(
                              child: Row(
                                children: [
                                  Expanded(child: CustomTextField(readOnly: true, labelText: "Borç", controller: borcEuroController)),
                                  Expanded(child: CustomTextField(readOnly: true, labelText: "Alacak", controller: alacakEuroController)),
                                  Expanded(child: CustomTextField(readOnly: true, labelText: "Bakiye", controller: bakiyeEuroController)),
                                ],
                              ),
                            )),
                        CustomWidgetWithLabel(
                            text: "  \$",
                            isVertical: false,
                            child: SizedBox(
                              child: Row(
                                children: [
                                  Expanded(child: CustomTextField(readOnly: true, labelText: "Borç", controller: borcDolarController)),
                                  Expanded(child: CustomTextField(readOnly: true, labelText: "Alacak", controller: alacakDolarController)),
                                  Expanded(child: CustomTextField(readOnly: true, labelText: "Bakiye", controller: bakiyeDolarController)),
                                ],
                              ),
                            )),
                        CustomWidgetWithLabel(
                            text: "  $mainCurrency",
                            isVertical: false,
                            child: SizedBox(
                              child: Row(
                                children: [
                                  Expanded(child: CustomTextField(readOnly: true, labelText: "Borç", controller: borcTLController)),
                                  Expanded(child: CustomTextField(readOnly: true, labelText: "Alacak", controller: alacakTLController)),
                                  Expanded(child: CustomTextField(readOnly: true, labelText: "Bakiye", controller: bakiyeTLController)),
                                ],
                              ),
                            )),
                      ],
                    )),
            CustomWidgetWithLabel(
              text: "Risk Bilgileri",
              child: Wrap(children: [
                Row(
                  children: [
                    Expanded(child: CustomTextField(readOnly: true, labelText: "Borç Toplamı", controller: borcToplamiController)),
                    Expanded(child: CustomTextField(readOnly: true, labelText: "Alacak Toplamı", controller: alacakToplamiController)),
                  ],
                ),
                CustomTextField(readOnly: true, labelText: "Bakiye", controller: bakiyeToplamiController),
                Row(
                  children: [
                    Expanded(child: CustomTextField(readOnly: true, labelText: "Risk Limiti", controller: riskLimitiController)),
                    Expanded(child: CustomTextField(readOnly: true, labelText: "Teminat", controller: teminatController)),
                  ],
                ),
                Row(
                  children: [
                    Expanded(
                        child: CustomTextField(
                            readOnly: true,
                            labelText: "Senet Asıl Riski",
                            valueText: "% ${CariDetayModel.instance.senetAsilRiskO?.toIntIfDouble.toStringIfNotNull ?? ""}",
                            controller: senetAsilController)),
                    Expanded(
                        child: CustomTextField(
                            readOnly: true,
                            labelText: "Senet Ciro Riski",
                            valueText: "% ${CariDetayModel.instance.senetCiroRiskO?.toIntIfDouble.toStringIfNotNull ?? ""}",
                            controller: senetCiroController)),
                  ],
                ),
                Row(
                  children: [
                    Expanded(
                        child: CustomTextField(
                            readOnly: true,
                            labelText: "Çek Asıl Riski",
                            valueText: "% ${CariDetayModel.instance.senetAsilRiskO?.toIntIfDouble.toStringIfNotNull ?? ""}",
                            controller: cekAsilController)),
                    Expanded(
                        child: CustomTextField(
                            readOnly: true,
                            labelText: "Çek Ciro Riski",
                            valueText: "% ${CariDetayModel.instance.senetCiroRiskO?.toIntIfDouble.toStringIfNotNull ?? ""}",
                            controller: cekCiroController)),
                  ],
                ),
                Row(
                  children: [
                    Expanded(child: CustomTextField(readOnly: true, labelText: "Sipariş Riski", controller: siparisController)),
                    Expanded(child: CustomTextField(readOnly: true, labelText: "Sevk Riski", controller: sevkController)),
                  ],
                ),
                Row(
                  children: [
                    Expanded(child: CustomTextField(readOnly: true, labelText: "Yükleme Riski", controller: yuklemelerController)),
                    Expanded(child: CustomTextField(readOnly: true, labelText: "İrsaliye Riski", controller: irsaliyeController)),
                  ],
                ),
                Row(
                  children: [
                    Expanded(child: CustomTextField(readOnly: true, labelText: "Teminat Riski", controller: teminatRiskiController)),
                    Expanded(child: CustomTextField(readOnly: true, labelText: "Toplam Risk", controller: toplamRiskController)),
                  ],
                ),
              ]),
            )
          ])),
    );
  }

  String getBakiye(String paraBirimi) {
    if (bakiyeList.ext.isNotNullOrEmpty) {
      if (paraBirimi == mainCurrency) {
        if (bakiyeList?.firstWhereOrNull((element) => element.dovizAdi == null) != null) {
          return bakiyeList?.firstWhereOrNull((element) => element.dovizAdi == null)?.bakiye?.commaSeparatedWithDecimalDigits(OndalikEnum.tutar) ?? "";
        } else {
          return "0";
        }
      } else if (paraBirimi == "Dolar") {
        if (bakiyeList?.firstWhereOrNull((element) => element.dovizTipi == 1) != null) {
          return bakiyeList?.firstWhereOrNull((element) => element.dovizTipi == 1)?.bakiye?.commaSeparatedWithDecimalDigits(OndalikEnum.tutar) ?? "";
        } else {
          return "0";
        }
      } else if (paraBirimi == "Euro") {
        if (bakiyeList?.firstWhereOrNull((element) => element.dovizTipi == 2) != null) {
          return bakiyeList?.firstWhereOrNull((element) => element.dovizTipi == 2)?.bakiye?.commaSeparatedWithDecimalDigits(OndalikEnum.tutar) ?? "";
        } else {
          return "0";
        }
      } else {
        return "";
      }
    } else {
      return "";
    }
  }

  String getAlacak(String paraBirimi) {
    if (bakiyeList.ext.isNotNullOrEmpty) {
      if (paraBirimi == mainCurrency) {
        if (bakiyeList?.firstWhereOrNull((element) => element.dovizAdi == null) != null) {
          return bakiyeList?.firstWhereOrNull((element) => element.dovizAdi == null)?.alacakToplami?.commaSeparatedWithDecimalDigits(OndalikEnum.tutar) ?? "";
        } else {
          return "0";
        }
      } else if (paraBirimi == "Dolar") {
        if (bakiyeList?.firstWhereOrNull((element) => element.dovizAdi == "\$") != null) {
          return bakiyeList?.firstWhereOrNull((element) => element.dovizAdi == "\$")?.alacakToplami?.commaSeparatedWithDecimalDigits(OndalikEnum.tutar) ?? "";
        } else {
          return "0";
        }
      } else if (paraBirimi == "Euro") {
        if (bakiyeList?.firstWhereOrNull((element) => element.dovizAdi == "€") != null) {
          return bakiyeList?.firstWhereOrNull((element) => element.dovizAdi == "€")?.alacakToplami?.commaSeparatedWithDecimalDigits(OndalikEnum.tutar) ?? "";
        } else {
          return "0";
        }
      } else {
        return "0";
      }
    } else {
      return "";
    }
  }

  String getBorc(String paraBirimi) {
    if (bakiyeList.ext.isNotNullOrEmpty) {
      if (paraBirimi == mainCurrency) {
        if (bakiyeList?.firstWhereOrNull((element) => element.dovizAdi == null) != null) {
          return bakiyeList?.firstWhereOrNull((element) => element.dovizAdi == null)?.borcToplami?.commaSeparatedWithDecimalDigits(OndalikEnum.tutar) ?? "";
        } else {
          return "";
        }
      } else if (paraBirimi == "Dolar") {
        if (bakiyeList?.firstWhereOrNull((element) => element.dovizAdi == "\$") != null) {
          return bakiyeList?.firstWhereOrNull((element) => element.dovizAdi == "\$")?.borcToplami?.commaSeparatedWithDecimalDigits(OndalikEnum.tutar) ?? "";
        } else {
          return "";
        }
      } else if (paraBirimi == "Euro") {
        if (bakiyeList?.firstWhereOrNull((element) => element.dovizAdi == "€") != null) {
          return bakiyeList?.firstWhereOrNull((element) => element.dovizAdi == "€")?.borcToplami?.commaSeparatedWithDecimalDigits(OndalikEnum.tutar) ?? "";
        } else {
          return "";
        }
      } else {
        return "";
      }
    } else {
      return "";
    }
  }
}
