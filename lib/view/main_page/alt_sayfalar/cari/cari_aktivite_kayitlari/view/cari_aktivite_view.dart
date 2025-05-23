import "package:flutter/material.dart";
import "package:flutter_mobx/flutter_mobx.dart";
import "package:get/get.dart";
import "package:picker/core/components/slide_controller/view/slide_controller_view.dart";

import "../../../../../../core/base/model/base_edit_model.dart";
import "../../../../../../core/base/model/kullanicilar_model.dart";
import "../../../../../../core/base/state/base_state.dart";
import "../../../../../../core/components/card/cari_aktivite_card.dart";
import "../../../../../../core/components/floating_action_button/custom_floating_action_button.dart";
import "../../../../../../core/components/list_view/rapor_filtre_date_time_bottom_sheet/view/rapor_filtre_date_time_bottom_sheet_view.dart";
import "../../../../../../core/components/list_view/refreshable_list_view.dart";
import "../../../../../../core/components/textfield/custom_text_field.dart";
import "../../../../../../core/components/wrap/appbar_title.dart";
import "../../../../../../core/constants/enum/base_edit_enum.dart";
import "../../../../../../core/constants/extensions/date_time_extensions.dart";
import "../../../../../../core/constants/ui_helper/ui_helper.dart";
import "../../cari_listesi/model/cari_listesi_model.dart";
import "../../cari_listesi/model/cari_request_model.dart";
import "../model/cari_aktivite_listesi_model.dart";
import "../view_model/cari_aktivite_view_model.dart";

final class CariAktiviteView extends StatefulWidget {
  const CariAktiviteView({super.key, this.cariModel});
  final CariListesiModel? cariModel;

  @override
  State<CariAktiviteView> createState() => _CariAktiviteViewState();
}

final class _CariAktiviteViewState extends BaseState<CariAktiviteView> {
  final CariAktiviteViewModel viewModel = CariAktiviteViewModel();
  late final TextEditingController searchController;
  late final TextEditingController cariController;
  late final TextEditingController kullaniciController;
  late final TextEditingController baslangicTarihiController;
  late final TextEditingController bitisTarihiController;

  @override
  void initState() {
    viewModel.setCariKodu(widget.cariModel?.cariKodu);
    searchController = TextEditingController();
    cariController = TextEditingController(text: widget.cariModel?.cariAdi);
    kullaniciController = TextEditingController();
    baslangicTarihiController = TextEditingController();
    bitisTarihiController = TextEditingController();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) async {
      await viewModel.getData();
    });
    super.initState();
  }

  @override
  void dispose() {
    searchController.dispose();
    cariController.dispose();
    kullaniciController.dispose();
    baslangicTarihiController.dispose();
    bitisTarihiController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) => BaseScaffold(
    appBar: AppBar(
      title: Observer(
        builder: (_) =>
            AppBarTitle(title: "Aktivite Kayıtları", subtitle: (viewModel.filteredList?.length ?? 0).toString()),
      ),
      actions: [IconButton(onPressed: getFilter, icon: const Icon(Icons.filter_alt_outlined))],
    ),
    floatingActionButton: yetkiController.cariAktiviteYeniKayit ? fab() : null,
    body: Column(
      children: [
        CustomTextField(
          labelText: "Ara...",
          controller: searchController,
          onClear: () async {
            viewModel.setSearchText(null);
            await viewModel.getData();
          },
          onSubmitted: (value) async {
            viewModel.setSearchText(value);
            await viewModel.getData();
          },
        ),
        RaporFiltreDateTimeBottomSheetView(
          filterOnChanged: (value) async {
            viewModel
              ..setBaslangicTarihi(baslangicTarihiController.text.toDateTimeDDMMYYYY())
              ..setBitisTarihi(bitisTarihiController.text.toDateTimeDDMMYYYY());
            await viewModel.getData();
          },
          baslangicTarihiController: baslangicTarihiController,
          bitisTarihiController: bitisTarihiController,
        ),
        Expanded(
          child: Observer(
            builder: (_) => RefreshableListView(
              onRefresh: viewModel.getData,
              items: viewModel.filteredList,
              itemBuilder: (item) => CariAktiviteCard(
                model: item,
                onRefresh: (value) async {
                  if (value) {
                    await viewModel.getData();
                  }
                },
                updatedModel: () async => await viewModel.getNewItem(item.id),
              ),
            ),
          ),
        ),
      ],
    ).paddingAll(UIHelper.lowSize),
  );

  CustomFloatingActionButton fab() => CustomFloatingActionButton(
    isScrolledDown: true,
    onPressed: () async {
      final result = await Get.toNamed(
        "/mainPage/cariAktiviteEdit",
        arguments: BaseEditModel<CariAktiviteListesiModel>(
          baseEditEnum: BaseEditEnum.ekle,
          model: CariAktiviteListesiModel(
            cariKodu: widget.cariModel?.cariKodu,
            cariAdi: cariController.text,
            kullaniciAdi: kullaniciController.text,
          ),
        ),
      );
      if (result == true) {
        await viewModel.getData();
      }
    },
  );

  Future<void> getFilter() async {
    await bottomSheetDialogManager.showBottomSheetDialog(
      context,
      title: loc.generalStrings.filter,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Observer(
            builder: (_) => SlideControllerWidget(
              childrenTitleList: CariAktiviteDurumEnum.values.map((e) => e.value).toList(),
              childrenValueList: CariAktiviteDurumEnum.values,
              groupValue: viewModel.durum,
              filterOnChanged: (index) async {
                viewModel.setDurum(CariAktiviteDurumEnum.values[index ?? 0]);
              },
            ),
          ),
          CustomTextField(
            labelText: "Cari",
            suffixMore: true,
            readOnly: true,
            controller: cariController,
            onClear: () => viewModel.setCariKodu(null),
            valueWidget: Observer(builder: (_) => Text(viewModel.requestModel.cariKodu ?? "")),
            suffix: IconButton(
              onPressed: () async {
                if (viewModel.requestModel.cariKodu == null) {
                  dialogManager.showAlertDialog("Lütfen bir cari seçiniz.");
                  return;
                } else {
                  final result = await networkManager.getCariModel(
                    CariRequestModel(kod: [viewModel.requestModel.cariKodu ?? ""]),
                  );
                  if (result is CariListesiModel) {
                    dialogManager.showCariIslemleriGridViewDialog(result);
                  }
                }
              },
              icon: const Icon(Icons.open_in_new_outlined, color: UIHelper.primaryColor),
            ),
            onTap: () async {
              final result = await Get.toNamed("mainPage/cariListesiOzel");
              if (result is CariListesiModel) {
                cariController.text = result.cariAdi ?? "";
                viewModel.setCariKodu(result.cariKodu);
              }
            },
          ),
          CustomTextField(
            labelText: "Kullanıcı",
            suffixMore: true,
            readOnly: true,
            controller: kullaniciController,
            valueWidget: Observer(builder: (_) => Text(viewModel.requestModel.kullanici ?? "")),
            onClear: () => viewModel.setKullanici(null),
            onTap: () async {
              final result = await bottomSheetDialogManager.showKullanicilarBottomSheetDialog(
                context,
                viewModel.requestModel.kullanici,
              );
              if (result is KullanicilarModel) {
                kullaniciController.text = result.adi ?? "";
                viewModel.setKullanici(result.kodu);
              }
            },
          ),
          ElevatedButton(
            onPressed: () async {
              Get.back();
              await viewModel.getData();
            },
            child: Text(loc.generalStrings.apply),
          ).paddingAll(UIHelper.lowSize),
        ],
      ).paddingAll(UIHelper.lowSize),
    );
  }
}
