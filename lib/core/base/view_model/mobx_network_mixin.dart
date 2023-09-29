import "package:picker/core/init/cache/cache_manager.dart";
import "package:picker/core/init/network/network_manager.dart";
import "package:picker/view/main_page/model/param_model.dart";

mixin MobxNetworkMixin {
  NetworkManager networkManager = NetworkManager();
  ParamModel parametreModel = CacheManager.getAnaVeri()?.paramModel ?? ParamModel();
}
