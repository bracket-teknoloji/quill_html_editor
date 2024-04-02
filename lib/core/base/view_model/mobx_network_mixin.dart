import "package:flutter/material.dart";

import "../../../generated/locale_base.dart";
import "../../../view/main_page/model/param_model.dart";
import "../../components/dialog/dialog_manager.dart";
import "../../init/cache/cache_manager.dart";
import "../../init/network/network_manager.dart";

mixin MobxNetworkMixin {
  NetworkManager get networkManager => NetworkManager();
  ParamModel get parametreModel => CacheManager.getAnaVeri?.paramModel ?? ParamModel();
  DialogManager get dialogManager => DialogManager();
  LocaleBase loc(BuildContext context) => Localizations.of<LocaleBase>(context, LocaleBase)!;
}
