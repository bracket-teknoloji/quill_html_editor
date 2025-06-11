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
  if (instance.status case final value?) 'Status': value,
  if (instance.message case final value?) 'Message': value,
  if (instance.errorCode case final value?) 'ErrorCode': value,
  if (instance.orderNumber case final value?) 'OrderNumber': value,
  if (instance.transactionId case final value?) 'TransactionId': value,
  if (instance.privateResponse?.toJson() case final value?)
    'PrivateResponse': value,
};

_PrivateResponse _$PrivateResponseFromJson(Map<String, dynamic> json) =>
    _PrivateResponse(
      message: json['Message'] == null
          ? null
          : Message.fromJson(json['Message'] as Map<String, dynamic>),
      verifyEnrollmentRequestId: json['VerifyEnrollmentRequestId'] as String?,
      messageErrorCode: json['MessageErrorCode'] as String?,
    );

Map<String, dynamic> _$PrivateResponseToJson(
  _PrivateResponse instance,
) => <String, dynamic>{
  if (instance.message?.toJson() case final value?) 'Message': value,
  if (instance.verifyEnrollmentRequestId case final value?)
    'VerifyEnrollmentRequestId': value,
  if (instance.messageErrorCode case final value?) 'MessageErrorCode': value,
};

_Message _$MessageFromJson(Map<String, dynamic> json) => _Message(
  veRes: json['VERes'] == null
      ? null
      : VeRes.fromJson(json['VERes'] as Map<String, dynamic>),
);

Map<String, dynamic> _$MessageToJson(_Message instance) => <String, dynamic>{
  if (instance.veRes?.toJson() case final value?) 'VERes': value,
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
  if (instance.version case final value?) 'Version': value,
  if (instance.status case final value?) 'Status': value,
  if (instance.paReq case final value?) 'PaReq': value,
  if (instance.acsUrl case final value?) 'ACSUrl': value,
  if (instance.termUrl case final value?) 'TermUrl': value,
  if (instance.md case final value?) 'MD': value,
  if (instance.actualbrand case final value?) 'ACTUALBRAND': value,
};
