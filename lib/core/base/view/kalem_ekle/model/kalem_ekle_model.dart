import '../../../../../view/main_page/alt_sayfalar/stok/stok_liste/model/stok_listesi_model.dart';
import '../../../../constants/enum/kalemler_enum.dart';

class KalemEkleModel {
  bool getArguments = true;
  KalemlerEnum? kalemEditEnum;
  String? searchText;
  StokListesiModel? stokListesiModel;

  KalemEkleModel({required this.kalemEditEnum,this.searchText, this.stokListesiModel});
}