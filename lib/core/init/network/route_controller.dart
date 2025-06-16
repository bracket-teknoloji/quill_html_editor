import "dart:developer";

import "package:app_links/app_links.dart";
import "package:get/get.dart";
import "package:picker/core/init/cache/cache_manager.dart";

final class RouteController extends GetxController {
  static RouteController get to => Get.find<RouteController>();

  late final AppLinks appLinks;

  @override
  void onInit() {
    appLinks = AppLinks();
    appLinks.uriLinkStream.listen(
      (link) {
        if (CacheManager.getVerifiedUser.account == null) {
          log("User not verified, redirecting to login page.", name: "AppLink");
          Get.offAllNamed("/login");
          return;
        }
        log("App Link: $link", name: "AppLink");
        Get.toNamed(
          link.path,
          arguments: link.queryParameters.isNotEmpty ? link.queryParameters : null,
        );
      },
      onDone: () => log("App Link Stream Done", name: "AppLinkDone"),
      onError: (Object error) => log("App Link Error: $error", name: "AppLinkError"),
    );
    super.onInit();
  }
}
