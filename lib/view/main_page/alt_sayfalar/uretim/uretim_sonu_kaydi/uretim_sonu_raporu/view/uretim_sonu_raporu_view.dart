import "package:flutter/material.dart";
import "package:flutter_mobx/flutter_mobx.dart";
import "package:get/get.dart";

import "../../../../../../../core/base/state/base_state.dart";
import "../../../../../../../core/base/view/stok_rehberi/model/stok_rehberi_request_model.dart";
import "../../../../../../../core/components/dialog/bottom_sheet/model/bottom_sheet_model.dart";
import "../../../../../../../core/components/layout/custom_layout_builder.dart";
import "../../../../../../../core/components/list_view/refreshable_list_view.dart";
import "../../../../../../../core/components/wrap/appbar_title.dart";
import "../../../../../../../core/constants/color_palette.dart";
import "../../../../../../../core/constants/extensions/number_extensions.dart";
import "../../../../../../../core/constants/extensions/widget_extensions.dart";
import "../../../../../../../core/constants/ondalik_utils.dart";
import "../../../../siparis/base_siparis_edit/model/base_siparis_edit_model.dart";
import "../view_model/uretim_sonu_raporu_view_model.dart";

final class UretimSonuRaporuView extends StatefulWidget {
  final KalemModel model;
  const UretimSonuRaporuView({super.key, required this.model});

  @override
  State<UretimSonuRaporuView> createState() => _UretimSonuRaporuViewState();
}

final class _UretimSonuRaporuViewState extends BaseState<UretimSonuRaporuView> {
  final UretimSonuRaporuViewModel viewModel = UretimSonuRaporuViewModel();

  @override
  void initState() {
    viewModel.setBelgeNo(widget.model.belgeNo);
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) async {
      await viewModel.getData();
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) => BaseScaffold(
        appBar: AppBar(
          title: Observer(
            builder: (_) => AppBarTitle(
              title: "Üretim Sonu Raporu (${viewModel.observableList?.length ?? 0})",
              subtitle: widget.model.belgeNo,
            ),
          ),
        ),
        body: Observer(
          builder: (_) => RefreshableListView(
            onRefresh: viewModel.getData,
            items: viewModel.observableList,
            itemBuilder: (item) => Card(
              child: ListTile(
                onTap: () async {
                  bottomSheetDialogManager.showBottomSheetDialog(
                    context,
                    title: item.stokAdi ?? "",
                    children: [
                      BottomSheetModel(
                        title: "Stok İşlemleri",
                        iconWidget: Icons.list_alt,
                        onTap: () async {
                          Get.back();
                          dialogManager.showStokGridViewDialog(await networkManager.getStokModel(StokRehberiRequestModel(stokKodu: item.stokKodu)));
                        },
                      ),
                    ],
                  );
                },
                title: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(child: Text(item.stokAdi ?? "")),
                    Icon(item.cikisIslemi == true ? Icons.arrow_forward : Icons.arrow_back, color: item.cikisIslemi == true ? ColorPalette.persianRed : ColorPalette.mantis),
                  ],
                ),
                subtitle: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    CustomLayoutBuilder(
                      splitCount: 2,
                      children: [
                        Text("Stok Kodu: ${item.stokKodu}").yetkiVarMi(item.stokKodu != null),
                        Text("Giriş/Çıkış: ${item.cikisIslemi == true ? "Çıkış" : "Giriş"}").yetkiVarMi(item.cikisIslemi != null),
                        Text("Miktar: ${item.stharGcmik.commaSeparatedWithDecimalDigits(OndalikEnum.miktar)}").yetkiVarMi(item.stharGcmik != null),
                        Text("Ek Alan 1: ${item.ekalan1}").yetkiVarMi(item.ekalan1 != null),
                        Text("Ek Alan 2: ${item.ekalan2}").yetkiVarMi(item.ekalan2 != null),
                        Text("Açıklama: ${item.aciklama}").yetkiVarMi(item.aciklama != null),
                      ],
                    ),
                    Text("Depo: ${item.depoKodu}"),
                    Text("Seri Durum: ${item.seriDurumAdi}"),
                  ],
                ),
              ),
            ),
          ),
        ),
      );
}
