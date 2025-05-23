import "package:flutter/material.dart";
import "package:flutter_mobx/flutter_mobx.dart";
import "package:get/get.dart";

import "../../../../../../core/base/state/base_state.dart";
import "../../../../../../core/components/bottom_bar/bottom_bar.dart";
import "../../../../../../core/components/button/elevated_buttons/footer_button.dart";
import "../../../../../../core/components/layout/custom_layout_builder.dart";
import "../../../../../../core/components/shimmer/list_view_shimmer.dart";
import "../../../../../../core/components/textfield/custom_app_bar_text_field.dart";
import "../../../../../../core/components/textfield/custom_text_field.dart";
import "../../../../../../core/components/wrap/appbar_title.dart";
import "../../../../../../core/constants/color_palette.dart";
import "../../../../../../core/constants/enum/depo_fark_raporu_filtre_enum.dart";
import "../../../../../../core/constants/extensions/date_time_extensions.dart";
import "../../../../../../core/constants/extensions/number_extensions.dart";
import "../../../../../../core/constants/ondalik_utils.dart";
import "../../../../../../core/constants/ui_helper/ui_helper.dart";
import "../../sayim_edit/sayilanlar_listesi/model/sayilan_kalemler_request_model.dart";
import "../../sayim_listesi/model/sayim_listesi_model.dart";
import "../view_model/depo_fark_raporu_view_model.dart";

final class DepoFarkRaporuView extends StatefulWidget {
  const DepoFarkRaporuView({required this.model, super.key});
  final SayimListesiModel model;

  @override
  State<DepoFarkRaporuView> createState() => _DepoFarkRaporuViewState();
}

final class _DepoFarkRaporuViewState extends BaseState<DepoFarkRaporuView> {
  final DepoFarkRaporuViewModel viewModel = DepoFarkRaporuViewModel();
  late final TextEditingController searchTextController;
  late final TextEditingController filtreController;

  @override
  void initState() {
    searchTextController = TextEditingController();
    filtreController = TextEditingController(text: viewModel.filtreTuru.filtreAdi);
    viewModel.setRequestModel(SayilanKalemlerRequestModel.fromSayimListesiModel(widget.model));
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) async {
      await viewModel.getData();
    });
    super.initState();
  }

  @override
  void dispose() {
    searchTextController.dispose();
    filtreController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) => BaseScaffold(appBar: appBar, body: body, bottomNavigationBar: bottomAppBar);

  AppBar get appBar => AppBar(
    title: Observer(
      builder: (_) => viewModel.searchBar
          ? CustomAppBarTextField(controller: searchTextController, onChanged: viewModel.setSearchText)
          : AppBarTitle(title: "Depo Fark Raporu", subtitle: widget.model.fisno),
    ),
    actions: [
      IconButton(
        onPressed: () {
          viewModel.setSearchBar(!viewModel.searchBar);
          if (!viewModel.searchBar) {
            searchTextController.clear();
          }
        },
        icon: Observer(builder: (_) => Icon(viewModel.searchBar ? Icons.search_off_outlined : Icons.search_outlined)),
      ),
      IconButton(
        onPressed: filterBottomSheetDialog,
        icon: Observer(builder: (_) => const Icon(Icons.more_vert_outlined)),
      ),
    ],
  );

  BottomBarWidget get bottomAppBar => BottomBarWidget(
    isScrolledDown: true,
    children: [
      FooterButton(
        children: [
          const Text("Kayıt Sayısı"),
          Observer(builder: (_) => Text(viewModel.filteredSayimListesi?.length.toString() ?? "0")),
        ],
      ),
      FooterButton(
        children: [
          const Text("Depo Mik."),
          Observer(
            builder: (_) => Text(viewModel.toplamDepoMiktari.commaSeparatedWithDecimalDigits(OndalikEnum.miktar)),
          ),
        ],
      ),
      FooterButton(
        children: [
          const Text("Sayım Mik."),
          Observer(
            builder: (_) => Text(viewModel.toplamSayimMiktari.commaSeparatedWithDecimalDigits(OndalikEnum.miktar)),
          ),
        ],
      ),
      FooterButton(
        children: [
          const Text("Fark"),
          Observer(
            builder: (_) => Text(viewModel.toplamFarkMiktari.commaSeparatedWithDecimalDigits(OndalikEnum.miktar)),
          ),
        ],
      ),
    ],
  );

  RefreshIndicator get body => RefreshIndicator.adaptive(
    onRefresh: () async {
      viewModel.setSayimListesi(null);
      await viewModel.getData();
    },
    child: Observer(
      builder: (_) {
        if (viewModel.filteredSayimListesi == null) return const ListViewShimmer();
        if (viewModel.filteredSayimListesi!.isEmpty) {
          return const Center(child: Text("Depo Fark Raporları Bulunamadı."));
        }
        return ListView.builder(
          itemCount: viewModel.filteredSayimListesi?.length ?? 0,
          itemBuilder: (context, index) {
            final SayimListesiModel item = viewModel.filteredSayimListesi![index];
            return Card(
              color: (item.miktar ?? 0) <= 0 ? ColorPalette.persianRedWithOpacity : null,
              child: ListTile(
                title: Text(item.stokAdi ?? ""),
                subtitle: CustomLayoutBuilder(
                  splitCount: 2,
                  children: [
                    Text("Stok Kodu: ${item.stokKodu}"),
                    if (item.seriNo != null) Text("Seri 1: ${item.seriNo}"),
                    if (item.seri2 != null) Text("Seri 2: ${item.seri2}"),
                    if (item.seri3 != null) Text("Seri 3: ${item.seri3}"),
                    if (item.seri4 != null) Text("Seri 4: ${item.seri4}"),
                    if (item.sonKullanmaTarihi?.toDateString != null)
                      Text("Son Kul. Tarihi: ${item.sonKullanmaTarihi.toDateString}"),
                    Text("Depo Miktarı: ${item.stokBakiye.commaSeparatedWithDecimalDigits(OndalikEnum.miktar)}"),
                    Text("Sayım Miktarı: ${item.miktar.commaSeparatedWithDecimalDigits(OndalikEnum.miktar)}"),
                    Text("Fark: ${item.depoFark.commaSeparatedWithDecimalDigits(OndalikEnum.miktar)}"),
                  ],
                ),
              ),
            );
          },
        );
      },
    ).paddingAll(UIHelper.lowSize),
  );

  Future<void> filterBottomSheetDialog() async {
    await bottomSheetDialogManager.showBottomSheetDialog(
      context,
      title: loc.generalStrings.filter,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          //TODO Filtre ekle
          CustomTextField(
            labelText: loc.generalStrings.filter,
            controller: filtreController,
            readOnly: true,
            suffixMore: true,
            onTap: () async {
              final result = await bottomSheetDialogManager.showSayimFiltresiBottomSheetDialog(
                context,
                viewModel.filtreTuru,
              );
              if (result is DepoFarkRaporuFiltreEnum) {
                viewModel.setFiltreTuru(result);
                filtreController.text = result.filtreAdi;
              }
            },
          ),
          Card(
            child: Observer(
              builder: (_) => SwitchListTile.adaptive(
                title: const Text("Seri Bazında Mı?"),
                value: viewModel.requestModel.seriBazinda == "E",
                onChanged: viewModel.setSeriBazindaMi,
              ),
            ),
          ),
          ElevatedButton(
            onPressed: () async {
              Get.back();
              await viewModel.getData();
            },
            child: Text(loc.generalStrings.apply),
          ),
        ],
      ),
    );
  }
}
