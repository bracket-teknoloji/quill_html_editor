import "package:flutter/material.dart";
import "package:flutter_mobx/flutter_mobx.dart";
import "package:get/get.dart";
import "../../../../components/textfield/custom_text_field.dart";
import "../../../../constants/extensions/date_time_extensions.dart";
import "../../../../constants/extensions/number_extensions.dart";

import "../../../../init/network/login/api_urls.dart";
import "../../../model/doviz_kurlari_model.dart";
import "../../../state/base_state.dart";
import "../view_model/doviz_kuru_girisi_view_model.dart";

class DovizKuruGirisiView extends StatefulWidget {
  final DovizKurlariModel? dovizKurlariModel;
  const DovizKuruGirisiView({super.key, this.dovizKurlariModel});

  @override
  State<DovizKuruGirisiView> createState() => _DovizKuruGirisiViewState();
}

class _DovizKuruGirisiViewState extends BaseState<DovizKuruGirisiView> {
  DovizKuruGirisiViewModel viewModel = DovizKuruGirisiViewModel();
  late final TextEditingController tarihController;
  late final TextEditingController dovizTipiController;
  late final TextEditingController alisController;
  late final TextEditingController satisController;
  late final TextEditingController efektifAlisController;
  late final TextEditingController efektifSatisController;
  final _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    viewModel.changeDovizKurlariModel(widget.dovizKurlariModel);
    tarihController = TextEditingController(text: widget.dovizKurlariModel?.tarih.toDateString ?? "");
    dovizTipiController = TextEditingController(text: widget.dovizKurlariModel?.dovizAdi ?? "");
    alisController = TextEditingController(text: widget.dovizKurlariModel?.dovAlis?.commaSeparated ?? "");
    satisController = TextEditingController(text: widget.dovizKurlariModel?.dovSatis?.commaSeparated ?? "");
    efektifAlisController = TextEditingController(text: widget.dovizKurlariModel?.effAlis?.commaSeparated ?? "");
    efektifSatisController = TextEditingController(text: widget.dovizKurlariModel?.effSatis?.commaSeparated ?? "");
    super.initState();
  }

  @override
  void dispose() {
    tarihController.dispose();
    dovizTipiController.dispose();
    alisController.dispose();
    satisController.dispose();
    efektifAlisController.dispose();
    efektifSatisController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("Döviz Kuru Girişi"),
          actions: [
            IconButton(
                onPressed: () {
                  if (_formKey.currentState?.validate() ?? false) {
                    postData();
                  }
                },
                icon: const Icon(Icons.save_outlined))
          ],
        ),
        body: Form(
          key: _formKey,
          child: Column(
            children: [
              CustomTextField(labelText: "Tarih", readOnly: true, controller: tarihController),
              CustomTextField(
                  labelText: "Döviz Tipi", readOnly: true, controller: dovizTipiController, valueWidget: Observer(builder: (_) => Text(viewModel.dovizKurlariModel?.dovizTipi.toStringIfNull ?? ""))),
              Row(
                children: [
                  Expanded(
                      child: CustomTextField(
                          labelText: "Alış",
                          isMust: true,
                          isFormattedString: true,
                          controller: alisController,
                          keyboardType: const TextInputType.numberWithOptions(decimal: true),
                          onChanged: (value) => viewModel.changeAlis(value.toDoubleWithFormattedString))),
                  Expanded(
                      child: CustomTextField(
                          labelText: "Efektif Alış",
                          isMust: true,
                          isFormattedString: true,
                          controller: efektifAlisController,
                          keyboardType: const TextInputType.numberWithOptions(decimal: true),
                          onChanged: (value) => viewModel.changeEfektifAlis(value.toDoubleWithFormattedString))),
                ],
              ),
              Row(
                children: [
                  Expanded(
                      child: CustomTextField(
                          labelText: "Satış",
                          isMust: true,
                          isFormattedString: true,
                          controller: satisController,
                          keyboardType: const TextInputType.numberWithOptions(decimal: true),
                          onChanged: (value) => viewModel.changeSatis(value.toDoubleWithFormattedString))),
                  Expanded(
                      child: CustomTextField(
                          labelText: "Efektif Satış",
                          isMust: true,
                          isFormattedString: true,
                          controller: efektifSatisController,
                          keyboardType: const TextInputType.numberWithOptions(decimal: true),
                          onChanged: (value) => viewModel.changeEfektifSatis(value.toDoubleWithFormattedString))),
                ],
              ),
            ],
          ),
        ));
  }

  Future<void> postData() async {
    var result = await networkManager
        .dioPost(path: ApiUrls.saveDovizKuru, showLoading: true, bodyModel: DovizKurlariModel(), data: [DovizKurlariRequestModel.fromDovizKurlariModel(viewModel.dovizKurlariModel!)]);
    if (result.success == true) {
      dialogManager.showSnackBar("Başarıyla Kaydedildi");
      Get.back();
    } else {
      dialogManager.showSnackBar("Kaydedilirken bir hata oluştu\n${result.message ?? result.errorDetails}");
    }
  }
}
