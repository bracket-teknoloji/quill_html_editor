import "package:flutter/material.dart";
import "package:get/get.dart";

import "../../../view/main_page/alt_sayfalar/stok/paketleme/paket_icerigi/model/paket_icerigi_model.dart";
import "../../../view/main_page/alt_sayfalar/stok/stok_liste/model/stok_listesi_model.dart";
import "../../base/state/base_state.dart";
import "../../base/view/stok_rehberi/model/stok_rehberi_request_model.dart";
import "../../constants/enum/badge_color_enum.dart";
import "../../constants/extensions/list_extensions.dart";
import "../../constants/extensions/model_extensions.dart";
import "../../constants/extensions/number_extensions.dart";
import "../../constants/extensions/widget_extensions.dart";
import "../../constants/ondalik_utils.dart";
import "../badge/colorful_badge.dart";
import "../dialog/bottom_sheet/model/bottom_sheet_model.dart";
import "../layout/custom_layout_builder.dart";

final class PaketIcerigiCard extends StatefulWidget {
  final PaketIcerigiModel item;
  final bool kilitliMi;
  final void Function() onDeleted;
  const PaketIcerigiCard({super.key, required this.item, required this.onDeleted, required this.kilitliMi});

  @override
  State<PaketIcerigiCard> createState() => _PaketIcerigiCardState();
}

final class _PaketIcerigiCardState extends BaseState<PaketIcerigiCard> {
  PaketIcerigiModel get item => widget.item;

  @override
  Widget build(BuildContext context) => Card(
        child: ListTile(
          onTap: onTap,
          title: Text(item.stokAdi ?? ""),
          subtitle: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  const ColorfulBadge(label: Text("Serili"), badgeColorEnum: BadgeColorEnum.seri).yetkiVarMi(item.cikistaSeri == "E"),
                ],
              ),
              CustomLayoutBuilder(
                splitCount: 2,
                children: [
                  Text("Stok Kodu: ${item.stokKodu ?? ""}"),
                  Text("Miktar: ${item.miktar.commaSeparatedWithDecimalDigits(OndalikEnum.miktar)}"),
                  Text("Seriler: ${item.seriList?.length ?? ""} adet seri").yetkiVarMi(item.cikistaSeri == "E"),
                ],
              ),
              Text(item.seriList?.map((e) => e.seriNo).join(", ") ?? ""),
            ],
          ),
        ),
      );

  void onTap() => bottomSheetDialogManager.showBottomSheetDialog(
        context,
        title: item.stokKodu ?? "",
        children: [
          BottomSheetModel(
            title: loc.generalStrings.delete,
            iconWidget: Icons.delete_outline_outlined,
            onTap: () async {
              widget.onDeleted();
            },
          ).yetkiKontrol(yetkiController.stokPaketlemeSil && !widget.kilitliMi),
          BottomSheetModel(
            title: "Seri Listesi",
            iconWidget: Icons.dynamic_form_outlined,
            onTap: () async {
              Get.back();
              Get.toNamed("/seriHareketleri", arguments: await getStok);
            },
          ).yetkiKontrol(yetkiController.seriIslemleri && yetkiController.seriUygulamasiAcikMi),
          BottomSheetModel(
            title: "Stok İşlemleri",
            iconWidget: Icons.list_alt_outlined,
            onTap: () async {
              Get.back();
              dialogManager.showStokGridViewDialog(await getStok);
            },
          ).yetkiKontrol(yetkiController.stokListesi),
        ].nullCheckWithGeneric,
      );

  Future<StokListesiModel?> get getStok async => await networkManager.getStokModel(StokRehberiRequestModel(stokKodu: item.stokKodu));
}
