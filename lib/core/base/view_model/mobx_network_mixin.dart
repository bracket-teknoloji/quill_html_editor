import "package:picker/core/components/dialog/dialog_manager.dart";

import "../../../view/main_page/model/param_model.dart";
import "../../init/cache/cache_manager.dart";
import "../../init/network/network_manager.dart";

mixin MobxNetworkMixin {
  NetworkManager networkManager = NetworkManager();
  ParamModel parametreModel = CacheManager.getAnaVeri?.paramModel ?? ParamModel();
  DialogManager dialogManager = DialogManager();
}
