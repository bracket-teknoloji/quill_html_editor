import "package:flutter/material.dart";
import "package:flutter_mobx/flutter_mobx.dart";
import "package:get/get.dart";

import "../../../../../../../core/base/state/base_state.dart";
import "../../../../../../../core/components/textfield/custom_text_field.dart";
import "../../../../../../../core/components/wrap/appbar_title.dart";
import "../../../../../../../core/constants/extensions/date_time_extensions.dart";
import "../../../../../../../core/constants/extensions/number_extensions.dart";
import "../../../../../../../core/constants/ondalik_utils.dart";
import "../../../../../../../core/constants/ui_helper/ui_helper.dart";
import "../../../../cari/cari_hareketleri/model/cari_hareketleri_model.dart";
import "../../kasa_islemleri/model/kasa_islemleri_request_model.dart";
import "../view_model/kasa_hareket_detay_view_model.dart";

class KasaHareketDetayiView extends StatefulWidget {
  final CariHareketleriModel cariListesiModel;
  const KasaHareketDetayiView({super.key, required this.cariListesiModel});

  @override
  State<KasaHareketDetayiView> createState() => _KasaHareketDetayiViewState();
}

class _KasaHareketDetayiViewState extends BaseState<KasaHareketDetayiView> {
  late final KasaHareketDetayViewModel viewModel;
  CariHareketleriModel get model => widget.cariListesiModel;
  late final TextEditingController _tarihController;
  late final TextEditingController _kasaController;
  late final TextEditingController _belgeNoController;
  late final TextEditingController _gelirGiderController;
  late final TextEditingController _tutarController;
  late final TextEditingController _aciklamaController;
  @override
  void initState() {
    viewModel = KasaHareketDetayViewModel(kasaIslemleriRequestModel: KasaIslemleriRequestModel.fromCariHareketleriModel(model));
    _tarihController = TextEditingController();
    _kasaController = TextEditingController();
    _belgeNoController = TextEditingController();
    _gelirGiderController = TextEditingController();
    _tutarController = TextEditingController();
    _aciklamaController = TextEditingController();
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      await viewModel.getData();
      if (viewModel.kasaIslemleriModel != null) {
        _tarihController.text = viewModel.kasaIslemleriModel?.tarih.toDateString ?? "";
        _kasaController.text = viewModel.kasaIslemleriModel?.kasaAdi ?? "";
        _belgeNoController.text = viewModel.kasaIslemleriModel?.belgeNo ?? "";
        _gelirGiderController.text = viewModel.kasaIslemleriModel?.gc == "G" ? "Gelir" : "Gider";
        _tutarController.text = "${viewModel.kasaIslemleriModel?.tutar.commaSeparatedWithDecimalDigits(OndalikEnum.tutar) ?? ""} ${viewModel.kasaIslemleriModel?.dovizAdi ?? mainCurrency}";
        _aciklamaController.text = viewModel.kasaIslemleriModel?.aciklama ?? "";
      } else {
        await dialogManager.showAlertDialog(viewModel.message ?? "Kasa hareketi bulunamadı.");
        Get.back();
      }
    });
    super.initState();
  }

  @override
  void dispose() {
    _tarihController.dispose();
    _kasaController.dispose();
    _belgeNoController.dispose();
    _gelirGiderController.dispose();
    _tutarController.dispose();
    _aciklamaController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) => BaseScaffold(
        appBar: AppBar(
          title: AppBarTitle(
            title: "Kasa Hareket Detayı",
            subtitle: model.cariAdi,
          ),
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              Row(
                children: [
                  Expanded(
                    child: CustomTextField(labelText: "Tarih", controller: _tarihController, readOnly: true),
                  ),
                  Expanded(
                    child: CustomTextField(labelText: "Kasa", controller: _kasaController, readOnly: true, valueWidget: Observer(builder: (_) => Text(viewModel.kasaIslemleriModel?.kasaKodu ?? ""))),
                  ),
                ],
              ),
              Row(
                children: [
                  Expanded(
                    child: CustomTextField(labelText: "Belge No", controller: _belgeNoController, readOnly: true),
                  ),
                  Expanded(
                    child: CustomTextField(labelText: "Gelir/Gider", controller: _gelirGiderController, readOnly: true),
                  ),
                ],
              ),
              Row(
                children: [
                  Expanded(
                    child: CustomTextField(labelText: "Tutar", controller: _tutarController, readOnly: true),
                  ),
                ],
              ),
              CustomTextField(labelText: "Açıklama", controller: _aciklamaController, readOnly: true),
            ],
          ).paddingAll(UIHelper.lowSize),
        ),
      );
}
