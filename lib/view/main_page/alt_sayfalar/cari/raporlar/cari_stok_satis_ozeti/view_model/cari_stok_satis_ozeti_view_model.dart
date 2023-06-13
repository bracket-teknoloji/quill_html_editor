import 'package:mobx/mobx.dart';

import '../model/cari_stok_satis_ozeti_model.dart';

part 'cari_stok_satis_ozeti_view_model.g.dart';

class CariStokSatisOzetiViewModel = _CariStokSatisOzetiViewModelBase with _$CariStokSatisOzetiViewModel;

abstract class _CariStokSatisOzetiViewModelBase with Store {
  @observable
  bool searchBar = false;

  @action
  void setSearchBar() => searchBar = !searchBar;

  @observable
  List<CariStokSatisOzetiModel>? modelList;

  @action
  void setModelList(List<CariStokSatisOzetiModel>? value) => modelList = value;
}
