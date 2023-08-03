import 'package:mobx/mobx.dart';
import 'package:picker/view/main_page/alt_sayfalar/siparis/base_siparis_edit/model/base_siparis_edit_model.dart';

import '../../../../../view/main_page/alt_sayfalar/stok/stok_liste/model/stok_listesi_model.dart';

part 'kalem_ekle_view_model.g.dart';

class KalemEkleViewModel = _KalemEkleViewModelBase with _$KalemEkleViewModel;

abstract class _KalemEkleViewModelBase with Store {
  @observable
  StokListesiModel? model;
  

  @action
  void setModel(StokListesiModel? value) => model = value;

  @computed
  bool get dovizliMi => model?.dovizliMi ?? false;

  @observable
  KalemModel kalemModel = KalemModel();
}
