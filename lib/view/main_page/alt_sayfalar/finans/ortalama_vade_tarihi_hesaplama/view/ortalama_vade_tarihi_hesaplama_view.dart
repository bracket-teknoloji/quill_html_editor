import "package:flutter/material.dart";
import "package:flutter_mobx/flutter_mobx.dart";
import "package:get/get.dart";
import "package:kartal/kartal.dart";
import "package:picker/core/base/state/base_state.dart";
import "package:picker/core/components/bottom_bar/bottom_bar.dart";
import "package:picker/core/components/button/elevated_buttons/footer_button.dart";
import "package:picker/core/components/dialog/bottom_sheet/model/bottom_sheet_model.dart";
import "package:picker/core/components/textfield/custom_text_field.dart";
import "package:picker/core/constants/extensions/date_time_extensions.dart";
import "package:picker/core/constants/extensions/number_extensions.dart";
import "package:picker/core/constants/ondalik_utils.dart";
import "package:picker/core/constants/ui_helper/ui_helper.dart";
import "package:picker/view/main_page/alt_sayfalar/finans/ortalama_vade_tarihi_hesaplama/model/ortalama_vade_tarihi_model.dart";
import "package:picker/view/main_page/alt_sayfalar/finans/ortalama_vade_tarihi_hesaplama/view_model/ortalama_vade_tarihi_hesaplama_view_model.dart";

class OrtalamaVadeTarihiHesaplamaView extends StatefulWidget {
  const OrtalamaVadeTarihiHesaplamaView({super.key});

  @override
  State<OrtalamaVadeTarihiHesaplamaView> createState() => _OrtalamaVadeTarihiHesaplamaViewState();
}

class _OrtalamaVadeTarihiHesaplamaViewState extends BaseState<OrtalamaVadeTarihiHesaplamaView> {
  final OrtalamaVadeTarihiHesaplamaViewModel viewModel = OrtalamaVadeTarihiHesaplamaViewModel();
  late final TextEditingController _vadeTarihiController;
  late final TextEditingController _tutarController;
  late final FocusNode _tutarFocusNode;

  @override
  void initState() {
    _vadeTarihiController = TextEditingController();
    _tutarController = TextEditingController();
    _tutarFocusNode = FocusNode();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) async {
      await getDateTime();
    });

    super.initState();
  }

  @override
  void dispose() {
    _vadeTarihiController.dispose();
    _tutarController.dispose();
    _tutarFocusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: appBar(),
        body: body().paddingAll(UIHelper.lowSize),
        bottomNavigationBar: bottomBar(),
      );

  AppBar appBar() => AppBar(
        title: const Text("Ortalama Vade Tarihi Hesaplama"),
        actions: [
          IconButton(
            onPressed: () async {
              if (viewModel.ortalamaVadeTarihiListesi.ext.isNullOrEmpty) {
                dialogManager.showErrorSnackBar("Liste Boş");
                return;
              }
              viewModel.clearOrtalamaVadeTarihiListesi();
            },
            icon: const Icon(Icons.clear_outlined),
          ),
        ],
      );

  Column body() => Column(
        children: [
          Row(
            // crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Expanded(
                child: CustomTextField(
                  labelText: "Vade Tarihi",
                  controller: _vadeTarihiController,
                  readOnly: true,
                  isDateTime: true,
                  isMust: true,
                  onTap: getDateTime,
                ),
              ),
              Expanded(
                child: CustomTextField(
                  labelText: "Tutar",
                  focusNode: _tutarFocusNode,
                  controller: _tutarController,
                  isFormattedString: true,
                  isMust: true,
                ),
              ),
              IconButton(
                onPressed: () async {
                  if (_vadeTarihiController.text.isEmpty || _tutarController.text.isEmpty) {
                    dialogManager.showErrorSnackBar("Boş Alan Bırakmayın");
                    return;
                  }
                  viewModel.addOrtalamaVadeTarihiListesi(
                    OrtalamaVadeTarihiModel(
                      vadeTarihi: _vadeTarihiController.text.toDateTimeDDMMYYYY(),
                      tutar: _tutarController.text.toDoubleWithFormattedString,
                    ),
                  );
                  _tutarController.clear();
                  await getDateTime();
                  _tutarFocusNode.requestFocus();
                },
                icon: const Icon(Icons.save_outlined),
              ),
            ],
          ),
          Expanded(
            child: Center(
              child: Observer(
                builder: (_) {
                  if (viewModel.ortalamaVadeTarihiListesi.ext.isNullOrEmpty) {
                    return const Text("Liste Boş");
                  }
                  return ListView.builder(
                    itemCount: viewModel.ortalamaVadeTarihiListesi.length,
                    itemBuilder: (context, index) {
                      final item = viewModel.ortalamaVadeTarihiListesi[index];
                      return Card(
                        child: ListTile(
                          title: Text(item.vadeTarihi.toDateString),
                          subtitle: Text("Tutar: ${item.tutar.commaSeparatedWithDecimalDigits(OndalikEnum.tutar)} $mainCurrency"),
                          onTap: () => listTileOnTap(item, index),
                        ),
                      );
                    },
                  );
                },
              ),
            ),
          ),
        ],
      );

  Future<void> listTileOnTap(OrtalamaVadeTarihiModel model, int index) async {
    await bottomSheetDialogManager.showBottomSheetDialog(
      context,
      title: loc(context).generalStrings.options,
      children: [
        BottomSheetModel(
          iconWidget: Icons.delete_outline,
          title: "Sil",
          onTap: () {
            Get.back();
            viewModel.removeOrtalamaVadeTarihiListesi(index);
          },
        ),
      ],
    );
  }

  BottomBarWidget bottomBar() => BottomBarWidget(
        isScrolledDown: true,
        children: [
          FooterButton(
            children: [
              const Text("Kayıt Sayısı:"),
              Observer(
                builder: (_) => Text(viewModel.toplamKayitSayisi.toString()),
              ),
            ],
          ),
          FooterButton(
            children: [
              const Text("Toplam Tutar:"),
              Observer(
                builder: (_) => Text(viewModel.toplamTutar.commaSeparatedWithDecimalDigits(OndalikEnum.tutar)),
              ),
            ],
          ),
          FooterButton(
            children: [
              const Text("Vade Günü:"),
              Observer(
                builder: (_) => Text(viewModel.ortalamaVadeTarihiString),
              ),
            ],
          ),
        ],
      );

  Future<void> getDateTime() async {
    final result = await dialogManager.showDateTimePicker();
    if (result != null) {
      _vadeTarihiController.text = result.toDateString;
    }
  }

  Future<void> cardOnTap() async {
    await bottomSheetDialogManager.showBottomSheetDialog(
      context,
      title: loc(context).generalStrings.options,
    );
  }
}
