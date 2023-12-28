import "package:flutter/material.dart";
import "package:flutter_mobx/flutter_mobx.dart";
import "package:get/get.dart";
import "package:picker/core/base/state/base_state.dart";
import "package:picker/core/components/textfield/custom_text_field.dart";
import "package:picker/core/constants/enum/base_edit_enum.dart";
import "package:picker/core/constants/extensions/date_time_extensions.dart";
import "package:picker/core/constants/ui_helper/ui_helper.dart";
import "package:picker/view/main_page/alt_sayfalar/finans/dekontlar/dekont_edit/alt_sayfalar/genel/view_model/dekont_edit_genel_view_model.dart";

class DekontEditGenelView extends StatefulWidget {
  final ValueChanged<bool>? onChanged;
  final BaseEditEnum baseEditEnum;
  const DekontEditGenelView({super.key, this.onChanged, required this.baseEditEnum});

  @override
  State<DekontEditGenelView> createState() => _DekontEditGenelViewState();
}

class _DekontEditGenelViewState extends BaseState<DekontEditGenelView> {
  final DekontEditGenelViewModel viewModel = DekontEditGenelViewModel();
  late final TextEditingController _tarihController;
  late final TextEditingController _seriController;
  late final TextEditingController _plasiyerController;
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    _tarihController = TextEditingController(text: viewModel.dekontIslemlerRequestModel.tarih?.toDateString ?? "");
    _seriController = TextEditingController(text: viewModel.dekontIslemlerRequestModel.seriAdi ?? "");
    _plasiyerController = TextEditingController(text: viewModel.dekontIslemlerRequestModel.plasiyerAdi ?? "");
    if ((widget.baseEditEnum == BaseEditEnum.ekle || widget.baseEditEnum == BaseEditEnum.taslak) && viewModel.dekontIslemlerRequestModel.seriAdi == null) {
      WidgetsBinding.instance.addPostFrameCallback((timeStamp) async {
        if (viewModel.dekontIslemlerRequestModel.tarih == null) {
          viewModel.setTarih(DateTime.now().dateTimeWithoutTime);
          _tarihController.text = viewModel.dekontIslemlerRequestModel.tarih?.toDateString ?? "";
        }
        await setSeri();
      });
    }
    super.initState();
  }

  @override
  void dispose() {
    widget.onChanged?.call(_formKey.currentState?.validate() ?? false);
    _tarihController.dispose();
    _seriController.dispose();
    _plasiyerController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) => Form(
        key: _formKey,
        child: Column(
          children: [
            CustomTextField(
              labelText: "Tarih",
              enabled: widget.baseEditEnum == BaseEditEnum.ekle || widget.baseEditEnum == BaseEditEnum.taslak,
              isDateTime: true,
              isMust: true,
              readOnly: true,
              controller: _tarihController,
              valueWidget: Observer(builder: (_) => Text(viewModel.dekontIslemlerRequestModel.tarih?.toDateString ?? "")),
              onTap: setTarih,
            ),
            CustomTextField(
              labelText: "Seri",
              enabled: widget.baseEditEnum == BaseEditEnum.ekle || widget.baseEditEnum == BaseEditEnum.taslak,
              suffixMore: true,
              isMust: true,
              readOnly: true,
              controller: _seriController,
              valueWidget: Observer(builder: (_) => Text(viewModel.dekontIslemlerRequestModel.dekontSeri ?? "")),
              onTap: setSeri,
            ),
            CustomTextField(
              labelText: "Plasiyer",
              suffixMore: true,
              isMust: true,
              readOnly: true,
              controller: _plasiyerController,
              valueWidget: Observer(builder: (_) => Text(viewModel.dekontIslemlerRequestModel.plasiyerKodu ?? "")),
              onTap: setPlasiyer,
            ),
          ],
        ).paddingAll(UIHelper.lowSize),
      );

  Future<void> setTarih() async {
    final result = await dialogManager.showDateTimePicker();
    if (result != null) {
      _tarihController.text = result.toDateString;
      viewModel.setTarih(result);
    }
  }

  Future<void> setSeri() async {
    final result = await bottomSheetDialogManager.showSeriKodBottomSheetDialog(context, true);
    if (result != null) {
      _seriController.text = result.aciklama ?? "";
      viewModel.setSeri(result);
    }
  }

  Future<void> setPlasiyer() async {
    final result = await bottomSheetDialogManager.showPlasiyerBottomSheetDialog(context, true);
    if (result != null) {
      _plasiyerController.text = result.plasiyerAciklama ?? "";
      viewModel.setPlasiyerKodu(result);
    }
  }
}
