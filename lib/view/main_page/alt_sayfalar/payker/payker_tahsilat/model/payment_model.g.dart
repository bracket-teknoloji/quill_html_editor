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

Map<String, dynamic> _$PaymentModelToJson(
  _PaymentModel instance,
) => <String, dynamic>{
  if (instance.customerIpAddress case final value?) 'CustomerIPAddress': value,
  if (instance.customerMailAddress case final value?)
    'CustomerMailAddress': value,
  if (instance.customerInfo?.toJson() case final value?) 'CustomerInfo': value,
  if (instance.order?.toJson() case final value?) 'Order': value,
  if (instance.saleInfo?.toJson() case final value?) 'SaleInfo': value,
  if (instance.payment3D?.toJson() case final value?) 'Payment3D': value,
  if (instance.erpInfo?.toJson() case final value?) 'ERPInfo': value,
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
      if (instance.customerId case final value?) 'CustomerId': value,
      if (instance.name case final value?) 'Name': value,
      if (instance.surname case final value?) 'Surname': value,
      if (instance.emailAddress case final value?) 'EmailAddress': value,
      if (instance.phoneNumber case final value?) 'PhoneNumber': value,
      if (instance.taxNumber case final value?) 'TaxNumber': value,
      if (instance.taxOffice case final value?) 'TaxOffice': value,
      if (instance.country case final value?) 'Country': value,
      if (instance.cityName case final value?) 'CityName': value,
      if (instance.townName case final value?) 'TownName': value,
      if (instance.addressDesc case final value?) 'AddressDesc': value,
      if (instance.postCode case final value?) 'PostCode': value,
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
  if (instance.orderId case final value?) 'OrderID': value,
  if (instance.groupId case final value?) 'GroupID': value,
  if (instance.items case final value?) 'Items': value,
  if (instance.addresses case final value?) 'Addresses': value,
  if (instance.comments case final value?) 'Comments': value,
  if (instance.description case final value?) 'Description': value,
};

_Payment3D _$Payment3DFromJson(Map<String, dynamic> json) => _Payment3D(
  confirm: json['Confirm'] as bool?,
  returnUrl: json['ReturnURL'] as String?,
  isDesktop: json['IsDesktop'] as bool?,
);

Map<String, dynamic> _$Payment3DToJson(_Payment3D instance) =>
    <String, dynamic>{
      if (instance.confirm case final value?) 'Confirm': value,
      if (instance.returnUrl case final value?) 'ReturnURL': value,
      if (instance.isDesktop case final value?) 'IsDesktop': value,
    };

_SaleInfo _$SaleInfoFromJson(Map<String, dynamic> json) => _SaleInfo(
  cardNameSurname: json['CardNameSurname'] as String?,
  cardNumber: json['CardNumber'] as String?,
  cardExpiryDateMonth: (json['CardExpiryDateMonth'] as num?)?.toInt(),
  cardExpiryDateYear: (json['CardExpiryDateYear'] as num?)?.toInt(),
  cardCvv: json['CardCVV'] as String?,
  currency: (json['Currency'] as num?)?.toInt(),
  amount: (json['Amount'] as num?)?.toInt(),
  point: json['Point'] as String?,
  installment: (json['Installment'] as num?)?.toInt(),
  campaignCode: json['CampaignCode'] as String?,
  bankCode: json['BankCode'] as String?,
  description: json['Description'] as String?,
);

Map<String, dynamic> _$SaleInfoToJson(_SaleInfo instance) => <String, dynamic>{
  if (instance.cardNameSurname case final value?) 'CardNameSurname': value,
  if (instance.cardNumber case final value?) 'CardNumber': value,
  if (instance.cardExpiryDateMonth case final value?)
    'CardExpiryDateMonth': value,
  if (instance.cardExpiryDateYear case final value?)
    'CardExpiryDateYear': value,
  if (instance.cardCvv case final value?) 'CardCVV': value,
  if (instance.currency case final value?) 'Currency': value,
  if (instance.amount case final value?) 'Amount': value,
  if (instance.point case final value?) 'Point': value,
  if (instance.installment case final value?) 'Installment': value,
  if (instance.campaignCode case final value?) 'CampaignCode': value,
  if (instance.bankCode case final value?) 'BankCode': value,
  if (instance.description case final value?) 'Description': value,
};

_ERPInfo _$ERPInfoFromJson(Map<String, dynamic> json) => _ERPInfo(
  companyCode: json['COMPANY_CODE'] as String?,
  businessUnitCode: json['BUSINESS_UNIT_CODE'] as String?,
  branchCode: json['BRANCH_CODE'] as String?,
  receiptNumber: json['RECEIPT_NUMBER'] as String?,
  receiptSeries: json['RECEIPT_SERIES'] as String?,
  operatorUser: json['OPERATOR_USER'] as String?,
);

Map<String, dynamic> _$ERPInfoToJson(_ERPInfo instance) => <String, dynamic>{
  if (instance.companyCode case final value?) 'COMPANY_CODE': value,
  if (instance.businessUnitCode case final value?) 'BUSINESS_UNIT_CODE': value,
  if (instance.branchCode case final value?) 'BRANCH_CODE': value,
  if (instance.receiptNumber case final value?) 'RECEIPT_NUMBER': value,
  if (instance.receiptSeries case final value?) 'RECEIPT_SERIES': value,
  if (instance.operatorUser case final value?) 'OPERATOR_USER': value,
};
