import "package:flutter/material.dart";
import "package:flutter_mobx/flutter_mobx.dart";
import "package:get/get.dart";
import "package:kartal/kartal.dart";
import "../../../../../../../core/components/card/banka_listesi_card.dart";

import "../../../../../../../core/base/state/base_state.dart";
import "../../../../../../../core/components/appbar/appbar_prefered_sized_bottom.dart";
import "../../../../../../../core/components/button/elevated_buttons/bottom_appbar_button.dart";
import "../../../../../../../core/components/button/elevated_buttons/footer_button.dart";
import "../../../../../../../core/components/dialog/bottom_sheet/model/bottom_sheet_model.dart";
import "../../../../../../../core/components/slide_controller/view/slide_controller_view.dart";
import "../../../../../../../core/components/textfield/custom_app_bar_text_field.dart";
import "../../../../../../../core/components/wrap/appbar_title.dart";
import "../../../../../../../core/constants/extensions/number_extensions.dart";
import "../../../../../../../core/constants/ondalik_utils.dart";
import "../../../../../../../core/constants/ui_helper/ui_helper.dart";
import "../model/kasa_listesi_model.dart";
import "../view_model/kasa_listesi_view_model.dart";

class KasaListesiView extends StatefulWidget {
  const KasaListesiView({super.key});

  @override
  State<KasaListesiView> createState() => _KasaListesiViewState();
}

class _KasaListesiViewState extends BaseState<KasaListesiView> {
  KasaListesiViewModel viewModel = KasaListesiViewModel();
  late final TextEditingController _searchController;

  @override
  void initState() {
    _searchController = TextEditingController();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) async {
      await viewModel.getData();
    });
    super.initState();
  }

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      extendBody: false,
      extendBodyBehindAppBar: false,
      appBar: appBar(),
      body: body(),
      bottomNavigationBar: bottomAppBar(),
    );
  }

  AppBar appBar() {
    return AppBar(
      title: Observer(builder: (_) {
        if (viewModel.searchBar) {
          return CustomAppBarTextField(
            onChanged: (value) => viewModel.setSearchText(value),
          );
        }
        return Observer(
            builder: (_) => AppBarTitle(
                title: "Kasa Listesi",
                subtitle:
                    viewModel.getKasaListesi?.length.toStringIfNotNull ?? ""));
      }),
      actions: [
        IconButton(
          onPressed: () => viewModel.setSearchBar(),
          icon: Observer(
              builder: (_) => Icon(viewModel.searchBar
                  ? Icons.search_off_outlined
                  : Icons.search_outlined)),
        )
      ],
      bottom: AppBarPreferedSizedBottom(children: [
        AppBarButton(
            icon: Icons.filter_alt_outlined,
            onPressed: filtrele,
            child: const Text("Filtrele")),
        AppBarButton(
            icon: Icons.sort_by_alpha_outlined,
            onPressed: sirala,
            child: const Text("Sırala")),
        AppBarButton(
            icon: Icons.refresh_outlined,
            onPressed: () async {
              viewModel.setKasaListesi(null);
              await viewModel.getData();
            },
            child: const Text("Yenile")),
      ]),
    );
  }

  Widget body() => RefreshIndicator.adaptive(
        onRefresh: () async {
          viewModel.setKasaListesi(null);
          await viewModel.getData();
        },
        child: Observer(
            builder: (_) => viewModel.getKasaListesi == null
                ? const Center(child: CircularProgressIndicator.adaptive())
                : viewModel.getKasaListesi.ext.isNullOrEmpty
                    ? const Center(
                        child: Text("Kasa bulunamadı"),
                      )
                    : Observer(builder: (_) {
                        return ListView.builder(
                            padding: UIHelper.lowPadding,
                            itemCount: viewModel.getKasaListesi?.length ?? 0,
                            itemBuilder: (context, index) {
                              KasaListesiModel? item =
                                  viewModel.getKasaListesi?[index];
                              return KasaListesiCard(
                                  item: item,
                                  onSelected: (p0) async {
                                    if (p0 == true) {
                                      viewModel.setKasaListesi(null);
                                      await viewModel.getData();
                                    }
                                  });
                            });
                      })),
      );

  BottomAppBar bottomAppBar() {
    return BottomAppBar(
        child: Row(
      children: [
        Expanded(
            child: FooterButton(children: [
          const Text("Gelir"),
          Observer(builder: (_) {
            return Text(
              "${viewModel.getGelir.commaSeparatedWithDecimalDigits(OndalikEnum.tutar)} $mainCurrency",
              style: const TextStyle(color: Colors.green),
            );
          }),
        ])),
        const VerticalDivider(),
        Expanded(
            child: FooterButton(children: [
          const Text("Gider"),
          Observer(builder: (_) {
            return Text(
                "${viewModel.getGider.commaSeparatedWithDecimalDigits(OndalikEnum.tutar)} $mainCurrency",
                style: const TextStyle(color: Colors.red));
          }),
        ])),
        const VerticalDivider(),
        Expanded(
            child: FooterButton(children: [
          const Text("Bakiye"),
          Observer(builder: (_) {
            return Text(
                "${viewModel.bakiye.commaSeparatedWithDecimalDigits(OndalikEnum.tutar)} $mainCurrency",
                style: const TextStyle(color: Colors.grey));
          }),
        ]))
      ],
    ));
  }

  sirala() async {
    var result = await bottomSheetDialogManager.showBottomSheetDialog(context,
        title: "Sırala",
        children: List.generate(
            viewModel.siralaMap.length,
            (index) => BottomSheetModel(
                title: viewModel.siralaMap.keys.toList()[index],
                value: viewModel.siralaMap.values.toList()[index])));
    if (result != null) {
      viewModel.setSirala(result);
      viewModel.setKasaListesi(null);
      viewModel.getData();
    }
  }

  filtrele() async {
    await bottomSheetDialogManager.showBottomSheetDialog(context,
        title: "Filtrele",
        body: Column(
          children: [
            Observer(builder: (_) {
              return SlideControllerWidget(
                  childrenTitleList: viewModel.filtreleMap.keys.toList(),
                  childrenValueList: viewModel.filtreleMap.values.toList(),
                  filterOnChanged: (index) =>
                      viewModel.setFiltreGroupValue(index ?? 0),
                  groupValue: viewModel.filtreGroupValue);
            }),
            Row(
              children: [
                Expanded(
                    child: ElevatedButton(
                        style: ButtonStyle(
                            backgroundColor: MaterialStateProperty.all(
                                Colors.white.withOpacity(0.1))),
                        onPressed: () {
                          Get.back();
                          viewModel.setFiltreGroupValue(0);
                          viewModel.getData();
                        },
                        child: const Text("Sıfırla"))),
                const SizedBox(width: 10),
                Expanded(
                    child: ElevatedButton(
                        onPressed: () {
                          Get.back();
                          viewModel.setKasaListesi(null);
                          viewModel.getData();
                        },
                        child: const Text("Uygula")))
              ],
            ).paddingAll(UIHelper.lowSize)
          ],
        ).paddingAll(UIHelper.lowSize));
  }
}
