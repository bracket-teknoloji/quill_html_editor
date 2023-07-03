import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:get/get.dart';

import '../../components/dialog/dialog_manager.dart';

class NetworkController extends GetxController {
  final Connectivity _connectivity = Connectivity();
  static ConnectivityResult? connectivityResult;

  @override
  void onInit() {
    super.onInit();
    _connectivity.onConnectivityChanged.listen(initConnectivity);
  }

  void initConnectivity(ConnectivityResult result) async {
    if (connectivityResult != result && result == ConnectivityResult.none) {
      connectivityResult = result;
      DialogManager().internetConnectionDialog();
    } else if (result == ConnectivityResult.mobile || result == ConnectivityResult.wifi) {
      connectivityResult = result;
      DialogManager().hideAlertDialog;
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
