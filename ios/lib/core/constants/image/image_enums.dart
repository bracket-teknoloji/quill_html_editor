enum ImageEnum {
  pickerLogo,
}

extension ImageExtension on ImageEnum {
  String get path {
    switch (this) {
      case ImageEnum.pickerLogo:
        return "assets/splash/picker_logo.png";
    }
  }
}