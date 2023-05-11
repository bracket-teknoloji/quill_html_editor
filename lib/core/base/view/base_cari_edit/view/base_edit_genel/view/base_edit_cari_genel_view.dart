import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:picker/core/components/textfield/custom_label_widget.dart';
import 'package:picker/core/components/textfield/custom_text_field.dart';

import '../../../../../state/base_state.dart';
import '../model/base_cari_edit_model.dart';
import '../view_model/base_cari_genel_edit_view_model.dart';

class BaseEditCariGenelView extends StatefulWidget {
  final BaseCariEditModel? model;
  const BaseEditCariGenelView({super.key, this.model});

  @override
  State<BaseEditCariGenelView> createState() => _BaseEditCariGenelViewState();
}

class _BaseEditCariGenelViewState extends BaseState<BaseEditCariGenelView> {
  BaseCariGenelEditViewModel? viewModel = BaseCariGenelEditViewModel();
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  FocusNode focusNode = FocusNode();
  @override
  void initState() {
    super.initState();
    viewModel?.changeIsSahisFirmasi(widget.model?.model?.sahisFirmasiMi ?? false);
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Form(
        key: formKey,
        child: Column(
          children: [
            Align(
              alignment: Alignment.centerLeft,
              child: CustomWidgetWithLabel(
                isVertical: true,
                text: "Şahıs Firması",
                children: [
                  Observer(
                      builder: (_) => Switch.adaptive(
                          value: viewModel?.isSahisFirmasi ?? false,
                          onChanged: (value) {
                            viewModel!.changeIsSahisFirmasi(value);
                          })),
                ],
              ),
            ),
            Row(children: const [
              Expanded(child: CustomTextField(isMust: true, labelText: "Kodu", valueText: "456")),
              Expanded(child: CustomTextField(isMust: true, labelText: "Cari Tipi", valueText: "15"))
            ]),
            CustomTextField(labelText: "Adı", valueText: "Burak", controller: TextEditingController(text: widget.model?.model?.cariAdi)),
            const CustomTextField(labelText: "Ülke", valueText: "Türkiye"),
            Row(children: const [
              Expanded(child: CustomTextField(labelText: "İl", valueText: "Sakarya")),
              Expanded(child: CustomTextField(labelText: "İlçe", valueText: "Erenler")),
            ]),
            const CustomTextField(labelText: "Posta Kodu"),
            const CustomTextField(labelText: "Adres"),
            const CustomTextField(labelText: "Telefon"),
            const CustomTextField(labelText: "E-Posta"),
            const CustomTextField(labelText: "Web"),
            Row(children: const [Expanded(child: CustomTextField(labelText: "Vergi Dairesi")), Expanded(child: CustomTextField(labelText: "Vergi No"))]),
            Row(children: [
              const Expanded(child: CustomTextField(labelText: "Plasiyer")),
              Expanded(
                  child: CustomWidgetWithLabel(isVertical: true, text: "Dövizli", children: [
                Observer(
                    builder: (_) => Switch(
                        value: viewModel?.isDovizli ?? false,
                        onChanged: (value) {
                          viewModel!.changeIsDovizli(value);
                        }))
              ]))
            ]),
            Row(
              children: const [Expanded(child: CustomTextField(labelText: "Vade Günü")), Expanded(child: CustomTextField(labelText: "Ödeme Günü"))],
            ),
          ],
        ),
      ),
    );
  }
}
