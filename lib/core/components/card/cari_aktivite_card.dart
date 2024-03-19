import "package:flutter/material.dart";
import "package:get/get.dart";
import "package:picker/core/base/model/base_edit_model.dart";
import "package:picker/core/base/state/base_state.dart";
import "package:picker/core/components/dialog/bottom_sheet/model/bottom_sheet_model.dart";
import "package:picker/core/constants/color_palette.dart";
import "package:picker/core/constants/enum/base_edit_enum.dart";
import "package:picker/core/constants/extensions/date_time_extensions.dart";
import "package:picker/core/constants/extensions/list_extensions.dart";
import "package:picker/core/constants/extensions/model_extensions.dart";
import "package:picker/core/constants/extensions/widget_extensions.dart";
import "package:picker/core/init/network/login/api_urls.dart";
import "package:picker/view/main_page/alt_sayfalar/cari/cari_aktivite_kayitlari/model/cari_aktivite_listesi_model.dart";
import "package:picker/view/main_page/alt_sayfalar/cari/cari_listesi/model/cari_request_model.dart";

class CariAktiviteCard extends StatefulWidget {
  final CariAktiviteListesiModel model;
  final void Function(bool) onRefresh;
  final Future<CariAktiviteListesiModel?> Function() updatedModel;
  const CariAktiviteCard({super.key, required this.model, required this.onRefresh, required this.updatedModel});

  @override
  State<CariAktiviteCard> createState() => _CariAktiviteCardState();
}

class _CariAktiviteCardState extends BaseState<CariAktiviteCard> {
  CariAktiviteListesiModel get model => widget.model;
  @override
  Widget build(BuildContext context) => Card(
        color: (model.bittar != null) ? ColorPalette.mantis.withOpacity(0.5) : null,
        child: ListTile(
          subtitle: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("Kullanıcı: ${model.kullaniciAdi ?? ""}"),
                  Text("#${model.id}"),
                ],
              ),
              Text("Başlama Tarihi: ${model.bastar.toDateString}").yetkiVarMi(model.bastar != null),
              Text("Bitiş Tarihi: ${model.bittar.toDateString}").yetkiVarMi(model.bittiMi),
              Text("Cari: ${model.cariAdi}").yetkiVarMi(model.cariAdi != null),
              Text("İlgili Kişi: ${model.ilgiliKisi}").yetkiVarMi(model.ilgiliKisi != null),
              Text("Aktivite: ${model.aktiviteAdi}").yetkiVarMi(model.aktiviteAdi != null),
              Text("Kaydeden: ${model.kayityapankul}").yetkiVarMi(model.kayityapankul != null),
              Text("Açıklama: ${model.aciklama}").yetkiVarMi(model.aciklama != null),
            ],
          ),
          onTap: () async {
            bottomSheetDialogManager.showBottomSheetDialog(
              context,
              title: "#${model.id}",
              children: [
                BottomSheetModel(
                  title: loc.generalStrings.view,
                  iconWidget: Icons.preview_outlined,
                  onTap: () async {
                    Get.back();
                    Get.toNamed("mainPage/cariAktiviteEdit", arguments: BaseEditModel(baseEditEnum: BaseEditEnum.goruntule, model: await widget.updatedModel.call()));
                  },
                ).yetkiKontrol(model.bittiMi),
                BottomSheetModel(
                  title: loc.generalStrings.edit,
                  iconWidget: Icons.edit_outlined,
                  onTap: () async {
                    Get.back();
                    final result = await Get.toNamed("mainPage/cariAktiviteEdit", arguments: BaseEditModel(baseEditEnum: BaseEditEnum.duzenle, model:  await widget.updatedModel.call()));
                    if (result == true) {
                      widget.onRefresh.call(true);
                    }
                  },
                ).yetkiKontrol(!model.bittiMi),
                BottomSheetModel(
                  title: loc.generalStrings.delete,
                  iconWidget: Icons.delete_outline_outlined,
                  onTap: () async {
                    Get.back();
                    dialogManager.showAreYouSureDialog(() async {
                      final result = await networkManager.dioPost(path: ApiUrls.saveAktivite, bodyModel: CariAktiviteListesiModel(), data: CariAktiviteListesiModel(id: model.id, islemKodu: 3));
                      if (result.success == true) {
                        dialogManager.showSuccessSnackBar(result.message ?? "Başarılı");
                        widget.onRefresh.call(true);
                      }
                    });
                  },
                ).yetkiKontrol(yetkiController.cariAktiviteSilme),
                BottomSheetModel(
                  title: "Bitirmeyi Geri Al",
                  iconWidget: Icons.remove_done_outlined,
                  onTap: () async {
                    Get.back();
                    final result = await networkManager.dioPost(path: ApiUrls.saveAktivite, bodyModel: CariAktiviteListesiModel(), data: CariAktiviteListesiModel(id: model.id, islemKodu: 8));
                    if (result.success == true) {
                      dialogManager.showSuccessSnackBar(result.message ?? "Başarılı");
                      widget.onRefresh.call(true);
                    }
                  },
                ).yetkiKontrol(model.bittiMi && yetkiController.cariAktiviteBitirmeyiGeriAl),
                BottomSheetModel(
                  title: "Bitir",
                  iconWidget: Icons.done_outline_outlined,
                  onTap: () async {
                    Get.back();
                    final result = await Get.toNamed("mainPage/cariAktiviteEdit", arguments: BaseEditModel(baseEditEnum: BaseEditEnum.bitir, model: model));
                    if (result == true) {
                      widget.onRefresh.call(true);
                    }
                  },
                ).yetkiKontrol(!model.bittiMi),
                BottomSheetModel(
                  title: "Cari İşlemleri",
                  iconWidget: Icons.person_outline_outlined,
                  onTap: () async {
                    Get.back();
                    dialogManager.showCariIslemleriGridViewDialog(await networkManager.getCariModel(CariRequestModel(kod: [model.cariKodu ?? ""])));
                  },
                ).yetkiKontrol(yetkiController.cariListesi),
              ].nullCheckWithGeneric,
            );
          },
        ),
      );
}
