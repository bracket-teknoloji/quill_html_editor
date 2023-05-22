import 'package:picker/core/constants/enum/cari_edit_enum.dart';

import '../../../../../../../view/main_page/alt_sayfalar/cari/cari_listesi/model/cari_listesi_model.dart';

class BaseCariEditModel {
  CariListesiModel? model;
  CariEditEnum? cariEditEnum;
  String? siradakiKod;

  BaseCariEditModel({this.model, this.cariEditEnum, this.siradakiKod});
}
