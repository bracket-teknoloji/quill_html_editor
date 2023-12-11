import "package:flutter/material.dart";
import "package:flutter_mobx/flutter_mobx.dart";
import "package:get/get.dart";
import "package:picker/core/base/state/base_state.dart";
import "package:picker/core/base/view/kalem_rehberi/view_model/kalem_rehberi_view_model.dart";
import "package:picker/core/components/wrap/appbar_title.dart";
import "package:picker/core/constants/enum/edit_tipi_enum.dart";
import "package:picker/core/constants/ui_helper/ui_helper.dart";
import "package:picker/view/main_page/alt_sayfalar/siparis/base_siparis_edit/model/base_siparis_edit_model.dart";

class KalemRehberiView extends StatefulWidget {
  final BaseSiparisEditModel model;
  const KalemRehberiView({super.key, required this.model});

  @override
  State<KalemRehberiView> createState() => _KalemRehberiViewState();
}

class _KalemRehberiViewState extends BaseState<KalemRehberiView> {
  final KalemRehberiViewModel viewModel = KalemRehberiViewModel();

  @override
  void initState() {
    viewModel.setModel(widget.model);
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) async {
      await viewModel.getData();
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
          title: Observer(
            builder: (_) => AppBarTitle(
              title: "Kalem Rehberi (${viewModel.kalemList?.length ?? 0})",
              subtitle: EditTipiEnum.values.firstWhereOrNull((element) => element.rawValue == viewModel.model?.pickerBelgeTuru)?.getName ?? "",
            ),
          ),
          actions: [
            IconButton(
              onPressed: () {
                if (viewModel.selectedKalemList.isEmpty) {
                  dialogManager.showErrorSnackBar("Lütfen en az bir kalem seçiniz");
                } else {
                  Get.back(result: viewModel.selectedKalemList);
                }
              },
              icon: Icon(
                Icons.check_circle,
                color: UIHelper.primaryColor,
              ),
            ),
            IconButton(
              onPressed: () async {
                final result = await bottomSheetDialogManager.showRadioBottomSheetDialog(context, title: "Sırala", groupValue: viewModel.model?.siralama, children: viewModel.siralaList);
                if (result != null) {
                  viewModel.setSiralama(result);
                  await viewModel.resetPage();
                }
              },
              icon: const Icon(Icons.sort_by_alpha_outlined),
            ),
          ],
        ),
        body: Observer(
          builder: (_) {
            if (viewModel.kalemList == null) {
              return const Center(child: CircularProgressIndicator.adaptive());
            }
            return ListView.builder(
              padding: UIHelper.lowPadding,
              itemCount: viewModel.kalemList?.length ?? 0,
              itemBuilder: (context, index) {
                //checkBox listTile
                final KalemModel model = viewModel.kalemList?[index] ?? KalemModel();
                return Card(
                  child: ListTile(
                    onTap: () {
                      changeCheckBox(!viewModel.selectedKalemList.any((element) => element.stokKodu == model.stokKodu), model);
                    },
                    title: Text(model.stokAdi ?? "", overflow: TextOverflow.ellipsis),
                    subtitle: Text(model.stokKodu ?? ""),
                    trailing: Observer(
                      builder: (_) => Checkbox(
                        value: viewModel.selectedKalemList.any((element) => element.stokKodu == model.stokKodu),
                        onChanged: (value) {
                          changeCheckBox(value, model);
                        },
                      ),
                    ),
                  ),
                );
              },
            );
          },
        ),
        bottomNavigationBar: BottomAppBar(
          padding: UIHelper.midPadding,
          child: Row(
            children: [
              Expanded(
                child: ElevatedButton(
                  onPressed: viewModel.removeAllSelectedKalem,
                  style: ButtonStyle(backgroundColor: MaterialStateProperty.all(theme.colorScheme.onSurface.withOpacity(0.1))),
                  child: const Text("Tümünü Bırak"),
                ),
              ),
              SizedBox(width: UIHelper.lowSize),
              Expanded(
                child: ElevatedButton(
                  onPressed: () => viewModel.addAllSelectedKalem(viewModel.kalemList ?? []),
                  child: const Text("Tümünü Seç"),
                ),
              ),
            ],
          ),
        ),
      );

  void changeCheckBox(bool? value, KalemModel model) {
    if (value == true) {
      viewModel.addSelectedKalem(model);
    } else {
      viewModel.removeSelectedKalem(model);
    }
  }
}
