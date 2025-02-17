import "package:flutter/material.dart";
import "package:get/get.dart";
import "package:picker/core/base/state/base_state.dart";
import "package:picker/core/components/layout/custom_layout_builder.dart";
import "package:picker/core/components/textfield/custom_text_field.dart";
import "package:picker/core/constants/enum/base_edit_enum.dart";
import "package:picker/core/constants/extensions/number_extensions.dart";
import "package:picker/core/constants/ondalik_utils.dart";
import "package:picker/core/constants/ui_helper/ui_helper.dart";
import "package:picker/view/main_page/alt_sayfalar/stok/base_stok_edit/view/base_stok_edit_ek_bilgiler/view_model/base_stok_edit_ek_bilgiler_view_model.dart";

final class BaseStokEditEkBilgilerView extends StatefulWidget {
  const BaseStokEditEkBilgilerView({super.key, this.model});

  final BaseEditEnum? model;

  @override
  State<BaseStokEditEkBilgilerView> createState() => _BaseStokEditEkBilgilerViewState();
}

final class _BaseStokEditEkBilgilerViewState extends BaseState<BaseStokEditEkBilgilerView> {
  final BaseStokEditEkBilgilerViewModel viewModel = BaseStokEditEkBilgilerViewModel();

  bool get enabled => !widget.model.goruntuleMi;
  @override
  Widget build(BuildContext context) => SingleChildScrollView(
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text("Kullanıcı Tanımlı Sahalar").paddingOnly(left: UIHelper.lowSize),
        CustomLayoutBuilder.divideInHalf(
          children: [
            if (parametreModel.mapStokKullSahalar?.the1S case final value?)
              CustomTextField(
                labelText: value,
                controllerText: viewModel.stokListesiModel.kull1s,
                enabled: enabled,
                onChanged: viewModel.set1s,
              ),
            if (parametreModel.mapStokKullSahalar?.the2S case final value?)
              CustomTextField(
                labelText: value,
                controllerText: viewModel.stokListesiModel.kull2s,
                enabled: enabled,
                onChanged: viewModel.set2s,
              ),
            if (parametreModel.mapStokKullSahalar?.the3S case final value?)
              CustomTextField(
                labelText: value,
                controllerText: viewModel.stokListesiModel.kull3s,
                enabled: enabled,
                onChanged: viewModel.set3s,
              ),
            if (parametreModel.mapStokKullSahalar?.the4S case final value?)
              CustomTextField(
                labelText: value,
                controllerText: viewModel.stokListesiModel.kull4s,
                enabled: enabled,
                onChanged: viewModel.set4s,
              ),
            if (parametreModel.mapStokKullSahalar?.the5S case final value?)
              CustomTextField(
                labelText: value,
                controllerText: viewModel.stokListesiModel.kull5s,
                enabled: enabled,
                onChanged: viewModel.set5s,
              ),
            if (parametreModel.mapStokKullSahalar?.the6S case final value?)
              CustomTextField(
                labelText: value,
                controllerText: viewModel.stokListesiModel.kull6s,
                enabled: enabled,
                onChanged: viewModel.set6s,
              ),
            if (parametreModel.mapStokKullSahalar?.the7S case final value?)
              CustomTextField(
                labelText: value,
                controllerText: viewModel.stokListesiModel.kull7s,
                enabled: enabled,
                onChanged: viewModel.set7s,
              ),
            if (parametreModel.mapStokKullSahalar?.the8S case final value?)
              CustomTextField(
                labelText: value,
                controllerText: viewModel.stokListesiModel.kull8s,
                enabled: enabled,
                onChanged: viewModel.set8s,
              ),
            if (parametreModel.mapStokKullSahalar?.the1N case final value?)
              CustomTextField(
                labelText: value,
                controllerText:
                    viewModel.stokListesiModel.kull1n?.commaSeparatedWithDecimalDigits(OndalikEnum.miktar) ?? "",
                enabled: enabled,
                isFormattedString: true,
                keyboardType: const TextInputType.numberWithOptions(decimal: true),
                onChanged: (value) => viewModel.set1n(value.toDoubleWithFormattedString),
              ),
            if (parametreModel.mapStokKullSahalar?.the2N case final value?)
              CustomTextField(
                labelText: value,
                controllerText: viewModel.stokListesiModel.kull2n.commaSeparatedWithDecimalDigits(OndalikEnum.miktar),
                enabled: enabled,
                isFormattedString: true,
                keyboardType: const TextInputType.numberWithOptions(decimal: true),
                onChanged: (value) => viewModel.set2n(value.toDoubleWithFormattedString),
              ),
            if (parametreModel.mapStokKullSahalar?.the3N case final value?)
              CustomTextField(
                labelText: value,
                controllerText: viewModel.stokListesiModel.kull3n.commaSeparatedWithDecimalDigits(OndalikEnum.miktar),
                enabled: enabled,
                isFormattedString: true,
                keyboardType: const TextInputType.numberWithOptions(decimal: true),
                onChanged: (value) => viewModel.set3n(value.toDoubleWithFormattedString),
              ),
            if (parametreModel.mapStokKullSahalar?.the4N case final value?)
              CustomTextField(
                labelText: value,
                controllerText: viewModel.stokListesiModel.kull4n.commaSeparatedWithDecimalDigits(OndalikEnum.miktar),
                enabled: enabled,
                isFormattedString: true,
                keyboardType: const TextInputType.numberWithOptions(decimal: true),
                onChanged: (value) => viewModel.set4n(value.toDoubleWithFormattedString),
              ),
            if (parametreModel.mapStokKullSahalar?.the5N case final value?)
              CustomTextField(
                labelText: value,
                controllerText: viewModel.stokListesiModel.kull5n.commaSeparatedWithDecimalDigits(OndalikEnum.miktar),
                enabled: enabled,
                isFormattedString: true,
                keyboardType: const TextInputType.numberWithOptions(decimal: true),
                onChanged: (value) => viewModel.set5n(value.toDoubleWithFormattedString),
              ),
            if (parametreModel.mapStokKullSahalar?.the6N case final value?)
              CustomTextField(
                labelText: value,
                controllerText: viewModel.stokListesiModel.kull6n.commaSeparatedWithDecimalDigits(OndalikEnum.miktar),
                enabled: enabled,
                isFormattedString: true,
                keyboardType: const TextInputType.numberWithOptions(decimal: true),
                onChanged: (value) => viewModel.set6n(value.toDoubleWithFormattedString),
              ),
            if (parametreModel.mapStokKullSahalar?.the7N case final value?)
              CustomTextField(
                labelText: value,
                controllerText: viewModel.stokListesiModel.kull7n.commaSeparatedWithDecimalDigits(OndalikEnum.miktar),
                enabled: enabled,
                isFormattedString: true,
                keyboardType: const TextInputType.numberWithOptions(decimal: true),
                onChanged: (value) => viewModel.set7n(value.toDoubleWithFormattedString),
              ),
            if (parametreModel.mapStokKullSahalar?.the8N case final value?)
              CustomTextField(
                labelText: value,
                controllerText: viewModel.stokListesiModel.kull8n.commaSeparatedWithDecimalDigits(OndalikEnum.miktar),
                enabled: enabled,
                isFormattedString: true,
                keyboardType: const TextInputType.numberWithOptions(decimal: true),
                onChanged: (value) => viewModel.set8n(value.toDoubleWithFormattedString),
              ),
          ],
        ),
      ],
    ).paddingAll(UIHelper.lowSize),
  );
}
