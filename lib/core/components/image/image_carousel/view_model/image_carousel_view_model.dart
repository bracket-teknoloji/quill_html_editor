import "package:mobx/mobx.dart";
import "package:picker/core/base/view_model/mobx_network_mixin.dart";
import "package:picker/core/init/network/login/api_urls.dart";
import "package:picker/view/main_page/alt_sayfalar/finans/cek_senet/cek_senet_evraklar/model/evraklar_model.dart";
import "package:picker/view/main_page/alt_sayfalar/finans/cek_senet/cek_senet_evraklar/model/evraklar_request_model.dart";

part "image_carousel_view_model.g.dart";

class ImageCarouselViewModel = _ImageCarouselViewModelBase with _$ImageCarouselViewModel;

abstract class _ImageCarouselViewModelBase with Store, MobxNetworkMixin {
  @observable
  ObservableList<EvraklarModel>? observableList;

  @observable
  String? selectedImage;

  @observable
  EvraklarRequestModel? requestModel;

  @computed
  bool get onlyOneItem => observableList?.length == 1;

  void setRequestModel(EvraklarRequestModel? model) => requestModel = model;
  @action
  void setObservableList(List<EvraklarModel>? list) => observableList = list?.asObservable();
  @action
  void setSelectedImage(String? image) => selectedImage = image;

  Future<void> getData() async {
    final result = await networkManager.dioGet(path: ApiUrls.getEvraklar, bodyModel: EvraklarModel(), queryParameters: requestModel?.toJson());
    if (result.isSuccess){
    setObservableList(result.dataList);
    setSelectedImage(result.dataList.first.resimUrl);
    }
  }
}
