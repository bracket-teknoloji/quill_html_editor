import 'dart:async';
import 'dart:developer';

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';

import '../../components/dialog/bottom_sheet/bottom_sheet_dialog_manager.dart';
import '../../components/dialog/dialog_manager.dart';
import '../../components/yetki_controller/yetki_controller.dart';
import '../../init/app_info/app_info.dart';
import '../../init/network/network_manager.dart';

abstract class BaseState<T extends StatefulWidget> extends State<T> {
  late final DialogManager dialogManager;
  late final BottomSheetDialogManager bottomSheetDialogManager;
  late final AppInfoModel appInfoModel;
  late final NetworkManager networkManager;
  late final YetkiController yetkiController;
  late StreamSubscription connectivitySubscription;
  ConnectivityResult connectivityResult = ConnectivityResult.none;
  Connectivity connectivity = Connectivity();
  BaseState() {
    networkManager = NetworkManager();
    bottomSheetDialogManager = BottomSheetDialogManager();
    dialogManager = DialogManager();
    appInfoModel = AppInfoModel();
    yetkiController = YetkiController();
    internetChecker();
  }
  @override
  void dispose() {
    connectivitySubscription.cancel();
    super.dispose();
  }

  double get width => MediaQuery.of(context).size.width;
  double get height => MediaQuery.of(context).size.height;
  ThemeData get theme => Theme.of(context);
  void internetChecker() {
    connectivitySubscription = connectivity.onConnectivityChanged.listen((ConnectivityResult result) {
      connectivityResult = result;
      log(connectivityResult.toString());
      if (connectivityResult == ConnectivityResult.none) {
        dialogManager.internetConnectionDialog();
      } else {
        dialogManager.hideAlertDialog;
      }
    });
  }
}
