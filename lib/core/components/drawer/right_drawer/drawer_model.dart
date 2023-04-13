class DrawerModel {
  String? title;
  String? icon;
  Function()? onTap;
  DrawerModel({this.title, this.icon, this.onTap});
  @override
  toString() => "$title";
}
