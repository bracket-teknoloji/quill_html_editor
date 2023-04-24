import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';

import '../../components/dialog/dialog_manager.dart';
import '../../init/app_info/app_info.dart';
import '../../init/network/network_manager.dart';

abstract class BaseState<T extends StatefulWidget> extends State<T> {
  late final DialogManager dialogManager;
  late final AppInfoModel appInfoModel;
  late final NetworkManager networkManager;
  ConnectivityResult connectivityResult = ConnectivityResult.none;
  Connectivity connectivity = Connectivity();
  BaseState() {
    internetChecker();
    networkManager = NetworkManager();
    dialogManager = DialogManager();
    appInfoModel = AppInfoModel();
  }

  double get width => MediaQuery.of(context).size.width;
  double get height => MediaQuery.of(context).size.height;
  ThemeData get theme => Theme.of(context);
  Future showAlertDialog(AlertDialog alertDialog) => showDialog(
        barrierDismissible: false,
        context: context,
        builder: (context) => alertDialog,
      );
  void internetChecker() {
    connectivity.checkConnectivity().then((value) {
      connectivityResult = value;
      if (connectivityResult == ConnectivityResult.none) {
        dialogManager.internetConnectionDialog();
      }
    });
    connectivity.onConnectivityChanged.listen((ConnectivityResult result) {
      connectivityResult = result;
      print(connectivityResult);
      if (connectivityResult == ConnectivityResult.none) {
        dialogManager.internetConnectionDialog();
      } else {
        dialogManager.hideAlertDialog;
      }
    });
  }
}
