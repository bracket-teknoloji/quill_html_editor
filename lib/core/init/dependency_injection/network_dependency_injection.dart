import "package:get/get.dart";

import "../network/network_controller.dart";

class NetworkDependencyInjection {
  static void init() {
    Get.put<NetworkController>(NetworkController(), permanent: true);
  }
}
