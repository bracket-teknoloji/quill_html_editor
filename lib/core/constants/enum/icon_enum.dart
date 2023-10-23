// ignore_for_file: constant_identifier_names

enum IconMenuEnum { Cari, Cuzdan, ElSikisma, Kamyon, MalKabul, Transpalet, Banka }

extension GetPath on IconMenuEnum {
  String get path {
    switch (this) {
      case IconMenuEnum.Cari:
        return "assets/icons/PickerSvgIcon/AnaMenu/$name.svg";
      case IconMenuEnum.Cuzdan:
        return "assets/icons/PickerSvgIcon/AnaMenu/Cuzdan.svg";
      case IconMenuEnum.ElSikisma:
        return "assets/icons/PickerSvgIcon/AnaMenu/ElSikisma.svg";
      case IconMenuEnum.Kamyon:
        return "assets/icons/PickerSvgIcon/AnaMenu/Kamyon.svg";
      case IconMenuEnum.MalKabul:
        return "assets/icons/PickerSvgIcon/AnaMenu/MalKabul.svg";
      case IconMenuEnum.Transpalet:
        return "assets/icons/PickerSvgIcon/AnaMenu/Transpalet.svg";
      case IconMenuEnum.Banka:
        return "assets/icons/PickerSvgIcon/AnaMenu/Banka.svg";
      default:
        return "assets/icons/PickerSvgIcon/AnaMenu/Cari.svg";
    }
  }
}
