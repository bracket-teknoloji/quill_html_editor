import "package:get/get.dart";

import "../network/network_controller.dart";

final class NetworkDependencyInjection {
  static void init() {
    Get.put<NetworkController>(NetworkController(), permanent: true);
    // ..put<RouteController>(RouteController(), permanent: true);
  }
}
