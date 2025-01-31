import "package:flutter_mobx/flutter_mobx.dart";
import "package:kartal/kartal.dart";
import "package:picker/app/picker_app_imports.dart";
import "package:picker/core/base/state/base_state.dart";
import "package:picker/core/base/view/stok_rehberi/model/stok_rehberi_request_model.dart";
import "package:picker/core/components/dialog/bottom_sheet/model/bottom_sheet_model.dart";
import "package:picker/core/components/textfield/custom_text_field.dart";
import "package:picker/core/components/wrap/appbar_title.dart";
import "package:picker/core/constants/extensions/number_extensions.dart";
import "package:picker/core/constants/ondalik_utils.dart";
import "package:picker/core/constants/ui_helper/ui_helper.dart";
import "package:picker/view/main_page/alt_sayfalar/transfer/transfer_mal_talebi_edit/alt_sayfalar/depo_talep_kalem_detay/view_model/depo_talep_kalem_detay_view_model.dart";

final class DepoTalepKalemDetayView extends StatefulWidget {
  const DepoTalepKalemDetayView({required this.model, required this.isTalep, super.key});

  final KalemModel? model;

  final bool isTalep;

  @override
  State<DepoTalepKalemDetayView> createState() => _DepoTalepKalemDetayViewState();
}

final class _DepoTalepKalemDetayViewState extends BaseState<DepoTalepKalemDetayView> {
  final DepoTalepKalemDetayViewModel viewModel = DepoTalepKalemDetayViewModel();

  late final TextEditingController _depoController;
  late final TextEditingController _olcuBirimiController;
  late final TextEditingController _miktarController;
  late final TextEditingController _aciklamaController;
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    if (widget.model case final value?) {
      viewModel.setModel(
        value.copyWith(
          miktar: widget.isTalep ? widget.model?.miktar : widget.model?.kalanMiktar,
          miktar2: widget.isTalep ? widget.model?.miktar : widget.model?.kalanMiktar,
        ),
      );
    }
    _depoController = TextEditingController(text: viewModel.model.depoTanimi);
    _olcuBirimiController = TextEditingController(text: viewModel.model.olcuBirimiAdi);
    _miktarController = TextEditingController(text: viewModel.model.miktar?.commaSeparatedWithDecimalDigits(OndalikEnum.miktar));
    _aciklamaController = TextEditingController(text: viewModel.model.aciklama);
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) async => await viewModel.getStokModel());
    super.initState();
  }

  @override
  void dispose() {
    _depoController.dispose();
    _olcuBirimiController.dispose();
    _miktarController.dispose();
    _aciklamaController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) => BaseScaffold(
        appBar: appBar(),
        floatingActionButton: fab(),
        body: body(),
      );

  AppBar appBar() => AppBar(
        title: AppBarTitle(
          title: widget.isTalep ? "Depo Talep Detayı" : "Depo Talep Mal Toplama Detayı",
        ),
        actions: [
          IconButton(
            onPressed: () async {
              if (_formKey.currentState?.validate() == true) {
                Get.back(result: viewModel.model);
                dialogManager.showSuccessSnackBar("Kaydedildi");
              }
            },
            icon: const Icon(Icons.save_outlined),
          ),
        ],
      );

  Widget fab() => FloatingActionButton(
        child: const Icon(Icons.open_in_new_outlined),
        onPressed: () async {
          dialogManager.showStokGridViewDialog(await networkManager.getStokModel(StokRehberiRequestModel(stokKodu: widget.model?.stokKodu)));
        },
      );

  Widget body() => SingleChildScrollView(
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Card(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    if (widget.model?.stokKodu case final value?) Text("Stok Kodu: $value"),
                    if (widget.model?.stokAdi case final value?) Text("Stok Adı: $value"),
                    if (!widget.isTalep) ...[
                      if (widget.model?.miktar case final value?) Text("Miktar: ${value.commaSeparatedWithDecimalDigits(OndalikEnum.miktar)} ${widget.model?.olcuBirimiAdi}"),
                      if (widget.model?.tamamlananMiktar case final value?) Text("Toplanan Miktar: ${value.commaSeparatedWithDecimalDigits(OndalikEnum.miktar)} ${widget.model?.olcuBirimiAdi}"),
                      if (widget.model?.kalanMiktar case final value?) Text("Kalan Miktar: ${value.commaSeparatedWithDecimalDigits(OndalikEnum.miktar)} ${widget.model?.olcuBirimiAdi}"),
                    ],
                  ],
                ).paddingAll(UIHelper.lowSize),
              ),
              if (!widget.isTalep)
                CustomTextField(
                  labelText: "Depo",
                  readOnly: true,
                  isMust: true,
                  controller: _depoController,
                  valueWidget: Observer(builder: (_) => Text(viewModel.model.depoKodu.toStringIfNotNull ?? "")),
                  suffixMore: true,
                ),
              CustomTextField(
                labelText: "Ölçü Birimi",
                readOnly: true,
                suffixMore: true,
                controller: _olcuBirimiController,
                valueWidget: Observer(
                  builder: (_) => Text(viewModel.model.olcuBirimKodu.toStringIfNotNull ?? ""),
                ),
                onClear: () => viewModel.setOlcuBirimi((adi: null, kodu: null)),
                onTap: () async {
                  final List<BottomSheetModel> list = List.generate(viewModel.stokModel?.getOlcuBirimiRecords.length ?? 0, (index) {
                    final item = viewModel.stokModel!.getOlcuBirimiRecords[index];
                    return BottomSheetModel(
                      title: item.adi ?? "",
                      groupValue: item.kodu,
                      description: item.kodu.toStringIfNotNull,
                      value: item,
                    );
                  });
                  if (list.ext.isNotNullOrEmpty) {
                    final result = await bottomSheetDialogManager.showRadioBottomSheetDialog(context, title: "Ölçü Birimi Seçiniz", children: list, groupValue: viewModel.model.olcuBirimKodu);
                    if (result case final value?) {
                      viewModel.setOlcuBirimi(value);
                      _olcuBirimiController.text = value.adi ?? "";
                    }
                  } else {
                    dialogManager.showErrorSnackBar("Ölçü birimi bulunamadı");
                  }
                },
              ),
              CustomTextField(
                labelText: "Miktar",
                isMust: true,
                isFormattedString: true,
                controller: _miktarController,
                keyboardType: const TextInputType.numberWithOptions(decimal: true),
                onChanged: (value) => viewModel.setMiktar(value.toDoubleWithFormattedString),
                validator: (value) {
                  if (value.toDoubleWithFormattedString < 1) return "Miktar giriniz";
                  if (!yetkiController.transferDepoMalToplamaFazlaTeslimatYapabilir) {
                    if (value.toDoubleWithFormattedString > (widget.model?.kalanMiktar ?? 0)) return "Kalan miktarı aşamazsınız";
                  }
                  return null;
                },
                suffix: Wrap(
                  children: [
                    IconButton(
                      onPressed: () {
                        if ((viewModel.model.miktar ?? 0) - 1 <= 0) return;
                        _miktarController.text = ((_miktarController.text.toDoubleWithFormattedString) - 1).commaSeparatedWithDecimalDigits(OndalikEnum.miktar);
                        viewModel.setMiktar(_miktarController.text.toDoubleWithFormattedString);
                      },
                      icon: const Icon(Icons.remove),
                    ),
                    IconButton(
                      onPressed: () {
                        _miktarController.text = ((_miktarController.text.toDoubleWithFormattedString) + 1).commaSeparatedWithDecimalDigits(OndalikEnum.miktar);
                        viewModel.setMiktar(_miktarController.text.toDoubleWithFormattedString);
                      },
                      icon: const Icon(Icons.add),
                    ),
                  ],
                ),
              ),
              if (widget.isTalep)
                CustomTextField(
                  labelText: "Açıklama",
                  controller: _aciklamaController,
                  onChanged: viewModel.setAciklama,
                ),
            ],
          ).paddingAll(UIHelper.lowSize),
        ),
      );
}
