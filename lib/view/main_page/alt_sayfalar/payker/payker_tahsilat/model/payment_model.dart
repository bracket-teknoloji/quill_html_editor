import "dart:convert";

import "package:freezed_annotation/freezed_annotation.dart";

part "payment_model.freezed.dart";
part "payment_model.g.dart";

PaymentModel paymentModelFromJson(String str) => PaymentModel.fromJson(json.decode(str));

String paymentModelToJson(PaymentModel data) => json.encode(data.toJson());

@freezed
sealed class PaymentModel with _$PaymentModel {
  const factory PaymentModel({
    @JsonKey(name: "CustomerIPAddress") String? customerIpAddress,
    @JsonKey(name: "CustomerMailAddress") String? customerMailAddress,
    @JsonKey(name: "CustomerInfo") CustomerInfo? customerInfo,
    @JsonKey(name: "Order") Order? order,
    @JsonKey(name: "SaleInfo") SaleInfo? saleInfo,
    @JsonKey(name: "Payment3D") Payment3D? payment3D,
  }) = _PaymentModel;

  factory PaymentModel.fromJson(Map<String, dynamic> json) => _$PaymentModelFromJson(json);
}

@freezed
sealed class CustomerInfo with _$CustomerInfo {
  const factory CustomerInfo({
    @JsonKey(name: "CustomerId") String? customerId,
    @JsonKey(name: "Name") String? name,
    @JsonKey(name: "Surname") String? surname,
    @JsonKey(name: "EmailAddress") String? emailAddress,
    @JsonKey(name: "PhoneNumber") String? phoneNumber,
    @JsonKey(name: "TaxNumber") String? taxNumber,
    @JsonKey(name: "TaxOffice") String? taxOffice,
    @JsonKey(name: "Country") int? country,
    @JsonKey(name: "CityName") String? cityName,
    @JsonKey(name: "TownName") String? townName,
    @JsonKey(name: "AddressDesc") String? addressDesc,
    @JsonKey(name: "PostCode") String? postCode,
  }) = _CustomerInfo;

  factory CustomerInfo.fromJson(Map<String, dynamic> json) => _$CustomerInfoFromJson(json);
}

@freezed
sealed class Order with _$Order {
  const factory Order({
    @JsonKey(name: "OrderID") String? orderId,
    @JsonKey(name: "GroupID") String? groupId,
    @JsonKey(name: "Items") String? items,
    @JsonKey(name: "Addresses") String? addresses,
    @JsonKey(name: "Comments") String? comments,
    @JsonKey(name: "Description") String? description,
  }) = _Order;

  factory Order.fromJson(Map<String, dynamic> json) => _$OrderFromJson(json);
}

@freezed
sealed class Payment3D with _$Payment3D {
  const factory Payment3D({
    @JsonKey(name: "Confirm") bool? confirm,
    @JsonKey(name: "ReturnURL") String? returnUrl,
    @JsonKey(name: "IsDesktop") bool? isDesktop,
  }) = _Payment3D;

  factory Payment3D.fromJson(Map<String, dynamic> json) => _$Payment3DFromJson(json);
}

@freezed
sealed class SaleInfo with _$SaleInfo {
  factory SaleInfo({
    @JsonKey(name: "CardNameSurname") String? cardNameSurname,
    @JsonKey(name: "CardNumber") String? cardNumber,
    @JsonKey(name: "CardExpiryDateMonth") int? cardExpiryDateMonth,
    @JsonKey(name: "CardExpiryDateYear") int? cardExpiryDateYear,
    @JsonKey(name: "CardCVV") String? cardCvv,
    @JsonKey(name: "Currency") int? currency,
    @JsonKey(name: "Amount") int? amount,
    @JsonKey(name: "Point") String? point,
    @JsonKey(name: "Installment") int? installment,
    @JsonKey(name: "CampaignCode") String? campaignCode,
    @JsonKey(name: "BankCode") String? bankCode,
    @JsonKey(name: "Description") String? description,
  }) = _SaleInfo;

  SaleInfo._();

  factory SaleInfo.fromJson(Map<String, dynamic> json) => _$SaleInfoFromJson(json);

  bool get isValid =>
      cardNameSurname != null &&
      cardNumber != null &&
      cardExpiryDateMonth != null &&
      cardExpiryDateYear != null &&
      cardCvv != null &&
      amount != null;

  String get expiryDate {
    final month = cardExpiryDateMonth.toString().padLeft(2, "0");
    final year = cardExpiryDateYear.toString().padLeft(2, "0");
    return "$month/$year";
  }
}
