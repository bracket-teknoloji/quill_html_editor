import "package:flutter/material.dart";
import "package:get/get.dart";

import "../../../view/main_page/alt_sayfalar/cari/cari_aktivite_kayitlari/model/cari_aktivite_listesi_model.dart";
import "../../base/model/base_edit_model.dart";
import "../../base/state/base_state.dart";
import "../../constants/enum/base_edit_enum.dart";
import "../../constants/extensions/date_time_extensions.dart";
import "../dialog/bottom_sheet/model/bottom_sheet_model.dart";

class CariAktiviteDetayCard extends StatefulWidget {

  const CariAktiviteDetayCard({super.key, required this.model, required this.baseEditEnum, required this.onAktiviteSil, required this.onAktiviteDuzenle});
  final CariAktiviteListesiModel model;
  final BaseEditEnum baseEditEnum;
  final void Function() onAktiviteSil;
  final void Function(CariAktiviteListesiModel) onAktiviteDuzenle;

  @override
  State<CariAktiviteDetayCard> createState() => _CariAktiviteDetayCardState();
}

class _CariAktiviteDetayCardState extends BaseState<CariAktiviteDetayCard> {
  @override
  Widget build(BuildContext context) => Card(
        child: ListTile(
          title: Text(widget.model.tarih?.toDateTimeString() ?? ""),
          subtitle: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("Aktivite: ${widget.model.aktiviteAdi}"),
              Text("Kaydeden: ${widget.model.kayityapankul}"),
              Text(widget.model.aciklama ?? ""),
            ],
          ),
          enabled: !widget.baseEditEnum.goruntuleMi,
          onTap: () async {
            await bottomSheetDialogManager.showBottomSheetDialog(
              context,
              title: widget.model.aktiviteAdi ?? "",
              children: [
                BottomSheetModel(
                  title: loc.generalStrings.edit,
                  iconWidget: Icons.edit_outlined,
                  onTap: () async {
                    Get.back();
                    final result = await Get.toNamed("/mainPage/cariAktiviteDetayiEdit", arguments: BaseEditModel(model: widget.model, baseEditEnum: widget.baseEditEnum));
                    if (result is CariAktiviteListesiModel) {
                      widget.onAktiviteDuzenle.call(result);
                      // SingletonModels.setCariAktiviteListesi = SingletonModels.cariAktiviteListesi..listDetay = SingletonModels.cariAktiviteListesi.listDetay;
                    }
                  },
                ),
                BottomSheetModel(
                  title: loc.generalStrings.delete,
                  iconWidget: Icons.delete_outline_outlined,
                  onTap: () async {
                    Get.back();
                    dialogManager.showAreYouSureDialog(() async {
                      widget.onAktiviteSil.call();
                    });
                  },
                ),
              ],
            );
          },
        ),
      );
}
