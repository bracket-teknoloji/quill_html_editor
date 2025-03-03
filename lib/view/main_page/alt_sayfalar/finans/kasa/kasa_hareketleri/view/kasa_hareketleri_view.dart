import "package:flutter/material.dart";
import "package:flutter_mobx/flutter_mobx.dart";
import "package:get/get.dart";
import "package:picker/core/components/layout/custom_layout_builder.dart";

import "../../../../../../../core/base/state/base_state.dart";
import "../../../../../../../core/components/badge/colorful_badge.dart";
import "../../../../../../../core/components/bottom_bar/bottom_bar.dart";
import "../../../../../../../core/components/button/elevated_buttons/footer_button.dart";
import "../../../../../../../core/components/dialog/bottom_sheet/model/bottom_sheet_model.dart";
import "../../../../../../../core/components/list_view/refreshable_list_view.dart";
import "../../../../../../../core/components/wrap/appbar_title.dart";
import "../../../../../../../core/constants/color_palette.dart";
import "../../../../../../../core/constants/enum/badge_color_enum.dart";
import "../../../../../../../core/constants/extensions/date_time_extensions.dart";
import "../../../../../../../core/constants/extensions/number_extensions.dart";
import "../../../../../../../core/constants/ondalik_utils.dart";
import "../../../../../../../core/constants/ui_helper/ui_helper.dart";
import "../../kasa_islemleri/model/kasa_islemleri_model.dart";
import "../../kasa_listesi/model/kasa_listesi_model.dart";
import "../view_model/kasa_hareketleri_view_model.dart";

final class KasaHareketleriView extends StatefulWidget {
  const KasaHareketleriView({super.key, this.model});
  final KasaListesiModel? model;

  @override
  State<KasaHareketleriView> createState() => _KasaHareketleriViewState();
}

final class _KasaHareketleriViewState extends BaseState<KasaHareketleriView> {
  final KasaHareketleriViewModel viewModel = KasaHareketleriViewModel();
  late final ScrollController _scrollController;
  @override
  void initState() {
    _scrollController = ScrollController();
    viewModel
      ..setDovizAdi(widget.model?.dovizli == "E" ? widget.model?.dovizAdi : mainCurrency)
      ..setKasaKodu(widget.model?.kasaKodu);

    WidgetsBinding.instance.addPostFrameCallback((timeStamp) async {
      _scrollController.addListener(() async => viewModel.changeScrollStatus(_scrollController.position));
      await viewModel.getData();
    });
    super.initState();
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) => BaseScaffold(
    // resizeToAvoidBottomInset: true,
    // extendBody: true,
    // extendBodyBehindAppBar: false,
    appBar: appBar(),
    bottomNavigationBar: bottomBar(),
    body: body(),
  );

  AppBar appBar() => AppBar(
    title: Observer(
      builder:
          (_) => AppBarTitle(
            title: "Kasa Hareketleri (${viewModel.observableList?.length ?? 0})",
            subtitle: widget.model?.kasaKodu,
          ),
    ),
  );

  Widget body() => Observer(
    builder:
        (_) => RefreshableListView.pageable(
          scrollController: _scrollController,
          onRefresh: viewModel.getData,
          dahaVarMi: viewModel.dahaVarMi,
          items: viewModel.observableList,
          itemBuilder: kasaHareketleriCard,
        ),
  );

  Card kasaHareketleriCard(KasaIslemleriModel? item) => Card(
    child: ListTile(
      onTap: () async {
        await bottomSheetDialogManager.showBottomSheetDialog(
          context,
          title: item?.tipAciklama ?? "",
          children: [
            BottomSheetModel(
              title: loc.generalStrings.delete,
              iconWidget: Icons.delete_outline_outlined,
              onTap: () {
                Get.back();
                dialogManager.showAreYouSureDialog(() async {
                  final result = await viewModel.deleteData(item?.inckeyno);
                  if (result.isSuccess) {
                    dialogManager.showSuccessSnackBar("${(result.message) ?? "Başarılı"} ${item?.inckeyno}");
                    viewModel.observableList?.remove(item);
                  } else {
                    dialogManager.showErrorSnackBar(result.message ?? "Başarısız");
                  }
                });
              },
            ),
          ],
        );
      },
      title: Column(
        children: [
          Row(
            children: [
              Text("${item?.tarih.toDateString ?? ""} "),
              if (item?.tipAciklama != null)
                ColorfulBadge(label: Text(item?.tipAciklama ?? ""), badgeColorEnum: BadgeColorEnum.tipAciklama),
            ],
          ),
        ],
      ),
      subtitle: CustomLayoutBuilder.divideInHalf(
        children: [
          if (item?.kasaKodu != null)
            Text("Kasa: ${item?.kasaKodu ?? ""}", style: const TextStyle(color: ColorPalette.slateGray)),
          if (item?.belgeNo != null)
            Text("Belge No: ${item?.belgeNo ?? ""}", style: const TextStyle(color: ColorPalette.slateGray)),
          if (item?.cariKodu != null) Text("Hesap Kodu: ${item?.cariKodu ?? ""}"),
          if (item?.cariAdi != null) Text("Hesap Adı: ${item?.cariAdi ?? ""}"),
          if (item?.projeKodu != null) Text("Proje: ${item?.projeKodu ?? ""}"),
          if (item?.plasiyerKodu != null) Text("Plasiyer: ${item?.plasiyerKodu ?? ""}"),
          if (item?.aciklama != null) Text("Açıklama: ${item?.aciklama ?? ""}"),
        ],
      ),
      trailing: Text(
        "${item?.tutar?.commaSeparatedWithDecimalDigits(OndalikEnum.tutar) ?? ""} ${viewModel.dovizAdi}",
        style: TextStyle(color: item?.gc == "G" ? ColorPalette.mantis : ColorPalette.persianRed),
      ),
    ),
  );

  Observer bottomBar() => Observer(
    builder:
        (_) => BottomBarWidget(
          isScrolledDown: viewModel.isScrollDown,
          children: [
            FooterButton(
              children: [
                const Text("Gelir"),
                Observer(
                  builder: (_) {
                    if (widget.model?.dovizli == "E") {
                      return Text(
                        "${((viewModel.paramData?["TOPLAM_GELIR_DOVIZ"] as double? ?? 0) + (widget.model?.dovizDevirTutari ?? 0)).commaSeparatedWithDecimalDigits(OndalikEnum.tutar)} ${viewModel.dovizAdi}",
                        style: const TextStyle(color: ColorPalette.mantis),
                      );
                    } else {
                      return Text(
                        "${((viewModel.paramData?["TOPLAM_GELIR"] as double? ?? 0) + (widget.model?.devirTutari ?? 0)).commaSeparatedWithDecimalDigits(OndalikEnum.tutar)} $mainCurrency",
                        style: const TextStyle(color: ColorPalette.mantis),
                      );
                    }
                  },
                ),
              ],
            ),
            FooterButton(
              children: [
                const Text("Gider"),
                Observer(
                  builder: (_) {
                    if (widget.model?.dovizli == "E") {
                      return Text(
                        "${(viewModel.paramData?["TOPLAM_GIDER_DOVIZ"] as double?).commaSeparatedWithDecimalDigits(OndalikEnum.tutar)} ${viewModel.dovizAdi}",
                        style: const TextStyle(color: ColorPalette.persianRed),
                      );
                    } else {
                      return Text(
                        "${(viewModel.paramData?["TOPLAM_GIDER"] as double?).commaSeparatedWithDecimalDigits(OndalikEnum.tutar)} $mainCurrency",
                        style: const TextStyle(color: ColorPalette.persianRed),
                      );
                    }
                  },
                ),
              ],
            ),
            FooterButton(
              children: [
                const Text("Bakiye"),
                Observer(
                  builder:
                      (_) => Text(
                        "${(widget.model?.dovizli == "E" ? widget.model?.devirliDovizBakiye : widget.model?.devirliBakiye).commaSeparatedWithDecimalDigits(OndalikEnum.tutar)} ${viewModel.dovizAdi}",
                        style: TextStyle(
                          color: UIHelper.getColorWithValue(
                            (widget.model?.dovizli == "E"
                                    ? widget.model?.devirliDovizBakiye
                                    : widget.model?.devirliBakiye) ??
                                0,
                          ),
                        ),
                      ),
                ),
              ],
            ),
          ],
        ),
  );
}
