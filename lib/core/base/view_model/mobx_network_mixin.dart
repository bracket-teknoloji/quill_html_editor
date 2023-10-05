import "../../init/cache/cache_manager.dart";
import "../../init/network/network_manager.dart";
import "../../../view/main_page/model/param_model.dart";

mixin MobxNetworkMixin {
  NetworkManager networkManager = NetworkManager();
  ParamModel parametreModel = CacheManager.getAnaVeri()?.paramModel ?? ParamModel();
}
