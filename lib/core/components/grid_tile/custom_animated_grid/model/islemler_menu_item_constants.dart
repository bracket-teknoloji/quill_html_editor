import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:kartal/kartal.dart';
import 'package:picker/core/base/model/base_edit_model.dart';
import 'package:picker/core/components/dialog/bottom_sheet/bottom_sheet_dialog_manager.dart';
import 'package:picker/core/components/dialog/bottom_sheet/model/bottom_sheet_model.dart';
import 'package:picker/core/constants/extensions/list_extensions.dart';
import 'package:picker/core/constants/extensions/model_extensions.dart';
import 'package:picker/view/main_page/alt_sayfalar/cari/cari_listesi/model/cari_listesi_model.dart';
import 'package:picker/view/main_page/alt_sayfalar/stok/stok_liste/model/stok_listesi_model.dart';
import 'package:picker/view/main_page/model/grid_item_model.dart';
import 'package:share_plus/share_plus.dart';

import '../../../../constants/enum/base_edit_enum.dart';
import '../../../../constants/enum/islem_tipi_enum.dart';

class IslemlerMenuItemConstants<T> {
  BottomSheetDialogManager bottomSheetDialogManager = BottomSheetDialogManager();
  IslemTipi islemtipi;
  List<GridItemModel?> islemler = [];
  T? model;

  IslemlerMenuItemConstants({required this.islemtipi, List<GridItemModel?>? raporlar, this.model}) {
    if (islemtipi == IslemTipi.stok) {
      GridItemModel stokKarti = GridItemModel.islemler(
          title: "Stok Kartı", iconData: Icons.info_outline, onTap: () => Get.toNamed("/mainPage/stokEdit", arguments: BaseEditModel(model: (model as StokListesiModel), baseEditEnum: BaseEditEnum.duzenle)));
      islemler.add(stokKarti);
    } else if (islemtipi == IslemTipi.cari) {
      if (model is CariListesiModel) {
        GridItemModel stokHareketleri =
            GridItemModel.islemler(iconData: Icons.sync_alt_outlined, title: "Cari Stok Hareketleri", onTap: () => Get.toNamed("mainPage/stokHareketleri", arguments: model));
        GridItemModel cariHareketleri = GridItemModel.islemler(iconData: Icons.sync_alt_outlined, title: "Cari Hareketleri", onTap: () => Get.toNamed("mainPage/cariHareketleri", arguments: model));
        GridItemModel paylas = GridItemModel.islemler(
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
        islemler.add(paylas);
        islemler.add(stokHareketleri);
        islemler.add(cariHareketleri);
      }
    }
    if (raporlar.isNotNullOrEmpty) {
      islemler.addAll(raporlar!);
    }
  }
}
