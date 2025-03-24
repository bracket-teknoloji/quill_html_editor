import "package:flutter/material.dart";
import "package:flutter_mobx/flutter_mobx.dart";
import "package:get/get.dart";

import "../../../../../../core/base/state/base_state.dart";
import "../../../../../../core/components/dialog/bottom_sheet/model/bottom_sheet_model.dart";
import "../../../../../../core/components/layout/custom_layout_builder.dart";
import "../../../../../../core/components/list_view/rapor_filtre_date_time_bottom_sheet/view/rapor_filtre_date_time_bottom_sheet_view.dart";
import "../../../../../../core/components/list_view/refreshable_list_view.dart";
import "../../../../../../core/components/textfield/custom_app_bar_text_field.dart";
import "../../../../../../core/components/wrap/appbar_title.dart";
import "../../../../../../core/constants/extensions/date_time_extensions.dart";
import "../../../../../../core/constants/extensions/number_extensions.dart";
import "../../../../../../core/constants/ondalik_utils.dart";
import "../../../../../../core/constants/ui_helper/ui_helper.dart";
import "../../../cari/cari_listesi/model/cari_request_model.dart";
import "../../banka/banka_hareketleri/model/banka_hareketleri_model.dart";
import "../view_model/hizli_tahsilat_kayitlari_view_model.dart";

final class HizliTahsilatKayitlariView extends StatefulWidget {
  const HizliTahsilatKayitlariView({super.key});

  @override
  State<HizliTahsilatKayitlariView> createState() => _HizliTahsilatKayitlariViewState();
}

final class _HizliTahsilatKayitlariViewState extends BaseState<HizliTahsilatKayitlariView> {
  final HizliTahsilatKayitlariViewModel viewModel = HizliTahsilatKayitlariViewModel();
  late final ScrollController scrollController;
  late final TextEditingController baslangicTarihiController;
  late final TextEditingController bitisTarihiController;
  late final TextEditingController searchController;

  @override
  void initState() {
    baslangicTarihiController = TextEditingController();
    bitisTarihiController = TextEditingController();
    searchController = TextEditingController();
    scrollController = ScrollController();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) async {
      await viewModel.getData();
    });
    super.initState();
  }

  @override
  void dispose() {
    baslangicTarihiController.dispose();
    bitisTarihiController.dispose();
    searchController.dispose();
    scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) => BaseScaffold(appBar: appBar(), body: body().paddingAll(UIHelper.lowSize));

  AppBar appBar() => AppBar(
    title: Observer(
      builder:
          (_) =>
              viewModel.isSearchBarOpen
                  ? CustomAppBarTextField(controller: searchController, onChanged: viewModel.setSearchText)
                  : AppBarTitle(
                    title: "Hızlı Tahsilat Kayıtları",
                    subtitle: viewModel.observableList?.length.toStringIfNotNull ?? "0",
                  ),
    ),
    actions: [
      IconButton(
        onPressed: viewModel.changeSearchBarStatus,
        icon: Observer(
          builder: (_) => Icon(viewModel.isSearchBarOpen ? Icons.search_off_outlined : Icons.search_outlined),
        ),
      ),
    ],
  );

  Column body() => Column(
    children: [
      RaporFiltreDateTimeBottomSheetView(
        filterOnChanged: (index) async {
          viewModel
            ..setBaslangicTarihi(baslangicTarihiController.text)
            ..setBitisTarihi(bitisTarihiController.text);
          await viewModel.resetList();
        },
        baslangicTarihiController: baslangicTarihiController,
        bitisTarihiController: bitisTarihiController,
      ),
      Expanded(
        child: Observer(
          builder:
              (_) => RefreshableListView(
                onRefresh: viewModel.resetList,
                items: viewModel.filteredObservableList,
                itemBuilder: hizliTahsilatKayitlariCard,
              ),
        ),
      ),
    ],
  );

  Widget hizliTahsilatKayitlariCard(BankaHareketleriModel item) => Card(
    child: ListTile(
      title: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(item.tarih?.toDateString ?? ""),
          //TODO döviz tipinin attribute'unu sor.
          Text("${item.tutar.commaSeparatedWithDecimalDigits(OndalikEnum.tutar)} $mainCurrency"),
        ],
      ),
      subtitle: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(item.cariAdi ?? ""),
          if (item.belgeNo != null) Text("Belge no: ${item.belgeNo}"),
          CustomLayoutBuilder.divideInHalf(
            children: [
              Text("Cari kodu: ${item.cariKodu}"),
              Text("Kasa kodu: ${item.kasaKodu}"),
              Text("Nakit/KK: ${item.nakitmi == "E" ? "Nakit" : "KK"}"),
              // Text("Cari kodu: ${item.na}"),
              if (yetkiController.projeUygulamasiAcikMi && item.projeKodu != null)
                Text("Proje kodu: ${item.projeKodu}"),
              // Text("Döviz tipi: ${item.dovizTipi}"),
            ],
          ),
          Text(item.aciklama ?? ""),
        ],
      ),
      onTap: () async {
        await bottomSheetDialogManager.showBottomSheetDialog(
          context,
          title: item.cariAdi ?? item.cariKodu ?? "",
          children: [
            if (yetkiController.hizliTahsilatSil)
              BottomSheetModel(
                title: loc.generalStrings.delete,
                iconWidget: Icons.delete_outline_outlined,
                onTap: () async {
                  Get.back();
                  dialogManager.showAreYouSureDialog(
                    onYes: () async {
                      final result = await viewModel.deleteHizliTahsilat(item.inckeyno!);
                      if (result.isSuccess) {
                        await viewModel.resetList();
                        dialogManager.showSuccessSnackBar(result.message ?? "İşlem başarılı");
                      }
                    },
                  );
                },
              ),
            BottomSheetModel(
              title: "Cari İşlemleri",
              iconWidget: Icons.person_outline_outlined,
              onTap: () async {
                Get.back();
                return dialogManager.showCariIslemleriGridViewDialog(
                  await networkManager.getCariModel(CariRequestModel(kod: [item.cariKodu ?? ""])),
                );
              },
            ),
          ],
        );
      },
    ),
  );
}
