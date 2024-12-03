import "base_network_mixin.dart";

class GenericResponseModel<T extends NetworkManagerMixin> {
  String? message;
  String? messageDetail;
  bool? _success;
  dynamic _data;
  T? model;
  String? exceptionName;
  String? errorDetails;
  String? exceptionStackTrace;
  Map<String, dynamic>? paramData;
  String? serviceVersion;
  int? errorCode;
  Map<String, dynamic>? ex;
  GenericResponseModel({
    this.message,
    this.messageDetail,
    bool? success,
    this.exceptionName,
    this.errorDetails,
    this.exceptionStackTrace,
    this.paramData,
    this.serviceVersion,
    this.errorCode,
    this.ex,
  }) : _success = success;

  GenericResponseModel.fromJson(Map<String, dynamic> json, this.model) {
    message = json["Message"];
    messageDetail = json["MessageDetail"];
    _success = json["Success"];
    exceptionName = json["ExceptionName"];
    errorDetails = json["ErrorDetails"];
    exceptionStackTrace = json["ExceptionStackTrace"];
    paramData = json["ParamData"];
    serviceVersion = json["ServiceVersion"];
    errorCode = json["errorCode"];
    ex = json["Ex"];

    if (json["Data"] is List) {
      _data = json["Data"].map((e) => model?.fromJson(e)).toList();
    } else if (json["Data"] is Map<String, dynamic>) {
      _data = model?.fromJson(json["Data"]);
    } else {
      _data = json["Data"];
    }
  }

  bool get isSuccess => _success == true;

  List<T> get dataList => (_data as List).map((e) => e as T).toList();

  T get dataItem => _data as T;
}
