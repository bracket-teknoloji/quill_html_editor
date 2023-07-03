


import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:get/get.dart';

import '../../components/dialog/dialog_manager.dart';

class NetworkController extends GetxController{
  final Connectivity _connectivity = Connectivity();

  @override
  void onInit() {
    super.onInit();_connectivity.onConnectivityChanged.listen(initConnectivity);
  }

  void initConnectivity(ConnectivityResult result) async {
    if (result == ConnectivityResult.none){
      DialogManager().internetConnectionDialog();
    }else {
      DialogManager().hideAlertDialog;
    }
  }
}