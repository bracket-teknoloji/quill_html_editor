import "package:flutter/material.dart";
import "package:flutter_slidable/flutter_slidable.dart";
import "package:get/get.dart";
import "package:kartal/kartal.dart";

import "../../../view/main_page/alt_sayfalar/cari/cari_hareketleri/model/cari_hareketleri_model.dart";
import "../../../view/main_page/alt_sayfalar/cari/cari_listesi/model/cari_listesi_model.dart";
import "../../../view/main_page/alt_sayfalar/siparis/siparisler/model/siparis_edit_request_model.dart";
import "../../base/model/base_edit_model.dart";
import "../../base/state/base_state.dart";
import "../../constants/color_palette.dart";
import "../../constants/enum/badge_color_enum.dart";
import "../../constants/enum/base_edit_enum.dart";
import "../../constants/enum/edit_tipi_enum.dart";
import "../../constants/extensions/date_time_extensions.dart";
import "../../constants/extensions/list_extensions.dart";
import "../../constants/extensions/number_extensions.dart";
import "../../constants/extensions/widget_extensions.dart";
import "../../constants/ondalik_utils.dart";
import "../../constants/ui_helper/ui_helper.dart";
import "../badge/colorful_badge.dart";
import "../helper_widgets/custom_label_widget.dart";

class CariHareketlerCard extends StatefulWidget {
  const CariHareketlerCard({required this.cariHareketleriModel, super.key, this.onTap, this.dovizTipi});
  final String? dovizTipi;
  final CariHareketleriModel cariHareketleriModel;
  final dynamic Function()? onTap;

  @override
  State<CariHareketlerCard> createState() => _CariHareketlerCardState();
}

class _CariHareketlerCardState extends BaseState<CariHareketlerCard> {
  bool get dovizliMi => widget.cariHareketleriModel.dovizliMi || widget.dovizTipi != null;
  CariHareketleriModel get model => widget.cariHareketleriModel;
  @override
  Widget build(BuildContext context) {
    final slidableList = [
      SlidableAction(
        onPressed: (context) async {
          if (model.faturaMi) {
            await Get.toNamed(
              "/mainPage/faturaEdit",
              arguments: BaseEditModel(
                baseEditEnum: BaseEditEnum.goruntule,
                editTipiEnum: EditTipiEnum.alisFatura.getEditTipiEnumWithRawValue(model.belgeTipi),
                model: SiparisEditRequestModel.fromCariHareketleriModel(model),
              ),
            );
          } else if (model.kasaMi) {
            await Get.toNamed("/mainPage/kasaHareketDetayi", arguments: model);
          } else {
            await Get.toNamed("/mainPage/cariYeniKayit", arguments: BaseEditModel<CariHareketleriModel>(baseEditEnum: BaseEditEnum.goruntule, model: model));
          }
        },
        icon: Icons.route_outlined,
        backgroundColor: theme.colorScheme.onPrimary,
        foregroundColor: theme.colorScheme.primary,
        label: "Belgeye Git",
      ).yetkiVarMi(widget.cariHareketleriModel.hareketAciklama != "Dekont" && yetkiController.cariHareketleriHarDetayGorsun),
    ].map((e) => e is! SizedBox ? e : null).toList().nullCheckWithGeneric;
    return InkWell(
      onTap: widget.onTap ?? () {},
      onLongPress: () async => await dialogManager.showCariHareketleriGridViewDialog(
        CariListesiModel.fromCariHareketleriModel(widget.cariHareketleriModel),
        onSelected: (value) async {
          // if (value == true) {
          //   await widget.
          // }
        },
      ),
      child: IntrinsicHeight(
        child: Card(
          child: Slidable(
            groupTag: 1,
            enabled: widget.cariHareketleriModel.hareketAciklama != "Dekont" && yetkiController.cariHareketleriHarDetayGorsun,
            endActionPane: ActionPane(
              motion: const BehindMotion(),
              children: slidableList.whereType<SlidableAction>().toList(),
            ),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                listTile(),
                Container(
                  width: UIHelper.lowSize,
                  decoration: const BoxDecoration(
                    color: UIHelper.primaryColor,
                  ),
                ).yetkiVarMi(slidableList.ext.isNotNullOrEmpty && yetkiController.cariHareketleriHarDetayGorsun),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Expanded listTile() => Expanded(
        child: ListTile(
          title: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text("${widget.cariHareketleriModel.tarih?.toDateString ?? ""} (${widget.cariHareketleriModel.alacakBorcHarf}) "),
                  Text(widget.cariHareketleriModel.hareketAciklama ?? "", style: TextStyle(color: theme.colorScheme.primary)),
                  Row(
                    children: [
                      if (widget.cariHareketleriModel.alacakMi) const ColorfulBadge(label: Text("Alacak"), badgeColorEnum: BadgeColorEnum.basarili),
                      if (!widget.cariHareketleriModel.alacakMi) const ColorfulBadge(label: Text("Borç"), badgeColorEnum: BadgeColorEnum.hata),
                      if (widget.cariHareketleriModel.dovizAlacak != null || widget.cariHareketleriModel.dovizBorc != null)
                        const ColorfulBadge(label: Text("Dövizli"), badgeColorEnum: BadgeColorEnum.dovizli),
                    ].nullCheck.map((e) => e.runtimeType != SizedBox ? e.paddingOnly(right: UIHelper.lowSize) : e).toList(),
                  ),
                ],
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    "${widget.cariHareketleriModel.alacak?.commaSeparatedWithDecimalDigits(OndalikEnum.tutar) ?? widget.cariHareketleriModel.borc?.commaSeparatedWithDecimalDigits(OndalikEnum.tutar)} $mainCurrency",
                    style: theme.textTheme.bodySmall?.copyWith(fontSize: 12),
                  ),
                  Text(
                    "${widget.cariHareketleriModel.dovizBakiye.commaSeparatedWithDecimalDigits(OndalikEnum.tutar)} ${widget.cariHareketleriModel.dovizAdi ?? mainCurrency}",
                    style: theme.textTheme.bodySmall?.copyWith(fontSize: UIHelper.midSize),
                  ).yetkiVarMi(widget.cariHareketleriModel.dovizAlacak != null || widget.cariHareketleriModel.dovizBorc != null),
                ],
              ),
            ],
          ),
          subtitle: Column(
            // runAlignment: WrapAlignment.spaceBetween,
            mainAxisSize: MainAxisSize.min,
            children: [
              Row(
                children: [
                  Expanded(
                    child: CustomWidgetWithLabel(
                      addPadding: false,
                      isVertical: true,
                      text: "Belge No",
                      child: Text(widget.cariHareketleriModel.belgeNo ?? "", overflow: TextOverflow.ellipsis),
                    ),
                  ),
                  Expanded(
                    child: CustomWidgetWithLabel(
                      addPadding: false,
                      isVertical: true,
                      text: "Vade Tarihi",
                      child: Text(widget.cariHareketleriModel.vadeTarihi?.toDateString ?? "", overflow: TextOverflow.ellipsis),
                    ),
                  ),
                ],
              ),
              Row(
                children: [
                  Expanded(
                    child: CustomWidgetWithLabel(
                      addPadding: false,
                      isVertical: true,
                      text: "Plasiyer",
                      child: SizedBox(child: Text(widget.cariHareketleriModel.plasiyerAciklama ?? "")),
                    ),
                  ).yetkiVarMi(yetkiController.plasiyerUygulamasiAcikMi),
                  Expanded(
                    child: CustomWidgetWithLabel(
                      addPadding: false,
                      isVertical: true,
                      text: "Şube",
                      child: Text("${widget.cariHareketleriModel.subeKodu ?? 0}", overflow: TextOverflow.ellipsis),
                    ),
                  ),
                ].whereType<Expanded>().toList(),
              ),
              const Divider(
                endIndent: 0,
                indent: 0,
              ).paddingOnly(top: UIHelper.midSize),
              Row(
                // alignment is spaceBetween
                // runAlignment: WrapAlignment.spaceBetween,

                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  //Açıklama
                  Expanded(
                    child: Text(
                      widget.cariHareketleriModel.aciklama ?? "",
                      overflow: TextOverflow.ellipsis,
                      softWrap: true,
                      maxLines: 3,
                      style: theme.textTheme.bodySmall?.copyWith(color: ColorPalette.slateGray, fontStyle: FontStyle.italic),
                    ),
                  ),
                  //YuruyenBakiye
                  Text(
                    "Bakiye: ${dovizCheck.commaSeparatedWithDecimalDigits(OndalikEnum.tutar)} ${widget.dovizTipi ?? mainCurrency}",
                    style: theme.textTheme.bodySmall?.copyWith(color: UIHelper.getColorWithValue(dovizCheck)),
                  ),
                ],
              ).paddingAll(UIHelper.midSize).paddingOnly(bottom: UIHelper.midSize),
            ],
          ).paddingOnly(bottom: UIHelper.highSize),
        ).paddingOnly(bottom: UIHelper.highSize),
      );

  double get dovizCheck {
    if (dovizliMi) {
      return widget.cariHareketleriModel.dovYuruyenBakiye ?? widget.cariHareketleriModel.yuruyenBakiye ?? 0;
    } else {
      return widget.cariHareketleriModel.yuruyenBakiye ?? 0;
    }
  }
}
