import "package:flutter/material.dart";
import "package:flutter_mobx/flutter_mobx.dart";
import "package:get/get.dart";
import "package:picker/core/base/state/base_state.dart";
import "package:picker/core/base/view/stok_rehberi/model/stok_rehberi_request_model.dart";
import "package:picker/core/components/dialog/bottom_sheet/model/bottom_sheet_model.dart";
import "package:picker/core/components/layout/custom_layout_builder.dart";
import "package:picker/core/components/list_view/refreshable_list_view.dart";
import "package:picker/core/constants/extensions/number_extensions.dart";
import "package:picker/core/constants/ondalik_utils.dart";
import "package:picker/core/constants/ui_helper/ui_helper.dart";
import "package:picker/view/main_page/alt_sayfalar/siparis/base_siparis_edit/model/base_siparis_edit_model.dart";
import "package:picker/view/main_page/alt_sayfalar/uretim/uretim_sonu_kaydi/uretim_sonu_kaydi_edit/alt_sayfalar/uretim_sonu_kaydi_edit_kalemler/view_model/uretim_sonu_kaydi_edit_kalemler_view_model.dart";

final class UretimSonuKaydiEditKalemlerView extends StatefulWidget {
  final List<KalemModel>? kalemList;
  const UretimSonuKaydiEditKalemlerView({super.key, this.kalemList});

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
  Widget build(BuildContext context) => body();

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
              Text("${item.cikisdepoKodu} (${item.cikisDepoAdi}) => ${item.girisdepoKodu} (${item.girisDepoAdi})"),
              Text("İş Emri: ${item.isemriNo ?? ""}"),
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
              Text(item.aciklama ?? "").paddingOnly(top: UIHelper.lowSize),
            ],
          ),
        ),
      );
}
