import "package:flutter/material.dart";
import "package:picker/core/base/state/base_state.dart";
import "package:picker/core/components/dialog/bottom_sheet/model/bottom_sheet_model.dart";
import "package:picker/core/components/list_view/refreshable_list_view.dart";
import "package:picker/core/components/textfield/custom_text_field.dart";
import "package:picker/core/components/wrap/appbar_title.dart";
import "package:picker/core/constants/extensions/number_extensions.dart";
import "package:picker/core/constants/extensions/widget_extensions.dart";
import "package:picker/core/constants/ondalik_utils.dart";
import "package:picker/view/main_page/alt_sayfalar/siparis/base_siparis_edit/model/base_siparis_edit_model.dart";
import "package:picker/view/main_page/alt_sayfalar/uretim/uretim_sonu_kaydi/uretim_sonu_kaydi_edit/alt_sayfalar/uretim_fire_bilgileri/view_model/uretim_fire_bilgileri_view_model.dart";

class UretimFireBilgileriView extends StatefulWidget {
  const UretimFireBilgileriView({required this.model, super.key});

  final KalemModel model;

  @override
  State<UretimFireBilgileriView> createState() => _UretimFireBilgileriViewState();
}

class _UretimFireBilgileriViewState extends BaseState<UretimFireBilgileriView> {
  late final TextEditingController _hurdaFireKoduController;
  late final TextEditingController _miktarController;
  late final UretimFireBilgileriViewModel viewModel;

  @override
  void initState() {
    viewModel = UretimFireBilgileriViewModel(
      widget.model.fireListe.isNull ? widget.model.copyWith(fireListe: []) : widget.model,
    );
    _hurdaFireKoduController = TextEditingController();
    _miktarController = TextEditingController();
    WidgetsBinding.instance.addPostFrameCallback((_) => viewModel.getData());
    super.initState();
  }

  @override
  void dispose() {
    _hurdaFireKoduController.dispose();
    _miktarController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) => BaseScaffold(
    appBar: AppBar(
      title: const AppBarTitle(title: "Fire Bilgileri"),
      actions: [
        IconButton(
          icon: const Icon(Icons.save_outlined),
          onPressed: () {
            Navigator.of(context).pop(viewModel.model.fireListe);
          },
        ),
      ],
    ),
    body: Column(
      children: [
        Row(
          children: [
            Expanded(
              child: CustomTextField(
                labelText: "Hurda/Fire Kodu",
                controller: _hurdaFireKoduController,
                suffixMore: true,
                readOnly: true,
                onTap: () async {
                  final result = await bottomSheetDialogManager.showRadioBottomSheetDialog(
                    context,
                    title: "Hurda/Fire Kodu",
                    groupValue: viewModel.fireModel.kodu,
                    children: viewModel.observableList
                        ?.map(
                          (element) =>
                              BottomSheetModel(title: element.tanimi ?? "", groupValue: element.kodu, value: element),
                        )
                        .toList(),
                  );
                  if (result != null) {
                    _hurdaFireKoduController.text = result.tanimi ?? result.kodu ?? "";
                    viewModel.setFireModel(result);
                  }
                },
              ),
            ),
            Expanded(
              child: CustomTextField(
                labelText: "Miktar",
                controller: _miktarController,
                keyboardType: const TextInputType.numberWithOptions(decimal: true),
                isFormattedString: true,
                onChanged: (value) =>
                    viewModel.setFireModel(viewModel.fireModel.copyWith(miktar: value.toDoubleWithFormattedString)),
              ),
            ),
            OutlinedButton(
              onPressed: () {
                viewModel.addFireModel(viewModel.fireModel);
                _hurdaFireKoduController.clear();
                _miktarController.clear();
              },
              child: const Text("Ekle"),
            ),
          ],
        ),
        Expanded(
          child: RefreshableListView(
            items: viewModel.model.fireListe,
            onRefresh: () async {},
            itemBuilder: (item) => Card(
              child: ListTile(
                title: Text(item.tanimi ?? ""),
                subtitle: Text(item.miktar.commaSeparatedWithDecimalDigits(OndalikEnum.miktar)),
                trailing: IconButton(
                  icon: const Icon(Icons.delete_outline_outlined),
                  onPressed: () => viewModel.removeFireModel(item),
                ),
              ),
            ),
          ),
        ),
      ],
    ),
  );
}
