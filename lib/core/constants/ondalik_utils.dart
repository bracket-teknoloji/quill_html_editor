import "package:get/get.dart";

import "../../view/main_page/model/param_model.dart";
import "../init/cache/cache_manager.dart";

abstract final class OndalikUtils {
  static List<NetsisOndalikResponseModel>? get _ondalikResponseList =>
      CacheManager.getAnaVeri?.paramModel?.netsisOndalikResponseModel;
  static NetsisOndalikResponseModel? get baseModel =>
      _ondalikResponseList?.firstWhereOrNull((element) => element.modul == "T");

  static int get baseMiktar => baseModel?.miktar ?? 2;
  static int get baseFiyat => baseModel?.fiyat ?? 4;
  static int get baseTutar => baseModel?.tutar ?? 2;
  static int get baseKur => baseModel?.kur ?? 4;
  static int get baseOran => baseModel?.oran ?? 2;
  static int get baseDovizTutari => baseModel?.doviz ?? 2;
  static int get baseDovizFiyati => baseModel?.dovizFiyati ?? 4;
  static int maxOndalik = 8;
}

enum OndalikEnum { miktar, fiyat, tutar, kur, oran, dovizTutari, dovizFiyati, maxOndalik }

extension OndalikEnumExtension on OndalikEnum {
  int get ondalik => switch (this) {
    OndalikEnum.miktar => OndalikUtils.baseMiktar,
    OndalikEnum.fiyat => OndalikUtils.baseFiyat,
    OndalikEnum.tutar => OndalikUtils.baseTutar,
    OndalikEnum.kur => OndalikUtils.baseKur,
    OndalikEnum.oran => OndalikUtils.baseOran,
    OndalikEnum.dovizTutari => OndalikUtils.baseDovizTutari,
    OndalikEnum.dovizFiyati => OndalikUtils.baseDovizFiyati,
    OndalikEnum.maxOndalik => OndalikUtils.maxOndalik,
  };
}
