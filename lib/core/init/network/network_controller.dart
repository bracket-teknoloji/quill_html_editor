import "dart:developer";

import "package:connectivity_plus/connectivity_plus.dart";
import "package:get/get.dart";
import "package:network_info_plus/network_info_plus.dart";
import "package:picker/view/add_company/model/account_model.dart";

import "../../components/dialog/dialog_manager.dart";

class NetworkController extends GetxController {
  final Connectivity _connectivity = Connectivity();
  static ConnectivityResult? connectivityResult;
  bool isOffline = false;

  @override
  void onInit() {
    super.onInit();
    _connectivity.onConnectivityChanged.listen(initConnectivity);
  }

  Future<void> initConnectivity(ConnectivityResult result) async {
    if (connectivityResult != result && result == ConnectivityResult.none) {
      connectivityResult = result;
      DialogManager().internetConnectionDialog();
      isOffline = true;
    } else if (result == ConnectivityResult.mobile || result == ConnectivityResult.wifi) {
      connectivityResult = result;
      if (isOffline) {
        DialogManager().hideAlertDialog;
        isOffline = false;
      }
      if (result == ConnectivityResult.wifi) {
        final NetworkInfo networkInfo = NetworkInfo();
        try {
        AccountModel.instance.wifiAdi = await networkInfo.getWifiName(); 
        } catch (e) {
          log(e.toString(), name: "NetworkController"); 
        }
      }
    }
    // connectivityResult != result ? connectivityResult = result : connectivityResult = null;
    // if (connectivityResult == ConnectivityResult.none) {
    //   DialogManager().showAlertDialog("network_error");
    // } else if (connectivityResult == ConnectivityResult.mobile ||
    //     connectivityResult == ConnectivityResult.wifi) {
    //   DialogManager().hideAlertDialog;
    // }
  }
}
