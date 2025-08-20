// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'payment_response_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PaymentResponseModel _$PaymentResponseModelFromJson(
  Map<String, dynamic> json,
) => PaymentResponseModel(
  status: json['Status'] as String?,
  message: json['Message'] as String?,
  errorCode: json['ErrorCode'],
  orderNumber: json['OrderNumber'] as String?,
  transactionId: json['TransactionId'] as String?,
  privateResponse: json['PrivateResponse'] == null
      ? null
      : PrivateResponse.fromJson(
          json['PrivateResponse'] as Map<String, dynamic>,
        ),
);

Map<String, dynamic> _$PaymentResponseModelToJson(
  PaymentResponseModel instance,
) => <String, dynamic>{
  'Status': ?instance.status,
  'Message': ?instance.message,
  'ErrorCode': ?instance.errorCode,
  'OrderNumber': ?instance.orderNumber,
  'TransactionId': ?instance.transactionId,
  'PrivateResponse': ?instance.privateResponse?.toJson(),
};

_PrivateResponse _$PrivateResponseFromJson(Map<String, dynamic> json) =>
    _PrivateResponse(
      message: json['Message'] == null
          ? null
          : Message.fromJson(json['Message'] as Map<String, dynamic>),
      verifyEnrollmentRequestId: json['VerifyEnrollmentRequestId'] as String?,
      messageErrorCode: json['MessageErrorCode'] as String?,
    );

Map<String, dynamic> _$PrivateResponseToJson(_PrivateResponse instance) =>
    <String, dynamic>{
      'Message': ?instance.message?.toJson(),
      'VerifyEnrollmentRequestId': ?instance.verifyEnrollmentRequestId,
      'MessageErrorCode': ?instance.messageErrorCode,
    };

_Message _$MessageFromJson(Map<String, dynamic> json) => _Message(
  veRes: json['VERes'] == null
      ? null
      : VeRes.fromJson(json['VERes'] as Map<String, dynamic>),
);

Map<String, dynamic> _$MessageToJson(_Message instance) => <String, dynamic>{
  'VERes': ?instance.veRes?.toJson(),
};

_VeRes _$VeResFromJson(Map<String, dynamic> json) => _VeRes(
  version: json['Version'] as String?,
  status: json['Status'] as String?,
  paReq: json['PaReq'] as String?,
  acsUrl: json['ACSUrl'] as String?,
  termUrl: json['TermUrl'] as String?,
  md: json['MD'] as String?,
  actualbrand: json['ACTUALBRAND'] as String?,
);

Map<String, dynamic> _$VeResToJson(_VeRes instance) => <String, dynamic>{
  'Version': ?instance.version,
  'Status': ?instance.status,
  'PaReq': ?instance.paReq,
  'ACSUrl': ?instance.acsUrl,
  'TermUrl': ?instance.termUrl,
  'MD': ?instance.md,
  'ACTUALBRAND': ?instance.actualbrand,
};
