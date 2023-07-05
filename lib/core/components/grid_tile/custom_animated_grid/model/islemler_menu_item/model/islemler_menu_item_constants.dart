import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:get/get.dart';
import 'package:kartal/kartal.dart';
import 'package:picker/core/base/model/base_edit_model.dart';
import 'package:picker/core/components/dialog/bottom_sheet/bottom_sheet_dialog_manager.dart';
import 'package:picker/core/components/dialog/bottom_sheet/model/bottom_sheet_model.dart';
import 'package:picker/core/components/grid_tile/custom_animated_grid/model/islemler_menu_item/view_model/islemler_menu_item_constants_view_model.dart';
import 'package:picker/core/components/grid_tile/custom_animated_grid/model/kod_degistir_model.dart';
import 'package:picker/core/components/helper_widgets/custom_label_widget.dart';
import 'package:picker/core/components/textfield/custom_text_field.dart';
import 'package:picker/core/constants/extensions/list_extensions.dart';
import 'package:picker/core/constants/extensions/model_extensions.dart';
import 'package:picker/core/init/network/network_manager.dart';
import 'package:picker/view/main_page/alt_sayfalar/cari/cari_listesi/model/cari_listesi_model.dart';
import 'package:picker/view/main_page/alt_sayfalar/stok/stok_liste/model/stok_listesi_model.dart';
import 'package:picker/view/main_page/model/grid_item_model.dart';
import 'package:share_plus/share_plus.dart';

import '../../../../../../constants/enum/base_edit_enum.dart';
import '../../../../../../constants/enum/islem_tipi_enum.dart';
import '../../../../../../constants/ui_helper/ui_helper.dart';
import '../../../../../../init/network/login/api_urls.dart';
import '../../../../../dialog/dialog_manager.dart';

class IslemlerMenuItemConstants<T> {
  IslemlerMenuItemConstantsViewModel viewModel = IslemlerMenuItemConstantsViewModel();
  BottomSheetDialogManager bottomSheetDialogManager = BottomSheetDialogManager();
  IslemTipi islemtipi;
  List<GridItemModel?> islemler = [];
  T? model;

  IslemlerMenuItemConstants({required this.islemtipi, List<GridItemModel?>? raporlar, this.model}) {
    if (islemtipi == IslemTipi.stok) {
      islemler.add(stokKarti);
      islemler.add(raporlar?.first);
    } else if (islemtipi == IslemTipi.cari) {
      if (model is CariListesiModel) {
        GridItemModel cariHareketleri = GridItemModel.islemler(iconData: Icons.sync_alt_outlined, title: "Cari Hareketleri", onTap: () => Get.toNamed("mainPage/cariHareketleri", arguments: model));
        islemler.add(paylas);
        islemler.add(cariHareketleri);
        islemler.add(cariKoduDegistir);
        islemler.addAll(raporlar!);
      }
    }
    if (raporlar.isNotNullOrEmpty) {
      islemler.add(stokHareketleri);
    }
  }

  //* Genel
  GridItemModel get stokHareketleri => GridItemModel.islemler(iconData: Icons.sync_alt_outlined, title: "Stok Hareketleri", onTap: () => Get.toNamed("mainPage/stokHareketleri", arguments: model));

  //* Stok
  GridItemModel get stokKarti => GridItemModel.islemler(
      title: "Stok Kartı",
      iconData: Icons.info_outline,
      onTap: () => Get.toNamed("/mainPage/stokEdit", arguments: BaseEditModel(model: (model as StokListesiModel), baseEditEnum: BaseEditEnum.duzenle)));

  //* Cari
  GridItemModel get paylas => GridItemModel.islemler(
      title: "Paylaş",
      iconData: Icons.share_outlined,
      onTap: () async {
        var result = await bottomSheetDialogManager.showCheckBoxBottomSheetDialog(Get.context!,
            title: "Paylaş",
            children: [
              BottomSheetModel(title: "Ünvan", value: (model as CariListesiModel).cariAdi).yetkiKontrol((model as CariListesiModel).cariAdi != null),
              BottomSheetModel(title: "Adres", value: (model as CariListesiModel).cariAdres).yetkiKontrol((model as CariListesiModel).cariAdres != null),
              BottomSheetModel(title: "İl/ İlçe", value: "${(model as CariListesiModel).cariIl ?? ""} / ${(model as CariListesiModel).cariIlce ?? ""}")
                  .yetkiKontrol((model as CariListesiModel).cariIl != null || (model as CariListesiModel).cariIlce != null),
              BottomSheetModel(title: "Vergi Bilgileri", value: "${(model as CariListesiModel).vergiDairesi ?? ""} ${(model as CariListesiModel).vergiNumarasi ?? ""}")
                  .yetkiKontrol((model as CariListesiModel).vergiDairesi != null || (model as CariListesiModel).vergiNumarasi != null),
              BottomSheetModel(title: "Telefon", value: (model as CariListesiModel).cariTel).yetkiKontrol((model as CariListesiModel).cariTel != null),
              BottomSheetModel(title: "Web Sitesi", value: (model as CariListesiModel).web).yetkiKontrol((model as CariListesiModel).web != null),
              BottomSheetModel(title: "Mail", value: (model as CariListesiModel).email).yetkiKontrol((model as CariListesiModel).email != null),
            ].nullCheck.cast<BottomSheetModel>());
        Clipboard.setData(ClipboardData(text: result.join("\n")));
        Share.share(result.join("\n"));
      });

  GridItemModel get cariKoduDegistir => GridItemModel.islemler(
      title: "Cari Kodu Değiştir",
      iconData: Icons.people_alt_outlined,
      onTap: () async {
        TextEditingController controller = TextEditingController();
        KodDegistirModel kodDegistirModel = KodDegistirModel()
          ..kaynakSil = "H"
          ..kaynakCari = (model as CariListesiModel).cariKodu;
        var result = await bottomSheetDialogManager.showBottomSheetDialog(Get.context!,
            title: "Cari Kodu Değiştir",
            body: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                CustomTextField(
                  labelText: "Cari",
                  readOnly: true,
                  isMust: true,
                  controllerText: model is CariListesiModel ? (model as CariListesiModel).cariAdi : null,
                ),
                CustomTextField(
                    labelText: "Yeni Cari Kodu",
                    controller: controller,
                    isMust: true,
                    suffix: IconButton(
                        onPressed: () async {
                          var result = await Get.toNamed("mainPage/cariListesi", arguments: true);
                          if (result != null) {
                            kodDegistirModel.hedefCari = (result as CariListesiModel).cariKodu;
                            controller.text = (result).cariKodu ?? "";
                          }
                        },
                        icon: const Icon(Icons.more_horiz_outlined))),
                CustomWidgetWithLabel(
                  text: "Eski Cari Kodu Silinsin mi?",
                  isVertical: true,
                  children: [
                    Observer(
                        builder: (_) => Switch.adaptive(
                            value: viewModel.cariKodDegistirSwitch,
                            onChanged: (value) {
                              viewModel.changeCariKodDegistirSwitch(value);
                              kodDegistirModel.kaynakSil = (value ? "E" : "H");
                            })),
                  ],
                ),
                Row(
                  children: [
                    Expanded(
                        child: ElevatedButton(onPressed: () => Get.back(), style: ButtonStyle(backgroundColor: MaterialStateProperty.all(Colors.white.withOpacity(0.1))), child: const Text("İptal"))),
                    SizedBox(width: Get.width * 0.02),
                    Expanded(
                        child: ElevatedButton(
                            onPressed: () {
                              DialogManager().showAreYouSureDialog(() async {
                                var result = await NetworkManager().dioPost<KodDegistirModel>(path: ApiUrls.kodDegistir, bodyModel: KodDegistirModel(), data: kodDegistirModel.toJson());
                                if (result.success == true) {
                                  print(result.data.toString());
                                }
                              });
                            },
                            child: const Text("Kaydet"))),
                  ],
                ).paddingAll(UIHelper.lowSize)
              ],
            ).paddingAll(UIHelper.lowSize));
      });
}
