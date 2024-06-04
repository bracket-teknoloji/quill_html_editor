import "package:mobx/mobx.dart";

import "../../../view/main_page/model/param_model.dart";
import "../../components/dialog/dialog_manager.dart";
import "../../init/cache/cache_manager.dart";
import "../../init/network/network_manager.dart";

mixin MobxNetworkMixin on Store {
  NetworkManager get networkManager => NetworkManager();

  ParamModel get parametreModel => CacheManager.getAnaVeri?.paramModel ?? ParamModel();
  DialogManager get dialogManager => DialogManager();
}
