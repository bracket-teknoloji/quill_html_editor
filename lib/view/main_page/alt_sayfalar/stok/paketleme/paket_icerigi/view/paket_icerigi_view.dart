import "package:flutter/material.dart";
import "package:flutter_mobx/flutter_mobx.dart";
import "package:picker/core/base/state/base_state.dart";
import "package:picker/core/components/bottom_bar/bottom_bar.dart";
import "package:picker/core/components/button/elevated_buttons/footer_button.dart";
import "package:picker/core/components/card/paket_icerigi_card.dart";
import "package:picker/core/components/list_view/refreshable_list_view.dart";
import "package:picker/core/components/wrap/appbar_title.dart";
import "package:picker/core/constants/extensions/number_extensions.dart";
import "package:picker/core/constants/ondalik_utils.dart";
import "package:picker/view/main_page/alt_sayfalar/stok/paketleme/paket_icerigi/model/paket_icerigi_model.dart";
import "package:picker/view/main_page/alt_sayfalar/stok/paketleme/paket_icerigi/view_model/paket_icerigi_view_model.dart";
import "package:picker/view/main_page/alt_sayfalar/stok/paketleme/paketleme_listesi/model/paketleme_listesi_model.dart";

final class PaketIcerigiView extends StatefulWidget {
  final PaketlemeListesiModel model;
  const PaketIcerigiView({super.key, required this.model});

  @override
  State<PaketIcerigiView> createState() => _PaketIcerigiViewState();
}

final class _PaketIcerigiViewState extends BaseState<PaketIcerigiView> {
  final PaketIcerigiViewModel viewModel = PaketIcerigiViewModel();

  @override
  void initState() {
    viewModel.setPaketID(widget.model.id!);
    WidgetsBinding.instance.addPostFrameCallback(
      (timeStamp) async {
        await viewModel.getData();
      },
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: appBar(),
        bottomNavigationBar: bottomBar(),
        body: body(),
      );

  AppBar appBar() => AppBar(
        title: Observer(
          builder: (_) => AppBarTitle(
            title: "Paket İçeriği (${viewModel.observableList?.length ?? 0})",
            subtitle: widget.model.kodu,
          ),
        ),
      );

  BottomBarWidget bottomBar() => BottomBarWidget(
        isScrolledDown: true,
        children: [
          FooterButton(
            children: [
              const Text("Paket Miktarı"),
              Observer(
                builder: (_) => Text(viewModel.toplamPaketMiktari.commaSeparatedWithDecimalDigits(OndalikEnum.miktar)),
              ),
            ],
          ),
        ],
      );

  Widget body() => Observer(
        builder: (_) => RefreshableListView(onRefresh: viewModel.getData, items: viewModel.observableList, itemBuilder: paketIcerigiCard),
      );

  PaketIcerigiCard paketIcerigiCard(PaketIcerigiModel item) => PaketIcerigiCard(
        item: item,
        kilitliMi: widget.model.kilit == "E",
        onDeleted: () {
          dialogManager.showAreYouSureDialog(() async {
            await viewModel.getData();
          });
        },
      );
}
