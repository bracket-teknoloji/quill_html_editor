import "package:mobx/mobx.dart";
import "package:picker/core/base/view_model/mobx_network_mixin.dart";

part "sayim_sayilanlar_view_model.g.dart";

class SayimSayilanlarViewModel = _SayimSayilanlarViewModelBase with _$SayimSayilanlarViewModel;

abstract class _SayimSayilanlarViewModelBase with Store, MobxNetworkMixin {}
