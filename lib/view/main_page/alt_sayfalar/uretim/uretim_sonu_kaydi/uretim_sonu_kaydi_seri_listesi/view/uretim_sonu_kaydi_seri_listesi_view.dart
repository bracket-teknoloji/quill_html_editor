import "package:collection/collection.dart";
import "package:flutter/material.dart";
import "package:flutter_mobx/flutter_mobx.dart";
import "package:get/get.dart";
import "package:picker/core/base/state/base_state.dart";
import "package:picker/core/base/view/stok_rehberi/model/stok_rehberi_request_model.dart";
import "package:picker/core/components/bottom_bar/bottom_bar.dart";
import "package:picker/core/components/button/elevated_buttons/footer_button.dart";
import "package:picker/core/components/layout/custom_layout_builder.dart";
import "package:picker/core/components/list_view/refreshable_list_view.dart";
import "package:picker/core/components/wrap/appbar_title.dart";
import "package:picker/core/constants/extensions/number_extensions.dart";
import "package:picker/core/constants/ondalik_utils.dart";
import "package:picker/view/main_page/alt_sayfalar/siparis/base_siparis_edit/model/base_siparis_edit_model.dart";
import "package:picker/view/main_page/alt_sayfalar/stok/base_stok_edit/model/stok_detay_model.dart";
import "package:picker/view/main_page/alt_sayfalar/uretim/uretim_sonu_kaydi/uretim_sonu_kaydi_seri_listesi/model/uretim_sonu_kaydi_recete_model.dart";
import "package:picker/view/main_page/alt_sayfalar/uretim/uretim_sonu_kaydi/uretim_sonu_kaydi_seri_listesi/view_model/uretim_sonu_kaydi_seri_listesi_view_model.dart";

final class UretimSonuKaydiSeriListesi extends StatefulWidget {
  final KalemModel model;
  const UretimSonuKaydiSeriListesi({super.key, required this.model});

  @override
  State<UretimSonuKaydiSeriListesi> createState() => _UretimSonuKaydiSeriListesiState();
}

final class _UretimSonuKaydiSeriListesiState extends BaseState<UretimSonuKaydiSeriListesi> {
  final UretimSonuKaydiSeriListesiViewModel viewModel = UretimSonuKaydiSeriListesiViewModel();

  @override
  void initState() {
    viewModel.setKalem(widget.model);

    WidgetsBinding.instance.addPostFrameCallback((_) async {
      await viewModel.getData();
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: appBar(),
        body: body(),
        bottomNavigationBar: bottomBar(),
      );

  AppBar appBar() => AppBar(
        title: const AppBarTitle(
          title: "Seri Girişi",
          subtitle: "Üretim Sonu Kaydı",
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.check_circle_outline_outlined),
            onPressed: () => Get.back(result: viewModel.predefinedList),
          ),
        ],
      );

  Observer body() => Observer(
        builder: (_) => RefreshableListView(
          onRefresh: viewModel.resetList,
          items: viewModel.predefinedList,
          itemBuilder: seriCard,
        ),
      );

  BottomBarWidget bottomBar() => BottomBarWidget(
        isScrolledDown: true,
        children: [
          FooterButton(
            children: [
              const Text("Miktar"),
              Observer(
                builder: (_) => Text(viewModel.predefinedList?.map((element) => element.miktar ?? 0).sum.commaSeparatedWithDecimalDigits(OndalikEnum.miktar) ?? "0"),
              ),
            ],
          ),
          FooterButton(
            children: [
              const Text("Kalan Miktar"),
              Observer(
                builder: (_) => Text(viewModel.predefinedList?.map((element) => element.miktar ?? 0).sum.commaSeparatedWithDecimalDigits(OndalikEnum.miktar) ?? "0  "),
              ),
            ],
          ),
        ],
      );

  Observer seriCard(UskReceteModel item) => Observer(
        builder: (_) => Card(
          color: item.miktar == item.seriList?.map((e) => e.miktar ?? 0).sum ? Colors.green : null,
          child: ListTile(
            onTap: () async {
              final result = await Get.toNamed("/seriListesi", arguments: KalemModel.fromUSKReceteModel(item));
              if (result is List<SeriList>) {
                viewModel.updateCard(item.copyWith(seriList: result));
              }
            },
            onLongPress: () async {
              dialogManager.showStokGridViewDialog(await networkManager.getStokModel(StokRehberiRequestModel(stokKodu: item.stokKodu)));
            },
            title: Text(item.stokAdi ?? ""),
            subtitle: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CustomLayoutBuilder.divideInHalf(
                  children: [
                    Text("Stok Kodu: ${item.stokKodu}"),
                    Text("Miktar: ${item.miktar.commaSeparatedWithDecimalDigits(OndalikEnum.miktar)}"),
                    Text("Seri Miktarı: ${item.seriList?.map((e) => e.miktar ?? 0).sum.commaSeparatedWithDecimalDigits(OndalikEnum.miktar) ?? 0}"),
                    const Text("Giriş/Çıkış: ${"G"}"),
                  ],
                ),
                Text("Seriler(${item.seriList?.length ?? 0}): ${item.seriList?.map((e) => e.seri1).join(", ") ?? ""}"),
              ],
            ),
          ),
        ),
      );
}
