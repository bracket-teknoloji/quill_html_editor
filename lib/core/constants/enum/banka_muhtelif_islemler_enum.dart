enum BankaMuhtelifIslemlerEnum {
  tahsilat,
  odeme,
}

extension BankaMuhtelifIslemlerExtensions on BankaMuhtelifIslemlerEnum {
  String get name {
    switch (this) {
      case BankaMuhtelifIslemlerEnum.tahsilat:
        return "Tahsilat";
      case BankaMuhtelifIslemlerEnum.odeme:
        return "Ödeme";
    }
  }

  String get title {
    switch (this) {
      case BankaMuhtelifIslemlerEnum.tahsilat:
        return "Banka Muhtelif Tahsilat";
      case BankaMuhtelifIslemlerEnum.odeme:
        return "Banka Muhtelif Ödeme";
    }
  }

  String get belgeTuru {
    switch (this) {
      case BankaMuhtelifIslemlerEnum.tahsilat:
        return "BMT";
      case BankaMuhtelifIslemlerEnum.odeme:
        return "BMO";
    }
  }
}
