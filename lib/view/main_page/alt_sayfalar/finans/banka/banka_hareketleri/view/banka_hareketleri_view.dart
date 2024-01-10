import "package:flutter/material.dart";
import "package:flutter_mobx/flutter_mobx.dart";
import "package:get/get.dart";

import "../../../../../../../core/base/state/base_state.dart";
import "../../../../../../../core/components/bottom_bar/bottom_bar.dart";
import "../../../../../../../core/components/button/elevated_buttons/footer_button.dart";
import "../../../../../../../core/components/shimmer/list_view_shimmer.dart";
import "../../../../../../../core/components/wrap/appbar_title.dart";
import "../../../../../../../core/constants/extensions/date_time_extensions.dart";
import "../../../../../../../core/constants/extensions/number_extensions.dart";
import "../../../../../../../core/constants/extensions/widget_extensions.dart";
import "../../../../../../../core/constants/ondalik_utils.dart";
import "../../../../../../../core/constants/ui_helper/ui_helper.dart";
import "../../banka_listesi/model/banka_listesi_model.dart";
import "../model/banka_hareketleri_model.dart";
import "../view_model/banka_hareketleri_view_model.dart";

class BankaHareketleriView extends StatefulWidget {
  final BankaListesiModel model;
  const BankaHareketleriView({super.key, required this.model});

  @override
  State<BankaHareketleriView> createState() => _BankaHareketleriViewState();
}

class _BankaHareketleriViewState extends BaseState<BankaHareketleriView> {
  BankaHareketleriViewModel viewModel = BankaHareketleriViewModel();

  @override
  void initState() {
    viewModel.setHesapKodu(widget.model.hesapKodu);
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) async {
      await viewModel.getData();
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: appBar,
        body: body,
        bottomNavigationBar: bottomBar,
      );

  AppBar get appBar => AppBar(
        title: Observer(
          builder: (_) => AppBarTitle(
            title: "Banka Hareketleri (${viewModel.bankaHareketleriListesi?.length ?? 0})",
            subtitle: widget.model.hesapKodu,
          ),
        ),
      );

  RefreshIndicator get body => RefreshIndicator.adaptive(
        onRefresh: viewModel.getData,
        child: Observer(
          builder: (_) {
            if (viewModel.bankaHareketleriListesi == null) {
              return const ListViewShimmer().paddingAll(UIHelper.lowSize);
            } else if ((viewModel.bankaHareketleriListesi?.length ?? 0) < 1) {
              return const Center(child: Text("Veri bulunamadı", textAlign: TextAlign.center));
            }
            return ListView.builder(
              itemCount: viewModel.bankaHareketleriListesi?.length ?? 0,
              itemBuilder: (context, index) {
                final BankaHareketleriModel model = viewModel.bankaHareketleriListesi![index];
                return Card(
                  child: ListTile(
                    title: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(model.tarih.toDateString),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            Text(
                              "${model.tutar.commaSeparatedWithDecimalDigits(OndalikEnum.tutar)} $mainCurrency",
                              style: TextStyle(color: UIHelper.getColorWithValue(model.ba == "B" ? 1 : -1)),
                            ),
                            Text("${model.dovizTutari.commaSeparatedWithDecimalDigits(OndalikEnum.dovizTutari)} ${model.dovizAdi ?? mainCurrency}").yetkiVarMi(model.dovizAdi != null),
                          ],
                        ),
                      ],
                    ),
                    subtitle: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(model.hareketAciklama ?? "", style: TextStyle(color: UIHelper.primaryColor)),
                        Text(model.belgeno ?? "").yetkiVarMi(model.belgeno != null),
                        Text(model.aciklama ?? "", style: const TextStyle(fontStyle: FontStyle.italic)),
                      ].where((element) => element is! SizedBox).toList(),
                    ),
                  ),
                );
              },
            ).paddingAll(UIHelper.lowSize);
          },
        ),
      );

  BottomBarWidget get bottomBar => BottomBarWidget(
        isScrolledDown: true,
        children: [
          FooterButton(
            children: [
              const Text("Gelir"),
              Observer(
                builder: (_) => Text(
                  "${(widget.model.dovizAdi != null ? viewModel.dovizGelenTutar : viewModel.gelenTutar).commaSeparatedWithDecimalDigits(OndalikEnum.tutar)} ${widget.model.dovizAdi ?? mainCurrency}",
                ),
              ),
            ],
          ),
          FooterButton(
            children: [
              const Text("Gider"),
              Observer(
                builder: (_) => Text(
                  "${(widget.model.dovizAdi != null ? viewModel.dovizGidenTutar : viewModel.gidenTutar).commaSeparatedWithDecimalDigits(OndalikEnum.tutar)} ${widget.model.dovizAdi ?? mainCurrency}",
                ),
              ),
            ],
          ),
          FooterButton(
            children: [
              const Text("Bakiye"),
              Observer(
                builder: (_) => Text(
                  "${(widget.model.dovizAdi != null ? viewModel.dovizBakiye : viewModel.bakiye).commaSeparatedWithDecimalDigits(OndalikEnum.tutar)} ${widget.model.dovizAdi ?? mainCurrency}",
                  style: TextStyle(color: UIHelper.getColorWithValue(viewModel.bakiye)),
                ),
              ),
            ],
          ),
        ],
      );
}
