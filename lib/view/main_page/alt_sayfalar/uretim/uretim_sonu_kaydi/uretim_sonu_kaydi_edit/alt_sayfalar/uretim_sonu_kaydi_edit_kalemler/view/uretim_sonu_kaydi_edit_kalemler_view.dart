import "package:flutter/material.dart";
import "package:flutter_mobx/flutter_mobx.dart";
import "package:get/get.dart";
import "package:picker/core/base/model/base_edit_model.dart";
import "package:picker/core/base/state/base_state.dart";
import "package:picker/core/base/view/stok_rehberi/model/stok_rehberi_request_model.dart";
import "package:picker/core/components/bottom_bar/bottom_bar.dart";
import "package:picker/core/components/button/elevated_buttons/footer_button.dart";
import "package:picker/core/components/dialog/bottom_sheet/model/bottom_sheet_model.dart";
import "package:picker/core/components/floating_action_button/custom_floating_action_button.dart";
import "package:picker/core/components/layout/custom_layout_builder.dart";
import "package:picker/core/components/list_view/refreshable_list_view.dart";
import "package:picker/core/constants/enum/base_edit_enum.dart";
import "package:picker/core/constants/extensions/number_extensions.dart";
import "package:picker/core/constants/extensions/widget_extensions.dart";
import "package:picker/core/constants/ondalik_utils.dart";
import "package:picker/core/constants/ui_helper/ui_helper.dart";
import "package:picker/view/main_page/alt_sayfalar/siparis/base_siparis_edit/model/base_siparis_edit_model.dart";
import "package:picker/view/main_page/alt_sayfalar/uretim/uretim_sonu_kaydi/uretim_sonu_kaydi_edit/alt_sayfalar/uretim_sonu_kaydi_edit_kalemler/view_model/uretim_sonu_kaydi_edit_kalemler_view_model.dart";
import "package:picker/view/main_page/alt_sayfalar/uretim/uretim_sonu_kaydi/uretim_sonu_kaydi_edit/model/uretim_sonu_kaydi_edit_model.dart";

final class UretimSonuKaydiEditKalemlerView extends StatefulWidget {
  final BaseEditModel<KalemModel> model;
  final UretimSonuKaydiEditModel requestModel;
  final List<KalemModel>? kalemList;
  final Function(List<KalemModel>?) onKalemListChange;
  const UretimSonuKaydiEditKalemlerView({super.key, required this.kalemList, required this.model, required this.requestModel, required this.onKalemListChange});

  @override
  State<UretimSonuKaydiEditKalemlerView> createState() => _UretimSonuKaydiEditKalemlerViewState();
}

final class _UretimSonuKaydiEditKalemlerViewState extends BaseState<UretimSonuKaydiEditKalemlerView> {
  final UretimSonuKaydiEditKalemlerViewModel viewModel = UretimSonuKaydiEditKalemlerViewModel();

  @override
  void initState() {
    viewModel.setObservableList(widget.kalemList);
    super.initState();
  }

  @override
  Widget build(BuildContext context) => BaseScaffold(
        floatingActionButton: fab(),
        body: body(),
        bottomNavigationBar: bottomBar(),
      );

  Widget fab() => CustomFloatingActionButton(
        isScrolledDown: true,
        onPressed: () async {
          final result = await Get.toNamed("mainPage/uretimSonuKaydiKalemEdit", arguments: widget.requestModel);
          if (result is KalemModel) {
            viewModel.addItem(result.copyWith(cikisdepoKodu: widget.requestModel.cikisDepo, girisdepoKodu: widget.requestModel.girisDepo));
            widget.onKalemListChange.call(viewModel.observableList?.toList());
          }
        },
      ).yetkiVarMi(!widget.model.baseEditEnum.goruntuleMi);

  Column body() => Column(
        children: [
          // CustomTextField(onTap: () {}),
          Expanded(
            child: Observer(
              builder: (_) => RefreshableListView<KalemModel>(
                onRefresh: () async {},
                items: viewModel.observableList,
                itemBuilder: kalemCard,
              ),
            ),
          ),
        ],
      );

  Card kalemCard(KalemModel item) => Card(
        child: ListTile(
          onTap: () async {
            bottomSheetDialogManager.showBottomSheetDialog(
              context,
              title: item.stokAdi ?? "",
              children: [
                BottomSheetModel(
                  title: "Stok İşlemleri",
                  iconWidget: Icons.list_alt_outlined,
                  onTap: () async {
                    Get.back();
                    dialogManager.showStokGridViewDialog(
                      await networkManager.getStokModel(StokRehberiRequestModel(stokKodu: item.stokKodu)),
                    );
                  },
                ),
              ],
            );
          },
          title: Text(item.stokAdi ?? ""),
          subtitle: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("${item.cikisdepoKodu} (${item.cikisDepoAdi}) => ${item.girisdepoKodu} (${item.girisDepoAdi})").yetkiVarMi(widget.model.baseEditEnum.goruntuleMi),
              Text("İş Emri: ${item.isemriNo ?? ""}").yetkiVarMi(item.isemriNo != null),
              CustomLayoutBuilder.divideInHalf(
                children: [
                  Text("Kodu: ${item.stokKodu}"),
                  Text("Miktar: ${item.miktar.commaSeparatedWithDecimalDigits(OndalikEnum.miktar)}"),
                  Text("Hurda/Fire Mik: ${item.miktar2.commaSeparatedWithDecimalDigits(OndalikEnum.miktar)}"),
                  Text("İşlendi: ${item.stoklaraIslendi == "E" ? "Evet" : "Hayır"}"),
                  Text("Maliyet Fiyatı: ${item.maliyetFiyati.commaSeparatedWithDecimalDigits(OndalikEnum.fiyat)}"),
                  Text("BarkodSay: ${item.barkod ?? ""}"),
                ],
              ),
              Text(item.aciklama ?? "").paddingOnly(top: UIHelper.lowSize).yetkiVarMi(item.aciklama != null),
            ],
          ),
        ),
      );

  BottomBarWidget bottomBar() => BottomBarWidget(
        isScrolledDown: true,
        children: [
          FooterButton(
            children: [
              const Text("Toplam Miktar"),
              Observer(
                builder: (_) => Text(
                  viewModel.toplamMiktar.commaSeparatedWithDecimalDigits(OndalikEnum.miktar),
                ),
              ),
            ],
          ),
          FooterButton(
            children: [
              const Text("Maliyet Tutarı"),
              Observer(
                builder: (_) => Text(
                  viewModel.toplamMaliyetTutari.commaSeparatedWithDecimalDigits(OndalikEnum.tutar),
                ),
              ),
            ],
          ),
        ],
      );
}
