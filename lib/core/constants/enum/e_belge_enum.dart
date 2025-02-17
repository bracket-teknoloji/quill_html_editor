enum EBelgeEnum { gelen, giden }

extension EBelgeEnumExtension on EBelgeEnum {
  String get appBarTitle => switch (this) {
    EBelgeEnum.gelen => "Gelen Kutusu",
    EBelgeEnum.giden => "Giden Kutusu",
  };

  String get faturaYonu => switch (this) {
    EBelgeEnum.gelen => "GET",
    EBelgeEnum.giden => "GIK",
  };
}
