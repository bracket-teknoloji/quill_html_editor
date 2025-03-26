import "package:get/get.dart";

import "../../view/main_page/model/param_model.dart";
import "../init/cache/cache_manager.dart";

abstract final class _OndalikUtils {
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
    OndalikEnum.miktar => _OndalikUtils.baseMiktar,
    OndalikEnum.fiyat => _OndalikUtils.baseFiyat,
    OndalikEnum.tutar => _OndalikUtils.baseTutar,
    OndalikEnum.kur => _OndalikUtils.baseKur,
    OndalikEnum.oran => _OndalikUtils.baseOran,
    OndalikEnum.dovizTutari => _OndalikUtils.baseDovizTutari,
    OndalikEnum.dovizFiyati => _OndalikUtils.baseDovizFiyati,
    OndalikEnum.maxOndalik => _OndalikUtils.maxOndalik,
  };
}
