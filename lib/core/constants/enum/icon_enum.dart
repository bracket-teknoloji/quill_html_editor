// ignore_for_file: constant_identifier_names

enum IconMenuEnum { Cari, Cuzdan, ElSikisma, Kamyon, MalKabul, Transpalet, Banka }

extension GetPath on IconMenuEnum {
  String get path => switch (this) {
        IconMenuEnum.Cari => "assets/icons/PickerSvgIcon/AnaMenu/$name.svg",
        IconMenuEnum.Cuzdan => "assets/icons/PickerSvgIcon/AnaMenu/Cuzdan.svg",
        IconMenuEnum.ElSikisma => "assets/icons/PickerSvgIcon/AnaMenu/ElSikisma.svg",
        IconMenuEnum.Kamyon => "assets/icons/PickerSvgIcon/AnaMenu/Kamyon.svg",
        IconMenuEnum.MalKabul => "assets/icons/PickerSvgIcon/AnaMenu/MalKabul.svg",
        IconMenuEnum.Transpalet => "assets/icons/PickerSvgIcon/AnaMenu/Transpalet.svg",
        IconMenuEnum.Banka => "assets/icons/PickerSvgIcon/AnaMenu/Banka.svg"
      };
}
