import 'package:mobx/mobx.dart';
part 'main_page_view_model.g.dart';

class MainPageViewModel = _MainPageViewModelBase with _$MainPageViewModel;

abstract class _MainPageViewModelBase with Store {
  @observable
  bool isDrawerOpen = false;
  

}