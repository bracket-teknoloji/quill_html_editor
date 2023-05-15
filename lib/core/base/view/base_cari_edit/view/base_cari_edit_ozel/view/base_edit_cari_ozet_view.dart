import 'package:flutter/material.dart';
import 'package:kartal/kartal.dart';
import 'package:picker/core/base/helpers/helper.dart';
import 'package:picker/core/components/textfield/custom_label_widget.dart';
import 'package:picker/core/components/textfield/custom_text_field.dart';
import 'package:picker/view/main_page/alt_sayfalar/cari/cari_listesi/model/cari_detay_model.dart';

class BaseEditCariOzetView extends StatefulWidget {
  const BaseEditCariOzetView({super.key});

  @override
  State<BaseEditCariOzetView> createState() => _BaseEditCariOzetViewState();
}

class _BaseEditCariOzetViewState extends State<BaseEditCariOzetView> {
  CariDetayModel? cariDetayModel = CariDetayModel.instance;
  List<BakiyeList>? bakiyeList = CariDetayModel.instance.bakiyeList ?? [];
  @override
  Widget build(BuildContext context) {
    TextEditingController borcEuroController = TextEditingController(text: getBorc("Euro"));
    TextEditingController alacakEuroController = TextEditingController(text: getAlacak("Euro"));
    TextEditingController bakiyeEuroController = TextEditingController(text: getBakiye("Euro"));
    TextEditingController borcDolarController = TextEditingController(text: getBorc("Dolar"));
    TextEditingController alacakDolarController = TextEditingController(text: getAlacak("Dolar"));
    TextEditingController bakiyeDolarController = TextEditingController(text: getBakiye("Dolar"));
    TextEditingController borcTLController = TextEditingController(text: getBorc("TL"));
    TextEditingController alacakTLController = TextEditingController(text: getAlacak("TL"));
    TextEditingController bakiyeTLController = TextEditingController(text: getBakiye("TL"));
    TextEditingController borcToplamiController = TextEditingController(text: "${cariDetayModel?.riskBorcToplami?.commaSeparatedWithFixedDigits ?? "0.00"} TL");
    TextEditingController alacakToplamiController = TextEditingController(text: "${cariDetayModel?.riskAlacakToplami?.commaSeparatedWithFixedDigits ?? "0.00"} TL");
    TextEditingController bakiyeToplamiController = TextEditingController(text: "${cariDetayModel?.riskBakiye?.commaSeparatedWithFixedDigits ?? "0.00"} TL");
    TextEditingController riskLimitiController = TextEditingController(text: "${cariDetayModel?.riskLimiti?.commaSeparatedWithFixedDigits ?? "0.00"} TL");
    TextEditingController teminatController = TextEditingController(text: "${cariDetayModel?.teminatTutari?.commaSeparatedWithFixedDigits ?? "0.00"} TL");
    TextEditingController senetAsilController = TextEditingController(text: "${cariDetayModel?.senetAsilRiski?.commaSeparatedWithFixedDigits ?? "0.00"} TL");
    TextEditingController senetCiroController = TextEditingController(text: "${cariDetayModel?.senetCiroRiski?.commaSeparatedWithFixedDigits ?? "0.00"} TL");
    TextEditingController cekAsilController = TextEditingController(text: "${cariDetayModel?.cekAsilRiski?.commaSeparatedWithFixedDigits ?? "0.00"} TL");
    TextEditingController cekCiroController = TextEditingController(text: "${cariDetayModel?.cekCiroRiski?.commaSeparatedWithFixedDigits ?? "0.00"} TL");
    TextEditingController siparisController = TextEditingController(text: "${cariDetayModel?.siparisRiski?.commaSeparatedWithFixedDigits ?? "0.00"} TL");
    TextEditingController sevkController = TextEditingController(text: "${cariDetayModel?.sevkRiski?.commaSeparatedWithFixedDigits ?? "0.00"} TL");
    TextEditingController yuklemelerController = TextEditingController(text: "${cariDetayModel?.yuklemeRiski?.commaSeparatedWithFixedDigits ?? "0.00"} TL");
    TextEditingController irsaliyeController = TextEditingController(text: "${cariDetayModel?.irsaliyeRiski?.commaSeparatedWithFixedDigits ?? "0.00"} TL");
    TextEditingController teminatRiskiController = TextEditingController(text: "${cariDetayModel?.teminatRiski?.commaSeparatedWithFixedDigits ?? "0.00"} TL");
    TextEditingController toplamRiskController = TextEditingController(text: "${((cariDetayModel?.riskBorcToplami ?? 0) - (cariDetayModel?.riskAlacakToplami ?? 0)).commaSeparatedWithFixedDigits} TL");
    return SingleChildScrollView(
      child: Form(
          child: Column(children: [
        getBakiye("TL") == ""
            ? Center(
                child: Column(
                  children: const [Icon(Icons.crisis_alert_outlined), Text("Kayıt Bulunamadı")],
                ),
              )
            : CustomWidgetWithLabel(text: "Döviz Bakiyeleri", children: [
                const Divider(),
                Row(
                  children: const [
                    Expanded(child: Text("  Borç")),
                    Expanded(child: Text("  Alacak")),
                    Expanded(child: Text("  Bakiye")),
                  ],
                ),
                CustomWidgetWithLabel(
                  text: "  €",
                  isVertical: false,
                  children: [
                    SizedBox(
                      child: Row(
                        children: [
                          Expanded(child: CustomTextField(readOnly: true, labelText: "Borç", controller: borcEuroController)),
                          Expanded(child: CustomTextField(readOnly: true, labelText: "Alacak", controller: alacakEuroController)),
                          Expanded(child: CustomTextField(readOnly: true, labelText: "Bakiye", controller: bakiyeEuroController)),
                        ],
                      ),
                    )
                  ],
                ),
                CustomWidgetWithLabel(
                  text: "  \$",
                  isVertical: false,
                  children: [
                    SizedBox(
                      child: Row(
                        children: [
                          Expanded(child: CustomTextField(readOnly: true, labelText: "Borç", controller: borcDolarController)),
                          Expanded(child: CustomTextField(readOnly: true, labelText: "Alacak", controller: alacakDolarController)),
                          Expanded(child: CustomTextField(readOnly: true, labelText: "Bakiye", controller: bakiyeDolarController)),
                        ],
                      ),
                    )
                  ],
                ),
                CustomWidgetWithLabel(
                  text: "  TL",
                  isVertical: false,
                  children: [
                    SizedBox(
                      child: Row(
                        children: [
                          Expanded(child: CustomTextField(readOnly: true, labelText: "Borç", controller: borcTLController)),
                          Expanded(child: CustomTextField(readOnly: true, labelText: "Alacak", controller: alacakTLController)),
                          Expanded(child: CustomTextField(readOnly: true, labelText: "Bakiye", controller: bakiyeTLController)),
                        ],
                      ),
                    )
                  ],
                ),
              ]),
        CustomWidgetWithLabel(
          text: "Risk Bilgileri",
          children: [
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
                        readOnly: true, labelText: "Senet Asıl Riski", valueText: "% ${CariDetayModel.instance.senetAsilRiskO?.toIntIfDouble.toStringIfNull}", controller: senetAsilController)),
                Expanded(
                    child: CustomTextField(
                        readOnly: true, labelText: "Senet Ciro Riski", valueText: "% ${CariDetayModel.instance.senetCiroRiskO?.toIntIfDouble.toStringIfNull}", controller: senetCiroController)),
              ],
            ),
            Row(
              children: [
                Expanded(
                    child: CustomTextField(
                        readOnly: true, labelText: "Çek Asıl Riski", valueText: "% ${CariDetayModel.instance.senetAsilRiskO?.toIntIfDouble.toStringIfNull}", controller: cekAsilController)),
                Expanded(
                    child: CustomTextField(
                        readOnly: true, labelText: "Çek Ciro Riski", valueText: "% ${CariDetayModel.instance.senetCiroRiskO?.toIntIfDouble.toStringIfNull}", controller: cekCiroController)),
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
          ],
        )
      ])),
    );
  }

  String getBakiye(String paraBirimi) {
    if (bakiyeList.isNotNullOrEmpty) {
      if (paraBirimi == "TL") {
        return bakiyeList?.where((element) => element.dovizTipi == 0).first.bakiye?.commaSeparatedWithFixedDigits ?? "";
      } else if (paraBirimi == "Dolar") {
        return bakiyeList?.where((element) => element.dovizTipi == 1).first.bakiye?.commaSeparatedWithFixedDigits ?? "";
      } else if (paraBirimi == "Euro") {
        return bakiyeList?.where((element) => element.dovizTipi == 2).first.bakiye?.commaSeparatedWithFixedDigits ?? "";
      } else {
        return "0";
      }
    } else {
      return "";
    }
  }

  String getAlacak(String paraBirimi) {
    if (bakiyeList.isNotNullOrEmpty) {
      if (paraBirimi == "TL") {
        return bakiyeList?.where((element) => element.dovizTipi == 0).first.alacakToplami?.commaSeparatedWithFixedDigits ?? "";
      } else if (paraBirimi == "Dolar") {
        return bakiyeList?.where((element) => element.dovizTipi == 1).first.alacakToplami?.commaSeparatedWithFixedDigits ?? "";
      } else if (paraBirimi == "Euro") {
        return bakiyeList?.where((element) => element.dovizTipi == 2).first.alacakToplami?.commaSeparatedWithFixedDigits ?? "";
      } else {
        return "0";
      }
    } else {
      return "";
    }
  }

  String getBorc(String paraBirimi) {
    if (bakiyeList.isNotNullOrEmpty) {
      if (paraBirimi == "TL") {
        return bakiyeList?.where((element) => element.dovizTipi == 0).first.borcToplami?.commaSeparatedWithFixedDigits ?? "";
      } else if (paraBirimi == "Dolar") {
        return bakiyeList?.where((element) => element.dovizTipi == 1).first.borcToplami?.commaSeparatedWithFixedDigits ?? "";
      } else if (paraBirimi == "Euro") {
        return bakiyeList?.where((element) => element.dovizTipi == 2).first.borcToplami?.commaSeparatedWithFixedDigits ?? "";
      } else {
        return "";
      }
    } else {
      return "";
    }
  }
}
