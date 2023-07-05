

import 'package:get/get.dart';
import 'package:picker/core/init/network/network_controller.dart';

class NetworkDependencyInjection {
  static void init() {
    Get.put<NetworkController>(NetworkController(), permanent: true);
  }
}