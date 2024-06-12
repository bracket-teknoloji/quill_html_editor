import "package:mobx/mobx.dart";
import "package:picker/core/base/view_model/mobx_network_mixin.dart";

part "barkod_tanimla_view_model.g.dart";

class BarkodTanimlaViewModel = _BarkodTanimlaViewModelBase with _$BarkodTanimlaViewModel;

abstract class _BarkodTanimlaViewModelBase with Store, MobxNetworkMixin {}
