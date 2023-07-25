import 'package:json_annotation/json_annotation.dart';

import 'base_network_mixin.dart';

part 'generic_response_model.g.dart';

@JsonSerializable(
  createToJson: false,
)
class GenericResponseModel<T extends NetworkManagerMixin> {
  @JsonKey(name: "Message")
  String? message;
  @JsonKey(name: "MessageDetail")
  String? messageDetail;
  @JsonKey(name: "Success")
  bool? success;
  @JsonKey(name: "Data")
  dynamic data;
  @JsonKey(required: false, includeFromJson: false, includeToJson: false)
  T? model;
  @JsonKey(name: "ExceptionName")
  String? exceptionName;
  @JsonKey(name: "ErrorDetails")
  String? errorDetails;
  @JsonKey(name: "ExceptionStackTrace")
  String? exceptionStackTrace;
  @JsonKey(name: "ParamData")
  Map<String, dynamic>? paramData;
  @JsonKey(name: "ServiceVersion")
  String? serviceVersion;
  @JsonKey(name: "errorCode")
  int? errorCode;
  GenericResponseModel({this.message, this.messageDetail, this.success, this.exceptionName, this.errorDetails, this.exceptionStackTrace, this.paramData, this.serviceVersion, this.errorCode});

  GenericResponseModel.fromJson(Map<String, dynamic> json, this.model) {
    message = json['Message'];
    messageDetail = json['MessageDetail'];
    success = json['Success'];
    exceptionName = json['ExceptionName'];
    errorDetails = json['ErrorDetails'];
    exceptionStackTrace = json['ExceptionStackTrace'];
    paramData = json['ParamData'];
    serviceVersion = json['ServiceVersion'];
    errorCode = json['errorCode'];

    if (json['Data'] is List) {
      data = json['Data'].map((e) => model!.fromJson(e)).toList();
    } else if (json['Data'] is Map<String, dynamic>) {
      data = model!.fromJson(json['Data']);
    } else {
      data = json['Data'];
    }
  }
}
