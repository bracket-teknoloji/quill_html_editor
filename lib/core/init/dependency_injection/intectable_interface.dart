/// Bu interface'ın amacı, Dependency Injection yapısının daha iyi anlaşılmasını sağlamak.
/// DIManager ile Injection yapılacak sınıfların InjectableInterface'i implemente etmesi gerekmektedir.
abstract interface class InjectableInterface {
  /// Eğer injection yapacağın model'in yüklenecek bazı şeyleri varsa bunu override ederek yükleyebilirsin.
  Future<void> load();
}
