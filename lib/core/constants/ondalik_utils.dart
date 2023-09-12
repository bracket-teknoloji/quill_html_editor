import "package:get/get.dart";
import "package:picker/core/init/cache/cache_manager.dart";

import "../../view/main_page/model/param_model.dart";

class OndalikUtils {
  static List<NetsisOndalikResponseModel>? get _ondalikResponseList => CacheManager.getAnaVeri()?.paramModel?.netsisOndalikResponseModel;
  static NetsisOndalikResponseModel? get baseModel => _ondalikResponseList?.firstWhereOrNull((element) => element.modul == "T");

  static int get baseMiktar => baseModel?.miktar ?? 3;
  static int get baseFiyat => baseModel?.fiyat ?? 3;
  static int get baseTutar => baseModel?.tutar ?? 3;
  static int get baseKur => baseModel?.kur ?? 3;
  static int get baseOran => baseModel?.oran ?? 3;
  static int get baseDovizTutari => baseModel?.doviz ?? 3;
  static int get baseDovizFiyati => baseModel?.dovizFiyati ?? 3;
}

enum OndalikEnum {
  miktar,
  fiyat,
  tutar,
  kur,
  oran,
  dovizTutari,
  dovizFiyati,
}

extension OndalikEnumExtension on OndalikEnum {
  int get ondalik {
    switch (this) {
      case OndalikEnum.miktar:
        return OndalikUtils.baseMiktar;
      case OndalikEnum.fiyat:
        return OndalikUtils.baseFiyat;
      case OndalikEnum.tutar:
        return OndalikUtils.baseTutar;
      case OndalikEnum.kur:
        return OndalikUtils.baseKur;
      case OndalikEnum.oran:
        return OndalikUtils.baseOran;
      case OndalikEnum.dovizTutari:
        return OndalikUtils.baseDovizTutari;
      case OndalikEnum.dovizFiyati:
        return OndalikUtils.baseDovizFiyati;
      default:
        return 2;
    }
  }
}
