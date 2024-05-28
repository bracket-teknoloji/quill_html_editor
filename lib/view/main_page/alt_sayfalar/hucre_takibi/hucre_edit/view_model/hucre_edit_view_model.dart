import "package:mobx/mobx.dart";
import "package:picker/core/base/view_model/mobx_network_mixin.dart";

part "hucre_edit_view_model.g.dart";

class HucreEditViewModel = _HucreEditViewModelBase with _$HucreEditViewModel;

abstract class _HucreEditViewModelBase with Store, MobxNetworkMixin {}
