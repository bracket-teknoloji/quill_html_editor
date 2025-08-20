// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'payment_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_PaymentModel _$PaymentModelFromJson(Map<String, dynamic> json) =>
    _PaymentModel(
      customerIpAddress: json['CustomerIPAddress'] as String?,
      customerMailAddress: json['CustomerMailAddress'] as String?,
      customerInfo: json['CustomerInfo'] == null
          ? null
          : CustomerInfo.fromJson(json['CustomerInfo'] as Map<String, dynamic>),
      order: json['Order'] == null
          ? null
          : Order.fromJson(json['Order'] as Map<String, dynamic>),
      saleInfo: json['SaleInfo'] == null
          ? null
          : SaleInfo.fromJson(json['SaleInfo'] as Map<String, dynamic>),
      payment3D: json['Payment3D'] == null
          ? null
          : Payment3D.fromJson(json['Payment3D'] as Map<String, dynamic>),
      erpInfo: json['ERPInfo'] == null
          ? null
          : ERPInfo.fromJson(json['ERPInfo'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$PaymentModelToJson(_PaymentModel instance) =>
    <String, dynamic>{
      'CustomerIPAddress': ?instance.customerIpAddress,
      'CustomerMailAddress': ?instance.customerMailAddress,
      'CustomerInfo': ?instance.customerInfo?.toJson(),
      'Order': ?instance.order?.toJson(),
      'SaleInfo': ?instance.saleInfo?.toJson(),
      'Payment3D': ?instance.payment3D?.toJson(),
      'ERPInfo': ?instance.erpInfo?.toJson(),
    };

_CustomerInfo _$CustomerInfoFromJson(Map<String, dynamic> json) =>
    _CustomerInfo(
      customerId: json['CustomerId'] as String?,
      name: json['Name'] as String?,
      surname: json['Surname'] as String?,
      emailAddress: json['EmailAddress'] as String?,
      phoneNumber: json['PhoneNumber'] as String?,
      taxNumber: json['TaxNumber'] as String?,
      taxOffice: json['TaxOffice'] as String?,
      country: (json['Country'] as num?)?.toInt(),
      cityName: json['CityName'] as String?,
      townName: json['TownName'] as String?,
      addressDesc: json['AddressDesc'] as String?,
      postCode: json['PostCode'] as String?,
    );

Map<String, dynamic> _$CustomerInfoToJson(_CustomerInfo instance) =>
    <String, dynamic>{
      'CustomerId': ?instance.customerId,
      'Name': ?instance.name,
      'Surname': ?instance.surname,
      'EmailAddress': ?instance.emailAddress,
      'PhoneNumber': ?instance.phoneNumber,
      'TaxNumber': ?instance.taxNumber,
      'TaxOffice': ?instance.taxOffice,
      'Country': ?instance.country,
      'CityName': ?instance.cityName,
      'TownName': ?instance.townName,
      'AddressDesc': ?instance.addressDesc,
      'PostCode': ?instance.postCode,
    };

_Order _$OrderFromJson(Map<String, dynamic> json) => _Order(
  orderId: json['OrderID'] as String?,
  groupId: json['GroupID'] as String?,
  items: json['Items'] as String?,
  addresses: json['Addresses'] as String?,
  comments: json['Comments'] as String?,
  description: json['Description'] as String?,
);

Map<String, dynamic> _$OrderToJson(_Order instance) => <String, dynamic>{
  'OrderID': ?instance.orderId,
  'GroupID': ?instance.groupId,
  'Items': ?instance.items,
  'Addresses': ?instance.addresses,
  'Comments': ?instance.comments,
  'Description': ?instance.description,
};

_Payment3D _$Payment3DFromJson(Map<String, dynamic> json) => _Payment3D(
  confirm: json['Confirm'] as bool?,
  returnUrl: json['ReturnURL'] as String?,
  isDesktop: json['IsDesktop'] as bool?,
);

Map<String, dynamic> _$Payment3DToJson(_Payment3D instance) =>
    <String, dynamic>{
      'Confirm': ?instance.confirm,
      'ReturnURL': ?instance.returnUrl,
      'IsDesktop': ?instance.isDesktop,
    };

_SaleInfo _$SaleInfoFromJson(Map<String, dynamic> json) => _SaleInfo(
  cardNameSurname: json['CardNameSurname'] as String?,
  cardNumber: json['CardNumber'] as String?,
  cardExpiryDateMonth: (json['CardExpiryDateMonth'] as num?)?.toInt(),
  cardExpiryDateYear: (json['CardExpiryDateYear'] as num?)?.toInt(),
  cardCvv: json['CardCvv'] as String?,
  currency: (json['Currency'] as num?)?.toInt(),
  amount: (json['Amount'] as num?)?.toInt(),
  point: json['Point'] as String?,
  installment: (json['Installment'] as num?)?.toInt(),
  campaignCode: json['CampaignCode'] as String?,
  bankCode: json['BankCode'] as String?,
  description: json['Description'] as String?,
);

Map<String, dynamic> _$SaleInfoToJson(_SaleInfo instance) => <String, dynamic>{
  'CardNameSurname': ?instance.cardNameSurname,
  'CardNumber': ?instance.cardNumber,
  'CardExpiryDateMonth': ?instance.cardExpiryDateMonth,
  'CardExpiryDateYear': ?instance.cardExpiryDateYear,
  'CardCvv': ?instance.cardCvv,
  'Currency': ?instance.currency,
  'Amount': ?instance.amount,
  'Point': ?instance.point,
  'Installment': ?instance.installment,
  'CampaignCode': ?instance.campaignCode,
  'BankCode': ?instance.bankCode,
  'Description': ?instance.description,
};

_ERPInfo _$ERPInfoFromJson(Map<String, dynamic> json) => _ERPInfo(
  companyCode: json['CompanyCode'] as String?,
  businessUnitCode: json['BusinessUnitCode'] as String?,
  branchCode: json['BranchCode'] as String?,
  receiptNumber: json['ReceiptNumber'] as String?,
  receiptSeries: json['ReceiptSeries'] as String?,
  operatorUser: json['OperatorUser'] as String?,
);

Map<String, dynamic> _$ERPInfoToJson(_ERPInfo instance) => <String, dynamic>{
  'CompanyCode': ?instance.companyCode,
  'BusinessUnitCode': ?instance.businessUnitCode,
  'BranchCode': ?instance.branchCode,
  'ReceiptNumber': ?instance.receiptNumber,
  'ReceiptSeries': ?instance.receiptSeries,
  'OperatorUser': ?instance.operatorUser,
};
