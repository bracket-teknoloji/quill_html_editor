import 'package:mobx/mobx.dart';
import 'package:picker/view/main_page/alt_sayfalar/siparis/base_siparis_edit/model/base_siparis_edit_model.dart';
part 'base_siparis_editing_view_model.g.dart';

class BaseSiparisEditingViewModel = _BaseSiparisEditingViewModelBase with _$BaseSiparisEditingViewModel;

abstract class _BaseSiparisEditingViewModelBase with Store {
  
  @observable
  bool isLastPage = false;

  @action
  void changeIsLastPage(bool value) => isLastPage = value;

  @computed
  int get getKalemCount => BaseSiparisEditModel.instance.kalemAdedi ?? 0;
}