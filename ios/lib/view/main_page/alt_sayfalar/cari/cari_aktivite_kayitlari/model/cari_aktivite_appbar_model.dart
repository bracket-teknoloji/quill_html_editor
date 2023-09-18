

class AppbarToggleButtonClass {
  static List<AppBarButtonModel> liste = [
    AppBarButtonModel("Tümü", () {}),
    AppBarButtonModel("Bugün", () {}),
    AppBarButtonModel("Dün", () {}),
    AppBarButtonModel("Bu Hafta", () {}),
    AppBarButtonModel("Bu Ay", () {}),
    AppBarButtonModel("Geçen Ay", () {}),
    AppBarButtonModel("Son 3 Ay", () {}),
    AppBarButtonModel("Bu Yıl", () {}),
    AppBarButtonModel("Özel", () {}),
  ];
}




class AppBarButtonModel {
  final String title;
  final dynamic Function() onTap;

  AppBarButtonModel(this.title, this.onTap);
}