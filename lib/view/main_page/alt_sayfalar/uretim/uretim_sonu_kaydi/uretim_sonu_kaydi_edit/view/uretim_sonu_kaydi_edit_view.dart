import "package:flutter/material.dart";
import "package:flutter_mobx/flutter_mobx.dart";
import "package:picker/core/base/model/base_edit_model.dart";
import "package:picker/core/base/state/base_state.dart";
import "package:picker/core/components/layout/custom_layout_builder.dart";
import "package:picker/core/components/textfield/custom_text_field.dart";
import "package:picker/core/components/wrap/appbar_title.dart";
import "package:picker/core/constants/enum/base_edit_enum.dart";
import "package:picker/core/constants/extensions/date_time_extensions.dart";
import "package:picker/core/constants/extensions/number_extensions.dart";
import "package:picker/core/constants/ondalik_utils.dart";
import "package:picker/view/main_page/alt_sayfalar/uretim/uretim_sonu_kaydi/uretim_sonu_kaydi_edit/view_model/uretim_sonu_kaydi_edit_view_model.dart";
import "package:picker/view/main_page/alt_sayfalar/uretim/uretim_sonu_kaydi/uretim_sonu_kaydi_listesi/model/uretim_sonu_kaydi_listesi_model.dart";

final class UretimSonuKaydiEditView extends StatefulWidget {
  final BaseEditModel<UretimSonuKaydiListesiModel> model;
  const UretimSonuKaydiEditView({super.key, required this.model});

  @override
  State<UretimSonuKaydiEditView> createState() => _UretimSonuKaydiEditViewState();
}

final class _UretimSonuKaydiEditViewState extends BaseState<UretimSonuKaydiEditView> {
  final UretimSonuKaydiEditViewModel viewModel = UretimSonuKaydiEditViewModel();
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

  UretimSonuKaydiListesiModel? get model => widget.model.model;

  @override
  void initState() {
    viewModel.setSelectedItem(model);
    belgeNoController = TextEditingController(text: model?.belgeNo ?? "");
    tarihController = TextEditingController(text: model?.tarih.toDateString ?? "");
    isEmriController = TextEditingController(text: model?.belgeNo ?? "");
    depoOnceligiController = TextEditingController(text: model?.belgeNo ?? "");
    cikisDepoController = TextEditingController();
    girisDepoController = TextEditingController();
    projeController = TextEditingController();
    mamulKoduController = TextEditingController(text: model?.belgeNo ?? "");
    olcuBirimiController = TextEditingController(text: model?.belgeNo ?? "");
    miktarController = TextEditingController(text: model?.miktar.commaSeparatedWithDecimalDigits(OndalikEnum.miktar) ?? "");
    hurdaFireMiktariController = TextEditingController(text: model?.belgeNo ?? "");
    aciklamaController = TextEditingController(text: model?.aciklama ?? "");
    ekAlan1Controller = TextEditingController(text: model?.ekalan1 ?? "");
    ekAlan2Controller = TextEditingController(text: model?.ekalan2 ?? "");
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) async {
      await viewModel.getKalemler();
      if (viewModel.model != null) {
        // depoOnceligiController.text = viewModel.model!..toString();
        cikisDepoController.text = viewModel.model!.cikisDepoAdi ?? "";
        girisDepoController.text = viewModel.model!.girisDepoAdi ?? "";
      }
    });
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
                isMust: true,
                onChanged: (value) {},
              ),
              CustomTextField(
                labelText: "Tarih",
                controller: tarihController,
                isMust: true,
                onChanged: (value) {},
              ),
              CustomTextField(
                labelText: "İş Emri",
                controller: isEmriController,
                suffixMore: true,
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
                    isMust: true,
                    suffixMore: true,
                    valueWidget: Observer(builder: (_) => Text(viewModel.model?.cikisdepoKodu.toStringIfNotNull ?? "")),
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
                    isMust: true,
                    suffixMore: true,
                    valueWidget: Observer(builder: (_) => Text(viewModel.model?.girisdepoKodu.toStringIfNotNull ?? "")),
                    onChanged: (value) {},
                  ),
                  CustomTextField(
                    labelText: "Proje",
                    controller: projeController,
                    isMust: true,
                    suffixMore: true,
                    onChanged: (value) {},
                  ),
                ],
              ),
              CustomTextField(
                labelText: "Mamul Kodu",
                controller: mamulKoduController,
                isMust: true,
                suffixMore: true,
                onChanged: (value) {},
              ),
              CustomLayoutBuilder(
                splitCount: 2,
                children: [
                  CustomTextField(
                    labelText: "Ölçü Birimi",
                    controller: olcuBirimiController,
                    suffixMore: true,
                    onChanged: (value) {},
                  ),
                  CustomTextField(
                    labelText: "Miktar",
                    controller: miktarController,
                    isMust: true,
                    isFormattedString: true,
                    onChanged: (value) {},
                  ),
                ],
              ),
              CustomTextField(
                labelText: "Hurda/Fire Miktarı",
                controller: hurdaFireMiktariController,
                isFormattedString: true,
                onChanged: (value) {},
              ),
              CustomTextField(
                labelText: "Açıklama",
                controller: aciklamaController,
                onChanged: (value) {},
              ),
              CustomTextField(
                labelText: "Ek Alan 1",
                controller: ekAlan1Controller,
                onChanged: (value) {},
              ),
              CustomTextField(
                labelText: "Ek Alan 2",
                controller: ekAlan2Controller,
                onChanged: (value) {},
              ),
            ],
          ),
        ),
      );
}
