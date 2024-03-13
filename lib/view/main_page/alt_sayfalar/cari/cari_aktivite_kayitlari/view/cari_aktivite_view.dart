import "package:flutter/material.dart";
import "package:flutter_mobx/flutter_mobx.dart";
import "package:get/get.dart";
import "package:picker/core/base/model/base_edit_model.dart";
import "package:picker/core/base/model/kullanicilar_model.dart";
import "package:picker/core/components/card/cari_aktivite_card.dart";
import "package:picker/core/components/floating_action_button/custom_floating_action_button.dart";
import "package:picker/core/components/list_view/rapor_filtre_date_time_bottom_sheet/view/rapor_filtre_date_time_bottom_sheet_view.dart";
import "package:picker/core/components/shimmer/list_view_shimmer.dart";
import "package:picker/core/components/textfield/custom_text_field.dart";
import "package:picker/core/components/wrap/appbar_title.dart";
import "package:picker/core/constants/enum/base_edit_enum.dart";
import "package:picker/core/constants/extensions/date_time_extensions.dart";
import "package:picker/core/constants/extensions/widget_extensions.dart";
import "package:picker/core/constants/ui_helper/ui_helper.dart";
import "package:picker/view/main_page/alt_sayfalar/cari/cari_aktivite_kayitlari/model/cari_aktivite_listesi_model.dart";
import "package:picker/view/main_page/alt_sayfalar/cari/cari_aktivite_kayitlari/view_model/cari_aktivite_view_model.dart";
import "package:picker/view/main_page/alt_sayfalar/cari/cari_listesi/model/cari_listesi_model.dart";
import "package:picker/view/main_page/alt_sayfalar/cari/cari_listesi/model/cari_request_model.dart";

import "../../../../../../core/base/state/base_state.dart";

class CariAktiviteView extends StatefulWidget {
  final CariListesiModel? cariModel;
  const CariAktiviteView({super.key, this.cariModel});

  @override
  State<CariAktiviteView> createState() => _CariAktiviteViewState();
}

class _CariAktiviteViewState extends BaseState<CariAktiviteView> {
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
    cariController = TextEditingController();
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
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
          title: Observer(
            builder: (_) => AppBarTitle(
              title: "Aktivite Kayıtları",
              subtitle: (viewModel.aktiviteList?.length ?? 0).toString(),
            ),
          ),
          actions: [
            IconButton(
              onPressed: getFilter,
              icon: const Icon(Icons.filter_alt_outlined),
            ),
          ],
        ),
        floatingActionButton: CustomFloatingActionButton(
          isScrolledDown: true,
          onPressed: () async {
            await Get.toNamed(
              "/mainPage/cariAktiviteEdit",
              arguments: BaseEditModel<CariAktiviteListesiModel>(
                baseEditEnum: BaseEditEnum.ekle,
                model: CariAktiviteListesiModel(cariKodu: widget.cariModel?.cariKodu, cariAdi: widget.cariModel?.cariAdi),
              ),
            );
          },
        ).yetkiVarMi(yetkiController.cariAktiviteYeniKayit),
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
                viewModel.setBaslangicTarihi(baslangicTarihiController.text.toDateTimeDDMMYYYY());
                viewModel.setBitisTarihi(bitisTarihiController.text.toDateTimeDDMMYYYY());
                await viewModel.getData();
              },
              baslangicTarihiController: baslangicTarihiController,
              bitisTarihiController: bitisTarihiController,
            ),
            Expanded(
              child: RefreshIndicator.adaptive(
                onRefresh: () async {
                  await viewModel.getData();
                },
                child: Observer(
                  builder: (_) {
                    if (viewModel.aktiviteList == null) {
                      return const ListViewShimmer();
                    }
                    if (viewModel.aktiviteList?.isEmpty == true) {
                      return const Center(
                        child: Text("Sonuç bulunamadı."),
                      );
                    }
                    return ListView.builder(
                      itemCount: viewModel.aktiviteList?.length ?? 0,
                      itemBuilder: (context, index) {
                        final CariAktiviteListesiModel model = viewModel.aktiviteList![index];
                        return CariAktiviteCard(model: model);
                      },
                    );
                  },
                ),
              ),
            ),
          ],
        ).paddingAll(UIHelper.lowSize),
      );

  Future<void> getFilter() async {
    await bottomSheetDialogManager.showBottomSheetDialog(
      context,
      title: loc.generalStrings.filter,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
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
                  final result = await networkManager.getCariModel(CariRequestModel(kod: [viewModel.requestModel.cariKodu ?? ""]));
                  if (result is CariListesiModel) {
                    dialogManager.showCariIslemleriGridViewDialog(result);
                  }
                }
              },
              icon: Icon(
                Icons.open_in_new_outlined,
                color: UIHelper.primaryColor,
              ),
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
              final result = await bottomSheetDialogManager.showKullanicilarBottomSheetDialog(context, viewModel.requestModel.kullanici);
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
