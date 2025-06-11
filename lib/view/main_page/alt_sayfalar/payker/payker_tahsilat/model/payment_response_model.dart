// To parse this JSON data, do
//
//     final paymentResponseModel = paymentResponseModelFromJson(jsonString);

import "package:freezed_annotation/freezed_annotation.dart";
import "package:picker/core/base/model/base_network_mixin.dart";

part "payment_response_model.freezed.dart";
part "payment_response_model.g.dart";

@freezed
@JsonSerializable()
final class PaymentResponseModel with _$PaymentResponseModel, NetworkManagerMixin {
  const PaymentResponseModel({
    this.status,
    this.message,
    this.errorCode,
    this.orderNumber,
    this.transactionId,
    this.privateResponse,
  });
  factory PaymentResponseModel.fromJson(Map<String, dynamic> json) => _$PaymentResponseModelFromJson(json);

  @override
  @JsonKey(name: "Status")
  final String? status;
  @override
  @JsonKey(name: "Message")
  final String? message;
  @override
  @JsonKey(name: "ErrorCode")
  final dynamic errorCode;
  @override
  @JsonKey(name: "OrderNumber")
  final String? orderNumber;
  @override
  @JsonKey(name: "TransactionId")
  final String? transactionId;
  @override
  @JsonKey(name: "PrivateResponse")
  final PrivateResponse? privateResponse;

  @override
  PaymentResponseModel fromJson(Map<String, dynamic> json) => PaymentResponseModel.fromJson(json);

  @override
  Map<String, dynamic> toJson() => _$PaymentResponseModelToJson(this);
}

@freezed
sealed class PrivateResponse with _$PrivateResponse {
  const factory PrivateResponse({
    @JsonKey(name: "Message") Message? message,
    @JsonKey(name: "VerifyEnrollmentRequestId") String? verifyEnrollmentRequestId,
    @JsonKey(name: "MessageErrorCode") String? messageErrorCode,
  }) = _PrivateResponse;

  factory PrivateResponse.fromJson(Map<String, dynamic> json) => _$PrivateResponseFromJson(json);
}

@freezed
sealed class Message with _$Message {
  const factory Message({
    @JsonKey(name: "VERes") VeRes? veRes,
  }) = _Message;

  factory Message.fromJson(Map<String, dynamic> json) => _$MessageFromJson(json);
}

@freezed
sealed class VeRes with _$VeRes {
  const factory VeRes({
    @JsonKey(name: "Version") String? version,
    @JsonKey(name: "Status") String? status,
    @JsonKey(name: "PaReq") String? paReq,
    @JsonKey(name: "ACSUrl") String? acsUrl,
    @JsonKey(name: "TermUrl") String? termUrl,
    @JsonKey(name: "MD") String? md,
    @JsonKey(name: "ACTUALBRAND") String? actualbrand,
  }) = _VeRes;

  factory VeRes.fromJson(Map<String, dynamic> json) => _$VeResFromJson(json);
}
