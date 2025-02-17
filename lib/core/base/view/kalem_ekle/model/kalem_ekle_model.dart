import "../../../../../view/main_page/alt_sayfalar/stok/stok_liste/model/stok_listesi_model.dart";
import "../../../../constants/enum/kalemler_enum.dart";

final class KalemEkleModel {
  KalemEkleModel({required this.kalemEditEnum, this.searchText, this.stokListesiModel});
  bool getArguments = true;
  KalemlerEnum? kalemEditEnum;
  String? searchText;
  StokListesiModel? stokListesiModel;
}
