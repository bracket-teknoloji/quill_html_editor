import "package:flutter/material.dart";
import "package:picker/core/base/model/base_edit_model.dart";
import "package:picker/core/base/state/base_state.dart";
import "package:picker/core/components/layout/custom_layout_builder.dart";
import "package:picker/core/components/textfield/custom_text_field.dart";
import "package:picker/core/components/wrap/appbar_title.dart";
import "package:picker/core/constants/enum/base_edit_enum.dart";
import "package:picker/view/main_page/alt_sayfalar/uretim/uretim_sonu_kaydi/uretim_sonu_kaydi_listesi/model/uretim_sonu_kaydi_listesi_model.dart";

final class UretimSonuKaydiEditView extends StatefulWidget {
  final BaseEditModel<UretimSonuKaydiListesiModel> model;
  const UretimSonuKaydiEditView({super.key, required this.model});

  @override
  State<UretimSonuKaydiEditView> createState() => _UretimSonuKaydiEditViewState();
}

final class _UretimSonuKaydiEditViewState extends BaseState<UretimSonuKaydiEditView> {
  late final TextEditingController belgeNoController;
  late final TextEditingController tarihController;
  late final TextEditingController isEmriController;
  late final TextEditingController depoOnceligiController;
  late final TextEditingController cikisDepoController;
  late final TextEditingController girisDepoController;
  late final TextEditingController projeController;
  late final TextEditingController mamulKoduController;
  late final TextEditingController olcuBirimiController;
  late final TextEditingController miktarController;
  late final TextEditingController hurdaFireMiktariController;
  late final TextEditingController aciklamaController;
  late final TextEditingController ekAlan1Controller;
  late final TextEditingController ekAlan2Controller;

  @override
  void initState() {
    belgeNoController = TextEditingController();
    tarihController = TextEditingController();
    isEmriController = TextEditingController();
    depoOnceligiController = TextEditingController();
    cikisDepoController = TextEditingController();
    girisDepoController = TextEditingController();
    projeController = TextEditingController();
    mamulKoduController = TextEditingController();
    olcuBirimiController = TextEditingController();
    miktarController = TextEditingController();
    hurdaFireMiktariController = TextEditingController();
    aciklamaController = TextEditingController();
    ekAlan1Controller = TextEditingController();
    ekAlan2Controller = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    belgeNoController.dispose();
    tarihController.dispose();
    isEmriController.dispose();
    depoOnceligiController.dispose();
    cikisDepoController.dispose();
    girisDepoController.dispose();
    projeController.dispose();
    mamulKoduController.dispose();
    olcuBirimiController.dispose();
    miktarController.dispose();
    hurdaFireMiktariController.dispose();
    aciklamaController.dispose();
    ekAlan1Controller.dispose();
    ekAlan2Controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
          title: AppBarTitle(
            title: "Üretim Sonu Kaydı",
            subtitle: widget.model.baseEditEnum?.getName,
          ),
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              CustomTextField(
                labelText: "Belge No",
                controller: belgeNoController,
                onChanged: (value) {},
              ),
              CustomTextField(
                labelText: "Tarih",
                controller: tarihController,
                onChanged: (value) {},
              ),
              CustomTextField(
                labelText: "İş Emri",
                controller: isEmriController,
                onChanged: (value) {},
              ),
              CustomLayoutBuilder(
                splitCount: 2,
                children: [
                  CustomTextField(
                    labelText: "Depo Önceliği",
                    controller: depoOnceligiController,
                    onChanged: (value) {},
                  ),
                  CustomTextField(
                    labelText: "Çıkış Depo",
                    controller: cikisDepoController,
                    onChanged: (value) {},
                  ),
                ],
              ),
              CustomLayoutBuilder(
                splitCount: 2,
                children: [
                  CustomTextField(
                    labelText: "Giriş Depo",
                    controller: girisDepoController,
                    onChanged: (value) {},
                  ),
                  CustomTextField(
                    labelText: "Proje",
                    controller: projeController,
                    onChanged: (value) {},
                  ),
                ],
              ),
              CustomTextField(
                labelText: "",
                onChanged: (value) {},
              ),
              CustomLayoutBuilder(
                splitCount: 2,
                children: [
                  CustomTextField(
                    labelText: "",
                    onChanged: (value) {},
                  ),
                  CustomTextField(
                    labelText: "",
                    onChanged: (value) {},
                  ),
                ],
              ),
              CustomTextField(
                labelText: "",
                onChanged: (value) {},
              ),
              CustomTextField(
                labelText: "",
                onChanged: (value) {},
              ),
              CustomTextField(
                labelText: "",
                onChanged: (value) {},
              ),
              CustomTextField(
                labelText: "",
                onChanged: (value) {},
              ),
            ],
          ),
        ),
      );
}
