import "package:flutter/material.dart";
import "package:flutter_mobx/flutter_mobx.dart";
import "package:get/get.dart";

import "../../../../../view/main_page/alt_sayfalar/siparis/base_siparis_edit/model/base_siparis_edit_model.dart";
import "../../../../../view/main_page/alt_sayfalar/siparis/siparisler/model/siparisler_request_model.dart";
import "../../../../components/layout/custom_layout_builder.dart";
import "../../../../components/shimmer/list_view_shimmer.dart";
import "../../../../components/wrap/appbar_title.dart";
import "../../../../constants/enum/edit_tipi_enum.dart";
import "../../../../constants/extensions/date_time_extensions.dart";
import "../../../../constants/extensions/number_extensions.dart";
import "../../../../constants/ondalik_utils.dart";
import "../../../../constants/ui_helper/ui_helper.dart";
import "../../../state/base_state.dart";
import "../view_model/kalem_rehberi_view_model.dart";

/// KalemModel Listesi dönüyor
class KalemRehberiView extends StatefulWidget {
  final SiparislerRequestModel model;
  const KalemRehberiView({super.key, required this.model});

  @override
  State<KalemRehberiView> createState() => _KalemRehberiViewState();
}

class _KalemRehberiViewState extends BaseState<KalemRehberiView> {
  final KalemRehberiViewModel viewModel = KalemRehberiViewModel();

  @override
  void initState() {
    viewModel.setRequestModel(widget.model);
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) async {
      await viewModel.getData();
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) => BaseScaffold(
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
                  if (EditTipiEnum.alisFatura.getEditTipiEnumWithRawValue(viewModel.model?.pickerBelgeTuru).faturaMi) {
                    Get.back(
                      result: viewModel.selectedKalemList
                          .map(
                            (e) => e
                              ..siparisNo = widget.model.belgeNo
                              ..belgeNo = null
                              ..siparisSira = viewModel.selectedKalemList.indexOf(e) + 1,
                          )
                          .toList(),
                    );
                    return;
                  }
                  Get.back(result: viewModel.selectedKalemList);
                }
              },
              icon: const Icon(
                Icons.check_circle,
                color: UIHelper.primaryColor,
              ),
            ),
            IconButton(
              onPressed: () async {
                final result =
                    await bottomSheetDialogManager.showRadioBottomSheetDialog(context, title: loc.generalStrings.sort, groupValue: viewModel.model?.siralama, children: viewModel.siralaList);
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
              return const ListViewShimmer();
            } else if (viewModel.kalemList!.isEmpty) {
              return const Center(child: Text("Kayıt bulunamadı"));
            }
            return ListView.builder(
              padding: UIHelper.lowPadding,
              itemCount: viewModel.kalemList?.length ?? 0,
              itemBuilder: (context, index) {
                //checkBox listTile
                final KalemModel model = viewModel.kalemList?[index] ?? KalemModel();
                return Card(
                  child: ListTile(
                    onTap: () => changeCheckBox(!viewModel.selectedKalemList.any((element) => element.belgeNo == model.belgeNo && element.sira == model.sira), model),
                    visualDensity: VisualDensity.compact,
                    leading: Observer(
                      builder: (_) => Checkbox(
                        visualDensity: VisualDensity.compact,
                        value: viewModel.selectedKalemList.any((element) => element.belgeNo == model.belgeNo && element.sira == model.sira),
                        onChanged: (value) => changeCheckBox(value, model),
                      ),
                    ),
                    title: Text(
                      model.kalemAdi ?? model.stokAdi ?? "",
                      overflow: TextOverflow.ellipsis,
                    ),
                    subtitle: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("Belge No: ${model.belgeNo ?? ""}", overflow: TextOverflow.ellipsis),
                        Text("Stok Kodu: ${model.stokKodu ?? ""}", overflow: TextOverflow.ellipsis),
                        CustomLayoutBuilder(
                          splitCount: 2,
                          children: [
                            Text("Miktar: ${model.miktar.commaSeparatedWithDecimalDigits(OndalikEnum.miktar)}"),
                            Text("Miktar 2: ${model.miktar2.commaSeparatedWithDecimalDigits(OndalikEnum.miktar)}"),
                            Text("Teslim Miktarı: ${model.teslimMiktari.commaSeparatedWithDecimalDigits(OndalikEnum.miktar)}"),
                            Text("Kalan Miktar: ${model.kalan.commaSeparatedWithDecimalDigits(OndalikEnum.miktar)}"),
                            Text("Teslim Tarihi: ${model.teslimTarihi.toDateString}"),
                            Text("Sıra: ${model.sira ?? ""}"),
                          ],
                        ),
                      ],
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
                  style: ButtonStyle(backgroundColor: WidgetStateProperty.all(theme.colorScheme.onSurface.withOpacity(0.1))),
                  child: const Text("Tümünü Bırak"),
                ),
              ),
              const SizedBox(width: UIHelper.lowSize),
              Expanded(
                child: ElevatedButton(
                  onPressed: viewModel.addAllSelectedKalem,
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
