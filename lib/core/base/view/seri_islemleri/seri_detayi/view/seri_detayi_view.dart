import "package:flutter/material.dart";
import "package:flutter_mobx/flutter_mobx.dart";
import "package:get/get.dart";
import "package:picker/core/base/state/base_state.dart";
import "package:picker/core/base/view/seri_islemleri/seri_detayi/view_model/seri_detayi_view_model.dart";
import "package:picker/core/base/view/seri_islemleri/seri_listesi/model/seri_detayi_model.dart";
import "package:picker/core/components/bottom_bar/bottom_bar.dart";
import "package:picker/core/components/button/elevated_buttons/footer_button.dart";
import "package:picker/core/components/textfield/custom_text_field.dart";
import "package:picker/core/constants/extensions/date_time_extensions.dart";
import "package:picker/core/constants/extensions/number_extensions.dart";
import "package:picker/core/constants/extensions/widget_extensions.dart";
import "package:picker/core/constants/ondalik_utils.dart";
import "package:picker/core/constants/ui_helper/ui_helper.dart";

class SeriDetayiView extends StatefulWidget {
  /// İlki Hareket Miktarı, İkincisi Kalan Miktar
  final SeriDetayiModel seriDetayiModel;
  const SeriDetayiView({super.key, required this.seriDetayiModel});

  @override
  State<SeriDetayiView> createState() => _SeriDetayiViewState();
}

class _SeriDetayiViewState extends BaseState<SeriDetayiView> {
  final SeriDetayiViewModel viewModel = SeriDetayiViewModel();
  late final GlobalKey<FormState> formKey;
  late final FocusNode _focusNode;

  @override
  void initState() {
    _focusNode = FocusNode();
    formKey = GlobalKey<FormState>();
    if (widget.seriDetayiModel.seriList != null) {
      viewModel.seriModel = widget.seriDetayiModel.seriList!;
    }
    if ((viewModel.seriModel.miktar ?? 0) > (widget.seriDetayiModel.kalanMiktar ?? 0) || widget.seriDetayiModel.miktarKadarSor == true) {
      viewModel.seriModel.miktar = 1;
    }
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) async {
      formKey.currentState?.validate();
      _focusNode.requestFocus();
    });
    super.initState();
  }

  @override
  void dispose() {
    _focusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
          title: const Text("Seri Detayı"),
          actions: [
            IconButton(
              onPressed: () {
                if (formKey.currentState?.validate() ?? false) {
                  dialogManager.showSuccessSnackBar("Başarılı");
                  Get.back(result: viewModel.seriModel);
                }
              },
              icon: const Icon(Icons.check_outlined),
            ),
          ],
        ),
        bottomNavigationBar: Padding(
          padding: MediaQuery.of(context).viewInsets,
          child: BottomBarWidget(
            isScrolledDown: true,
            children: [
              FooterButton(
                children: [
                  const Text("Hareket Miktarı"),
                  Text(widget.seriDetayiModel.hareketMiktari.toStringIfNotNull ?? ""),
                ],
              ),
              FooterButton(
                children: [
                  const Text("Kalan Miktar"),
                  Text(widget.seriDetayiModel.kalanMiktar.toStringIfNotNull ?? ""),
                ],
              ),
            ],
          ),
        ),
        body: SingleChildScrollView(
          child: Form(
            key: formKey,
            child: Column(
              children: [
                const Card(
                  child: ListTile(
                    leading: Icon(Icons.info_outline),
                    title: Text("Her 1 miktar için seri giriniz."),
                  ),
                ).yetkiVarMi(widget.seriDetayiModel.miktarKadarSor == true),
                CustomTextField(
                  labelText: "Seri 1",
                  focusNode: _focusNode,
                  controllerText: viewModel.seriModel.seri1 ?? viewModel.seriModel.seriNo,
                  isMust: true,
                  onChanged: viewModel.setSeri1,
                  suffix: IconButton(
                    onPressed: () async {
                      final result = await Get.toNamed("qr");
                      if (result is String) {
                        viewModel.setSeri1(result);
                      }
                    },
                    icon: const Icon(Icons.qr_code_scanner),
                  ),
                ),
                CustomTextField(
                  labelText: "Seri 2",
                  controllerText: viewModel.seriModel.seri2,
                  onChanged: viewModel.setSeri2,
                ),
                CustomTextField(
                  labelText: "Seri 3",
                  controllerText: viewModel.seriModel.seri3,
                  onChanged: viewModel.setSeri3,
                ),
                CustomTextField(
                  labelText: "Seri 4",
                  controllerText: viewModel.seriModel.seri4,
                  onChanged: viewModel.setSeri4,
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                      child: Observer(
                        builder: (_) => CustomTextField(
                          labelText: "Son Kullanma Tarihi",
                          controllerText: viewModel.seriModel.sonKullanmaTarihi.toDateStringIfNull,
                          isDateTime: true,
                          onTap: () async {
                            final result = await dialogManager.showDateTimePicker(initialDate: viewModel.seriModel.sonKullanmaTarihi);
                            if (result is DateTime) {
                              viewModel.setSonKullanmaTarihi(result);
                            }
                          },
                        ),
                      ),
                    ),
                    Expanded(
                      child: CustomTextField(
                        labelText: "Miktar",
                        readOnly: widget.seriDetayiModel.miktarKadarSor == true,
                        isMust: true,
                        keyboardType: const TextInputType.numberWithOptions(decimal: true),
                        isFormattedString: true,
                        controllerText: viewModel.seriModel.miktar?.commaSeparatedWithDecimalDigits(OndalikEnum.miktar),
                        validator: (value) {
                          if ((widget.seriDetayiModel.kalanMiktar ?? 0) < value.toDoubleWithFormattedString) {
                            return "Kalandan fazla girilemez.";
                          }
                          if (value case (null || "")) {
                            return "Bu alan boş bırakılamaz.";
                          }
                          return null;
                        },
                        onChanged: (value) {
                          viewModel.setMiktar(value.toDoubleWithFormattedString);
                          formKey.currentState?.validate();
                        },
                      ),
                    ),
                  ],
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                      child: CustomTextField(
                        labelText: "Açıklama 1",
                        controllerText: viewModel.seriModel.acik1,
                        onChanged: viewModel.setAcik1,
                      ),
                    ),
                    Expanded(
                      child: CustomTextField(
                        labelText: "Açıklama 2",
                        controllerText: viewModel.seriModel.acik2,
                        onChanged: viewModel.setAcik2,
                      ),
                    ),
                  ],
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                      child: CustomTextField(
                        labelText: "Açıklama 3",
                        controllerText: viewModel.seriModel.acik3,
                        onChanged: viewModel.setAcik3,
                      ),
                    ),
                    Expanded(
                      child: CustomTextField(
                        labelText: "Açıklama 4",
                        controllerText: viewModel.seriModel.acik4,
                        onChanged: viewModel.setAcik4,
                      ),
                    ),
                  ],
                ),
              ],
            ).paddingAll(UIHelper.lowSize),
          ),
        ),
      );
}
