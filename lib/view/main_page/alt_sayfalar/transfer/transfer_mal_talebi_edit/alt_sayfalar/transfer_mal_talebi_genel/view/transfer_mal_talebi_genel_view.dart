import "package:flutter_mobx/flutter_mobx.dart";
import "package:picker/app/picker_app_imports.dart";
import "package:picker/core/base/model/base_edit_model.dart";
import "package:picker/core/base/state/base_state.dart";
import "package:picker/core/components/dialog/bottom_sheet/model/bottom_sheet_model.dart";
import "package:picker/core/components/layout/custom_layout_builder.dart";
import "package:picker/core/components/textfield/custom_text_field.dart";
import "package:picker/core/constants/extensions/number_extensions.dart";
import "package:picker/core/constants/ui_helper/ui_helper.dart";
import "package:picker/view/main_page/alt_sayfalar/transfer/transfer_mal_talebi_edit/alt_sayfalar/transfer_mal_talebi_genel/view_model/transfer_mal_talebi_genel_view_model.dart";
import "package:picker/view/main_page/alt_sayfalar/uretim/is_emirleri/is_emri_rehberi/model/is_emirleri_model.dart";

final class TransferMalTalebiGenelView extends StatefulWidget {
  const TransferMalTalebiGenelView({required this.model, super.key});

  final BaseEditModel<BaseSiparisEditModel> model;

  @override
  State<TransferMalTalebiGenelView> createState() => _TransferMalTalebiGenelViewState();
}

final class _TransferMalTalebiGenelViewState extends BaseState<TransferMalTalebiGenelView> {
  late final TextEditingController _subeController;
  late final TextEditingController _girisDepoController;
  late final TextEditingController _karsiSubeController;
  late final TextEditingController _isEmriController;
  late final TextEditingController _aciklamaController;

  final TransferMalTalebiGenelViewModel viewModel = TransferMalTalebiGenelViewModel();

  BaseSiparisEditModel get model => BaseSiparisEditModel.instance;

  bool get enabled => widget.model.baseEditEnum?.goruntuleMi != true;

  @override
  void initState() {
    super.initState();
    _subeController = TextEditingController();
    _girisDepoController = TextEditingController();
    _karsiSubeController = TextEditingController();
    _isEmriController = TextEditingController();
    _aciklamaController = TextEditingController();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) async {
      _subeController.text = CacheManager.getIsletmeSube["Şube"];
      _girisDepoController.text = yetkiController.yetkiliDepoList?.firstWhereOrNull((element) => element.depoKodu == model.depoKodu)?.depoTanimi ?? "";
      _karsiSubeController.text = (model.hedefSube != null) ? parametreModel.subeList?.firstWhereOrNull((element) => element.subeKodu == model.hedefSube)?.subeAdi ?? "" : "";
      _isEmriController.text = model.belgeNo ?? "";
      _aciklamaController.text = model.aciklama ?? "";
    });
  }

  @override
  void dispose() {
    super.dispose();
    _subeController.dispose();
    _girisDepoController.dispose();
    _karsiSubeController.dispose();
    _isEmriController.dispose();
    _aciklamaController.dispose();
  }

  @override
  Widget build(BuildContext context) => SingleChildScrollView(
        child: Column(
          children: [
            CustomLayoutBuilder.divideInHalf(
              children: [
                CustomTextField(
                  labelText: "Şubeniz",
                  enabled: enabled,
                  readOnly: true,
                  valueWidget: Text(CacheManager.getVeriTabani["Şube"]?.toString() ?? ""),
                  controller: _subeController,
                ),
                CustomTextField(
                  labelText: "Giriş Depo",
                  enabled: enabled,
                  isMust: true,
                  readOnly: true,
                  suffixMore: true,
                  controller: _girisDepoController,
                  valueWidget: Observer(
                    builder: (_) => Text(viewModel.model.depoKodu.toStringIfNotNull ?? ""),
                  ),
                  onTap: () async {
                    final result = await bottomSheetDialogManager.showDepoBottomSheetDialog(context, viewModel.model.depoKodu);
                    if (result case final value?) {
                      viewModel.setDepoKodu(value);
                      _girisDepoController.text = value.depoTanimi ?? "";
                    }
                  },
                ),
                CustomTextField(
                  labelText: "Karşı Şube",
                  enabled: enabled,
                  isMust: true,
                  controller: _karsiSubeController,
                  readOnly: true,
                  suffixMore: true,
                  valueWidget: Observer(
                    builder: (_) => Text(viewModel.model.hedefSube.toStringIfNotNull ?? ""),
                  ),
                  onTap: () async {
                    final result = await bottomSheetDialogManager.showRadioBottomSheetDialog(
                      context,
                      title: "Karşı Şube Seçiniz",
                      groupValue: viewModel.model.hedefSube,
                      children: List.generate(parametreModel.subeList?.length ?? 0, (index) {
                        final item = parametreModel.subeList![index];
                        return BottomSheetModel(
                          title: item.subeAdi ?? "",
                          value: item,
                          groupValue: item.subeKodu,
                          description: (item.subeKodu ?? 0).toStringIfNotNull,
                        );
                      }),
                    );
                    if (result case final value?) {
                      viewModel.setHedefSube(value);
                      _karsiSubeController.text = value.subeAdi ?? "";
                    }
                  },
                ),
              ],
            ),
            CustomTextField(
              labelText: "İş Emri",
              enabled: enabled,
              readOnly: true,
              suffixMore: true,
              controller: _isEmriController,
              onTap: () async {
                final result = await Get.toNamed("mainPage/isEmriRehberiOzel");
                if (result is IsEmirleriModel) {
                  viewModel.setIsEmri(result);
                  _isEmriController.text = result.isemriNo ?? "";
                }
              },
            ),
            CustomTextField(
              labelText: "Açıklama",
              enabled: enabled,
              onChanged: viewModel.setAciklama,
              onClear: () => viewModel.setAciklama(null),
              controller: _aciklamaController,
            ),
          ],
        ),
      ).paddingAll(UIHelper.lowSize);
}
