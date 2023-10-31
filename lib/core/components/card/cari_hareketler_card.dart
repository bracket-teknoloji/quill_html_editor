import "package:flutter/material.dart";
import "package:flutter_slidable/flutter_slidable.dart";
import "package:get/get.dart";
import "package:picker/core/base/model/base_edit_model.dart";
import "package:picker/core/constants/color_palette.dart";
import "package:picker/core/constants/enum/base_edit_enum.dart";
import "package:picker/core/constants/enum/siparis_tipi_enum.dart";
import "package:picker/view/main_page/alt_sayfalar/cari/cari_listesi/model/cari_listesi_model.dart";
import "package:picker/view/main_page/alt_sayfalar/siparis/siparisler/model/siparis_edit_request_model.dart";

import "../../../view/main_page/alt_sayfalar/cari/cari_hareketleri/model/cari_hareketleri_model.dart";
import "../../base/state/base_state.dart";
import "../../constants/enum/badge_color_enum.dart";
import "../../constants/extensions/date_time_extensions.dart";
import "../../constants/extensions/number_extensions.dart";
import "../../constants/extensions/widget_extensions.dart";
import "../../constants/ondalik_utils.dart";
import "../../constants/ui_helper/ui_helper.dart";
import "../badge/colorful_badge.dart";
import "../helper_widgets/custom_label_widget.dart";

class CariHareketlerCard extends StatefulWidget {
  final String? dovizTipi;
  final CariHareketleriModel cariHareketleriModel;
  final dynamic Function()? onTap;

  const CariHareketlerCard({super.key, this.onTap, required this.cariHareketleriModel, this.dovizTipi});

  @override
  State<CariHareketlerCard> createState() => _CariHareketlerCardState();
}

class _CariHareketlerCardState extends BaseState<CariHareketlerCard> {
  bool get dovizliMi => widget.cariHareketleriModel.dovizliMi || widget.dovizTipi != null;
  @override
  Widget build(BuildContext context) => Slidable(
        enabled: widget.cariHareketleriModel.hareketAciklama != "Dekont",
        endActionPane: ActionPane(
          motion: const ScrollMotion(),
          children: [
            SlidableAction(
              autoClose: true,
              onPressed: (context) async {
                if (widget.cariHareketleriModel.hareketKodu == "A") {
                  await Get.toNamed("/mainPage/cariYeniKayit", arguments: BaseEditModel(baseEditEnum: BaseEditEnum.goruntule, model: widget.cariHareketleriModel));
                } else if (widget.cariHareketleriModel.hareketKodu == "B") {
                  await Get.toNamed(
                    "/mainPage/faturaEdit",
                    arguments: BaseEditModel(
                      baseEditEnum: BaseEditEnum.goruntule,
                      model: SiparisEditRequestModel.fromCariHareketleriModel(widget.cariHareketleriModel),
                      siparisTipiEnum: (SiparisTipiEnum.alisFatura).getSiparisTipiEnumWithRawValue(widget.cariHareketleriModel.belgeTipi),
                    ),
                  );
                }
              },
              icon: Icons.route_outlined,
              backgroundColor: theme.cardColor,
              foregroundColor: theme.colorScheme.primary,
              label: "Belgeye Git",
            ).yetkiVarMi(widget.cariHareketleriModel.hareketAciklama != "Dekont"),
          ].whereType<SlidableAction>().toList(),
        ),
        child: Stack(
          alignment: Alignment.centerRight,
          fit: StackFit.passthrough,
          children: [
            Card(
              child: InkWell(
                onTap: widget.onTap ?? () {},
                onLongPress: () async => await dialogManager.showCariHareketleriGridViewDialog(CariListesiModel.fromCariHareketleriModel(widget.cariHareketleriModel)),
                child: Row(
                  children: [
                    Expanded(
                      child: Column(
                        children: [
                          ListTile(
                            horizontalTitleGap: 0,
                            // onTap: widget.onTap ?? () {},
                            title: Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Row(
                                      children: [
                                        Text("${widget.cariHareketleriModel.tarih?.toDateString ?? ""} (${widget.cariHareketleriModel.hareketKodu ?? ""}) "),
                                        const ColorfulBadge(label: Text("Dövizli"), badgeColorEnum: BadgeColorEnum.dovizli)
                                            .yetkiVarMi(widget.cariHareketleriModel.dovizAlacak != null || widget.cariHareketleriModel.dovizBorc != null),
                                        // widget.cariHareketleriModel.dovizliMi ? const Badge(label: Text("Dövizli")) : Container(),
                                      ],
                                    ),
                                    Text(widget.cariHareketleriModel.hareketAciklama ?? "", style: TextStyle(color: UIHelper.primaryColor)),
                                  ],
                                ),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.end,
                                  children: [
                                    Text(
                                      "${widget.cariHareketleriModel.alacak?.commaSeparatedWithDecimalDigits(OndalikEnum.tutar) ?? widget.cariHareketleriModel.borc?.commaSeparatedWithDecimalDigits(OndalikEnum.tutar)} $mainCurrency",
                                      style: theme.textTheme.bodySmall?.copyWith(fontSize: 12),
                                    ),
                                    Visibility(
                                      visible: widget.cariHareketleriModel.dovizliMi,
                                      child: Text(
                                        "${widget.cariHareketleriModel.dovizBakiye.commaSeparatedWithDecimalDigits(OndalikEnum.tutar)} ${widget.cariHareketleriModel.dovizAdi ?? mainCurrency}",
                                        style: theme.textTheme.bodySmall?.copyWith(fontSize: UIHelper.midSize),
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                            subtitle: LayoutBuilder(
                              builder: (context, constraints) => Wrap(
                                runAlignment: WrapAlignment.spaceBetween,
                                children: [
                                  CustomWidgetWithLabel(
                                    addPadding: false,
                                    isVertical: true,
                                    text: "Belge No",
                                    child: Text(widget.cariHareketleriModel.belgeNo ?? "", overflow: TextOverflow.ellipsis),
                                  ),
                                  CustomWidgetWithLabel(
                                    addPadding: false,
                                    isVertical: true,
                                    text: "Vade Tarihi",
                                    child: Text(widget.cariHareketleriModel.vadeTarihi?.toDateString ?? "", overflow: TextOverflow.ellipsis),
                                  ),
                                  CustomWidgetWithLabel(
                                    addPadding: false,
                                    isVertical: true,
                                    text: "Plasiyer",
                                    child: Text(widget.cariHareketleriModel.plasiyerAciklama ?? "", overflow: TextOverflow.ellipsis),
                                  ),
                                  CustomWidgetWithLabel(
                                    addPadding: false,
                                    isVertical: true,
                                    text: "Şube",
                                    child: Text("${widget.cariHareketleriModel.subeKodu ?? 0}", overflow: TextOverflow.ellipsis),
                                  ),
                                ].map((e) => SizedBox(width: constraints.maxWidth / 2, child: e).paddingOnly(bottom: UIHelper.lowSize)).toList(),
                              ),
                            ),
                          ),
                          const Divider(),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              //Açıklama
                              SizedBox(
                                width: width * 0.4,
                                child: Text(
                                  widget.cariHareketleriModel.aciklama ?? "",
                                  overflow: TextOverflow.ellipsis,
                                  softWrap: true,
                                  maxLines: 3,
                                  style: theme.textTheme.bodySmall?.copyWith(color: ColorPalette.slateGray, fontStyle: FontStyle.italic),
                                ),
                              ),
                              //YuruyenBakiye
                              Container(
                                alignment: Alignment.centerRight,
                                child: Text(
                                  "Bakiye : ${dovizCheck.commaSeparatedWithDecimalDigits(OndalikEnum.tutar)} ${widget.dovizTipi ?? mainCurrency}",
                                  style: theme.textTheme.bodySmall?.copyWith(color: UIHelper.getColorWithValue(dovizCheck)),
                                ),
                              ),
                            ].map((e) => e.paddingSymmetric(vertical: UIHelper.midSize, horizontal: UIHelper.highSize)).toList(),
                          ),
                        ],
                      ).paddingAll(UIHelper.lowSize),
                    ),
                  ],
                ),
              ),
            ).paddingSymmetric(horizontal: UIHelper.lowSize),
            Align(
              alignment: Alignment.centerRight,
              child: Visibility(visible: widget.cariHareketleriModel.hareketAciklama != "Dekont", child: Icon(Icons.chevron_right_outlined, color: theme.colorScheme.primary)),
            ).paddingOnly(right: UIHelper.lowSize),
          ],
        ),
      );

  double get dovizCheck {
    if (dovizliMi) {
      return widget.cariHareketleriModel.dovYuruyenBakiye ?? widget.cariHareketleriModel.yuruyenBakiye ?? 0;
    } else {
      return widget.cariHareketleriModel.yuruyenBakiye ?? 0;
    }
  }
}
