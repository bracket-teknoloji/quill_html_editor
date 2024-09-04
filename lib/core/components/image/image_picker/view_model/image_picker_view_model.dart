import "dart:typed_data";

import "package:mobx/mobx.dart";
import "package:picker/core/base/model/generic_response_model.dart";
import "package:picker/core/base/view_model/mobx_network_mixin.dart";
import "package:picker/core/components/image/evraklar/model/evrak_edit_model.dart";
import "package:picker/core/init/network/login/api_urls.dart";
import "package:picker/view/main_page/alt_sayfalar/finans/cek_senet/cek_senet_evraklar/model/evraklar_request_model.dart";

part "image_picker_view_model.g.dart";

class ImagePickerViewModel = _ImagePickerViewModelBase with _$ImagePickerViewModel;

abstract class _ImagePickerViewModelBase with Store, MobxNetworkMixin {
  @observable
  EvrakEditModel? requestModel;

  @observable
  bool isProcessing = false;

  @observable
  Uint8List? image;

  @action
  void setRequestModel(EvraklarRequestModel? model) => requestModel = EvrakEditModel(
        belgeNo: model?.belgeNo,
        belgeTipi: model?.belgeTipi,
      );

  @action
  void setImage(Uint8List? value) => image = value;

  @action
  void setIsProcessing(bool value) => isProcessing = value;

  @action
  void setByteData(String? value) => requestModel = requestModel?.copyWith(base64Data: value);

  @action
  void setBoyutByte(int? value) => requestModel = requestModel?.copyWith(boyutByte: value);

  @action
  void setAciklama(String? value) => requestModel = requestModel?.copyWith(aciklama: value);

  @action
  Future<GenericResponseModel<EvraklarRequestModel>> uploadEvrak() async =>
      await networkManager.dioPost(path: ApiUrls.saveEvrak, bodyModel: EvraklarRequestModel(), showLoading: true, data: requestModel?.copyWith(islemKodu: 1).toJson());
}
