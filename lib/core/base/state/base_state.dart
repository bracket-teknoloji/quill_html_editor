import "package:flutter/material.dart";
import "package:picker/view/main_page/model/user_model/user_model.dart";

import "../../../generated/locale_base.dart";
import "../../../view/main_page/model/param_model.dart";
import "../../../view/main_page/model/user_model/profil_yetki_model.dart";
import "../../components/dialog/bottom_sheet/bottom_sheet_dialog_manager.dart";
import "../../components/dialog/dialog_manager.dart";
import "../../constants/yetki_controller/yetki_controller.dart";
import "../../init/cache/cache_manager.dart";
import "../../init/network/network_manager.dart";

export "../../base/view/base_scaffold.dart";

abstract class BaseState<T extends StatefulWidget> extends State<T> {
  final DialogManager dialogManager = DialogManager();
  final BottomSheetDialogManager bottomSheetDialogManager = BottomSheetDialogManager();
  final NetworkManager networkManager = NetworkManager();
  final YetkiController yetkiController = YetkiController();
  ParamModel get parametreModel => CacheManager.getAnaVeri?.paramModel ?? ParamModel();
  UserModel get userModel => CacheManager.getAnaVeri?.userModel ?? UserModel();
  ProfilYetkiModel get profilYetkiModel => CacheManager.getAnaVeri?.userModel?.profilYetki ?? ProfilYetkiModel();
  String get mainCurrency => parametreModel.paraBirimi ?? "TL";
  double get width => MediaQuery.sizeOf(context).width;
  double get height => MediaQuery.sizeOf(context).height;
  ThemeData get theme => Theme.of(context);
  LocaleBase get loc => Localizations.of<LocaleBase>(context, LocaleBase)!;
  // NavigatorState navigator(BuildContext context) => Navigator.of(context);
}
