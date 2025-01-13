import "package:flutter/material.dart";
import "package:flutter_mobx/flutter_mobx.dart";
import "package:get/get.dart";
import "package:kartal/kartal.dart";
import "package:picker/core/components/card/sayimlar_card.dart";
import "package:picker/core/components/floating_action_button/custom_floating_action_button.dart";
import "package:picker/core/components/shimmer/list_view_shimmer.dart";
import "package:picker/core/components/textfield/custom_text_field.dart";
import "package:picker/core/components/wrap/appbar_title.dart";
import "package:picker/core/constants/ui_helper/ui_helper.dart";
import "package:picker/view/main_page/alt_sayfalar/sayim/sayim_listesi/view_model/sayim_listesi_view_model.dart";

import "../../../../../../core/base/model/base_grup_kodu_model.dart";
import "../../../../../../core/base/state/base_state.dart";

final class SayimListesiView extends StatefulWidget {
  const SayimListesiView({super.key});

  @override
  State<SayimListesiView> createState() => _SayimListesiViewState();
}

final class _SayimListesiViewState extends BaseState<SayimListesiView> {
  late final TextEditingController depoKoduController;
  late final TextEditingController grupKoduController;
  late final TextEditingController kod1Controller;
  late final TextEditingController kod2Controller;
  late final TextEditingController kod3Controller;
  late final TextEditingController kod4Controller;
  late final TextEditingController kod5Controller;
  final SayimListesiViewModel viewModel = SayimListesiViewModel();
  final GlobalKey<FormState> formKey = GlobalKey();

  @override
  void initState() {
    depoKoduController = TextEditingController();
    grupKoduController = TextEditingController();
    kod1Controller = TextEditingController();
    kod2Controller = TextEditingController();
    kod3Controller = TextEditingController();
    kod4Controller = TextEditingController();
    kod5Controller = TextEditingController();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) async {
      await viewModel.getData();
    });
    super.initState();
  }

  @override
  void dispose() {
    depoKoduController.dispose();
    grupKoduController.dispose();
    kod1Controller.dispose();
    kod2Controller.dispose();
    kod3Controller.dispose();
    kod4Controller.dispose();
    kod5Controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) => BaseScaffold(
        appBar: appBar(),
        floatingActionButton: fab(),
        body: body(),
      );

  AppBar appBar() => AppBar(
        title: Observer(
          builder: (_) => AppBarTitle(
            title: "Sayım",
            subtitle: (viewModel.sayimList?.length ?? 0).toString(),
          ),
        ),
      );

  CustomFloatingActionButton? fab() {
    if (yetkiController.sayimEkle) {
      return CustomFloatingActionButton(
        isScrolledDown: true,
        onPressed: filterBottomSheet,
      );
    }
    return null;
  }

  RefreshIndicator body() => RefreshIndicator.adaptive(
        onRefresh: viewModel.getData,
        child: Observer(
          builder: (_) {
            if (viewModel.sayimList == null) {
              return const ListViewShimmer();
            }
            if (viewModel.sayimList?.isEmpty == true) {
              return Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(Icons.dashboard_outlined, size: 100, color: Colors.grey.shade300),
                    //TODO Bunları da refreshable list'e ekle
                    const Text("Kayıt bulunamadı."),
                    const Text("Size atanmış sayım yok veya Sayım emri oluşturulmamış"),
                  ],
                ),
              );
            }
            return ListView.builder(
              itemCount: viewModel.sayimList?.length ?? 0,
              padding: UIHelper.lowPadding,
              itemBuilder: (context, index) => SayimlarCard(
                model: viewModel.sayimList![index],
                onChanged: (value) async {
                  if (value) {
                    await viewModel.getData();
                  }
                },
              ),
            );
          },
        ),
      );

  Future<void> filterBottomSheet() async {
    if (viewModel.grupKoduList.ext.isNullOrEmpty) {
      await viewModel.getGrupKodlari();
    }
    await bottomSheetDialogManager.showBottomSheetDialog(
      context,
      title: "Serbest Sayım Parametreleri",
      body: Form(
        key: formKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            CustomTextField(
              labelText: "Depo Kodu",
              readOnly: true,
              isMust: true,
              suffixMore: true,
              controller: depoKoduController,
              onTap: () async {
                final result = await bottomSheetDialogManager.showDepoBottomSheetDialog(context, 0);
                if (result != null) {
                  depoKoduController.text = result.depoTanimi ?? "";
                  viewModel.filtreModel.depoKodu = result.depoKodu;
                }
              },
            ),
            Row(
              children: [
                Expanded(
                  child: CustomTextField(
                    labelText: "Grup Kodu",
                    readOnly: true,
                    suffixMore: true,
                    controller: grupKoduController,
                    onClear: () => viewModel.filtreModel.arrGrupKodu = null,
                    onTap: () async {
                      final result = await bottomSheetDialogManager.showCheckBoxBottomSheetDialog<BaseGrupKoduModel>(
                        context,
                        title: "Grup Kodu",
                        groupValues: viewModel.filtreModel.arrGrupKodu,
                        children: viewModel.bottomSheetChildren(0),
                      );
                      if (result != null) {
                        viewModel.filtreModel.arrGrupKodu = result.map((e) => e.grupKodu ?? "").toList();
                        grupKoduController.text = result.map((e) => e.grupAdi ?? "").join(", ");
                      }
                    },
                  ),
                ),
                Expanded(
                  child: CustomTextField(
                    labelText: "Kod 1",
                    readOnly: true,
                    suffixMore: true,
                    controller: kod1Controller,
                    onClear: () => viewModel.filtreModel.arrKod1 = null,
                    onTap: () async {
                      final result = await bottomSheetDialogManager.showCheckBoxBottomSheetDialog<BaseGrupKoduModel>(
                        context,
                        title: "Kod 1",
                        groupValues: viewModel.filtreModel.arrKod1,
                        children: viewModel.bottomSheetChildren(1),
                      );
                      if (result != null) {
                        viewModel.filtreModel.arrKod1 = result.map((e) => e.grupKodu ?? "").toList();
                        kod1Controller.text = result.map((e) => e.grupAdi ?? "").join(", ");
                      }
                    },
                  ),
                ),
              ],
            ),
            Row(
              children: [
                Expanded(
                  child: CustomTextField(
                    labelText: "Kod 2",
                    readOnly: true,
                    suffixMore: true,
                    controller: kod2Controller,
                    onClear: () => viewModel.filtreModel.arrKod2 = null,
                    onTap: () async {
                      final result = await bottomSheetDialogManager.showCheckBoxBottomSheetDialog<BaseGrupKoduModel>(
                        context,
                        title: "Kod 2",
                        groupValues: viewModel.filtreModel.arrKod2,
                        children: viewModel.bottomSheetChildren(2),
                      );
                      if (result != null) {
                        viewModel.filtreModel.arrKod2 = result.map((e) => e.grupKodu ?? "").toList();
                        kod2Controller.text = result.map((e) => e.grupAdi ?? "").join(", ");
                      }
                    },
                  ),
                ),
                Expanded(
                  child: CustomTextField(
                    labelText: "Kod 3",
                    readOnly: true,
                    suffixMore: true,
                    controller: kod3Controller,
                    onClear: () => viewModel.filtreModel.arrKod3 = null,
                    onTap: () async {
                      final result = await bottomSheetDialogManager.showCheckBoxBottomSheetDialog<BaseGrupKoduModel>(
                        context,
                        title: "Kod 3",
                        groupValues: viewModel.filtreModel.arrKod3,
                        children: viewModel.bottomSheetChildren(3),
                      );
                      if (result != null) {
                        viewModel.filtreModel.arrKod3 = result.map((e) => e.grupKodu ?? "").toList();
                        kod3Controller.text = result.map((e) => e.grupAdi ?? "").join(", ");
                      }
                    },
                  ),
                ),
              ],
            ),
            Row(
              children: [
                Expanded(
                  child: CustomTextField(
                    labelText: "Kod 4",
                    readOnly: true,
                    suffixMore: true,
                    controller: kod4Controller,
                    onClear: () => viewModel.filtreModel.arrKod4 = null,
                    onTap: () async {
                      final result = await bottomSheetDialogManager.showCheckBoxBottomSheetDialog<BaseGrupKoduModel>(
                        context,
                        title: "Kod 4",
                        groupValues: viewModel.filtreModel.arrKod4,
                        children: viewModel.bottomSheetChildren(4),
                      );
                      if (result != null) {
                        viewModel.filtreModel.arrKod4 = result.map((e) => e.grupKodu ?? "").toList();
                        kod4Controller.text = result.map((e) => e.grupAdi ?? "").join(", ");
                      }
                    },
                  ),
                ),
                Expanded(
                  child: CustomTextField(
                    labelText: "Kod 5",
                    readOnly: true,
                    suffixMore: true,
                    controller: kod5Controller,
                    onClear: () => viewModel.filtreModel.arrKod5 = null,
                    onTap: () async {
                      final result = await bottomSheetDialogManager.showCheckBoxBottomSheetDialog<BaseGrupKoduModel>(
                        context,
                        title: "Kod 5",
                        groupValues: viewModel.filtreModel.arrKod5,
                        children: viewModel.bottomSheetChildren(5),
                      );
                      if (result != null) {
                        final List<BaseGrupKoduModel> list = result;
                        viewModel.filtreModel.arrKod5 = list.map((e) => e.grupKodu ?? "").toList();
                        kod5Controller.text = list.map((e) => e.grupAdi).join(", ");
                      }
                    },
                  ),
                ),
              ],
            ),
            ElevatedButton(
              onPressed: () async {
                if (formKey.currentState?.validate() == true) {
                  final result = await viewModel.postData();
                  if (result) {
                    Get.back();
                    dialogManager.showSuccessSnackBar("Yeni bir serbest Rapor oluşturuldu.");
                    await viewModel.getData();
                  }
                }
              },
              child: Text(loc.generalStrings.apply),
            ).paddingAll(UIHelper.lowSize),
          ],
        ).paddingAll(UIHelper.lowSize),
      ),
    );
  }
}
