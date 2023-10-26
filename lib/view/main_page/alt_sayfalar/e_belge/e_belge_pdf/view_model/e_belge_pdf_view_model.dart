import "dart:convert";
import "dart:io";

import "package:mobx/mobx.dart";
import "package:path_provider/path_provider.dart";
import "package:picker/core/base/view_model/mobx_network_mixin.dart";
import "package:picker/core/init/network/login/api_urls.dart";
import "package:picker/view/main_page/alt_sayfalar/e_belge/e_belge_pdf/model/e_belge_pdf_model.dart";
import "package:picker/view/main_page/alt_sayfalar/e_belge/e_belge_pdf/model/e_belge_pdf_request_model.dart";

part "e_belge_pdf_view_model.g.dart";

class EBelgePdfViewModel = _EBelgePdfViewModelBase with _$EBelgePdfViewModel;

abstract class _EBelgePdfViewModelBase with Store, MobxNetworkMixin {
  _EBelgePdfViewModelBase({required this.model});

  @observable
  int currentPage = 0;

  @observable
  int pageCounter = 0;

  @observable
  File? pdfFile;

  @action
  void changePdfFile(File? value) => pdfFile = value;

  @observable
  ObservableFuture<bool?> futureController = ObservableFuture(Future.value(false));

  @computed
  String get getPageCounter => "Sayfa: ${currentPage + 1} / $pageCounter";

  @action
  void changeCurrentPage(int value) => currentPage = value;

  @action
  void changePageCounter(int value) => pageCounter = value;

  @observable
  late EBelgePdfRequestModel model;

  @observable
  EBelgePdfModel? eBelgePdfModel;

  @action
  void changeEBelgePdfModel(EBelgePdfModel? value) => eBelgePdfModel = value;

  @action
  Future<void> getFile() async {
    final appStorage = await getApplicationDocumentsDirectory();
    //create a folder in documents/picker as name picker
    await Directory("${appStorage.path}/picker/e_pdf").create(recursive: true);
    final file = File("${appStorage.path}/picker/e_pdf/${eBelgePdfModel?.fileModel?.dosyaAdi}");
    final fileWriter = file.openSync(mode: FileMode.write);
    fileWriter.writeFromSync(base64Decode(eBelgePdfModel?.fileModel?.byteData ?? ""));
    await fileWriter.close();
    if (file.lengthSync() > 0) {
      changePdfFile(file);
    }
    // changePdfFile(file.lengthSync() > 0 ? file : null);
  }

  @action
  Future<void> getData() async {
    final result = await networkManager.dioPost<EBelgePdfModel>(path: ApiUrls.eBelgeIslemi, bodyModel: EBelgePdfModel(), data: model.toJson());
    if (result.success == true && result.data is List) {
      changeEBelgePdfModel((result.data as List).first);
      await getFile();
    } else {
      eBelgePdfModel = null;
    }
  }
}
