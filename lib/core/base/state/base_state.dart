import "package:flutter/material.dart";

import "../../../view/main_page/model/param_model.dart";
import "../../components/dialog/bottom_sheet/bottom_sheet_dialog_manager.dart";
import "../../components/dialog/dialog_manager.dart";
import "../../components/yetki_controller/yetki_controller.dart";
import "../../init/app_info/app_info.dart";
import "../../init/cache/cache_manager.dart";
import "../../init/network/network_manager.dart";

abstract class BaseState<T extends StatefulWidget> extends State<T> {
  late final DialogManager dialogManager;
  late final BottomSheetDialogManager bottomSheetDialogManager;
  late final AppInfoModel appInfoModel;
  late final NetworkManager networkManager;
  late final YetkiController yetkiController;
  late final ParamModel parametreModel;
   String get mainCurrency => parametreModel.paraBirimi ?? "TL";
  BaseState() {
    networkManager = NetworkManager();
    bottomSheetDialogManager = BottomSheetDialogManager();
    dialogManager = DialogManager();
    appInfoModel = AppInfoModel.instance;
    yetkiController = YetkiController();
    parametreModel = CacheManager.getAnaVeri()?.paramModel ?? ParamModel();
  }
  @override
  void initState() => super.initState();
  @override
  void dispose() => super.dispose();

  double get width => MediaQuery.sizeOf(context).width;
  double get height => MediaQuery.sizeOf(context).height;
  ThemeData get theme => Theme.of(context);
}
