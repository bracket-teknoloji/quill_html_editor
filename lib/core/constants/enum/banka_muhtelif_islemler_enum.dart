enum BankaMuhtelifIslemlerEnum { tahsilat, odeme }

extension BankaMuhtelifIslemlerExtensions on BankaMuhtelifIslemlerEnum {
  String get name => switch (this) {
    BankaMuhtelifIslemlerEnum.tahsilat => "Tahsilat",
    BankaMuhtelifIslemlerEnum.odeme => "Ödeme",
  };

  String get title => switch (this) {
    BankaMuhtelifIslemlerEnum.tahsilat => "Banka Muhtelif Tahsilat",
    BankaMuhtelifIslemlerEnum.odeme => "Banka Muhtelif Ödeme",
  };

  String get belgeTuru => switch (this) {
    BankaMuhtelifIslemlerEnum.tahsilat => "BMT",
    BankaMuhtelifIslemlerEnum.odeme => "BMO",
  };
}
