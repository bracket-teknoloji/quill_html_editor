import "base_network_mixin.dart";

class GenericResponseModel<T extends NetworkManagerMixin> {
  String? message;
  String? messageDetail;
  bool? success;
  dynamic data;
  T? model;
  String? exceptionName;
  String? errorDetails;
  String? exceptionStackTrace;
  Map<String, dynamic>? paramData;
  String? serviceVersion;
  int? errorCode;
  Map<String, dynamic>? ex;
  GenericResponseModel({this.message, this.messageDetail, this.success, this.exceptionName, this.errorDetails, this.exceptionStackTrace, this.paramData, this.serviceVersion, this.errorCode, this.ex});

  GenericResponseModel.fromJson(Map<String, dynamic> json, this.model) {
    message = json["Message"];
    messageDetail = json["MessageDetail"];
    success = json["Success"];
    exceptionName = json["ExceptionName"];
    errorDetails = json["ErrorDetails"];
    exceptionStackTrace = json["ExceptionStackTrace"];
    paramData = json["ParamData"];
    serviceVersion = json["ServiceVersion"];
    errorCode = json["errorCode"];
    ex = json["Ex"];

    if (json["Data"] is List) {
      data = json["Data"].map((e) => model?.fromJson(e)).toList();
    } else if (json["Data"] is Map<String, dynamic>) {
      data = model?.fromJson(json["Data"]);
    } else {
      data = json["Data"];
    }
  }
}
