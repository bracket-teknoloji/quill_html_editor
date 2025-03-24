import "package:flutter/material.dart";
import "package:flutter_mobx/flutter_mobx.dart";

import "../../../../../../../core/base/state/base_state.dart";
import "../../../../../../../core/components/bottom_bar/bottom_bar.dart";
import "../../../../../../../core/components/button/elevated_buttons/footer_button.dart";
import "../../../../../../../core/components/card/paket_icerigi_card.dart";
import "../../../../../../../core/components/list_view/refreshable_list_view.dart";
import "../../../../../../../core/components/wrap/appbar_title.dart";
import "../../../../../../../core/constants/extensions/number_extensions.dart";
import "../../../../../../../core/constants/ondalik_utils.dart";
import "../../paketleme_listesi/model/paketleme_listesi_model.dart";
import "../model/paket_icerigi_model.dart";
import "../view_model/paket_icerigi_view_model.dart";

final class PaketIcerigiView extends StatefulWidget {
  const PaketIcerigiView({required this.model, super.key});
  final PaketlemeListesiModel model;

  @override
  State<PaketIcerigiView> createState() => _PaketIcerigiViewState();
}

final class _PaketIcerigiViewState extends BaseState<PaketIcerigiView> {
  final PaketIcerigiViewModel viewModel = PaketIcerigiViewModel();

  @override
  void initState() {
    viewModel.setPaketID(widget.model.id!);
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) async {
      await viewModel.getData();
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) => BaseScaffold(appBar: appBar(), bottomNavigationBar: bottomBar(), body: body());

  AppBar appBar() => AppBar(
    title: Observer(
      builder:
          (_) => AppBarTitle(
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
    builder:
        (_) => RefreshableListView(
          onRefresh: viewModel.getData,
          items: viewModel.observableList,
          itemBuilder: paketIcerigiCard,
        ),
  );

  PaketIcerigiCard paketIcerigiCard(PaketIcerigiModel item) => PaketIcerigiCard(
    item: item,
    kilitliMi: widget.model.kilit == "E",
    onDeleted: () {
      dialogManager.showAreYouSureDialog(
        onYes: () async {
          await viewModel.getData();
        },
      );
    },
  );
}
