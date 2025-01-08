import "package:flutter/material.dart";
import "package:get/get.dart";
import "package:kartal/kartal.dart";

import "../../../../../view/main_page/alt_sayfalar/cari/cari_listesi/model/cari_listesi_model.dart";
import "../../../../components/textfield/custom_text_field.dart";
import "../../../../components/wrap/appbar_title.dart";
import "../../../../constants/ui_helper/ui_helper.dart";
import "../../../state/base_state.dart";

final class MuhtelifCariEkleView extends StatefulWidget {
  const MuhtelifCariEkleView({super.key});

  @override
  State<MuhtelifCariEkleView> createState() => _MuhtelifCariEkleViewState();
}

final class _MuhtelifCariEkleViewState extends BaseState<MuhtelifCariEkleView> {
  CariListesiModel cariModel = CariListesiModel(kodu: "0" * 15, requestVersion: 6, islemKodu: 4, cariKodu: "0" * 15);
  @override
  Widget build(BuildContext context) => BaseScaffold(
        appBar: AppBar(
          title: const AppBarTitle(title: "Muhtelif Cari"),
          actions: [
            IconButton(
              onPressed: () {
                if (cariModel.adi.ext.isNullOrEmpty) {
                  dialogManager.showAlertDialog("Unvan Giriniz.");
                } else {
                  dialogManager.showAreYouSureDialog(() {
                    Get.back(result: cariModel);
                  });
                }
              },
              icon: const Icon(
                Icons.check_circle,
                color: UIHelper.primaryColor,
              ),
            ),
          ],
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              CustomTextField(
                labelText: "Unvan",
                isMust: true,
                onChanged: (value) => cariModel
                  ..adi = value
                  ..cariAdi = value,
              ),
              CustomTextField(
                labelText: "İl",
                onChanged: (value) => cariModel
                  ..cariIl = value
                  ..sehir = value,
              ),
              CustomTextField(
                labelText: "İlçe",
                onChanged: (value) => cariModel
                  ..cariIlce = value
                  ..ilce = value,
              ),
              CustomTextField(
                labelText: "Adres",
                onChanged: (value) => cariModel
                  ..cariAdres = value
                  ..adres = value,
              ),
              CustomTextField(
                labelText: "Telefon",
                onChanged: (value) => cariModel
                  ..cariTel = value
                  ..telefon = value,
              ),
              CustomTextField(
                labelText: "E-Posta",
                onChanged: (value) => cariModel
                  ..email = value
                  ..eposta = value,
              ),
              CustomTextField(
                labelText: "Web",
                onChanged: (value) => cariModel
                  ..web = value
                  ..website = value,
              ),
              CustomTextField(labelText: "Vergi Dairesi", onChanged: (value) => cariModel.vergiDairesi = value),
              CustomTextField(
                labelText: "Vergi No",
                onChanged: (value) => cariModel
                  ..vergiNo = value
                  ..vergiNumarasi = value,
              ),
            ],
          ).paddingAll(
            UIHelper.lowSize,
          ),
        ),
      );
}
