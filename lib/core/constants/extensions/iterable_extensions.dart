extension DoubleIterableExtensions on Iterable<double?>? {
  double get sum => this?.fold(0, (previousValue, element) => (previousValue ?? 0) + (element ?? 0)) ?? 0;
}
